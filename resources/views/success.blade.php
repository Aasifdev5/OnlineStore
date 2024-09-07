@extends('master')

@section('title')
Order Success
@endsection

@section('content')
<main class="main__content_wrapper">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Pedido realizado con éxito</div>
                    <div class="card-body">
                        ¡Tu pedido ha sido realizado con éxito!
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>

    <!-- Hidden inputs to pass data to the external JS file -->
    <input type="hidden" id="orderId" value="{{ $id }}">
    <input type="hidden" id="pdfDownloadUrl" value="{{ route('invoice.generate', ['id' => $id]) }}">

</main>

<!-- Include the external JS file -->
<script>
    document.addEventListener('DOMContentLoaded', function() {
    var orderId = document.getElementById('orderId').value; // Get the order ID from the hidden input
    var downloadUrl = document.getElementById('pdfDownloadUrl').value; // Get the PDF download URL

    // Create a hidden iframe and set its src to trigger the download
    var iframe = document.createElement('iframe');
    iframe.style.display = 'none';
    iframe.src = downloadUrl;

    document.body.appendChild(iframe); // Append iframe to the body to start the download
});

</script>
@endsection
