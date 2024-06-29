@extends('admin.Master')
@section('title')
    Products
@endsection
@section('content')
    <div class="page-body">
        <br>
        <!-- main Section -->
        <div class="main-body">
            <div class="container-fluid">

                <div class="row mt-25">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <span>{{ __('Products') }}</span>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="float-right">
                                            <a id="show-form-btn" class="btn btn-primary btn-form pull-right"><i
                                                    class="fa fa-plus"></i> {{ __('Add New') }}</a>
                                                    <center>
                                                        <a href="{{ route('export.products') }}" class="btn btn-success ">
                                                            {{ __('Export Products') }}
                                                        </a>
                                                    </center>


                                                    <a href="{{ url('admin\import') }}" class="btn btn-primary btn-form pull-left"><i
                                                        class="fa fa-plus"></i> {{ __('Import Products') }}</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--Data grid-->
                            <div id="list-panel" class="card-body">


                                <!--Data Entry Form-->
                                <div id="form-panel" class="card-body" style="display: none">
                                    <form action="{{ url('admin\saveProductsData') }}" method="POST">
                                        @csrf
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="form-group">
                                                    <label for="title">{{ __('Product Name') }}<span
                                                            class="red">*</span></label>
                                                    <input type="text" name="title" id="title"
                                                        class="form-control parsley-validated" data-required="true">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="slug">{{ __('Slug') }}<span
                                                            class="red">*</span></label>
                                                    <input type="text" name="slug" id="slug"
                                                        class="form-control parsley-validated" data-required="true">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">



                                            <div class="col-sm-4">
                                                <label class="col-form-label"> Category</label>
                                                <select name="categories"  class="select2 form-control">
                                                    <option value="">Please Category</option>
                                        @php
                                        $categories = \App\Models\Category::all();
                                        @endphp
                                        @foreach($categories as $row)
                                        <option value="{{$row->id}}">{{$row->name}}</option>
                                        @endforeach
                                    </select>
                                            </div>
                                            <div class="col-sm-4">

                                                    <label for="brand_id">{{ __('Brand') }}<span
                                                            class="red">*</span></label>
                                                    <select name="brand_id" id="brand_id"
                                                        class="select2 chosen-select form-control">
                                                        <option value="0">No Brand</option>
                                                        @foreach ($brandlist as $row)
                                                            <option value="{{ $row->id }}">
                                                                {{ $row->name }}
                                                            </option>
                                                        @endforeach
                                                    </select>

                                            </div>
                                            <div class="col-sm-4">

                                                    <label for="store_id">{{ __('Store') }}<span
                                                            class="red">*</span></label>
                                                    <select name="store_id" id="store_id"
                                                        class="select2 chosen-select form-control">
                                                        @foreach ($storeList as $row)
                                                            <option value="{{ $row->id }}">
                                                                {{ $row->store }}
                                                            </option>
                                                        @endforeach
                                                    </select>

                                            </div>
                                        </div>

                                        <input type="hidden" name="RecordId" id="RecordId">
                                        <br>
                                        <div class="row tabs-footer mt-15">
                                            <div class="col-lg-12">
                                                <button type="submit"
                                                    class="btn btn-primary mr-10">{{ __('Save') }}</button>

                                            </div>
                                        </div>
                                    </form>
                                </div>


                                <div id="tp_datalist">
                                    @include('admin.backend.products_table')
                                </div>
                            </div>
                            <!--/Data grid/-->


                        </div>
                    </div>
                </div>


            </div>
            <!-- /main Section -->
        </div>
        <script>
            document.getElementById('show-form-btn').addEventListener('click', function(event) {
                event.preventDefault(); // Prevent default link behavior (navigation)
                document.getElementById('form-panel').style.display = 'block'; // Show the form
                document.getElementById('tp_datalist').style.display = 'none'; // Hide tp_datalist
            });
        </script>
    @endsection
