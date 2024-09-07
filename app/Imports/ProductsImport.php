<?php
namespace App\Imports;

use App\Models\Product;
use App\Models\ProductVariations;
use App\Models\Pro_image;
use App\Models\Related_product; // Ensure you include this
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Storage;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithBatchInserts;
use Maatwebsite\Excel\Concerns\WithChunkReading;

class ProductsImport implements ToCollection, WithHeadingRow, WithBatchInserts, WithChunkReading
{
    use Importable;

    protected $skuList;

    public function collection(Collection $rows)
    {
       
        foreach ($rows as $row) {
            // Sanitize and decode JSON fields
            $colorImages = $this->parseJsonField($row['color_images'] ?? '[]');
            $variationSkus = $this->parseJsonField($row['variation_skus'] ?? '[]');

            // Process sizes and colors
            $sizes = array_filter(array_map('trim', explode(',', $row['variation_size'] ?? '')));
            $colors = array_filter(array_map('trim', explode(',', $row['variation_color'] ?? '')));

            // Convert empty arrays to null
            $sizes = !empty($sizes) ? json_encode($sizes) : null;
            $colors = !empty($colors) ? json_encode($colors) : null;

            $productData = [
                'title' => $row['title'] ?? null,
                'slug' => $this->generateUniqueSlug($row['title']),
                'description' => $row['description'] ?? null,
                'f_thumbnail' => $row['f_thumbnail'] ?? null,
                'category' => $row['category'] ?? null,
                'subcategory_id' => $row['subcategory_id'] ?? null,
                'childcategory' => $row['childcategory'] ?? null,
                'short_desc' => $row['short_desc'] ?? null,
                'brand_id' => $row['brand_id'] ?? null,
                'price1' => $row['price1'] ?? null,
                'price2' => $row['price2'] ?? null,
                'price3' => $row['price3'] ?? null,
                'price4' => $row['price4'] ?? null,
                'price5' => $row['price5'] ?? null,
                'is_publish' => $row['is_publish'] ?? null,
                'is_stock' => $row['is_stock'] ?? null,
                'stock_status_id' => $row['stock_status_id'] ?? null,
                'sku' => $row['sku'],
                'stock_qty' => $row['stock_qty'] ?? null,
                'variation_color' => $colors, // Null if empty
                'variation_size' => $sizes, // Null if empty
                'og_title' => $row['og_title'] ?? null,
                'og_description' => $row['og_description'] ?? null,
                'og_keywords' => $row['og_keywords'] ?? null,
                'color_images' => json_encode($colorImages), // Encode as JSON
                'variation_skus' => json_encode($variationSkus), // Encode as JSON
            ];

            // Fetch or create the product
            $product = Product::updateOrCreate(
                ['sku' => $productData['sku']],
                $productData
            );

            // Process variations
            $this->processVariations($product, $sizes, $colors, $variationSkus);

            // Handle color images upload if color is present
            foreach (json_decode($colors, true) ?? [] as $color) {
                if (isset($colorImages[$color])) {
                    $imagePath = $colorImages[$color];
                    $imageName = basename($imagePath);
                    $destinationPath = public_path('product_images');

                    if (!file_exists($destinationPath . '/' . $imageName)) {
                        if (Storage::exists($imagePath)) {
                            Storage::copy($imagePath, $destinationPath . '/' . $imageName);
                        }
                    }

                    Pro_image::updateOrCreate(
                        [
                            'product_id' => $product->id,
                            'color' => $color,
                        ],
                        [
                            'thumbnail' => 'product_images/' . $imageName,
                        ]
                    );
                }
            }

            // Handle related items
            $relatedItemIds = $row['related_item_ids'] ? explode(',', $row['related_item_ids']) : [];
            foreach ($relatedItemIds as $relatedItemId) {
                Related_product::updateOrCreate(
                    [
                        'product_id' => $product->id,
                        'related_item_id' => trim($relatedItemId),
                    ]
                );
            }
        }
    }

    private function parseJsonField($jsonField)
    {
        $decoded = json_decode($jsonField, true);
        if (json_last_error() !== JSON_ERROR_NONE) {
            \Log::error('Invalid JSON data:', ['data' => $jsonField, 'error' => json_last_error_msg()]);
            return [];
        }
        return is_array($decoded) ? $decoded : [];
    }

    private function processVariations($product, $sizes, $colors, $skus)
    {
        // Clear previous variations
        ProductVariations::where('product_id', $product->id)->delete();

        if (!empty($sizes) && !empty($colors)) {
            // Both sizes and colors selected
            foreach (json_decode($sizes, true) as $size) {
                foreach (json_decode($colors, true) as $color) {
                    $this->processSkuAndCreateVariation($product, $size, $color, $skus);
                }
            }
        } elseif (!empty($sizes)) {
            // Only sizes selected
            foreach (json_decode($sizes, true) as $size) {
                $this->processSkuAndCreateVariation($product, $size, null, $skus);
            }
        } elseif (!empty($colors)) {
            // Only colors selected
            foreach (json_decode($colors, true) as $color) {
                $this->processSkuAndCreateVariation($product, null, $color, $skus);
            }
        }
    }

    private function processSkuAndCreateVariation($product, $size, $color, $skus)
    {
        $variationSku = $this->getVariationSku($size, $color, $skus);

        if (!$variationSku) {
            \Log::error('SKU not provided for:', ['size' => $size, 'color' => $color]);
            return;
        }

        // Create the variation
        ProductVariations::create([
            'product_id' => $product->id,
            'size' => $size,
            'color' => $color,
            'sku' => $variationSku,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        // Create or update product for each SKU variation
        Product::updateOrCreate(
            ['sku' => $variationSku],
            $this->getProductDataForVariation($product, $size, $color)
        );
    }

    private function getVariationSku($size, $color, $skus)
    {
        if ($size && $color && isset($skus[$color][$size])) {
            return $skus[$color][$size];
        } elseif ($size && isset($skus[$size])) {
            return $skus[$size];
        } elseif ($color && isset($skus[$color])) {
            return $skus[$color];
        }
        return null;
    }

    private function getProductDataForVariation($product, $size, $color)
    {
        return [
            'title' => $product->title,
            'slug' => $this->generateUniqueSlug($product->title . '-' . strtoupper($color ?? $size)),
            'description' => $product->description,
            'f_thumbnail' => $product->f_thumbnail,
            'category' => $product->category,
            'subcategory_id' => $product->subcategory_id,
            'childcategory' => $product->childcategory,
            'short_desc' => $product->short_desc,
            'brand_id' => $product->brand_id,
            'store_id' => $product->store_id,
            'price1' => $product->price1,
            'price2' => $product->price2,
            'price3' => $product->price3,
            'price4' => $product->price4,
            'price5' => $product->price5,
            'is_publish' => $product->is_publish,
            'is_stock' => $product->is_stock,
            'stock_status_id' => $product->stock_status_id,
            'stock_qty' => $product->stock_qty,
            'variation_size' => $size ? json_encode([$size]) : null, // Null if empty
            'variation_color' => $color ? json_encode([$color]) : null, // Null if empty
        ];
    }

    private function generateUniqueSlug($title, $id = null)
    {
        $slug = \Str::slug($title);
        $originalSlug = $slug;

        $query = Product::where('slug', $slug);
        if ($id) {
            $query->where('id', '!=', $id);
        }

        $count = $query->count();
        if ($count > 0) {
            $slug = $originalSlug . '-' . ($count + 1);
        }

        return $slug;
    }

    public function batchSize(): int
    {
        return 1000;
    }

    public function chunkSize(): int
    {
        return 1000;
    }
}
