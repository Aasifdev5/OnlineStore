@extends('admin.Master')
@section('title')
    Products
@endsection
@section('content')
<div class="page-body">
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
									<a  href="{{ url('admin/product') }}" class="btn btn-primary btn-form pull-left"><i class="fa fa-plus"></i> {{ __('Add New') }}</a>

                                    <a onClick="onListPanel()" href="javascript:void(0);" class="btn btn-warning btn-list pull-right "><i class="fa fa-reply"></i> {{ __('Back to List') }}</a>
								</div>
							</div>
						</div>
					</div>
					<!--Data grid-->
					<div id="list-panel" class="card-body">
						<div class="row mb-10">
							<div class="col-lg-9">
								<div class="group-button">
									<button type="button" onClick="onDataViewByStatus(0)" id="viewstatus_0" class="btn btn-theme viewstatus active">{{ __('All') }} ({{ $AllCount }})</button>
									<button type="button" onClick="onDataViewByStatus(1)" id="viewstatus_1" class="btn btn-theme viewstatus">{{ __('Published') }} ({{ $PublishedCount }})</button>
									<button type="button" onClick="onDataViewByStatus(2)" id="viewstatus_2" class="btn btn-theme viewstatus">{{ __('Draft') }} ({{ $DraftCount }})</button>
								</div>
								<input type="hidden" id="view_by_status" value="0"/>
							</div>
							<div class="col-md-3"></div>
						</div>

						<div class="row mb-10">

							<div class="col-md-3">
								<div class="form-group mb-10">
									<select name="category_id" id="category_id" class="chosen-select form-control">
										<option value="0" selected="selected">{{ __('All Category') }}</option>
										@foreach($categorylist as $row)
											<option value="{{ $row->id }}">
												{{ $row->name }}
											</option>
										@endforeach
									</select>
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group mb-10">
									<select name="brand_id" id="brand_id" class="chosen-select form-control">
										<option value="all" selected="selected">{{ __('All Brand') }}</option>
										<option value="0">No Brand</option>
										@foreach($brandlist as $row)
											<option value="{{ $row->id }}">
												{{ $row->name }}
											</option>
										@endforeach
									</select>
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group mb-10">
									<select name="store_id" id="store_id" class="chosen-select form-control">
										<option value="0" selected="selected">{{ __('All Store') }}</option>
										@foreach($storeList as $row)
											<option value="{{ $row->id }}">
												{{ $row->store }}
											</option>
										@endforeach
									</select>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-lg-4">
								<div class="form-group bulk-box">
									<select id="bulk-action" class="form-control">
										<option value="">{{ __('Select Action') }}</option>
										<option value="publish">{{ __('Publish') }}</option>
										<option value="draft">{{ __('Draft') }}</option>
										<option value="delete">{{ __('Delete Permanently') }}</option>
									</select>
									<button type="submit" onClick="onBulkAction()" class="btn bulk-btn">{{ __('Apply') }}</button>
								</div>
							</div>
							<div class="col-lg-3"></div>
							<div class="col-lg-5">
								<div class="form-group search-box">
									<input id="search" name="search" type="text" class="form-control" placeholder="{{ __('Search') }}...">
									<button type="submit" onClick="onSearch()" class="btn search-btn">{{ __('Search') }}</button>
								</div>
							</div>
						</div>
						<div id="tp_datalist">
							@include('admin.backend.products_table')
						</div>
					</div>
					<!--/Data grid/-->

					<!--Data Entry Form-->
					<div id="form-panel" class="card-body" style="display: none">
						<form  action="{{ url('admin\saveProductsData') }}" method="post"  id="DataEntry_formId">
							<div class="row">
								<div class="col-lg-12">
									<div class="form-group">
										<label for="title">{{ __('Product Name') }}<span class="red">*</span></label>
										<input type="text" name="title" id="title" class="form-control parsley-validated" data-required="true">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="slug">{{ __('Slug') }}<span class="red">*</span></label>
										<input type="text" name="slug" id="slug" class="form-control parsley-validated" data-required="true">
									</div>
								</div>
							</div>
							<div class="row">

								<div class="col-md-3">
									<div class="form-group">
										<label for="categoryid">{{ __('Category') }}<span class="red">*</span></label>
										<select name="categoryid" id="categoryid" class="chosen-select form-control">
											@foreach($categorylist as $row)
												<option value="{{ $row->id }}">
													{{ $row->name }}
												</option>
											@endforeach
										</select>
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label for="brandid">{{ __('Brand') }}<span class="red">*</span></label>
										<select name="brandid" id="brandid" class="chosen-select form-control">
											<option value="0">No Brand</option>
											@foreach($brandlist as $row)
												<option value="{{ $row->id }}">
													{{ $row->name }}
												</option>
											@endforeach
										</select>
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label for="storeid">{{ __('Store') }}<span class="red">*</span></label>
										<select name="storeid" id="storeid" class="chosen-select form-control">
										@foreach($storeList as $row)
											<option value="{{ $row->id }}">
												{{ $row->store }}
											</option>
										@endforeach
										</select>
									</div>
								</div>
							</div>

							<input type="text" name="RecordId" id="RecordId" class="dnone">
							<div class="row tabs-footer mt-15">
								<div class="col-lg-12">
                                    <br>
									<button type="submit" class="btn btn-primary mr-10">{{ __('Save') }}</button>
									<a onClick="onListPanel()" href="javascript:void(0);" class="btn btn-danger">{{ __('Cancel') }}</a>
								</div>
							</div>
						</form>
					</div>
					<!--/Data Entry Form/-->
				</div>
			</div>
		</div>

	</div>
