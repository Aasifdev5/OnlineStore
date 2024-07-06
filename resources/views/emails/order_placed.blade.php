<!DOCTYPE html>
<html>
<head>
    <title>Your Order</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background-color: #f9f9f9;
        }
        .header {
            text-align: center;
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
            margin-bottom: 20px;
        }
        .order-details, .product-details {
            margin-bottom: 20px;
        }
        .product-details th, .product-details td {
            padding: 10px;
            text-align: left;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Thank you for your order!</h1>
        </div>

        <div class="order-details">
            <h2>Order Summary</h2>
            <p><strong>Order ID:</strong> {{ $order->id }}</p>
            <p><strong>Total Amount:</strong> BS{{ number_format($order->total_amount, 2) }}</p>
        </div>

        <div class="product-details">
            <h2>Product Details</h2>
            <table class="table table-bordered">
                <thead class="thead-light">
                    <tr>
                        <th>Product Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($order->products as $product)
                    <tr>
                        <td>{{ $product->title }}</td>
                        <td>{{ $product->pivot->quantity }}</td>
                        <td>BS{{ number_format($product->pivot->price, 2) }}</td>
                        <td>BS{{ number_format($product->pivot->price * $product->pivot->quantity, 2) }}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>

        <div class="footer">
            <p>We will notify you once your order is shipped.</p>
            <p>For any queries, contact our support team.</p>
        </div>
    </div>
</body>
</html>
