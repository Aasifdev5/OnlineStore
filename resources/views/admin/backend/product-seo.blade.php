@extends('admin.Master')

@section('title', __('SEO'))

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
								{{ __('SEO') }}
							</div>
							<div class="col-lg-6">
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
                                        <a class="nav-link" id="inventory-tab" data-toggle="tab" href="{{ route('backend.inventory') }}" role="tab" aria-controls="inventory" aria-selected="false"><i class="fa fa-balance-scale"></i> {{ __('Inventory') }}</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="images-tab" data-toggle="tab" href="{{ route('backend.product-images') }}" role="tab" aria-controls="images" aria-selected="false"><i class="fa fa-picture-o"></i> {{ __('Multiple Images') }}</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="variations-tab" data-toggle="tab" href="{{ route('backend.variations') }}" role="tab" aria-controls="variations" aria-selected="false"><i class="fa fa-hourglass-end"></i> {{ __('Variations') }}</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link active" id="seo-tab" data-toggle="tab" href="{{ route('backend.product-seo') }}" role="tab" aria-controls="seo" aria-selected="false"><i class="fa fa-rocket"></i> {{ __('SEO') }}</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <br>
                        <div class="col-lg-9" style="margin-top: 25px;">
                            <div class="card">
                                <div class="card-body">
						<div class="tab-content" id="myTabContent">
							<!--Data Entry Form-->
							<form action="" method="POST">
								<div class="row">
									<div class="col-lg-12">
										<div class="form-group">
											<label for="og_title">{{ __('SEO Title') }}</label>
											<input  type="text" name="og_title" id="og_title" class="form-control">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<div class="form-group">
											<label for="og_keywords">{{ __('SEO Keywords') }}</label>
											<input  type="text" name="og_keywords" id="og_keywords" class="form-control">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label for="og_description">{{ __('SEO Description') }}</label>
											<textarea name="og_description" id="og_description" class="form-control" rows="2"></textarea>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-12">
										<div class="input__group mb-25">
                                            <label>{{ __('Imagen ') }}</label>
                                            <div class="upload-img-box">
                                                <img src="">
                                                <input type="file" name="og_image" id="og_image" accept="image/*"
                                                    onchange="previewFile(this)">
                                                <div class="upload-img-box-icon">
                                                    <i class="fa fa-camera"></i>
                                                    <p class="m-0">{{ __('Imagen OG') }}</p>
                                                </div>
                                            </div>
                                            @if ($errors->has('og_image'))
                                                <span class="text-danger"><i class="fas fa-exclamation-triangle"></i>
                                                    {{ $errors->first('og_image') }}</span>
                                            @endif
                                            <p>
                                                <span class="text-black">{{ __('Tamaño Recomendado') }}:</span> 400px x 400px
                                            </p>
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