</div>
<!-- /main Section -->
</div>
<script>
    var $ = jQuery.noConflict();
var RecordId = '';
var BulkAction = '';
var ids = [];

$(function () {
	"use strict";

	$.ajaxSetup({
		headers: {
			'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
		}
	});

	resetForm("DataEntry_formId");

	$("#submit-form").on("click", function () {
        $("#DataEntry_formId").submit();
    });

	$(document).on('click', '.pagination a', function(event){
		event.preventDefault();
		var page = $(this).attr('href').split('page=')[1];
		onPaginationDataLoad(page);
	});

	$('input:checkbox').prop('checked',false);

    $(".checkAll").on("click", function () {
        $("input:checkbox").not(this).prop("checked", this.checked);
    });

	$("#title").on("blur", function () {
		if(RecordId ==''){
			onProductSlug();
		}
	});

	$("#view_by_status").val(0);


	$("#category_id").val(0).trigger("chosen:updated");
	$("#category_id").on("change", function () {
		onRefreshData();
	});

	$("#brand_id").val('all').trigger("chosen:updated");
	$("#brand_id").on("change", function () {
		onRefreshData();
	});

	$("#store_id").val(0).trigger("chosen:updated");
	$("#store_id").on("change", function () {
		onRefreshData();
	});

	$("#lan").chosen();
	$("#lan").trigger("chosen:updated");
	$("#lan").on("change", function () {
		onCategoryListForform();
		onBrandListForform();
	});

});

function onCheckAll() {
    $(".checkAll").on("click", function () {
        $("input:checkbox").not(this).prop("checked", this.checked);
    });
}

function onPaginationDataLoad(page) {

	$.ajax({
		url:base_url + "/backend/getProductsTableData?page="+page
		+"&status="+$("#view_by_status").val()
		+"&search="+$("#search").val()

		+"&category_id="+$('#category_id').val()
		+"&brand_id="+$('#brand_id').val()
		+"&store_id="+$('#store_id').val(),
		success:function(data){
			$('#tp_datalist').html(data);
			onCheckAll();
		}
	});
}



function onSearch() {

	$.ajax({
		url: base_url + "/backend/getProductsTableData?search="+$("#search").val()
		+"&status="+$("#view_by_status").val()
		+"&language_code="+$('#language_code').val()
		+"&category_id="+$('#category_id').val()
		+"&brand_id="+$('#brand_id').val()
		+"&store_id="+$('#store_id').val(),
		success:function(data){
			$('#tp_datalist').html(data);
			onCheckAll();
		}
	});
}

function onDataViewByStatus(status) {

	$("#view_by_status").val(status);

	$(".viewstatus").removeClass('active')
	$("#viewstatus_"+status).addClass('active');

	$.ajax({
		url: base_url + "/backend/getProductsTableData?status="+$("#view_by_status").val()
		+"&search="+$("#search").val()
		+"&language_code="+$('#language_code').val()
		+"&category_id="+$('#category_id').val()
		+"&brand_id="+$('#brand_id').val()
		+"&store_id="+$('#store_id').val(),
		success:function(data){
			$('#tp_datalist').html(data);
			onCheckAll();
		}
	});
}

function resetForm(id) {
    $('#' + id).each(function () {
        this.reset();
    });

	$("#lan").trigger("chosen:updated");
}

function onListPanel() {
	$('.parsley-error-list').hide();
    $('#list-panel, .btn-form').show();
    $('#form-panel, .btn-list').hide();
}

function onFormPanel() {
    resetForm("DataEntry_formId");
	RecordId = '';

	$("#lan").trigger("chosen:updated");

    $('#list-panel, .btn-form').hide();
    $('#form-panel, .btn-list').show();

	onCategoryListForform();
	onBrandListForform();
}

function onEditPanel() {
    $('#list-panel, .btn-form').hide();
    $('#form-panel, .btn-list').show();
}

function showPerslyError() {
    $('.parsley-error-list').show();
}

