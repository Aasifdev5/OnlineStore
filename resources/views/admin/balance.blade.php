@extends('admin.Master')
@section('title')
    Order Request
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
                            <h5> Order Request List</h5>

                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="advance-1" class="table table-striped table-bordered table-hover">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>#</th>
                                            <th>Order ID</th>
                                            <th>Monto</th>
                                            <th>Recibo</th>
                                            <th>Estado</th>
                                            <th>Acción</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @php
                                            $previousOrderId = null; // To keep track of the previous order ID
                                            $totalAmount = 0; // To accumulate the total amount for the order
                                        @endphp

                                        @foreach ($transaction as $transaction)
                                            @php
                                                $products = json_decode($transaction->product_details, true);
                                                $orderAmount = $transaction->amount;
                                            @endphp

                                            @foreach ($products as $product)
                                                @php
                                                    $productDetails = \App\Models\Product::find($product['product_id']);
                                                    $totalAmount += $product['price']; // Summing up the price of each product
                                                @endphp

                                                @if ($productDetails)
                                                    @if ($transaction->order_id !== $previousOrderId)
                                                        <tr>
                                                            <td colspan="6">Order ID: {{ $transaction->order_id }}</td>
                                                            <!-- Display the total order amount -->
                                                        </tr>
                                                        <tr>
                                                            <td>{{ $loop->parent->iteration }}</td>
                                                            <!-- Use $loop->parent to get the iteration of the outer loop -->
                                                            <td>{{ $transaction->order_id }}</td>
                                                            <td>{{ $orderAmount }}</td>
                                                            <td>
                                                                @if ($transaction->payment_receipt)
                                                                    <a href="{{ asset($transaction->payment_receipt) }}"
                                                                        target="_blank">
                                                                        <img src="{{ asset($transaction->payment_receipt) }}"
                                                                            alt="Payment Receipt" style="max-width: 100px;">
                                                                    </a>
                                                                @else
                                                                    No receipt uploaded
                                                                @endif
                                                            </td>
                                                            <td>
                                                                @if ($transaction->accepted)
                                                                    Aceptado
                                                                @else
                                                                    Pendiente
                                                                @endif
                                                            </td>
                                                            <td>
                                                                @if (!$transaction->accepted)
                                                                    <a href="{{ route('accept', ['id' => $transaction->id]) }}"
                                                                        class="btn btn-sm btn-success">Aceptar</a>
                                                                @endif
                                                            </td>
                                                        </tr>
                                                        @php
                                                            $previousOrderId = $transaction->order_id;
                                                            $totalAmount = 0; // Reset total amount for the new order ID
                                                        @endphp
                                                    @endif
                                                    <tr>
                                                        <td></td>
                                                        <td>{{ $productDetails->title }}</td>
                                                        <td>{{ $product['price'] }}</td>
                                                        <td> <img
                                                                src="{{ asset('f_thumbnail/' . $productDetails->f_thumbnail) }}"
                                                                width="70" height="50" /></td>
                                                        <td colspan="3"></td>
                                                        <!-- Empty colspan to align with headers -->
                                                    </tr>
                                                @endif
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
