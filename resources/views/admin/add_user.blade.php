@extends('admin.Master')
@section('title')
    Agregar Usuario
@endsection
@section('content')
    <!-- page-wrapper Start-->
    <div class="page-wrapper">
        <div class="container-fluid">
            <!-- sign up page start-->
            <div class="auth-bg-video">
                <video id="bgvid" poster="{{ asset('admin/images/coming-soon-bg.jpg') }}" playsinline="" autoplay=""
                    muted="" loop="">
                    <source src="{{ asset('admin/video/auth-bg.mp4') }}" type="video/mp4">
                </video>
                <div class="col-sm-8">
                    <div class="text-center"><img src="assets/images/endless-logo.png" alt=""></div>
                    <div class="card mt-4 p-4">
                        <h4 class="text-center">Agregar Usuario</h4>

                        <form class="theme-form" action="{{ url('admin/save_user') }}" method="post"
                            enctype="multipart/form-data">
                            @if (Session::has('success'))
                                <div class="alert alert-success">
                                    <p>{{ session::get('success') }}</p>
                                </div>
                            @endif
                            @if (Session::has('fail'))
                                <div class="alert alert-danger">
                                    <p>{{ session::get('fail') }}</p>
                                </div>
                            @endif
                            @csrf

                            <div class="row g-1">
                                <div class="col-md-12">
                                    <div class="mb-2">

                                        <div class="personal-image">
                                            <label class="label">
                                                <input type="file" name="profile_photo" id="profilePhotoInput"
                                                    onchange="previewImage(this)" />
                                                <figure class="personal-figure">

                                                    <img src="images/profile photo.png" class="personal-avatar"
                                                        alt="avatar" id="profileImagePreview">


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
                                                }

                                                if (file) {
                                                    reader.readAsDataURL(file);
                                                } else {
                                                    preview.src = "images/profile photo.png"; // Default image when no file selected
                                                }
                                            }
                                        </script>
                                        <span class="text-danger">
                                            @error('profile_photo')
                                                {{ $message }}
                                            @enderror
                                        </span>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <label class="col-form-label">Nombre completo</label>
                                    <input class="form-control" type="text" name="name" value="{{ old('name') }}"
                                        placeholder="John">
                                    <span class="text-danger">
                                        @error('name')
                                            {{ $message }}
                                        @enderror
                                    </span>
                                </div>




                                <div class="col-sm-6">
                                    <label class="col-form-label">Store Name</label>
                                    <input class="form-control" type="text" name="store" value="{{ old('store') }}">
                                    <span class="text-danger">
                                        @error('store')
                                            {{ $message }}
                                        @enderror
                                    </span>

                                </div>
                                <div class="col-sm-6">
                                    <label class="col-form-label">Department</label>
                                    <input class="form-control" type="text" name="department"
                                        value="{{ old('department') }}">
                                    <span class="text-danger">
                                        @error('department')
                                            {{ $message }}
                                        @enderror
                                    </span>

                                </div>
                                <div class="col-sm-6">
                                    <label class="col-form-label">City </label>
                                    <input class="form-control" type="text" name="city" value="{{ old('city') }}"
                                        placeholder="India">
                                    <span class="text-danger">
                                        @error('city')
                                            {{ $message }}
                                        @enderror
                                    </span>
                                </div>
                                <div class="col-sm-6">
                                    <label class="col-form-label">Location </label>
                                    <input class="form-control" type="text" name="location"
                                        value="{{ old('location') }}" placeholder="India">
                                    <span class="text-danger">
                                        @error('location')
                                            {{ $message }}
                                        @enderror
                                    </span>
                                </div>
                                <div class="col-sm-6">
                                    <label class="col-form-label">Correo electrónico</label>
                                    <input class="form-control" type="email" name="email" value="{{ old('email') }}">
                                    <span class="text-danger">
                                        @error('email')
                                            {{ $message }}
                                        @enderror
                                    </span>

                                </div>
                                <div class="col-sm-6">
                                    <label class="col-form-label">Contraseña</label>
                                    <input class="form-control" type="password" name="password"
                                        value="{{ old('password') }}">
                                    <span class="text-danger">
                                        @error('password')
                                            {{ $message }}
                                        @enderror
                                    </span>

                                </div>
                                <div class="col-sm-6">
                                    <label class="col-form-label">Mobile Number</label>
                                    <input class="form-control" type="text" name="mobile_number"
                                        value="{{ old('mobile_number') }}">
                                    <span class="text-danger">
                                        @error('mobile_number')
                                            {{ $message }}
                                        @enderror
                                    </span>

                                </div>
                                <div class="col-sm-6">
                                    <label class="col-form-label">Alter Mobile Number</label>
                                    <input class="form-control" type="text" name="alter_mobile_number"
                                        value="{{ old('alter_mobile_number') }}">
                                    <span class="text-danger">
                                        @error('alter_mobile_number')
                                            {{ $message }}
                                        @enderror
                                    </span>

                                </div>
                                <div class="col-sm-6">
                                    <label class="col-form-label">Assign Category</label>
                                    <select class="form-control select2" multiple name="categories[]">
                                        <option value="">Please Select</option>
                                        <option value="bicycle">Bicycle</option>
                                        <option value="motorcycle">Motorcycle</option>
                                        <option value="shimano">Shimano</option>
                                        <option value="loadline">Load Line</option>
                                    </select>
                                    <span class="text-danger">
                                        @error('categories')
                                            {{ $message }}
                                        @enderror
                                    </span>

                                </div>
                                <div class="col-sm-6">
                                    <label class="col-form-label">Assign Price</label>
                                    <select class="form-control select2" multiple name="price[]">
                                        <option value="">Please Select</option>
                                        <option value="bicycle">Price 1</option>
                                        <option value="motorcycle">Price 2</option>
                                        <option value="shimano">Price 3</option>
                                        <option value="loadline">Price 4</option>
                                    </select>
                                    <span class="text-danger">
                                        @error('price')
                                            {{ $message }}
                                        @enderror
                                    </span>

                                </div>
                                <div class="col-sm-6">

                                    <label class="col-form-label">Estado</label>
                                    <select class="form-control select2" name="status">
                                        <option value="">Please Select</option>
                                        <option value="1">Sí</option>
                                        <option value="0">No</option>

                                    </select>
                                    <span class="text-danger">
                                        @error('status')
                                            {{ $message }}
                                        @enderror
                                    </span>

                                </div>


                                <div class="row g-2">
                                    <div class="col-sm-4">
                                        <button class="btn btn-primary" type="submit">Ahorrar</button>
                                    </div>

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
