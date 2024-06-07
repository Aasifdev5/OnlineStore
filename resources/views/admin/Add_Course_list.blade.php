@extends('admin.Master')
@section('title')
Agregar Categoría
@endsection
@section('content')
<!-- page-wrapper Start-->
<div class="page-wrapper">
    <div class="container-fluid">
        <!-- sign up page start-->
        <div class="auth-bg-video">
            <video id="bgvid" poster="{{asset('admin/images/coming-soon-bg.jpg')}}" playsinline="" autoplay="" muted="" loop="">
                <source src="{{asset('admin/video/auth-bg.mp4')}}" type="video/mp4">
            </video>
            <div class="authentication-box">
                <div class="text-center"><img src="assets/images/endless-logo.png" alt=""></div>
                <div class="card mt-4 p-4">
                    <h4 class="text-center">Agregar Categoría</h4>

                    <form class="theme-form" action="save_course" method="post" enctype="multipart/form-data">
                        @if(Session::has('success'))
                        <div class="alert alert-success">
                            <p>{{session::get('success')}}</p>
                        </div>
                        @endif
                        @if(Session::has('fail'))
                        <div class="alert alert-danger">
                            <p>{{session::get('fail')}}</p>
                        </div>
                        @endif
                        @csrf

                        <div class="row g-1">

                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label class="col-form-label">Título</label>
                                    <input class="form-control" type="text" name="category_id" value="{{old('category_id')}}">

                                    <span class="text-danger">@error('category_id'){{$message}}@enderror</span>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label class="col-form-label"> Icono</label>
                                    <input class="form-control" type="text" name="category_icon" value="{{old('category_icon')}}">
                                    <span class="text-danger">@error('category_icon'){{ $message }}@enderror</span>
                                </div>
                            </div>


                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label class="col-form-label"> Foto</label>
                                    <div class="personal-image">
                                        <label class="label">
                                            <input type="file" name="product_photo" id="profilePhotoInput" onchange="previewImage(this)" />
                                            <figure class="personal-figure">
                                                @if(!empty($user_session->product_photo))
                                                <img src="{{ asset('product_photo/' . $user_session->product_photo) }}" class="personal-avatar" alt="avatar" id="profileImagePreview">
                                                @else
                                                <img src="{{ asset('images/profile photo.png') }}" class="personal-avatar" alt="avatar" id="profileImagePreview">
                                                @endif
                                            </figure>
                                        </label>
                                        <p>PNG, JPG, JPEG</p>
                                    </div>
                                    <!-- ... (rest of your form code) ... -->

                                    <script>
                                        function previewImage(input) {
                                            var preview = document.getElementById('profileImagePreview');
                                            var file = input.files[0];
                                            var reader = new FileReader();

                                            reader.onloadend = function() {
                                                preview.src = reader.result;
                                            };

                                            if (file) {
                                                reader.readAsDataURL(file);
                                            } else {
                                                preview.src = "{{ asset('images/profile photo.png') }}"; // Default image when no file selected
                                            }
                                        }
                                    </script>
                                    <span class="text-danger">@error('product_photo'){{ $message }}@enderror</span>
                                </div>
                            </div>



                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label class="col-form-label">Descripción</label>
                                    <textarea id="elm1" name="description" class="form-control"></textarea>


                                    <span class="text-danger">@error('description'){{$message}}@enderror</span>
                                </div>
                            </div>



                        </div>



                        <div class="row g-2">
                            <div class="col-sm-4">
                                <button class="btn btn-primary" type="submit">Ahorrar</button>
                            </div>

                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- sign up page ends-->
</div>
</div>
<!-- page-wrapper Ends-->
@endsection
