<?php

namespace App\Imports;

use App\Models\Product;
use App\Models\Pro_image;
use App\Models\ProductVariations;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class ProductsImport implements ToModel, WithHeadingRow
{
    public function model(array $row)
    {
        // Create a new Product instance
        $product = new Product([
            'title' => $row['title'],
            'slug' => getSlug($row['title']), // Generate slug from title
            'description' => $row['description'],
            'f_thumbnail' => $row['f_thumbnail'],
            'category' => $row['category'],
            'subcategory_id' => $row['subcategory_id'],
            'short_desc' => $row['short_desc'],
            'brand_id' => $row['brand_id'],
            'store_id' => $row['store_id'],
            'price1' => $row['price1'],
            'price2' => $row['price2'],
            'price3' => $row['price3'],
            'price4' => $row['price4'],
            'price5' => $row['price5'],
            'is_publish' => $row['is_publish'],
            'cost_price' => $row['cost_price'],
            'sale_price' => $row['sale_price'],
            'old_price' => $row['old_price'],
            'start_date' => $row['start_date'],
            'end_date' => $row['end_date'],
            'is_discount' => $row['is_discount'],
            'is_stock' => $row['is_stock'],
            'stock_status_id' => $row['stock_status_id'],
            'sku' => $row['sku'],

            'stock_qty' => $row['stock_qty'],
            'variation_color' => $row['variation_color'],
            'variation_size' => $row['variation_size'],

            'og_title' => $row['og_title'],
            'og_description' => $row['og_description'],
            'og_keywords' => $row['og_keywords'],
        ]);

        // Save the product
        $product->save();



        // Clear previous variations for the product
        ProductVariations::where('product_id', $product->id)->delete();

        // Assuming you have a Pro_image and ProductVariations model
        for ($i = 1; $i <= 5; $i++) {
            // Process product images
            if (isset($row['image_' . $i])) {
                $imageName = $row['image_' . $i];
                $imagePath = 'product_images/' . $imageName; // Adjust this based on your directory structure

                Pro_image::create([
                    'thumbnail' => $imagePath,
                    'product_id' => $product->id,
                ]);
            }

            // Process product variations (assuming there are max 5 variations)
            if ($i <= 5) {
                if (isset($row['size_' . $i]) && isset($row['color_' . $i])) {
                    $size = $row['size_' . $i];
                    $color = $row['color_' . $i];
                    $mainSku = $row['sku'];

                    $sku = $mainSku . '-' . $size . '-' . $color;
                    $product->updateOrCreate(
                        [
                            'title' => $product->title,
                            'slug' => getSlug($product->slug . '-' . strtoupper($color)),
                        ],
                        [
                            'description' => $product->description,
                            'f_thumbnail' => $imageName,
                            'sku' => $sku,
                            'category' => $product->category,
                            'subcategory_id' => $product->subcategory_id,
                            'short_desc' => $product->short_desc,
                            'brand_id' => $product->brand_id,
                            'store_id' => $product->store_id,
                            'price1' => $product->price1,
                            'price2' => $product->price2,
                            'price3' => $product->price3,
                            'price4' => $product->price4,
                            'price5' => $product->price5,
                            'is_publish' => $product->is_publish,
                            'cost_price' => $product->cost_price,
                            'sale_price' => $product->sale_price,
                            'old_price' => $product->old_price,
                            'start_date' => $product->start_date,
                            'end_date' => $product->end_date,
                            'is_discount' => $product->is_discount,
                            'is_stock' => $product->is_stock,
                            'stock_status_id' => $product->stock_status_id,
                            'stock_qty' => $product->stock_qty,
                            'variation_color' => $row['variation_color'],
                            'variation_size' => $row['variation_size'],
                        ]
                    );
                    ProductVariations::create([
                        'product_id' => $product->id,
                        'size' => $size,
                        'color' => $color,
                        'sku' => $sku,
                        // Add other variation fields here if necessary
                    ]);
                }
            }
        }

        ProductVariations::create([
            'product_id' => $product->id,
            'size' => $product->sku,
            'color' => $product->sku,
            'sku' => $product->sku,
            'created_at' => now(),
            'updated_at' => now(),
        ]);
        return $product;
    }
}
