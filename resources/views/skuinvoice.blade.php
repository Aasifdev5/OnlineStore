<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invoice</title>
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
        <h2>Factura</h2>
        <img src="https://bikebros.net/site_logo/Logo bikebros oficial color amarillo.png" alt="Company Logo">
    </div>
    <div class="invoice-details">
        <p><strong>Número de factura:</strong> #INV-00{{ $order->id }}</p>
        <p><strong>Fecha:</strong> {{ $order->created_at->format('F j, Y') }}</p>
        <p><strong>Nombre del cliente:</strong> {{ $order->customer->name }}</p>
        <p><strong>Dirección del cliente:</strong> {{ $order->customer->address }}, {{ $order->customer->city }}, {{ $order->customer->country }}</p>
    </div>
    <table class="table invoice-table">
        <thead class="thead-light">
            <tr>
                <th>Imagen</th>
                <th>Producto</th>
                <th>SKU</th>
                <th>Cantidad</th>
                <th>Precio unitario</th>
                <th>Subtotal</th>
            </tr>
        </thead>
        <tbody>
            @php
                $total = 0;
            @endphp
            @foreach($items as $item)
                @php
                    $subtotal = $item->price * $item->quantity;
                    $total += $subtotal;

                @endphp
                <tr>
                    <td>
                        @if($item->product && $item->product->f_thumbnail)

                            <img src="https://bikebros.net/product_images/{{  $item->product->f_thumbnail }}" alt="{{ $item->product->title }}" style="width: 50px; height: 50px;">
                        @else
                            N/A
                        @endif
                    </td>
                    <td>{{ $item->product ? $item->product->title : 'N/A' }}</td>
                    <td>{{ $item->product ? $item->product->sku : 'N/A' }}</td>
                    <td>{{ $item->quantity }}</td>
                    <td>{{ number_format($item->price, 2) }}</td>
                    <td>{{ number_format($subtotal, 2) }}</td>
                </tr>
            @endforeach
        </tbody>
        <tfoot>
            <tr>
                <td colspan="5" class="text-right"><strong>Total</strong></td>
                <td><strong>{{ number_format($total, 2) }}</strong></td>
            </tr>
        </tfoot>

    </table>
    <div class="invoice-footer">
        <p>¡Gracias por hacer negocios!</p>
        <p>Si tiene alguna pregunta, contáctenos en admin@bikebros.net</p>
    </div>
</div>
</body>
</html>