jQuery('#DataEntry_formId').parsley({
    listeners: {
        onFieldValidate: function (elem) {
            if (!$(elem).is(':visible')) {
                return true;
            }
            else {
                showPerslyError();
                return false;
            }
        },
        onFormSubmit: function (isFormValid, event) {

                onConfirmWhenAddEdit();
                return false;

        }
    }
});

function onConfirmWhenAddEdit() {

    $.ajax({
		type : 'POST',
		url: base_url + '/backend/saveProductsData',
		data: $('#DataEntry_formId').serialize(),
		success: function (response) {
			var msgType = response.msgType;
			var msg = response.msg;

			if (msgType == "success") {
				resetForm("DataEntry_formId");
				onRefreshData();
				onSuccessMsg(msg);
				var id = response.id;
				window.location.href= base_url + '/backend/product/'+id;
			} else {
				onErrorMsg(msg);
			}

			onCheckAll();
		}
	});
}

function onDelete(id) {
	RecordId = id;
	var msg = TEXT["Do you really want to delete this record"];
	onCustomModal(msg, "onConfirmDelete");
}

function onConfirmDelete() {

    $.ajax({
		type : 'POST',
		url: base_url + '/backend/deleteProducts',
		data: 'id='+RecordId,
		success: function (response) {
			var msgType = response.msgType;
			var msg = response.msg;

			if(msgType == "success"){
				onSuccessMsg(msg);
				onRefreshData();
			}else{
				onErrorMsg(msg);
			}

			onCheckAll();
		}
    });
}





//Product Slug
function onProductSlug() {
	var StrName = $("#title").val();
	var str_name = StrName.trim();
	var strLength = str_name.length;
	if(strLength>0){
		$.ajax({
			type : 'POST',
			url: base_url + '/backend/hasProductSlug',
			data: 'slug='+StrName,
			success: function (response) {
				var slug = response.slug;
				$("#slug").val(slug);
			}
		});
	}
}

function onCategoryList() {

	$.ajax({
		type : 'POST',
		url: base_url + '/backend/getCategoryList',
		data: 'lan='+$('#language_code').val(),
		success: function (data) {
			var html = '<option value="0" selected="selected">'+TEXT['All Category']+'</option>';
			$.each(data, function (key, obj) {
				html += '<option value="' + obj.id + '">' + obj.name + '</option>';
			});

			$("#category_id").html(html);
			$("#category_id").chosen();
			$("#category_id").trigger("chosen:updated");
		}
	});
}

function onBrandList() {

	$.ajax({
		type : 'POST',
		url: base_url + '/backend/getBrandList',
		data: 'lan='+$('#language_code').val(),
		success: function (data) {
			var html = '<option value="all" selected="selected">'+TEXT['All Brand']+'</option>';
			$.each(data, function (key, obj) {
				html += '<option value="' + obj.id + '">' + obj.name + '</option>';
			});

			$("#brand_id").html(html);
			$("#brand_id").chosen();
			$("#brand_id").trigger("chosen:updated");
		}
	});
}

function onCategoryListForform() {

	$.ajax({
		type : 'POST',
		url: base_url + '/backend/getCategoryList',
		data: 'lan='+$('#lan').val(),
		success: function (data) {
			var html = '';
			$.each(data, function (key, obj) {
				html += '<option value="' + obj.id + '">' + obj.name + '</option>';
			});

			$("#categoryid").html(html);
			$("#categoryid").chosen();
			$("#categoryid").trigger("chosen:updated");
		}
	});
}

function onBrandListForform() {

	$.ajax({
		type : 'POST',
		url: base_url + '/backend/getBrandList',
		data: 'lan='+$('#lan').val(),
		success: function (data) {
			var html = '';
			$.each(data, function (key, obj) {
				html += '<option value="' + obj.id + '">' + obj.name + '</option>';
			});

			$("#brandid").html(html);
			$("#brandid").chosen();
			$("#brandid").trigger("chosen:updated");
		}
	});
}
</script>
@endsection

@push('scripts')
<!-- css/js -->
<script type="text/javascript">
var TEXT = [];
	TEXT['Do you really want to edit this record'] = "{{ __('Do you really want to edit this record') }}";
	TEXT['Do you really want to delete this record'] = "{{ __('Do you really want to delete this record') }}";
	TEXT['Do you really want to publish this records'] = "{{ __('Do you really want to publish this records') }}";
	TEXT['Do you really want to draft this records'] = "{{ __('Do you really want to draft this records') }}";
	TEXT['Do you really want to delete this records'] = "{{ __('Do you really want to delete this records') }}";
	TEXT['Please select action'] = "{{ __('Please select action') }}";
	TEXT['Please select record'] = "{{ __('Please select record') }}";
	TEXT['All Category'] = "{{ __('All Category') }}";
	TEXT['All Brand'] = "{{ __('All Brand') }}";
</script>
<script src="{{asset('backend/pages/products.js')}}"></script>
@endpush
