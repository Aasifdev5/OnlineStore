@extends('admin.Master')
@section('title', 'Product Import')

@section('content')
<div class="page-body">
    <br>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="card">
                    <div class="card-header">{{ __('Import Products') }}
                        <div class="col-lg-12">
                            <div class="float-right">
                                <a href="{{ route('backend.products') }}" class="btn btn-warning pull-right"><i
                                        class="fa fa-reply"></i> {{ __('Back to List') }}</a>
                                        <a href="{{ route('download.sample.file') }}" class="btn btn-success pull-left">
                                            {{ __('Download Sample File To understand what will use in header or first row of EXCEL FILE') }}
                                        </a>
                            </div>
                        </div>
                    </div>

                    <div class="card-body">
                        @if ($errors->any())
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif

                        <form action="{{ route('products.import') }}" method="POST" enctype="multipart/form-data">
                            @csrf

                            <div class="form-group">
                                <label for="file">Choose file to import:</label>
                                <input type="file" name="file" class="form-control-file" id="file" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel">
                            </div>

                            <button type="submit" class="btn btn-primary">Import</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
