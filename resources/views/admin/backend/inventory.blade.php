@extends('admin.Master')

@section('title', __('Inventory'))

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
								{{ __('Inventory') }}
							</div>
							<div class="col-lg-12">
								<div class="float-right">
									<a href="{{ route('backend.products') }}" class="btn btn-warning pull-right"><i class="fa fa-reply"></i> {{ __('Back to List') }}</a>
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
                                        <a class="nav-link " id="product-tab" data-toggle="tab" href="{{ route('backend.product') }}" role="tab" aria-controls="product" aria-selected="true"><i class="fa fa-truck"></i> {{ __('Product') }}</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="price-tab" data-toggle="tab" href="{{ route('backend.price') }}" role="tab" aria-controls="price" aria-selected="false"><i class="fa fa-money"></i> {{ __('Discount Manage') }}</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link active" id="inventory-tab" data-toggle="tab" href="{{ route('backend.inventory') }}" role="tab" aria-controls="inventory" aria-selected="false"><i class="fa fa-balance-scale"></i> {{ __('Inventory') }}</a>
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
						<div class="tabs-body">
							<!--Data Entry Form-->
							<form action="" method="POST">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="is_stock">{{ __('Manage Stock') }}</label>
											<select name="is_stock" id="is_stock" class="chosen-select form-control">
												<option  value="1">{{ __('YES') }}</option>
												<option  value="0">{{ __('NO') }}</option>
											</select>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="stock_status_id">{{ __('Stock Status') }}</label>
											<select name="stock_status_id" id="stock_status_id" class="chosen-select form-control">
												<option  value="1">{{ __('In Stock') }}</option>
												<option  value="0">{{ __('Out Of Stock') }}</option>
											</select>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label for="sku">{{ __('SKU') }}</label>
											<input  name="sku" id="sku" type="text" class="form-control">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="stock_qty">{{ __('Stock Quantity') }}</label>
											<input  name="stock_qty" id="stock_qty" type="number" class="form-control">
										</div>
									</div>
								</div>

<br>
								<div class="row tabs-footer mt-15">
									<div class="col-lg-12">
										<button type="submit" class="btn btn-primary">{{ __('Save') }}</button>
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

