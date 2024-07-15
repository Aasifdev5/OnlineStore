@extends('admin.Master')
@section('title')
    Pedido
@endsection
@section('content')
    <style>
        .table {
            width: 100%;
            max-width: 100%;
            margin-bottom: 1rem;
            background-color: #fff;
            border-collapse: collapse;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .table th,
        .table td {
            padding: 0.75rem;
            vertical-align: top;
            border-top: 1px solid #dee2e6;
        }

        .table thead th {
            vertical-align: bottom;
            border-bottom: 2px solid #dee2e6;
            background-color: #343a40;
            color: #fff;
        }

        .table tbody tr:hover {
            background-color: #f8f9fa;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: rgba(0, 0, 0, 0.05);
        }

        .table-striped tbody tr:nth-of-type(even) {
            background-color: rgba(0, 0, 0, 0.03);
        }

        .table-bordered {
            border: 1px solid #dee2e6;
        }

        .table-bordered th,
        .table-bordered td {
            border: 1px solid #dee2e6;
        }

        .table-hover tbody tr:hover {
            background-color: #e9ecef;
        }

        .table-hover tbody tr:hover td {
            color: #0056b3;
        }

        .table-hover tbody tr:hover a {
            color: #0056b3;
            text-decoration: none;
        }
    </style>
    <div class="page-body">

        <!-- Container-fluid starts-->
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12">
                    <div class="card">
                        @if (Session::has('success'))
                            <div class="alert alert-success">
                                <p>{{ session::get('success') }}</p>
                            </div>
                        @endif
                        @if (Session::has('fail'))
                            <div class="alert alert-danger">
                                <p>{{ session::get('fail') }}</p>
                            </div>
                        @endif
                        <div class="card-header">
                            <h5> Lista de solicitudes de pedidos</h5>

                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="advance-1" class="table table-striped table-bordered table-hover">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>#</th>
                                            <th>Usuario</th>
                                            <th>Número de pedido</th>
                                            <th>Monto</th>
                                            <th>Producto</th>
                                            <th>SKU</th>
                                            <th>Precio</th>
                                            <th>Cantidad</th>
                                            <th>Color</th>
                                            <th>Imagen</th>
                                            <th>Factura</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @php
                                            $previousOrderId = null; // To keep track of the previous order ID
                                        @endphp

                                        @foreach ($transaction as $transaction)
                                            @php
                                                $products = json_decode($transaction->product_details, true);
                                                $orderAmount = $transaction->amount;
                                                $user = \App\Models\User::find($transaction->user_id); // Fetch user information
                                            @endphp

                                            @foreach ($products as $index => $product)
                                                @php
                                                    $productDetails = \App\Models\Product::find($product['product_id']);
                                                    if (!$productDetails) {
                                                        continue;
                                                    } // Skip if product details not found

                                                    $orderItem = \App\Models\OrderItem::where(
                                                        'order_id',
                                                        $transaction->order_id,
                                                    )
                                                        ->where('product_id', $product['product_id'])
                                                        ->first();
                                                    $productColor = $orderItem ? $orderItem->color : 'N/A';
                                                    $productSku = $productDetails->sku ?? 'N/A';

                                                    // Show "Descargar factura" link only for the first product in each order
                                                    $showInvoiceLink = $index === 0;
                                                @endphp

                                                @if ($transaction->order_id !== $previousOrderId)
                                                    <tr>
                                                        <td>{{ $loop->parent->iteration }}</td>
                                                        <td>{{ $user ? $user->name : 'Usuario desconocido' }}</td>
                                                        <td>{{ $transaction->order_id }}</td>
                                                        <td>{{ 'Total : BS' . number_format($orderAmount, 2) }}</td>
                                                        <td colspan="6"></td>
                                                        <!-- Empty colspan to align with headers -->
                                                    </tr>
                                                    @php
                                                        $previousOrderId = $transaction->order_id;
                                                    @endphp
                                                @endif

                                                <tr>
                                                    <td>{{ $index + 1 }}</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td>{{ $productDetails->title }}</td>
                                                    <td>{{ $productSku }}</td>
                                                    <td>{{ 'BS' . number_format($product['price'], 2) }}</td>
                                                    <td>{{ $product['quantity'] }}</td>
                                                    <td>{{ $productColor }}</td>
                                                    <td><img src="{{ asset('product_images/' . $productDetails->f_thumbnail) }}"
                                                            width="70" height="50" /></td>
                                                    <td class="account__table--body__cell">
                                                        @if ($showInvoiceLink)
                                                            <a href="{{ route('SkugenerateInvoice', ['id' => $transaction->order_id]) }}"
                                                                class="btn btn-primary">Descargar factura</a>
                                                        @endif
                                                    </td>
                                                </tr>
                                            @endforeach
                                        @endforeach
                                    </tbody>
                                </table>




                            </div>
                        </div>
                    </div>
                </div>
                <!-- DOM / jQuery  Ends-->


            </div>
        </div>


        <!-- Container-fluid Ends-->
        <!-- Container-fluid Ends-->
    </div>
@endsection
