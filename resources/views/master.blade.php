<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    @php
        $general_setting = getApplicationsettings();
        $category = getCategory();
        $adminNotifications = userNotifications();

    @endphp
    <title> {{ $general_setting->site_name }} || @yield('title') </title>
    <!-- favicons Icons -->

    <meta name="description" content="{{ $general_setting->site_description }}" />
    <meta name="csrf-token" content="{{ csrf_token() }}">
 <!-- Ensure jQuery is loaded first -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- template styles -->
    <link rel="stylesheet" href="{{ asset('admin/css/custom/image-preview.css') }}">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

   


    <link rel="shortcut icon" type="image/x-icon" href="{{ asset('site_favicon/') }}<?php echo '/' . $general_setting->site_favicon; ?>">

    <!-- ======= All CSS Plugins here ======== -->
    <link rel="stylesheet" href="{{ asset('assets/css/plugins/swiper-bundle.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/css/plugins/glightbox.min.css') }}">
    <link
        href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&amp;family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700&amp;family=Rubik:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500&amp;display=swap"
        rel="stylesheet">

    <!-- Plugin css -->
    <link rel="stylesheet" href="{{ asset('assets/css/vendor/bootstrap.min.css') }}">

    <!-- Custom Style CSS -->
    <link rel="stylesheet" href="{{ asset('assets/css/style.css') }}">
    <style>
      body {
        -webkit-touch-callout: none; /* Disable callouts (iOS Safari) */
        -webkit-user-select: none; /* Disable text selection (iOS Safari, Chrome etc.) */
        -moz-user-select: none; /* Disable text selection (Firefox) */
        -ms-user-select: none; /* Disable text selection (Edge) */
        user-select: none; /* Disable text selection (standard) */
    }
     #overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0); /* Transparent background */
            pointer-events: none; /* Allow pointer events to pass through */
            z-index: 9999; /* Ensure it's above other content */
        }
        /* Modal Styling */
        .modal-header {
            background-color: #fadc00;
            color: white;
        }

        .modal-title {
            font-weight: bold;
        }

        .product-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
        }

        .product-card {
            background-color: #fff;
            border: 1px solid #e0e0e0;
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s ease-in-out;
            width: calc(33.333% - 15px);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .product-card:hover {
            transform: scale(1.05);
        }

        .product-link {
            color: inherit;
            text-decoration: none;
        }

        .product-image {
            width: 100%;
            height: 150px;
            object-fit: cover;
        }

        .product-info {
            padding: 10px;
            text-align: center;
        }

        .product-title {
            font-size: 1.1em;
            font-weight: bold;
            margin: 0;
        }

        .no-results {
            color: #ff0000;
            font-weight: bold;
            text-align: center;
        }
        </style>

</head>

<body>
@if (Request::path() !== 'cart')
    <!-- Start preloader -->
    <div id="preloader">
        <div id="ctn-preloader" class="ctn-preloader">
            <div class="animation-preloader">
                <div class="spinner"></div>
                <div class="txt-loading">
                    <span data-text-preloader="B" class="letters-loading">
                        B
                    </span>

                    <span data-text-preloader="I" class="letters-loading">
                        I
                    </span>

                    <span data-text-preloader="K" class="letters-loading">
                        K
                    </span>

                    <span data-text-preloader="E" class="letters-loading">
                        E
                    </span>

                    <span data-text-preloader="B" class="letters-loading">
                        B
                    </span>

                    <span data-text-preloader="R" class="letters-loading">
                        R
                    </span>

                    <span data-text-preloader="O" class="letters-loading">
                        O
                    </span>
                     <span data-text-preloader="S" class="letters-loading">
                        S
                    </span>
                </div>
            </div>
            <div class="loader-section section-left"></div>
            <div class="loader-section section-right"></div>
        </div>
    </div>
    <!-- End preloader -->
@endif


    <!-- Start header area -->
    <header class="header__section mb-20">

        <div class="main__header header__sticky">
            <div class="container">
                <div class="main__header--inner position__relative d-flex justify-content-between align-items-center">
                    <div class="offcanvas__header--menu__open ">
                        <a class="offcanvas__header--menu__open--btn" href="javascript:void(0)" data-offcanvas>
                            <svg xmlns="http://www.w3.org/2000/svg" class="ionicon offcanvas__header--menu__open--svg"
                                viewBox="0 0 512 512">
                                <path fill="currentColor" stroke="currentColor" stroke-linecap="round"
                                    stroke-miterlimit="10" stroke-width="32" d="M80 160h352M80 256h352M80 352h352" />
                            </svg>
                            <span class="visually-hidden">Offcanvas Menu Open</span>
                        </a>
                    </div>
                    <div class="main__logo">
                        <h1 class="main__logo--title"><a class="main__logo--link" href="{{ url('shop') }}"><img
                                    class="main__logo--img" src="{{ asset('site_logo/') }}<?php echo '/' . $general_setting->site_logo; ?>"
                                    style="width: 200px;height:60px" alt="logo-img"></a>
                        </h1>
                    </div>

                    <div class="header__search--widget d-none d-lg-block header__sticky--none">
                        <form id="product_search_form" class="d-flex header__search--form border-radius-5">
                            <div class="header__select--categories select">
                                <select name="category_id" class="header__select--inner">
                                    <option selected value="1">Todas las categorías</option>
                                    @php
                                        $userCategories = !empty($user_session->categories)
                                        ? explode(',', $user_session->categories)
                                        : [];
                                    $categories = \App\Models\Category::whereIn('id', $userCategories)
                                        ->select('id', 'name')
                                        ->get();
                                    @endphp
                                    @foreach ($categories as $parentCategory)
                                        <option value="{{ $parentCategory->id }}">{{ $parentCategory->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="header__search--box">
                                <label>
                                    <input id="search_term" class="header__search--input" placeholder="Buscar productos..." type="text">
                                </label>
                                <button class="header__search--button bg__primary text-white" aria-label="search button" type="submit">
                                    <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path
                                            d="M15.6952 14.4991L11.7663 10.5588C12.7765 9.4008 13.33 7.94381 13.33 6.42703C13.33 2.88322 10.34 0 6.66499 0C2.98997 0 0 2.88322 0 6.42703C0 9.97085 2.98997 12.8541 6.66499 12.8541C8.04464 12.8541 9.35938 12.4528 10.4834 11.6911L14.4422 15.6613C14.6076 15.827 14.8302 15.9184 15.0687 15.9184C15.2944 15.9184 15.5086 15.8354 15.6711 15.6845C16.0166 15.364 16.0276 14.8325 15.6952 14.4991ZM6.66499 1.67662C9.38141 1.67662 11.5913 3.8076 11.5913 6.42703C11.5913 9.04647 9.38141 11.1775 6.66499 11.1775C3.94857 11.1775 1.73869 9.04647 1.73869 6.42703C1.73869 3.8076 3.94857 1.67662 6.66499 1.67662Z"
                                            fill="currentColor" />
                                    </svg>
                                </button>
                            </div>
                        </form>


                    </div>
                    <div class="header__menu d-none d-lg-block header__sticky--block">
                        <nav class="header__menu--navigation">
                            <ul class="header__menu--wrapper d-flex">
                                <li class="header__menu--items">
                                    <a class="header__menu--link  {{ Request::is('home') ? 'active' : '' }}" href="{{ url('home') }}">Inicio</a>
                                </li>
                                <li class="header__menu--items">
                                    <a class="header__menu--link  {{ Request::is('shop') ? 'active' : '' }}" href="{{ url('shop') }}">Tienda</a>
                                </li>



                      @foreach ($pages as $page)
    @if ($page->page_title == "Sobre nosotros" || $page->page_title == "Contact")
        <li class="header__menu--items">
            <a class="header__menu--link {{ Request::is('page/' . $page->page_slug) ? 'active' : '' }}" href="{{ url('page/' . $page->page_slug) }}">
                Contacto
            </a>
        </li>
    @endif
@endforeach

                                
                            </ul>
                        </nav>
                    </div>
                    <div class="header__account header__sticky--none">
                        <ul class="header__account--wrapper d-flex align-items-center">
                            <li class="header__account--items d-none d-lg-block">
                                @if (!empty($user_session))
                                    <a class="header__account--btn" href="{{ url('dashboard') }}">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                            viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                            stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                            class=" -user">
                                            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                            <circle cx="12" cy="7" r="4"></circle>
                                        </svg>
                                        <span class="visually">Mi cuenta</span>
                                    </a>
                                @else
                                    <a class="header__account--btn" href="{{ url('Userlogin') }}">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                            viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                            stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                            class=" -user">
                                            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                            <circle cx="12" cy="7" r="4"></circle>
                                        </svg>
                                        <span class="visually-hidden">Mi cuenta</span>
                                    </a>
                                @endif

                            </li>
                            <li
                                class="header__account--items  header__account--search__items mobile__d--block d-sm-2-none">
                                <a class="header__account--btn search__open--btn" href="javascript:void(0)"
                                    data-offcanvas>
                                    <svg class="product__items--action__btn--svg" xmlns="http://www.w3.org/2000/svg"
                                        width="22.51" height="20.443" viewBox="0 0 512 512">
                                        <path d="M221.09 64a157.09 157.09 0 10157.09 157.09A157.1 157.1 0 00221.09 64z"
                                            fill="none" stroke="currentColor" stroke-miterlimit="10"
                                            stroke-width="32" />
                                        <path fill="none" stroke="currentColor" stroke-linecap="round"
                                            stroke-miterlimit="10" stroke-width="32" d="M338.29 338.29L448 448" />
                                    </svg>
                                    <span class="visually-hidden">Search</span>
                                </a>
                            </li>
                            @if (!empty($user_session))
                            <li class="header__account--items d-none d-lg-block">
                                <a class="header__account--btn" href="{{ url('wishlist') }}">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                        viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                        stroke-linecap="round" stroke-linejoin="round" class=" -heart">
                                        <path
                                            d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z">
                                        </path>
                                    </svg>
                                    <span class="items__count">@php
                                        $count = \App\Models\Wishlist::where('user_id', Session::get('LoggedIn'))->count();
                                       @endphp
                                       @if ($count)
                                           {{ $count }}
                                       @else
                                           0
                                       @endif</span>
                                </a>
                            </li>
                            @else
                            <li class="header__account--items d-none d-lg-block">
                                <a class="header__account--btn" href="{{ url('Userlogin') }}">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                        viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                        stroke-linecap="round" stroke-linejoin="round" class=" -heart">
                                        <path
                                            d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z">
                                        </path>
                                    </svg>
                                    <span class="items__count">0</span>
                                </a>
                            </li>
                            @endif
                            @if (!empty($user_session))
                            <li class="header__account--items header__minicart--items">
                                <a class="header__account--btn minicart__open--btn" href="{{ url('cart') }}"
                                    data-offcanvas>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="22.706" height="22.534"
                                        viewBox="0 0 14.706 13.534">
                                        <g transform="translate(0 0)">
                                            <g>
                                                <path data-name="Path 16787"
                                                    d="M4.738,472.271h7.814a.434.434,0,0,0,.414-.328l1.723-6.316a.466.466,0,0,0-.071-.4.424.424,0,0,0-.344-.179H3.745L3.437,463.6a.435.435,0,0,0-.421-.353H.431a.451.451,0,0,0,0,.9h2.24c.054.257,1.474,6.946,1.555,7.33a1.36,1.36,0,0,0-.779,1.242,1.326,1.326,0,0,0,1.293,1.354h7.812a.452.452,0,0,0,0-.9H4.74a.451.451,0,0,1,0-.9Zm8.966-6.317-1.477,5.414H5.085l-1.149-5.414Z"
                                                    transform="translate(0 -463.248)" fill="currentColor" />
                                                <path data-name="Path 16788"
                                                    d="M5.5,478.8a1.294,1.294,0,1,0,1.293-1.353A1.325,1.325,0,0,0,5.5,478.8Zm1.293-.451a.452.452,0,1,1-.431.451A.442.442,0,0,1,6.793,478.352Z"
                                                    transform="translate(-1.191 -466.622)" fill="currentColor" />
                                                <path data-name="Path 16789"
                                                    d="M13.273,478.8a1.294,1.294,0,1,0,1.293-1.353A1.325,1.325,0,0,0,13.273,478.8Zm1.293-.451a.452.452,0,1,1-.431.451A.442.442,0,0,1,14.566,478.352Z"
                                                    transform="translate(-2.875 -466.622)" fill="currentColor" />
                                            </g>
                                        </g>
                                    </svg>
                                    <span class="items__count">
                                        @php
                                         $count = \App\Models\Cart::where('user_id', Session::get('LoggedIn'))->count();
                                        @endphp
                                        @if ($count)
                                            {{ $count }}
                                        @else
                                            0
                                        @endif
                                    </span>
                                    <span class="minicart__btn--text">Mi Carrito <br> <span
                                            class="minicart__btn--text__price">@php
                                            $total = \App\Models\Cart::where('user_id', Session::get('LoggedIn'))
                                                                    ->selectRaw('SUM(price * quantity) as total')
                                                                    ->pluck('total')
                                                                    ->first();
                                            $formattedTotal = $total ? 'Bs ' . number_format($total, 2) : 'Bs 0.00';
                                        @endphp
                                        {{ $formattedTotal }}

                                        </span></span>
                                </a>
                            </li>
                            @else
                            <li class="header__account--items header__minicart--items">
                                <a class="header__account--btn minicart__open--btn" href="{{ url('Userlogin') }}"
                                    data-offcanvas>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="22.706" height="22.534"
                                        viewBox="0 0 14.706 13.534">
                                        <g transform="translate(0 0)">
                                            <g>
                                                <path data-name="Path 16787"
                                                    d="M4.738,472.271h7.814a.434.434,0,0,0,.414-.328l1.723-6.316a.466.466,0,0,0-.071-.4.424.424,0,0,0-.344-.179H3.745L3.437,463.6a.435.435,0,0,0-.421-.353H.431a.451.451,0,0,0,0,.9h2.24c.054.257,1.474,6.946,1.555,7.33a1.36,1.36,0,0,0-.779,1.242,1.326,1.326,0,0,0,1.293,1.354h7.812a.452.452,0,0,0,0-.9H4.74a.451.451,0,0,1,0-.9Zm8.966-6.317-1.477,5.414H5.085l-1.149-5.414Z"
                                                    transform="translate(0 -463.248)" fill="currentColor" />
                                                <path data-name="Path 16788"
                                                    d="M5.5,478.8a1.294,1.294,0,1,0,1.293-1.353A1.325,1.325,0,0,0,5.5,478.8Zm1.293-.451a.452.452,0,1,1-.431.451A.442.442,0,0,1,6.793,478.352Z"
                                                    transform="translate(-1.191 -466.622)" fill="currentColor" />
                                                <path data-name="Path 16789"
                                                    d="M13.273,478.8a1.294,1.294,0,1,0,1.293-1.353A1.325,1.325,0,0,0,13.273,478.8Zm1.293-.451a.452.452,0,1,1-.431.451A.442.442,0,0,1,14.566,478.352Z"
                                                    transform="translate(-2.875 -466.622)" fill="currentColor" />
                                            </g>
                                        </g>
                                    </svg>
                                    <span class="items__count">0</span>
                                    <span class="minicart__btn--text"> Carrito <br> <span
                                            class="minicart__btn--text__price">BS0.00</span></span>
                                </a>
                            </li>
                            @endif

                        </ul>
                    </div>
                    <div class="header__account header__sticky--block">
                        <ul class="header__account--wrapper d-flex align-items-center">
                            <li class="header__account--items  header__account--search__items d-sm-2-none">
                                <a class="header__account--btn search__open--btn" href="javascript:void(0)"
                                    data-offcanvas>
                                    <svg class="product__items--action__btn--svg" xmlns="http://www.w3.org/2000/svg"
                                        width="22.51" height="20.443" viewBox="0 0 512 512">
                                        <path d="M221.09 64a157.09 157.09 0 10157.09 157.09A157.1 157.1 0 00221.09 64z"
                                            fill="none" stroke="currentColor" stroke-miterlimit="10"
                                            stroke-width="32" />
                                        <path fill="none" stroke="currentColor" stroke-linecap="round"
                                            stroke-miterlimit="10" stroke-width="32" d="M338.29 338.29L448 448" />
                                    </svg>
                                    <span class="visually-hidden">Search</span>
                                </a>
                            </li>
                            <li class="header__account--items d-none d-lg-block">
                                @if (!empty($user_session))
                                    <a class="header__account--btn" href="{{ url('dashboard') }}">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                            viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                            stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                            class=" -user">
                                            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                            <circle cx="12" cy="7" r="4"></circle>
                                        </svg>
                                        <span class="visually">Mi cuenta</span>
                                    </a>
                                @else
                                    <a class="header__account--btn" href="{{ url('Userlogin') }}">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                            viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                            stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                            class=" -user">
                                            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                            <circle cx="12" cy="7" r="4"></circle>
                                        </svg>
                                        <span class="visually-hidden">Mi cuenta</span>
                                    </a>
                                @endif
                            </li>
                            @if (!empty($user_session))
                            <li class="header__account--items d-none d-lg-block">
                                <a class="header__account--btn" href="{{ url('wishlist') }}">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                        viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                        stroke-linecap="round" stroke-linejoin="round" class=" -heart">
                                        <path
                                            d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z">
                                        </path>
                                    </svg>
                                    <span class="items__count">@php
                                        $count = \App\Models\Wishlist::where('user_id', Session::get('LoggedIn'))->count();
                                       @endphp
                                       @if ($count)
                                           {{ $count }}
                                       @else
                                           0
                                       @endif</span>
                                </a>
                            </li>
                            @else
                            <li class="header__account--items d-none d-lg-block">
                                <a class="header__account--btn" href="{{ url('Userlogin') }}">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                        viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                        stroke-linecap="round" stroke-linejoin="round" class=" -heart">
                                        <path
                                            d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z">
                                        </path>
                                    </svg>
                                    <span class="items__count">
                                           0
                                       </span>
                                </a>
                            </li>
                            @endif
                            @if (!empty($user_session))
                            <li class="header__account--items header__minicart--items">
                                <a class="header__account--btn minicart__open--btn" href="javascript:void(0)"
                                    data-offcanvas>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="22.706" height="22.534"
                                        viewBox="0 0 14.706 13.534">
                                        <g transform="translate(0 0)">
                                            <g>
                                                <path data-name="Path 16787"
                                                    d="M4.738,472.271h7.814a.434.434,0,0,0,.414-.328l1.723-6.316a.466.466,0,0,0-.071-.4.424.424,0,0,0-.344-.179H3.745L3.437,463.6a.435.435,0,0,0-.421-.353H.431a.451.451,0,0,0,0,.9h2.24c.054.257,1.474,6.946,1.555,7.33a1.36,1.36,0,0,0-.779,1.242,1.326,1.326,0,0,0,1.293,1.354h7.812a.452.452,0,0,0,0-.9H4.74a.451.451,0,0,1,0-.9Zm8.966-6.317-1.477,5.414H5.085l-1.149-5.414Z"
                                                    transform="translate(0 -463.248)" fill="currentColor" />
                                                <path data-name="Path 16788"
                                                    d="M5.5,478.8a1.294,1.294,0,1,0,1.293-1.353A1.325,1.325,0,0,0,5.5,478.8Zm1.293-.451a.452.452,0,1,1-.431.451A.442.442,0,0,1,6.793,478.352Z"
                                                    transform="translate(-1.191 -466.622)" fill="currentColor" />
                                                <path data-name="Path 16789"
                                                    d="M13.273,478.8a1.294,1.294,0,1,0,1.293-1.353A1.325,1.325,0,0,0,13.273,478.8Zm1.293-.451a.452.452,0,1,1-.431.451A.442.442,0,0,1,14.566,478.352Z"
                                                    transform="translate(-2.875 -466.622)" fill="currentColor" />
                                            </g>
                                        </g>
                                    </svg>
                                    <span class="items__count"> @php
                                        $count = \App\Models\Cart::where('user_id', Session::get('LoggedIn'))->count();
                                       @endphp
                                       @if ($count)
                                           {{ $count }}
                                       @else
                                           0
                                       @endif</span>
                                </a>
                            </li>
                            @else
                            <li class="header__account--items header__minicart--items">
                                <a class="header__account--btn minicart__open--btn" href="{{ url('Userlogin') }}"
                                    data-offcanvas>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="22.706" height="22.534"
                                        viewBox="0 0 14.706 13.534">
                                        <g transform="translate(0 0)">
                                            <g>
                                                <path data-name="Path 16787"
                                                    d="M4.738,472.271h7.814a.434.434,0,0,0,.414-.328l1.723-6.316a.466.466,0,0,0-.071-.4.424.424,0,0,0-.344-.179H3.745L3.437,463.6a.435.435,0,0,0-.421-.353H.431a.451.451,0,0,0,0,.9h2.24c.054.257,1.474,6.946,1.555,7.33a1.36,1.36,0,0,0-.779,1.242,1.326,1.326,0,0,0,1.293,1.354h7.812a.452.452,0,0,0,0-.9H4.74a.451.451,0,0,1,0-.9Zm8.966-6.317-1.477,5.414H5.085l-1.149-5.414Z"
                                                    transform="translate(0 -463.248)" fill="currentColor" />
                                                <path data-name="Path 16788"
                                                    d="M5.5,478.8a1.294,1.294,0,1,0,1.293-1.353A1.325,1.325,0,0,0,5.5,478.8Zm1.293-.451a.452.452,0,1,1-.431.451A.442.442,0,0,1,6.793,478.352Z"
                                                    transform="translate(-1.191 -466.622)" fill="currentColor" />
                                                <path data-name="Path 16789"
                                                    d="M13.273,478.8a1.294,1.294,0,1,0,1.293-1.353A1.325,1.325,0,0,0,13.273,478.8Zm1.293-.451a.452.452,0,1,1-.431.451A.442.442,0,0,1,14.566,478.352Z"
                                                    transform="translate(-2.875 -466.622)" fill="currentColor" />
                                            </g>
                                        </g>
                                    </svg>
                                    <span class="items__count">0</span>
                                </a>
                            </li>
                            @endif
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="header__bottom bg__primary">
            <div class="container">
                <div class="header__bottom--inner position__relative d-flex align-items-center">
                    <div class="categories__menu mobile-v-none">
                        <div class="categories__menu--header bg__secondary text-white d-flex align-items-center"
                            data-bs-toggle="collapse" data-bs-target="#categoriesAccordion">
                            <svg class="categories__list--icon" width="18" height="15" viewBox="0 0 18 15"
                                fill="none" xmlns="http://www.w3.org/2000/svg">
                                <rect width="13" height="1.5" fill="currentColor" />
                                <rect y="4.44434" width="18" height="1.5" fill="currentColor" />
                                <rect y="8.88892" width="15" height="1.5" fill="currentColor" />
                                <rect y="13.3333" width="17" height="1.5" fill="currentColor" />
                            </svg>

                            <span class="categories__menu--title">CATEGORÍAS</span>
                            <svg class="categories__arrowdown--icon" xmlns="http://www.w3.org/2000/svg"
                                width="12.355" height="8.394" viewBox="0 0 10.355 6.394">
                                <path d="M15.138,8.59l-3.961,3.952L7.217,8.59,6,9.807l5.178,5.178,5.178-5.178Z"
                                    transform="translate(-6 -8.59)" fill="currentColor" />
                            </svg>
                        </div>

                        <div class="dropdown__categories--menu border-radius-5 active collapse @if ($_SERVER['REQUEST_URI'] == '/') show @endif"
                            id="categoriesAccordion">
                            <ul class="d-none d-lg-block">
                                @php
                                    $userCategories = !empty($user_session->categories)
                                        ? explode(',', $user_session->categories)
                                        : [];
                                    $categories = \App\Models\Category::whereIn('id', $userCategories)
                                        ->select('id', 'name','image')
                                        ->get();
                                @endphp
                                @foreach ($categories as $parentCategory)
                                    <li class="categories__menu--items {{ $parentCategory->id }}">
                                       <a class="categories__menu--link" href="{{ url('productbyCategory') }}/{{ $parentCategory->id }}" style="display: flex; align-items: center;">
    <img class="categories__thumbnail--img" src="{{ asset($parentCategory->image) }}" alt="categories-img" width="24" height="24" style="margin-right: 8px;">
    <span style="flex-grow: 1;"><strong>{{ $parentCategory->name }}</strong></span>
    <svg class="categories__menu--right__arrow--icon"
        xmlns="http://www.w3.org/2000/svg" width="17.007" height="16.831"
        viewBox="0 0 512 512">
        <path fill="none" stroke="currentColor" stroke-linecap="round"
            stroke-linejoin="round" stroke-width="48"
            d="M184 112l144 144-144 144" />
    </svg>
</a>


                                        <ul
                                            class="categories__submenu border-radius-10 d-flex justify-content-between">
                                            @php
                                            $allCategoryIds = \App\Models\Category::pluck('id')->toArray();
                                            if (in_array($parentCategory->id, $allCategoryIds)) {
                                            
                                     $subcategories = \App\Models\Subcategory::where(
                                                    'parent_category_id',
                                                    $parentCategory->id,
                                                )
                                                    ->where('category_id', '0')
                                                    ->get();
                                    }else{
                                      $subcategories = \App\Models\Subcategory::where(
                                                    'parent_category_id',
                                                    $parentCategory->id,
                                                )
                                                    
                                                    ->get();
                                    }
                                                
                                            @endphp
                                            @foreach ($subcategories as $subcategory)
                                                <li class="categories__submenu--items">
                                                    <a class="categories__submenu--items__text"
                                                        href="{{ url('productbySubCategory') }}/{{ $parentCategory->id }}/{{ $subcategory->id }}"><strong>{{ $subcategory->name }}
                                                        </strong></a>
                                                    <ul class="categories__submenu--child">
                                                       @php
    $childcategories = \App\Models\Subcategory::where('category_id', $subcategory->id)->get();
@endphp

<ul class="categories__submenu--child">
    @foreach ($childcategories as $index => $childcategory)
        <li class="categories__submenu--child__items {{ $index >= 3 ? 'hidden' : '' }}">
            <a class="categories__submenu--child__items--link"
                href="{{ url('productbyChildCategory') }}/{{ $parentCategory->id }}/{{ $subcategory->id }}/{{ $childcategory->id }}">
                {{ $childcategory->name }}
            </a>
        </li>
        
    @endforeach
</ul>

@if ($childcategories->count() > 3)
    
      <li class="categories__submenu--child__items">
        <a href="javascript:void(0);" id="show-more" class="categories__submenu--child__items--link">Más</a>
    </li>
@endif



                                                    </ul>
                                                </li>
                                            @endforeach
                                        </ul>
                                    </li>
                                @endforeach

<script>
    document.getElementById('show-more').addEventListener('click', function() {
        var hiddenItems = document.querySelectorAll('.categories__submenu--child__items.hidden');
        hiddenItems.forEach(function(item) {
            item.classList.remove('hidden');
        });
        this.style.display = 'none'; // Hide the "More" button after clicking
    });
</script>

<style>
    .hidden {
        display: none;
    }
</style>

                            </ul>
                        </div>
                    </div>
                    <div class="categories__menu mobile-v-block">
                        <div class="categories__menu--header bg__secondary text-white d-flex align-items-center"
                            data-bs-toggle="collapse" data-bs-target="#categoriesAccordion2">
                            <svg class="categories__list--icon" width="18" height="15" viewBox="0 0 18 15"
                                fill="none" xmlns="http://www.w3.org/2000/svg">
                                <rect width="13" height="1.5" fill="currentColor" />
                                <rect y="4.44434" width="18" height="1.5" fill="currentColor" />
                                <rect y="8.88892" width="15" height="1.5" fill="currentColor" />
                                <rect y="13.3333" width="17" height="1.5" fill="currentColor" />
                            </svg>

                            <span class="categories__menu--title">CATEGORÍAS</span>
                            <svg class="categories__arrowdown--icon" xmlns="http://www.w3.org/2000/svg"
                                width="12.355" height="8.394" viewBox="0 0 10.355 6.394">
                                <path d="M15.138,8.59l-3.961,3.952L7.217,8.59,6,9.807l5.178,5.178,5.178-5.178Z"
                                    transform="translate(-6 -8.59)" fill="currentColor" />
                            </svg>
                        </div>
                        <div class="dropdown__categories--menu border-radius-5 active collapse"
                            id="categoriesAccordion2">
                            <nav class="category__mobile--menu">
                                <ul class="category__mobile--menu_ul">


                                    @php
                                        $userCategories = !empty($user_session->categories)
                                            ? explode(',', $user_session->categories)
                                            : [];
                                        $categories = \App\Models\Category::whereIn('id', $userCategories)
                                            ->select('id', 'name','image')
                                            ->get();
                                    @endphp
                                    @foreach ($categories as $parentCategory)
                                        <li class="categories__menu--items">
                                           
                                             <a class="categories__menu--link" href="{{ url('productbyCategory') }}/{{ $parentCategory->id }}" style="display: flex; align-items: center;">
    <img class="categories__thumbnail--img" src="{{ asset($parentCategory->image) }}" alt="categories-img" width="24" height="24" style="margin-right: 8px;">
    <span style="flex-grow: 1;"><strong>{{ $parentCategory->name }}</strong></span>
   
</a>
                                            <ul class="category__sub--menu">
                                                @php
                                                   $allCategoryIds = \App\Models\Category::pluck('id')->toArray();
                                            if (in_array($parentCategory->id, $allCategoryIds)) {   
                                     $subcategories = \App\Models\Subcategory::where(
                                                    'parent_category_id',
                                                    $parentCategory->id,
                                                )
                                                    ->where('category_id', '0')
                                                    ->get();
                                    }else{
                                      $subcategories = \App\Models\Subcategory::where(
                                                    'parent_category_id',
                                                    $parentCategory->id,
                                                )
                                                    
                                                    ->get();
                                    }
                                                @endphp
                                                @foreach ($subcategories as $subcategory)
                                                    <li class="categories__submenu--items"><a
                                                            class="categories__submenu--items__text"
                                                            href="{{ url('productbySubCategory') }}/{{ $parentCategory->id }}/{{ $subcategory->id }}"><strong>{{ $subcategory->name }}</strong></a>
                                                        <ul class="category__sub--menu">
                                                            @php
                                                                $childcategories = \App\Models\Subcategory::where(
                                                                    'category_id',
                                                                    $subcategory->id,
                                                                )->get();
                                                            @endphp
                                                            @foreach ($childcategories as $childcategory)
                                                                <li class="categories__submenu--child__items"><a
                                                                        class="categories__submenu--child__items--link"
                                                                        href="{{ url('productbyChildCategory') }}/{{ $parentCategory->id }}/{{ $subcategory->id }}/{{ $childcategory->id }}">{{ $childcategory->name }}
                                                                    </a></li>
                                                            @endforeach

                                                        </ul>
                                                    </li>
                                                @endforeach
                                            </ul>

                                        </li>
                                    @endforeach
                                </ul>
                            </nav>
                        </div>
                    </div>
                    <div class="header__right--area d-flex justify-content-between align-items-center">
                        <div class="header__menu">
                            <nav class="header__menu--navigation">
                                <ul class="header__menu--wrapper d-flex">
                                    <li class="header__menu--items">
                                        <a class="header__menu--link text-white {{ Request::is('home') ? 'active' : '' }}"
                                            href="{{ url('home') }}">Inicio

                                        </a>

                                    </li>
                                    <li class="header__menu--items">
                                        <a class="header__menu--link text-white {{ Request::is('shop') ? 'active' : '' }}"
                                            href="{{ url('shop') }}">Tienda

                                        </a>

                                    </li>

@foreach ($pages as $page)
    @if ($page->page_title == "Sobre nosotros" || $page->page_title == "Contact")
        <li class="header__menu--items">
            <a class="header__menu--link text-white {{ Request::is('page/' . $page->page_slug) ? 'active' : '' }}" href="{{ url('page/' . $page->page_slug) }}">
                Contacto
            </a>
        </li>
    @endif
@endforeach


                                   
                                </ul>
                            </nav>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <!-- Start Offcanvas header menu -->
        <div class="offcanvas__header">
            <div class="offcanvas__inner">
                <div class="offcanvas__logo">
                    <a class="offcanvas__logo_link" href="{{ url('shop') }}">
                        <img src="{{ asset('site_logo/') }}<?php echo '/' . $general_setting->site_logo; ?>" alt="Grocee Logo" width="158"
                            height="36">
                    </a>
                    <button class="offcanvas__close--btn" data-offcanvas>close</button>
                </div>
                <nav class="offcanvas__menu">
                    <ul class="offcanvas__menu_ul">
                        <li class="header__menu--items">
                            <a class="header__menu--link  {{ Request::is('home') ? 'active' : '' }}"
                                href="{{ url('home') }}">Inicio

                            </a>

                        </li>
                        <li class="header__menu--items">
                            <a class="header__menu--link  {{ Request::is('shop') ? 'active' : '' }}"
                                href="{{ url('shop') }}">Tienda

                            </a>

                        </li>
                        @foreach ($pages as $page)
    @if ($page->page_title == "Sobre nosotros" || $page->page_title == "Contact")
        <li class="offcanvas__menu_li">
            <a class="offcanvas__menu_item {{ Request::is('page/' . $page->page_slug) ? 'active' : '' }}" href="{{ url('page/' . $page->page_slug) }}">
                Contacto
            </a>
        </li>
    @endif
@endforeach

                        
                                 
                    </ul>
                    <div class="offcanvas__account--items">
                        @if (!empty($user_session))
                            <a class="header__account--btn" href="{{ url('dashboard') }}">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                    stroke-linecap="round" stroke-linejoin="round" class=" -user">
                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                    <circle cx="12" cy="7" r="4"></circle>
                                </svg>
                                <span class="visually">Mi cuenta</span>
                            </a>
                        @else
                            <a class="offcanvas__account--items__btn d-flex align-items-center"
                                href="{{ url('Userlogin') }}">
                                <span class="offcanvas__account--items__icon">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20.51" height="19.443"
                                        viewBox="0 0 512 512">
                                        <path
                                            d="M344 144c-3.92 52.87-44 96-88 96s-84.15-43.12-88-96c-4-55 35-96 88-96s92 42 88 96z"
                                            fill="none" stroke="currentColor" stroke-linecap="round"
                                            stroke-linejoin="round" stroke-width="32" />
                                        <path
                                            d="M256 304c-87 0-175.3 48-191.64 138.6C62.39 453.52 68.57 464 80 464h352c11.44 0 17.62-10.48 15.65-21.4C431.3 352 343 304 256 304z"
                                            fill="none" stroke="currentColor" stroke-miterlimit="10"
                                            stroke-width="32" />
                                    </svg>
                                </span>
                                <span class="offcanvas__account--items__label">Iniciar sesión</span>
                            </a>
                        @endif

                    </div>

                </nav>
            </div>
        </div>
        <!-- End Offcanvas header menu -->

        <!-- Start Offcanvas stikcy toolbar -->
        <div class="offcanvas__stikcy--toolbar">
            <ul class="d-flex justify-content-between">
                <li class="offcanvas__stikcy--toolbar__list">
                    <a class="offcanvas__stikcy--toolbar__btn" href="{{ url('home') }}">
                        <span class="offcanvas__stikcy--toolbar__icon">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" width="21.51" height="21.443"
                                viewBox="0 0 22 17">
                                <path fill="currentColor"
                                    d="M20.9141 7.93359c.1406.11719.2109.26953.2109.45703 0 .14063-.0469.25782-.1406.35157l-.3516.42187c-.1172.14063-.2578.21094-.4219.21094-.1406 0-.2578-.04688-.3515-.14062l-.9844-.77344V15c0 .3047-.1172.5625-.3516.7734-.2109.2344-.4687.3516-.7734.3516h-4.5c-.3047 0-.5742-.1172-.8086-.3516-.2109-.2109-.3164-.4687-.3164-.7734v-3.6562h-2.25V15c0 .3047-.11719.5625-.35156.7734-.21094.2344-.46875.3516-.77344.3516h-4.5c-.30469 0-.57422-.1172-.80859-.3516-.21094-.2109-.31641-.4687-.31641-.7734V8.46094l-.94922.77344c-.11719.09374-.24609.14062-.38672.14062-.16406 0-.30468-.07031-.42187-.21094l-.35157-.42187C.921875 8.625.875 8.50781.875 8.39062c0-.1875.070312-.33984.21094-.45703L9.73438.832031C10.1094.527344 10.5312.375 11 .375s.8906.152344 1.2656.457031l8.6485 7.101559zm-3.7266 6.50391V7.05469L11 1.99219l-6.1875 5.0625v7.38281h3.375v-3.6563c0-.3046.10547-.5624.31641-.7734.23437-.23436.5039-.35155.80859-.35155h3.375c.3047 0 .5625.11719.7734.35155.2344.211.3516.4688.3516.7734v3.6563h3.375z">
                                </path>
                            </svg>
                        </span>
                        <span class="offcanvas__stikcy--toolbar__label">Inicio</span>
                    </a>
                </li>

                <li class="offcanvas__stikcy--toolbar__list">
                    <a class="offcanvas__stikcy--toolbar__btn" href="{{url('shop')}}">
                    <span class="offcanvas__stikcy--toolbar__icon"> 
                        <svg fill="currentColor" xmlns="http://www.w3.org/2000/svg" width="18.51" height="17.443" viewBox="0 0 448 512"><path d="M416 32H32A32 32 0 0 0 0 64v384a32 32 0 0 0 32 32h384a32 32 0 0 0 32-32V64a32 32 0 0 0-32-32zm-16 48v152H248V80zm-200 0v152H48V80zM48 432V280h152v152zm200 0V280h152v152z"></path></svg>
                        </span>
                    <span class="offcanvas__stikcy--toolbar__label">Tienda</span>
                    </a>
                </li>
                 
                @if (!empty($user_session))
                <li class="offcanvas__stikcy--toolbar__list ">
                    <a class="offcanvas__stikcy--toolbar__btn search__open--btn" href="javascript:void(0)" data-offcanvas>
                        <span class="offcanvas__stikcy--toolbar__icon"> 
                            <svg xmlns="http://www.w3.org/2000/svg"  width="22.51" height="20.443" viewBox="0 0 512 512"><path d="M221.09 64a157.09 157.09 0 10157.09 157.09A157.1 157.1 0 00221.09 64z" fill="none" stroke="currentColor" stroke-miterlimit="10" stroke-width="32"/><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-miterlimit="10" stroke-width="32" d="M338.29 338.29L448 448"/></svg>   
                        </span>
                    <span class="offcanvas__stikcy--toolbar__label">Search</span>
                    </a>
                </li>
                <li class="offcanvas__stikcy--toolbar__list">
                    <a class="offcanvas__stikcy--toolbar__btn minicart__open--btn" href="{{ url('cart') }}"
                        data-offcanvas>
                        <span class="offcanvas__stikcy--toolbar__icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="22.706" height="22.534"
                                viewBox="0 0 14.706 13.534">
                                <g transform="translate(0 0)">
                                    <g>
                                        <path data-name="Path 16787"
                                            d="M4.738,472.271h7.814a.434.434,0,0,0,.414-.328l1.723-6.316a.466.466,0,0,0-.071-.4.424.424,0,0,0-.344-.179H3.745L3.437,463.6a.435.435,0,0,0-.421-.353H.431a.451.451,0,0,0,0,.9h2.24c.054.257,1.474,6.946,1.555,7.33a1.36,1.36,0,0,0-.779,1.242,1.326,1.326,0,0,0,1.293,1.354h7.812a.452.452,0,0,0,0-.9H4.74a.451.451,0,0,1,0-.9Zm8.966-6.317-1.477,5.414H5.085l-1.149-5.414Z"
                                            transform="translate(0 -463.248)" fill="currentColor" />
                                        <path data-name="Path 16788"
                                            d="M5.5,478.8a1.294,1.294,0,1,0,1.293-1.353A1.325,1.325,0,0,0,5.5,478.8Zm1.293-.451a.452.452,0,1,1-.431.451A.442.442,0,0,1,6.793,478.352Z"
                                            transform="translate(-1.191 -466.622)" fill="currentColor" />
                                        <path data-name="Path 16789"
                                            d="M13.273,478.8a1.294,1.294,0,1,0,1.293-1.353A1.325,1.325,0,0,0,13.273,478.8Zm1.293-.451a.452.452,0,1,1-.431.451A.442.442,0,0,1,14.566,478.352Z"
                                            transform="translate(-2.875 -466.622)" fill="currentColor" />
                                    </g>
                                </g>
                            </svg>
                        </span>
                        <span class="offcanvas__stikcy--toolbar__label">Carrito</span>
                        <span class="items__count">@php
                            $count = \App\Models\Cart::where('user_id', Session::get('LoggedIn'))->count();
                           @endphp
                           @if ($count)
                               {{ $count }}
                           @else
                               0
                           @endif</span>
                    </a>
                </li>
                @else
                <li class="offcanvas__stikcy--toolbar__list">
                    <a class="offcanvas__stikcy--toolbar__btn minicart__open--btn" href="{{ url('Userlogin') }}"
                        data-offcanvas>
                        <span class="offcanvas__stikcy--toolbar__icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="22.706" height="22.534"
                                viewBox="0 0 14.706 13.534">
                                <g transform="translate(0 0)">
                                    <g>
                                        <path data-name="Path 16787"
                                            d="M4.738,472.271h7.814a.434.434,0,0,0,.414-.328l1.723-6.316a.466.466,0,0,0-.071-.4.424.424,0,0,0-.344-.179H3.745L3.437,463.6a.435.435,0,0,0-.421-.353H.431a.451.451,0,0,0,0,.9h2.24c.054.257,1.474,6.946,1.555,7.33a1.36,1.36,0,0,0-.779,1.242,1.326,1.326,0,0,0,1.293,1.354h7.812a.452.452,0,0,0,0-.9H4.74a.451.451,0,0,1,0-.9Zm8.966-6.317-1.477,5.414H5.085l-1.149-5.414Z"
                                            transform="translate(0 -463.248)" fill="currentColor" />
                                        <path data-name="Path 16788"
                                            d="M5.5,478.8a1.294,1.294,0,1,0,1.293-1.353A1.325,1.325,0,0,0,5.5,478.8Zm1.293-.451a.452.452,0,1,1-.431.451A.442.442,0,0,1,6.793,478.352Z"
                                            transform="translate(-1.191 -466.622)" fill="currentColor" />
                                        <path data-name="Path 16789"
                                            d="M13.273,478.8a1.294,1.294,0,1,0,1.293-1.353A1.325,1.325,0,0,0,13.273,478.8Zm1.293-.451a.452.452,0,1,1-.431.451A.442.442,0,0,1,14.566,478.352Z"
                                            transform="translate(-2.875 -466.622)" fill="currentColor" />
                                    </g>
                                </g>
                            </svg>
                        </span>
                        <span class="offcanvas__stikcy--toolbar__label">Carrito</span>
                        <span class="items__count">
                               0
                           </span>
                    </a>
                </li>
                @endif
                @if (!empty($user_session))
                <li class="offcanvas__stikcy--toolbar__list">
                    <a class="offcanvas__stikcy--toolbar__btn" href="{{ url('wishlist') }}">
                        <span class="offcanvas__stikcy--toolbar__icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26"
                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                stroke-linecap="round" stroke-linejoin="round" class=" -heart">
                                <path
                                    d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z">
                                </path>
                            </svg>
                        </span>
                        <span class="offcanvas__stikcy--toolbar__label">Wishlist</span>
                        <span class="items__count">@php
                            $count = \App\Models\Wishlist::where('user_id', Session::get('LoggedIn'))->count();
                           @endphp
                           @if ($count)
                               {{ $count }}
                           @else
                               0
                           @endif</span>
                    </a>
                </li>
                @else
                <li class="offcanvas__stikcy--toolbar__list">
                    <a class="offcanvas__stikcy--toolbar__btn" href="{{ url('Userlogin') }}">
                        <span class="offcanvas__stikcy--toolbar__icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26"
                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                stroke-linecap="round" stroke-linejoin="round" class=" -heart">
                                <path
                                    d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z">
                                </path>
                            </svg>
                        </span>
                        <span class="offcanvas__stikcy--toolbar__label">Wishlist</span>
                        <span class="items__count">
                               0
                           </span>
                    </a>
                </li>
                @endif
            </ul>
        </div>
        <!-- End Offcanvas stikcy toolbar -->


        <!-- Start serch box area -->
        <div class="predictive__search--box ">
            <div class="predictive__search--box__inner">
                <h2 class="predictive__search--title">Buscar productos</h2>
                <form class="predictive__search--form" action="/search" method="GET">
    <label>
        <input class="predictive__search--input" name="query" placeholder="Buscar aquí" type="text">
    </label>
    <button class="predictive__search--button text-white" aria-label="botón de búsqueda">
        <svg class="product__items--action__btn--svg" xmlns="http://www.w3.org/2000/svg" width="30.51" height="25.443" viewBox="0 0 512 512">
            <path d="M221.09 64a157.09 157.09 0 10157.09 157.09A157.1 157.1 0 00221.09 64z" fill="none" stroke="currentColor" stroke-miterlimit="10" stroke-width="32" />
            <path fill="none" stroke="currentColor" stroke-linecap="round" stroke-miterlimit="10" stroke-width="32" d="M338.29 338.29L448 448" />
        </svg>
    </button>
</form>

            </div>
            <button class="predictive__search--close__btn" aria-label="search close" data-offcanvas>
                <svg class="predictive__search--close__icon" xmlns="http://www.w3.org/2000/svg" width="40.51"
                    height="30.443" viewBox="0 0 512 512">
                    <path fill="currentColor" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                        stroke-width="32" d="M368 368L144 144M368 144L144 368" />
                </svg>
            </button>
        </div>
        <!-- End serch box area -->

    </header>
    <!-- End header area -->
  <!-- Enhanced Modal Structure -->
<div class="modal fade" id="searchResultsModal" tabindex="-1" role="dialog" aria-labelledby="searchResultsModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="searchResultsModalLabel">Resultados de la búsqueda</h5>

            </div>
            <div class="modal-body">
                <div id="search_results"></div>
            </div>
        </div>
    </div>
</div>



    @yield('content')
 <!-- Transparent overlay -->
    <div id="overlay"></div>

    <!-- Start footer section -->
    <footer class="footer__section footer__bg">
        <div class="container">

            <div class="main__footer">
                <div class="row ">
                    <div class="col-lg-4 col-md-10">
                        <div class="footer__widget">
                            <h2 class="footer__widget--title">SOBRE NOSOTROS <button class="footer__widget--button"
                                    aria-label="footer widget button"></button>
                                <svg class="footer__widget--title__arrowdown--icon" xmlns="http://www.w3.org/2000/svg"
                                    width="12.355" height="8.394" viewBox="0 0 10.355 6.394">
                                    <path d="M15.138,8.59l-3.961,3.952L7.217,8.59,6,9.807l5.178,5.178,5.178-5.178Z"
                                        transform="translate(-6 -8.59)" fill="currentColor"></path>
                                </svg>
                            </h2>
                            <div class="footer__widget--inner">
                                <p class="footer__widget--desc"></p>
                                <ul class="social__share footer__social d-flex">
                                    <li class="social__share--list">
                                        <a class="social__share--icon__style2" target="_blank"
                                            href="https://www.facebook.com/">
                                            <svg width="11" height="17" viewBox="0 0 9 15" fill="none"
                                                xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M7.62891 8.625L8.01172 6.10938H5.57812V4.46875C5.57812 3.75781 5.90625 3.10156 7 3.10156H8.12109V0.941406C8.12109 0.941406 7.10938 0.75 6.15234 0.75C4.15625 0.75 2.84375 1.98047 2.84375 4.16797V6.10938H0.601562V8.625H2.84375V14.75H5.57812V8.625H7.62891Z"
                                                    fill="currentColor" />
                                            </svg>
                                            <span class="visually-hidden">Facebook</span>
                                        </a>
                                    </li>
                                    <li class="social__share--list">
                                        <a class="social__share--icon__style2" target="_blank"
                                            href="https://twitter.com/">
                                            <svg width="16" height="14" viewBox="0 0 14 12" fill="none"
                                                xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M12.5508 2.90625C13.0977 2.49609 13.5898 2.00391 13.9727 1.42969C13.4805 1.64844 12.9062 1.8125 12.332 1.86719C12.9336 1.51172 13.3711 0.964844 13.5898 0.28125C13.043 0.609375 12.4141 0.855469 11.7852 0.992188C11.2383 0.417969 10.5 0.0898438 9.67969 0.0898438C8.09375 0.0898438 6.80859 1.375 6.80859 2.96094C6.80859 3.17969 6.83594 3.39844 6.89062 3.61719C4.51172 3.48047 2.37891 2.33203 0.957031 0.609375C0.710938 1.01953 0.574219 1.51172 0.574219 2.05859C0.574219 3.04297 1.06641 3.91797 1.85938 4.4375C1.39453 4.41016 0.929688 4.30078 0.546875 4.08203V4.10938C0.546875 5.50391 1.53125 6.65234 2.84375 6.92578C2.625 6.98047 2.35156 7.03516 2.10547 7.03516C1.91406 7.03516 1.75 7.00781 1.55859 6.98047C1.91406 8.12891 2.98047 8.94922 4.23828 8.97656C3.25391 9.74219 2.02344 10.207 0.683594 10.207C0.4375 10.207 0.21875 10.1797 0 10.1523C1.25781 10.9727 2.76172 11.4375 4.40234 11.4375C9.67969 11.4375 12.5508 7.08984 12.5508 3.28906C12.5508 3.15234 12.5508 3.04297 12.5508 2.90625Z"
                                                    fill="currentColor" />
                                            </svg>
                                            <span class="visually-hidden">Twitter</span>
                                        </a>
                                    </li>
                                    <li class="social__share--list">
                                        <a class="social__share--icon__style2" target="_blank"
                                            href="https://www.instagram.com/">
                                            <svg width="16" height="15" viewBox="0 0 14 13" fill="none"
                                                xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M7.125 3.60547C5.375 3.60547 3.98047 5.02734 3.98047 6.75C3.98047 8.5 5.375 9.89453 7.125 9.89453C8.84766 9.89453 10.2695 8.5 10.2695 6.75C10.2695 5.02734 8.84766 3.60547 7.125 3.60547ZM7.125 8.80078C6.00391 8.80078 5.07422 7.89844 5.07422 6.75C5.07422 5.62891 5.97656 4.72656 7.125 4.72656C8.24609 4.72656 9.14844 5.62891 9.14844 6.75C9.14844 7.89844 8.24609 8.80078 7.125 8.80078ZM11.1172 3.49609C11.1172 3.08594 10.7891 2.75781 10.3789 2.75781C9.96875 2.75781 9.64062 3.08594 9.64062 3.49609C9.64062 3.90625 9.96875 4.23438 10.3789 4.23438C10.7891 4.23438 11.1172 3.90625 11.1172 3.49609ZM13.1953 4.23438C13.1406 3.25 12.9219 2.375 12.2109 1.66406C11.5 0.953125 10.625 0.734375 9.64062 0.679688C8.62891 0.625 5.59375 0.625 4.58203 0.679688C3.59766 0.734375 2.75 0.953125 2.01172 1.66406C1.30078 2.375 1.08203 3.25 1.02734 4.23438C0.972656 5.24609 0.972656 8.28125 1.02734 9.29297C1.08203 10.2773 1.30078 11.125 2.01172 11.8633C2.75 12.5742 3.59766 12.793 4.58203 12.8477C5.59375 12.9023 8.62891 12.9023 9.64062 12.8477C10.625 12.793 11.5 12.5742 12.2109 11.8633C12.9219 11.125 13.1406 10.2773 13.1953 9.29297C13.25 8.28125 13.25 5.24609 13.1953 4.23438ZM11.8828 10.3594C11.6914 10.9062 11.2539 11.3164 10.7344 11.5352C9.91406 11.8633 8 11.7812 7.125 11.7812C6.22266 11.7812 4.30859 11.8633 3.51562 11.5352C2.96875 11.3164 2.55859 10.9062 2.33984 10.3594C2.01172 9.56641 2.09375 7.65234 2.09375 6.75C2.09375 5.875 2.01172 3.96094 2.33984 3.14062C2.55859 2.62109 2.96875 2.21094 3.51562 1.99219C4.30859 1.66406 6.22266 1.74609 7.125 1.74609C8 1.74609 9.91406 1.66406 10.7344 1.99219C11.2539 2.18359 11.6641 2.62109 11.8828 3.14062C12.2109 3.96094 12.1289 5.875 12.1289 6.75C12.1289 7.65234 12.2109 9.56641 11.8828 10.3594Z"
                                                    fill="currentColor" />
                                            </svg>
                                            <span class="visually-hidden">Instagram</span>
                                        </a>
                                    </li>
                                    <li class="social__share--list">
                                        <a class="social__share--icon__style2" target="_blank"
                                            href="https://www.pinterest.com/">
                                            <svg width="16" height="17" viewBox="0 0 14 15" fill="none"
                                                xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M13.5625 7.75C13.5625 4.00391 10.5273 0.96875 6.78125 0.96875C3.03516 0.96875 0 4.00391 0 7.75C0 10.6484 1.77734 13.082 4.29297 14.0664C4.23828 13.5469 4.18359 12.7266 4.32031 12.125C4.45703 11.6055 5.11328 8.76172 5.11328 8.76172C5.11328 8.76172 4.92188 8.35156 4.92188 7.75C4.92188 6.82031 5.46875 6.10938 6.15234 6.10938C6.72656 6.10938 7 6.54688 7 7.06641C7 7.64062 6.61719 8.51562 6.42578 9.33594C6.28906 9.99219 6.78125 10.5391 7.4375 10.5391C8.64062 10.5391 9.57031 9.28125 9.57031 7.44922C9.57031 5.80859 8.39453 4.6875 6.75391 4.6875C4.8125 4.6875 3.69141 6.13672 3.69141 7.61328C3.69141 8.21484 3.91016 8.84375 4.18359 9.17188C4.23828 9.22656 4.23828 9.30859 4.23828 9.36328C4.18359 9.58203 4.04688 10.0469 4.04688 10.1289C4.01953 10.2656 3.9375 10.293 3.80078 10.2383C2.95312 9.82812 2.43359 8.59766 2.43359 7.58594C2.43359 5.45312 3.99219 3.48438 6.91797 3.48438C9.26953 3.48438 11.1016 5.17969 11.1016 7.42188C11.1016 9.74609 9.625 11.6328 7.57422 11.6328C6.89062 11.6328 6.23438 11.2773 6.01562 10.8398C6.01562 10.8398 5.6875 12.1523 5.60547 12.4531C5.44141 13.0547 5.03125 13.793 4.75781 14.2305C5.38672 14.4492 6.07031 14.5312 6.78125 14.5312C10.5273 14.5312 13.5625 11.4961 13.5625 7.75Z"
                                                    fill="currentColor" />
                                            </svg>
                                            <span class="visually-hidden">Pinterest</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4">
                        <div class="footer__widget">
                            <h2 class="footer__widget--title ">My Account <button class="footer__widget--button"
                                    aria-label="footer widget button"></button>
                                <svg class="footer__widget--title__arrowdown--icon" xmlns="http://www.w3.org/2000/svg"
                                    width="12.355" height="8.394" viewBox="0 0 10.355 6.394">
                                    <path d="M15.138,8.59l-3.961,3.952L7.217,8.59,6,9.807l5.178,5.178,5.178-5.178Z"
                                        transform="translate(-6 -8.59)" fill="currentColor"></path>
                                </svg>
                            </h2>
                            <ul class="footer__widget--menu footer__widget--inner">
                                @if (!empty($user_session))
                                    <li class="footer__widget--menu__list"><a class="footer__widget--menu__text"
                                            href="{{ url('dashboard') }}">Mi cuenta</a></li>
                                @else
                                    <li class="footer__widget--menu__list"><a class="footer__widget--menu__text"
                                            href="{{ url('Userlogin') }}">Mi cuenta</a></li>
                                @endif

                                <li class="footer__widget--menu__list"><a class="footer__widget--menu__text"
                                        href="{{ url('cart') }}">Carrito de compras</a></li>


                                <li class="footer__widget--menu__list"><a class="footer__widget--menu__text"
                                        href="{{ url('checkout') }}">Pagar</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4">
                        <div class="footer__widget">
                            <h2 class="footer__widget--title ">RECURSOS <button class="footer__widget--button"
                                    aria-label="footer widget button"></button>
                                <svg class="footer__widget--title__arrowdown--icon" xmlns="http://www.w3.org/2000/svg"
                                    width="12.355" height="8.394" viewBox="0 0 10.355 6.394">
                                    <path d="M15.138,8.59l-3.961,3.952L7.217,8.59,6,9.807l5.178,5.178,5.178-5.178Z"
                                        transform="translate(-6 -8.59)" fill="currentColor"></path>
                                </svg>
                            </h2>
                            <ul class="footer__widget--menu footer__widget--inner">
                                @foreach ($pages as $page)
    @if ($page->page_title == "Sobre nosotros" || $page->page_title == "contact")
        <li class="footer__widget--menu__list">
            <a class="footer__widget--menu__text {{ Request::is('page/' . $page->page_slug) ? 'active' : '' }}" href="{{ url('page/' . $page->page_slug) }}">
                Contacto
            </a>
        </li>
    @endif
@endforeach

                                       
                                <li class="footer__widget--menu__list"><a class="footer__widget--menu__text"
                                        href="{{ url('about') }}">SOBRE NOSOTROS</a></li>

                                <li class="footer__widget--menu__list"><a class="footer__widget--menu__text"
                                        href="privacy-policy.html">Política de privacidad</a></li>

                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4">
                        <div class="footer__widget">
                            <h2 class="footer__widget--title ">ENCUENTRA RÁPIDO <button class="footer__widget--button"
                                    aria-label="footer widget button"></button>
                                <svg class="footer__widget--title__arrowdown--icon" xmlns="http://www.w3.org/2000/svg"
                                    width="12.355" height="8.394" viewBox="0 0 10.355 6.394">
                                    <path d="M15.138,8.59l-3.961,3.952L7.217,8.59,6,9.807l5.178,5.178,5.178-5.178Z"
                                        transform="translate(-6 -8.59)" fill="currentColor"></path>
                                </svg>
                            </h2>
                            <ul class="footer__widget--menu footer__widget--inner">
                                @php
                                    $userCategories = !empty($user_session->categories)
                                        ? explode(',', $user_session->categories)
                                        : [];
                                    $category = \App\Models\Category::whereIn('id', $userCategories)
                                        ->select('id', 'name')
                                        ->get();
                                @endphp
                                @foreach ($category as $row)
                                    <li class="footer__widget--menu__list"><a class="footer__widget--menu__text"
                                            href="{{ url('shop') }}">{{ $row->name }}</a></li>
                                @endforeach

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        <div class="footer__bottom">
            <div class="container">

                <div class="footer__bottom--inenr ">
                    <center>
                      <p class="copyright__content"><span class="text__secondary">© {{ date('Y') }}</span> Todos los derechos reservados.</p>

                    </center>
                    {{-- <div class="footer__logo">
                        <a class="footer__logo--link" href="{{url('/')}}"><img
                            src="{{ asset('site_logo/') }}<?php echo '/' . $general_setting->site_logo; ?>" style="width: 200px;height:60px" alt="logo-img"></a>
                    </div>

                    <div class="footer__payment">
                        <img src="assets/img/icon/payment-img.webp" alt="payment-img">
                    </div> --}}
                </div>
            </div>
        </div>
    </footer>
    <!-- End footer section -->




    <!-- Scroll top bar -->
    <button id="scroll__top"><svg xmlns="http://www.w3.org/2000/svg" class="ionicon" viewBox="0 0 512 512">
            <path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                stroke-width="48" d="M112 244l144-144 144 144M256 120v292" />
        </svg></button>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
    document.addEventListener('contextmenu', function(e) {
            e.preventDefault();
        });
$(document).ready(function() {
    $('#product_search_form').submit(function(event) {
        event.preventDefault(); // Prevent form submission
        performSearch();
    });

    $('#search_term').keyup(function() {
        const searchTerm = $(this).val();
        if (searchTerm.length >= 2) {
            performSearch();
        } else {
            $('#search_results').empty(); // Clear results if search term is less than 2 characters
        }
    });

    function performSearch() {
        const searchTerm = $('#search_term').val();
        const categoryId = $('select[name="category_id"]').val();

        $.ajax({
            url: "{{ url('getProducts') }}", // Replace with your actual route
            method: 'GET',
            data: {
                search: searchTerm,
                category_id: categoryId
            },
            dataType: 'json',
            success: function(response) {
                $('#search_results').empty(); // Clear previous results
                if (response.length > 0) {
                    const resultList = $('<div class="product-grid"></div>');

                    $.each(response, function(index, product) {
                        const listItem = `
                            <div class="product-card">
                                <a href="{{ url('product-details') }}/${product.slug}" class="product-link">
                                    <img src="{{ asset('product_images') }}/${product.f_thumbnail}" alt="${product.title}" class="product-image">
                                    <div class="product-info">
                                        <h5 class="product-title">${product.title}</h5>
                                    </div>
                                </a>
                            </div>`;
                        resultList.append(listItem);
                    });

                    $('#search_results').append(resultList);
                } else {
                    $('#search_results').append('<p class="no-results">No products found.</p>');
                }

                $('#searchResultsModal').modal('show'); // Show the modal
            },
            error: function(xhr, status, error) {
                console.error(error);
                $('#search_results').empty().append('<p>Error fetching products.</p>');
            }
        });
    }
});

    </script>
    <!-- Hidden Logout Form -->
<!-- Hidden Logout Form -->
<form id="logout-form" action="{{ route('update.logout.time') }}" method="POST" style="display: none;">
    @csrf
</form>

<!-- Auto Logout Script -->
<script>
   const sessionLifetimeMinutes = 15; // Set to 15 minutes for testing
const sessionLifetime = sessionLifetimeMinutes * 60000; // Convert minutes to milliseconds
console.log('Session Lifetime (minutes):', sessionLifetimeMinutes);
console.log('Session Lifetime (milliseconds):', sessionLifetime);

let logoutTimer;
const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

function formatDateToBoliviaTime(date) {
    return new Intl.DateTimeFormat('en-US', {
        timeZone: 'America/La_Paz',
        year: 'numeric',
        month: '2-digit',
        day: '2-digit',
        hour: '2-digit',
        minute: '2-digit',
        second: '2-digit'
    }).format(date);
}

function resetActivityTimer() {
    clearTimeout(logoutTimer); // Clear any existing timer
    logoutTimer = setTimeout(performLogout, sessionLifetime); // Set new logout timer
    console.log('Activity detected, timer reset at (Bolivia Time):', formatDateToBoliviaTime(new Date()));
}

function handleVisibilityChange() {
    if (document.visibilityState === 'visible') {
        resetActivityTimer(); // Reset timer when the page becomes visible again
        console.log('Page is visible, timer reset at (Bolivia Time):', formatDateToBoliviaTime(new Date()));
    } else {
        console.log('Page is not visible, skipping session check.');
    }
}

function updateLogoutTime() {
    $.ajax({
        url: '{{ route("update.logout.time") }}',
        method: 'POST',
        data: {
            _token: csrfToken
        },
        success: function(response) {
            console.log('Logout time updated:', response.status);
        },
        error: function(xhr) {
            console.log('Error updating logout time:', xhr.responseText);
        }
    });
}

function performLogout() {
    console.log('Performing logout at (Bolivia Time):', formatDateToBoliviaTime(new Date()));
    document.getElementById('logout-form').submit();
}

setInterval(() => {
    if (document.visibilityState === 'visible') {
        updateLogoutTime(); // Update logout time periodically if page is visible
    } else {
        console.log('Page is not visible, skipping session update.');
    }
}, 60000); // Update every minute

document.addEventListener('mousemove', resetActivityTimer);
document.addEventListener('keydown', resetActivityTimer);
document.addEventListener('visibilitychange', handleVisibilityChange);

// Initialize timer
resetActivityTimer(); // Ensure the timer starts correctly

</script>


    <!-- All Script JS Plugins here  -->
    <script src="{{ asset('assets/js/vendor/popper.js') }}" defer="defer"></script>
    <script src="{{ asset('assets/js/vendor/bootstrap.min.js') }}" defer="defer"></script>
    <script src="{{ asset('assets/js/plugins/swiper-bundle.min.js') }}"></script>
    <script src="{{ asset('assets/js/plugins/glightbox.min.js') }}"></script>

    <!-- Customscript js -->
    <script src="{{ asset('assets/js/script.js') }}"></script>

</body>

</html>
