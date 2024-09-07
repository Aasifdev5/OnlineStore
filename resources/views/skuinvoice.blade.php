<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PROFORMA</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }
        .invoice-container {
            max-width: 800px;
            margin: 40px auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        .invoice-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-bottom: 20px;
            border-bottom: 2px solid #f2f2f2;
        }
        .invoice-header h2 {
            margin: 0;
            font-size: 24px;
            color: #333;
        }
        .invoice-header img {
            height: 50px;
        }
        .invoice-details {
            margin: 20px 0;
            padding-bottom: 20px;
            border-bottom: 2px solid #f2f2f2;
        }
        .invoice-details p {
            margin: 5px 0;
            font-size: 14px;
            color: #555;
        }
        .invoice-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .invoice-table th, .invoice-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #f2f2f2;
        }
        .invoice-table th {
            background-color: #f2f2f2;
            font-size: 14px;
            color: #333;
        }
        .invoice-table td {
            font-size: 14px;
            color: #555;
        }
        .invoice-table tfoot td {
            font-size: 16px;
            color: #333;
            font-weight: bold;
            text-align: right;
            padding-top: 20px;
        }
        .invoice-footer {
            text-align: center;
            margin-top: 30px;
            color: #999;
            font-size: 12px;
        }
    </style>
</head>
<body>
<div class="invoice-container">
    <div class="invoice-header">
        <h2>PROFORMA</h2>
        <img src="https://bikebros.net/logos bikebros.png" alt="Company Logo">
    </div>
    <div class="invoice-details">
        <p><strong>Número de factura:</strong> #INV-00{{ $order->id }}</p>
        <p><strong>Fecha:</strong> {{ $order->created_at->format('F j, Y H:i:s') }}</p>
        <p><strong>Nombre del cliente:</strong> {{ $order->customer->name }}</p>
        <p><strong>Dirección del cliente:</strong> {{ $order->customer->address }}, {{ $order->customer->city }}, {{ $order->customer->country }}</p>
    </div>
<table class="table invoice-table">
    <thead class="thead-light">
        <tr>
            <th>Imagen</th>
            <th>Producto</th>
            <th>SKU</th>
            <th>Color</th>
            <th>Tamaño</th>
            <th>Cantidad</th>
            <th>Precio unitario</th>
            <th>Subtotal</th>
        </tr>
    </thead>
    <tbody>
        @php
            $total = 0;
            $groupedItems = [];
        @endphp

        @foreach($items as $item)
            @php
                // Create a unique key for each combination of product_id, color, and size
                $key = $item->product_id . '-' . $item->color . '-' . $item->size;

                // Fetch the correct SKU for each combination
                $variation = \App\Models\ProductVariations::where('product_id', $item->product_id)
                                                          ->where('color', $item->color)
                                                          ->where('size', $item->size)
                                                          ->first();

                $sku = $variation ? $variation->sku : 'N/A';

                if (!isset($groupedItems[$key])) {
                    $groupedItems[$key] = [
                        'product' => $item->product,
                        'color' => $item->color,
                        'size' => $item->size, // Include size in the grouping
                        'quantity' => 0,
                        'subtotal' => 0,
                        'price' => $item->price,
                        'sku' => $item->sku, // Store the correct SKU for each combination
                    ];
                }

                $groupedItems[$key]['quantity'] += $item->quantity;
                $groupedItems[$key]['subtotal'] += $item->price * $item->quantity;
            @endphp
        @endforeach

        @foreach($groupedItems as $group)
            @php
                $total += $group['subtotal'];
                $vcolor = \App\Models\ProductVariations::where('sku', $group['sku'])->first();

// Count the number of images for the given product and color 'm'
$productImagesCount = \App\Models\Pro_image::where('product_id', $group['product']->id)
                                            ->where('color', 'm')
                                            ->count();

// Use the count to decide how to fetch the images
if ($productImagesCount > 1) {
    // If there are multiple images with color 'm', fetch one
    $productImages = \App\Models\Pro_image::where('product_id', $group['product']->id)
                                          ->where('color', 'm')
                                          ->orderBy('id', 'asc')
                                          ->first();
} else {
    // Otherwise, fetch the image based on the vcolor
    $productImages = \App\Models\Pro_image::where('product_id', $vcolor->product_id)
                                          ->where('color', $vcolor->color)
                                          ->orderBy('id', 'asc')
                                          ->first();
}



                                                
            @endphp
            <tr>
                <td>
                    @if($productImages)
                        <img src="https://bikebros.net/{{ $productImages->thumbnail }}" alt="{{ $group['product']->title }}" style="width: 50px; height: 50px;">
                    @elseif($group['product'] && $group['product']->f_thumbnail)
                        <img src="https://bikebros.net/product_images/{{ $group['product']->f_thumbnail }}" alt="{{ $group['product']->title }}" style="width: 50px; height: 50px;">
                    @else
                        N/A
                    @endif
                </td>
                <td>{{ $group['product'] ? $group['product']->title : 'N/A' }}</td>
                <td>{{ $group['sku'] }}</td> <!-- Display the SKU -->
                <td>{{ $group['color'] ?? 'N/A' }}</td>
                <td>{{ $group['size'] ?? 'N/A' }}</td> <!-- Display size value -->
                <td>{{ $group['quantity'] }}</td>
                <td>{{ number_format($group['price'], 2) }}</td>
                <td>{{ number_format($group['subtotal'], 2) }}</td>
            </tr>
        @endforeach

        <tr>
            <td colspan="7">Total</td> <!-- Adjusted colspan to include the new column -->
            <td>{{ number_format($total, 2) }}</td>
        </tr>
    </tbody>
    <tfoot>
        <tr>
            <td colspan="7" class="text-right"><strong>Total</strong></td> <!-- Adjusted colspan to include the new column -->
            <td><strong>{{ number_format($total, 2) }}</strong></td>
        </tr>
    </tfoot>
</table>





    <div class="invoice-footer">
        <p>¡Gracias por tu pedido!</p>
        <p>Si tiene alguna pregunta, contáctenos por Whatsapp al 62476645 ó 65197437</p>
    </div>
</div>
</body>
</html>
