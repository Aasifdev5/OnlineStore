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



                                            <div class="col-sm-6">
                                                <label class="col-form-label">Assign Category</label>
                                                <div class="form-group">
                                                    <div>
                                                        <input type="radio" name="categories" id="category_bicycle"
                                                            value="bicycle">
                                                        <label for="category_bicycle">Bicycle</label>
                                                    </div>
                                                    <div>
                                                        <input type="radio" name="categories" id="category_motorcycle"
                                                            value="motorcycle">
                                                        <label for="category_motorcycle">Motorcycle</label>
                                                    </div>
                                                    <div>
                                                        <input type="radio" name="categories" id="category_shimano"
                                                            value="shimano">
                                                        <label for="category_shimano">Shimano</label>
                                                    </div>
                                                    <div>
                                                        <input type="radio" name="categories" id="category_loadline"
                                                            value="loadline">
                                                        <label for="category_loadline">Load Line</label>
                                                    </div>
                                                    <span class="text-danger">
                                                        @error('category')
                                                            {{ $message }}
                                                        @enderror
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="brandid">{{ __('Brand') }}<span
                                                            class="red">*</span></label>
                                                    <select name="brandid" id="brandid"
                                                        class="chosen-select form-control">
                                                        <option value="0">No Brand</option>
                                                        @foreach ($brandlist as $row)
                                                            <option value="{{ $row->id }}">
                                                                {{ $row->name }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="storeid">{{ __('Store') }}<span
                                                            class="red">*</span></label>
                                                    <select name="storeid" id="storeid"
                                                        class="chosen-select form-control">
                                                        @foreach ($storeList as $row)
                                                            <option value="{{ $row->id }}">
                                                                {{ $row->store }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>
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
