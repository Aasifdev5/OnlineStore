@extends('admin.Master')

@section('title', __('Related Products'))

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
                                        {{ __('Related Products') }}
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="float-right">
                                            <a href="{{ route('backend.products') }}" class="btn btn-warning pull-right"><i
                                                class="fa fa-reply"></i> {{ __('Back to List') }}</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-3" style="margin-top: 25px;">
                                    <div class="card">
                                        <div class="card-header">
                                            {{ __('Product') }}
                                        </div>
                                        <ul class="nav flex-column nav-pills" id="myTab" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link " id="product-tab" data-toggle="tab"
                                                    href="{{ route('backend.product', [$datalist['id']]) }}" role="tab"
                                                    aria-controls="product" aria-selected="true"><i class="fa fa-truck"></i>
                                                    {{ __('Product') }}</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="price-tab" data-toggle="tab"
                                                    href="{{ route('backend.price', [$datalist['id']]) }}" role="tab"
                                                    aria-controls="price" aria-selected="false"><i class="fa fa-money"></i>
                                                    {{ __('Discount Manage') }}</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link " id="inventory-tab" data-toggle="tab"
                                                    href="{{ route('backend.inventory', [$datalist['id']]) }}"
                                                    role="tab" aria-controls="inventory" aria-selected="false"><i
                                                        class="fa fa-balance-scale"></i> {{ __('Inventory') }}</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="images-tab" data-toggle="tab"
                                                    href="{{ route('backend.product-images', [$datalist['id']]) }}"
                                                    role="tab" aria-controls="images" aria-selected="false"><i
                                                        class="fa fa-picture-o"></i> {{ __('Multiple Images') }}</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="variations-tab" data-toggle="tab"
                                                    href="{{ route('backend.variations', [$datalist['id']]) }}"
                                                    role="tab" aria-controls="variations" aria-selected="false"><i
                                                        class="fa fa-hourglass-end"></i> {{ __('Variations') }}</a>
                                            </li>
                                            <li class="nav-item"><a class="nav-link active"
                                                    href="{{ route('backend.related-products', [$datalist['id']]) }}"><i
                                                        class="fa fa-compass"></i>{{ __('Related Products') }}</a></li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="seo-tab" data-toggle="tab"
                                                    href="{{ route('backend.product-seo', [$datalist['id']]) }}"
                                                    role="tab" aria-controls="seo" aria-selected="false"><i
                                                        class="fa fa-rocket"></i>
                                                    {{ __('SEO') }}</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-lg-9" style="margin-top: 25px;">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="tabs-body">
                                                <div class="row">
                                                    <div class="col-lg-7">
                                                        <a onClick="onAddRelatedProductsModalView()"
                                                            href="javascript:void(0);" class="btn blue-btn mr-10"><i
                                                                class="fa fa-plus"></i> {{ __('Add New') }}</a>
                                                    </div>
                                                    <div class="col-lg-5">
                                                        <div class="form-group search-box">
                                                            <input id="search" name="search" type="text"
                                                                class="form-control" placeholder="{{ __('Search') }}...">
                                                            <button type="submit" onClick="onSearch()"
                                                                class="btn search-btn">{{ __('Search') }}</button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="tp_datalist">

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
        </div>

        <!-- Products modal -->
        <div id="global_media_modal_view" class="modal bd-example-modal-lg">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">{{ __('Products') }}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body media-content padding-no">
                        <div class="container-fluid">
                            <div class="row mt-15">
                                <div class="col-lg-7"></div>
                                <div class="col-lg-5">
                                    <div class="form-group search-box">
                                        <input id="search_modal" name="search_modal" type="text" class="form-control"
                                            placeholder="{{ __('Search') }}...">
                                        <button type="submit" onClick="onSearchModal()"
                                            class="btn search-btn">{{ __('Search') }}</button>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div id="tp_datalist_modal">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/Products modal/-->

        <!-- /main Section -->
    </div>

@endsection
