@extends('admin.Master')
@section('title')
    {{ $title }}
@endsection
@section('content')
    <div class="page-body">
        <!-- Page content area start -->
        <div class="page-content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="breadcrumb__content">
                            <div class="breadcrumb__content__left">
                                <div class="breadcrumb__title">
                                    <h2>{{ __('Subcategories') }}</h2>
                                </div>
                            </div>
                            <div class="breadcrumb__content__right">
                                <nav aria-label="breadcrumb">
                                    <ul class="breadcrumb">
                                        <li class="breadcrumb-item"><a
                                                href="{{ url('admin\dashboard') }}">{{ __('Dashboard') }}</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">{{ __('Subcategories') }}
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card customers__area bg-style mb-30">
                            <div class="card-header item-title d-flex justify-content-between">
                                <h2>{{ __('Subcategories') }}</h2>
                                <a href="{{ route('subcategory.create') }}" class="btn btn-success btn-sm"> <i
                                        class="fa fa-plus"></i> {{ __('Add Subcategory') }} </a>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="advance-1" class="table table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Subcategory ID</th>
                                                <th>Subcategory</th>
                                                <th>{{ __('Category') }}</th>
                                                <th>{{ __('Parent Category') }}</th>

                                                <th>{{ __('Action') }}</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($subcategories as $subcategory)
                                                <tr class="removable-item">
                                                    <td>{{ $loop->iteration }}</td>
                                                    <td>{{ $subcategory->id }}</td>
                                                    <td>{{ $subcategory->name }}</td>
                                                    <td>
                                                        @php
                                                            $category = \App\Models\Subcategory::where('id', $subcategory->category_id)->where('category_id', '0')->first();
                                                            if (!empty($subcategory->id) && $category) {
                                                                $CategoryName = $category->name;
                                                            } else {
                                                                $CategoryName = 'No Category';
                                                            }
                                                        @endphp
                                                        {{ $CategoryName }}
                                                    </td>
                                                    <td>
                                                        @php
                                                        if(!empty($subcategory->parent_category_id)){
                                                            $parentCategory = \App\Models\Category::where('id',$subcategory->parent_category_id)->first()->name;
                                                        }else{
                                                            $parentCategory = 'No Parent Category';
                                                        }

                                                        @endphp
                                                        {{ $parentCategory }}
                                                    </td>

                                                    <td>
                                                        <div class="action__buttons">
                                                            <a href="{{ route('subcategory.edit', [$subcategory->uuid]) }}"
                                                                title="Edit"
                                                                class="btn btn-icon waves-effect waves-light btn-success m-b-5 m-r-5"
                                                                data-toggle="tooltip"> <i class="fa fa-edit"></i>
                                                            </a>
                                                            <a href="javascript:void(0);"
                                                                class="btn btn-icon waves-effect waves-light btn-danger m-b-5 delete-subcategory"
                                                                data-toggle="tooltip" title="{{ trans('remove') }}"
                                                                data-url="{{ route('subcategory.delete', [$subcategory->uuid]) }}">
                                                                <i class="fa fa-remove"></i>
                                                            </a>


                                                            </a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                    <div class="mt-3">
                                        {{ $subcategories->links() }}
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- Page content area end -->
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
        $(document).on('click', '.delete-subcategory', function(e) {
            e.preventDefault(); // Prevent default action of the link

            console.log("Delete button clicked."); // Log click event

            let deleteUrl = $(this).data('url'); // Get the URL from data attribute
            console.log("Delete URL: ", deleteUrl); // Log URL

            if (confirm('{{ trans('do you want to delete') }}')) { // Confirmation dialog
                console.log("User confirmed deletion."); // Log confirmation
                $.ajax({
                    type: "DELETE", // Use DELETE method for deletion
                    url: deleteUrl,
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') // CSRF protection
                    },
                    dataType: "json",
                    success: function(response) {
                        console.log("Response received: ", response); // Log response
                        if (response.success) {
                            toastr.success("Subcategory successfully deleted.", "", {
                                onHidden: function() {
                                    window.location.reload(); // Reload page on success
                                }
                            });
                        } else {
                            toastr.error("Failed to delete subcategory."); // Show error if failed
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error("Error occurred: ", xhr.responseText); // Log error details
                        toastr.error(
                        "Failed to delete subcategory. Please try again later."); // Notify user of failure
                    }
                });
            } else {
                console.log("User cancelled deletion."); // Log cancellation
            }
        });
    </script>
@endsection
