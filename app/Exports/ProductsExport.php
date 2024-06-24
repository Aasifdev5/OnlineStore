<?php

namespace App\Exports;

use App\Models\Product;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class ProductsExport implements FromCollection, WithHeadings
{
    public function collection()
    {
        return Product::all();
    }

    public function headings(): array
    {
        return [
            'ID',
            'Title',
            'Description',
            'Thumbnail',
            'Category ID',
            'Short Description',
            'Brand ID',
            'Store ID',
            'Price 1',
            'Price 2',
            'Price 3',
            'Price 4',
            'Price 5',
            'Cost Price',
            'Sale Price',
            'Old Price',
            'Start Date',
            'End Date',
            'Is Discount',
            'Is Stock',
            'Stock Status ID',
            'SKU',
            'Stock Qty',
            'OG Title',
            'OG Description',
            'OG Keywords',
        ];
    }
}
