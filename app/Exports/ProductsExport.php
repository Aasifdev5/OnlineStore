<?php

namespace App\Exports;

use App\Models\Product;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class ProductsExport implements FromCollection, WithHeadings
{
    /**
     * Retrieve all products from the database with explicit columns.
     *
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        return Product::select([
            'id',
            'title',
            'slug',
            'f_thumbnail',
            'short_desc',
            'description',
            'extra_desc',
            'cost_price',
            'sale_price',
            'old_price',
            'start_date',
            'end_date',
            'is_discount',
            'is_stock',
            'sku',
            'stock_status_id',
            'stock_qty',
            'u_stock_qty',
            'subcategory_id',
            'category',
            'brand_id',

            'variation_color',
            'variation_size',
            'tax_id',
            'is_publish',
            'user_id',
            'store_id',
            'og_title',
            'og_image',
            'og_description',
            'og_keywords',
            'price',
            'price1',
            'price2',
            'price3',
            'price4',
            'price5'
        ])->get();
    }

    /**
     * Define the headings for the exported file.
     *
     * @return array
     */
    public function headings(): array
    {
        return [
            'ID',
            'Title',
            'Slug',
            'Thumbnail',
            'Short Description',
            'Description',
            'Extra Description',
            'Cost Price',
            'Sale Price',
            'Old Price',
            'Start Date',
            'End Date',
            'Is Discount',
            'Is Stock',
            'SKU',
            'Stock Status ID',
            'Stock Qty',
            'Updated Stock Qty',
            'Subcategory ID',
            'Category',
            'Brand ID',

            'Variation Color',
            'Variation Size',
            'Tax ID',
            'Is Publish',
            'User ID',
            'Store ID',
            'OG Title',
            'OG Image',
            'OG Description',
            'OG Keywords',
            'Price',
            'Price1',
            'Price2',
            'Price3',
            'Price4',
            'Price5'
        ];
    }
}
