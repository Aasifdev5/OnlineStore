@extends('admin.Master')

@section('title', __('Variations'))

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
								{{ __('Variations') }}
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
                                        <a class="nav-link " id="product-tab" data-toggle="tab"
                                            href="{{ route('backend.product', [$datalist['id']]) }}" role="tab"
                                            aria-controls="product" aria-selected="true"><i class="fa fa-truck"></i>
                                            {{ __('Product') }}</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="price-tab" data-toggle="tab"
                                            href="{{ route('backend.price', [$datalist['id']]) }}" role="tab" aria-controls="price"
                                            aria-selected="false"><i class="fa fa-money"></i>
                                            {{ __('Discount Manage') }}</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="inventory-tab" data-toggle="tab"
                                            href="{{ route('backend.inventory', [$datalist['id']]) }}" role="tab"
                                            aria-controls="inventory" aria-selected="false"><i
                                                class="fa fa-balance-scale"></i> {{ __('Inventory') }}</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="images-tab" data-toggle="tab"
                                            href="{{ route('backend.product-images', [$datalist['id']]) }}" role="tab"
                                            aria-controls="images" aria-selected="false"><i
                                                class="fa fa-picture-o"></i> {{ __('Multiple Images') }}</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link active" id="variations-tab" data-toggle="tab"
                                            href="{{ route('backend.variations', [$datalist['id']]) }}" role="tab"
                                            aria-controls="variations" aria-selected="false"><i
                                                class="fa fa-hourglass-end"></i> {{ __('Variations') }}</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="seo-tab" data-toggle="tab"
                                            href="{{ route('backend.product-seo', [$datalist['id']]) }}" role="tab"
                                            aria-controls="seo" aria-selected="false"><i class="fa fa-rocket"></i>
                                            {{ __('SEO') }}</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <br>
                        <div class="col-lg-9" style="margin-top: 25px;">
                            <div class="card">
                                <div class="card-body">
						<div class="tabs-body">
							<!--Data Entry Form-->
							<form action="{{ url('admin\saveVariationsData') }}" method="POST">
                                @csrf
                                <input type="hidden" name="RecordId"
                                value="@if ($datalist['id']) {{ $datalist['id'] }} @endif">
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label for="variation_size">{{ __('Size') }}</label>
											<select data-placeholder="{{ __('Select Size') }}" name="variation_size[]" id="variation_size" class="select2 form-control" multiple>
                                                <option value="small" {{ in_array('small', explode(',', $datalist->variation_size)) ? 'selected' : '' }}>Small</option>
                                                <option value="medium" {{ in_array('medium', explode(',', $datalist->variation_size)) ? 'selected' : '' }}>Medium</option>
                                                <option value="large" {{ in_array('large', explode(',', $datalist->variation_size)) ? 'selected' : '' }}>Large</option>
                                            </select>

										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label for="variation_color">{{ __('Color') }}</label>
											<select data-placeholder="{{ __('Select Color') }}" name="variation_color[]" id="variation_color" class="select2 form-control" multiple>
                                                <option value="red" {{ in_array('red', explode(',', $datalist->variation_color)) ? 'selected' : '' }}>Red</option>
                                                <option value="green" {{ in_array('green', explode(',', $datalist->variation_color)) ? 'selected' : '' }}>Green</option>
                                                <option value="blue" {{ in_array('blue', explode(',', $datalist->variation_color)) ? 'selected' : '' }}>Blue</option>
                                                <option value="black" {{ in_array('black', explode(',', $datalist->variation_color)) ? 'selected' : '' }}>Black</option>
                                                <option value="white" {{ in_array('white', explode(',', $datalist->variation_color)) ? 'selected' : '' }}>White</option>
                                            </select>

										</div>
									</div>
								</div>

								<br>
								<div class="row tabs-footer mt-15">
									<div class="col-lg-12">
										<button type="submit" class="btn btn-primary">{{ __('Next Step') }}</button>
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

