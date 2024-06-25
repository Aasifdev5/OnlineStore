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
            'slug' => getSlug($row['title']) ,// Generate slug from title
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
            'variation_color'=>$row['variation_color'],
            'variation_size'=>$row['variation_size'],
            // 'variation_color'=>implode(',',$row['variation_color']),
            // 'variation_size'=>implode(',',$row['variation_size']),
            'og_title' => $row['og_title'],
            'og_description' => $row['og_description'],
            'og_keywords' => $row['og_keywords'],
        ]);

        // Save the product
        $product->save();

        // Process product images (assuming 'image_1', 'image_2', ... up to 'image_15')
        for ($i = 1; $i <= 15; $i++) {
            if (isset($row['image_' . $i])) {
                $imageName = $row['image_' . $i];
                $imagePath = 'product_images/' . $imageName; // Adjust this based on your directory structure

                Pro_image::create([
                    'thumbnail' => $imagePath,
                    'product_id' => $product->id,
                ]);
            }
        }

        // Clear previous variations for the product
        ProductVariations::where('product_id', $product->id)->delete();

        // Process product variations (assuming 'size_1', 'color_1', 'size_2', 'color_2', ...)
        for ($j = 1; $j <= 5; $j++) { // Adjust the limit based on the maximum number of variations
            if (isset($row['size_' . $j]) && isset($row['color_' . $j])) {
                $size = $row['size_' . $j];
                $color = $row['color_' . $j];
                $mainSku = $row['sku'];

                $sku = $mainSku . '-' . $size . '-' . $color;

                ProductVariations::create([
                    'product_id' => $product->id,
                    'size' => $size,
                    'color' => $color,
                    'sku' => $sku,
                    // Add other variation fields here if necessary
                ]);
            }
        }

        return $product;
    }
}
