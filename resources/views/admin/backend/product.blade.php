@extends('admin.Master')

@section('title', __('Product'))

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
                                        {{ __('Product') }}
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="float-right">
                                            <a href="{{ route('backend.products') }}" class="btn btn-warning pull-right"><i
                                                    class="fa fa-reply"></i> {{ __('Back to List') }}</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-25">
                                <div class="col-lg-3" style="margin-top: 25px;">
                                    <div class="card">
                                        <div class="card-header">
                                            {{ __('Product') }}
                                        </div>
                                        <ul class="nav flex-column nav-pills" id="myTab" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active" id="product-tab" data-toggle="tab" href="{{ route('backend.product') }}" role="tab" aria-controls="product" aria-selected="true"><i class="fa fa-truck"></i> {{ __('Product') }}</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="price-tab" data-toggle="tab" href="{{ route('backend.price') }}" role="tab" aria-controls="price" aria-selected="false"><i class="fa fa-money"></i> {{ __('Discount Manage') }}</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="inventory-tab" data-toggle="tab" href="{{ route('backend.inventory') }}" role="tab" aria-controls="inventory" aria-selected="false"><i class="fa fa-balance-scale"></i> {{ __('Inventory') }}</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="images-tab" data-toggle="tab" href="{{ route('backend.product-images') }}" role="tab" aria-controls="images" aria-selected="false"><i class="fa fa-picture-o"></i> {{ __('Multiple Images') }}</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="variations-tab" data-toggle="tab" href="{{ route('backend.variations') }}" role="tab" aria-controls="variations" aria-selected="false"><i class="fa fa-hourglass-end"></i> {{ __('Variations') }}</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="seo-tab" data-toggle="tab" href="{{ route('backend.product-seo') }}" role="tab" aria-controls="seo" aria-selected="false"><i class="fa fa-rocket"></i> {{ __('SEO') }}</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-lg-9" style="margin-top: 25px;">
                                    <div class="card">
                                        <div class="card-body">
                                <div class="tab-content" id="myTabContent">
                                    <!--Data Entry Form-->
                                    <form action="" method="POST">

                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="form-group">
                                                    <label for="product_name">{{ __('Product Name') }}<span
                                                            class="red">*</span></label>
                                                    <input type="text" name="title" id="product_name"
                                                        class="form-control parsley-validated" data-required="true">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="form-group">
                                                    <label for="slug">{{ __('Slug') }}<span
                                                            class="red">*</span></label>
                                                    <input type="text" name="slug" id="slug"
                                                        class="form-control parsley-validated" data-required="true">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="form-group">
                                                    <label for="short_desc">{{ __('Short Description') }}</label>
                                                    <textarea name="short_desc" id="short_desc" class="form-control" rows="2"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="form-group tpeditor">
                                                    <label for="description">{{ __('Product Content') }}</label>
                                                    <textarea name="description" id="description" class="form-control" rows="4"></textarea>
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
                                            <div class="col-lg-6">
                                                <div class="input__group mb-25">
                                                    <label>{{ __('Imagen ') }}</label>
                                                    <div class="upload-img-box">
                                                        <img src="">
                                                        <input type="file" name="og_image" id="og_image"
                                                            accept="image/*" onchange="previewFile(this)">
                                                        <div class="upload-img-box-icon">
                                                            <i class="fa fa-camera"></i>
                                                            <p class="m-0">{{ __('Imagen OG') }}</p>
                                                        </div>
                                                    </div>
                                                    @if ($errors->has('og_image'))
                                                        <span class="text-danger"><i
                                                                class="fas fa-exclamation-triangle"></i>
                                                            {{ $errors->first('og_image') }}</span>
                                                    @endif
                                                    <p>
                                                        <span class="text-black">{{ __('Tamaño Recomendado') }}:</span>
                                                        400px x 400px
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="brand_id">{{ __('Brand') }}<span
                                                            class="red">*</span></label>
                                                    <select name="brand_id" id="brand_id"
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
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="storeid">{{ __('Store') }}<span
                                                            class="red">*</span></label>
                                                    <select name="storeid" id="storeid"
                                                        class="chosen-select form-control">
                                                        @foreach ($storeList as $row)
                                                            <option value="{{ $row->id }}">
                                                                {{ $row->shop_name }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-sm-6">
                                            <label class="col-form-label">Assign Price</label>
                                            <br>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" id="priceBicycle"
                                                    name="price" value="price1">
                                                <label class="form-check-label" for="priceBicycle">Price 1 </label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" id="priceMotorcycle"
                                                    name="price" value="price2">
                                                <label class="form-check-label" for="priceMotorcycle">Price 2 </label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" id="priceShimano"
                                                    name="price" value="price3">
                                                <label class="form-check-label" for="priceShimano">Price 3 </label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" id="priceLoadline"
                                                    name="price" value="price4">
                                                <label class="form-check-label" for="priceLoadline">Price 4 </label>
                                            </div>

                                            <span class="text-danger">
                                                @error('price')
                                                    {{ $message }}
                                                @enderror
                                            </span>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="tax_id">{{ __('Tax') }}<span
                                                            class="red">*</span></label>
                                                    <select name="tax_id" id="tax_id"
                                                        class="chosen-select form-control">
                                                        @foreach ($taxlist as $row)
                                                            <option value="{{ $row->id }}">
                                                                {{ $row->title }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="sale_price">{{ __('Sale Price') }}<span
                                                            class="red">*</span></label>
                                                    <input name="sale_price" id="sale_price" type="text"
                                                        class="form-control parsley-validated" data-required="true">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">


                                        </div>



                                        <div class="row">



                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <label class="col-form-label">Estado</label>
                                                <br>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" id="statusYes"
                                                        name="status" value="1">
                                                    <label class="form-check-label" for="statusYes">Sí </label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" id="statusNo"
                                                        name="status" value="0">
                                                    <label class="form-check-label" for="statusNo">No</label>
                                                </div>

                                                <span class="text-danger">
                                                    @error('status')
                                                        {{ $message }}
                                                    @enderror
                                                </span>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row tabs-footer mt-15">
                                            <div class="col-lg-12">
                                                <button type="submit"
                                                    class="btn btn-primary">{{ __('Save') }}</button>
                                            </div>
                                        </div>
                                    </form>
                                    <!--/Data Entry Form/-->
                                </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- /main Section -->
    </div>




@endsection
