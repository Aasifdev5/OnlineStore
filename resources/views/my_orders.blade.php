@extends('master')
@section('title')
 {{ __('Orders') }}
@endsection
@section('content')
<main class="main__content_wrapper">
    @if(Session::has('success'))
    <div class="alert alert-success" style="background-color: green;">
        <p style="color: #fff;">{{session::get('success')}}</p>
    </div>
    @endif
    @if(Session::has('fail'))
    <div class="alert alert-danger" style="background-color: red;">
        <p style="color: #fff;">{{session::get('fail')}}</p>
    </div>
    @endif


    <!-- my account section start -->
    <section class="my__account--section section--padding">
        <div class="container">
            <p class="account__welcome--text">Hello, {{ $user_session->name }} welcome to your dashboard!</p>
            <div class="my__account--section__inner border-radius-10 d-flex">
                <div class="account__left--sidebar">
                    <h2 class="account__content--title mb-20">My Profile</h2>
                    <ul class="account__menu">
                        <li class="account__menu--list "><a href="{{ url('dashboard') }}">Dashboard</a></li>
                        <li class="account__menu--list"><a href="{{ url('address') }}">Addresses</a></li>
                        <li class="account__menu--list"><a href="{{ url('edit_profile') }}">Edit Profile</a></li>
                        <li class="account__menu--list"><a href="{{ url('change_password') }}">Change Password</a></li>
                        <li class="account__menu--list active"><a href="{{ url('MyOrders') }}">Orders</a></li>
                        <li class="account__menu--list"><a href="{{ url('wishlist') }}">Wishlist</a></li>
                        <li class="account__menu--list"><a href="{{ url('logout') }}">Log Out</a></li>
                    </ul>
                </div>
                <div class="account__wrapper">
                    <div class="account__content">
                        <h2 class="account__content--title h3 mb-20">Orders</h2>
                        <div class="account__table--area">
                            <table class="account__table">
                                <thead class="account__table--header">
                                    <tr class="account__table--header__child">
                                        <th class="account__table--header__child--items">Order</th>
                                        <th class="account__table--header__child--items">Date</th>
                                        <th class="account__table--header__child--items">Payment Status</th>
                                        <th class="account__table--header__child--items">Product</th>
                                        <th class="account__table--header__child--items">Total</th>
                                    </tr>
                                </thead>
                                <tbody class="account__table--body mobile__none">
                                    @foreach ($orders as $order)
                                        @foreach ($order->orderItems as $orderItem)
                                            <tr class="account__table--body__child">
                                                <td class="account__table--body__child--items">{{ $order->id }}</td>
                                                <td class="account__table--body__child--items">{{ $order->created_at->format('F j, Y') }}</td>
                                                <td class="account__table--body__child--items">
                                                    @if($order->accept == 1)
                                                        Paid
                                                    @elseif($order->accept == 0)
                                                        Pending
                                                    @elseif($order->accept == -1)
                                                        Failed
                                                    @else
                                                        Unknown
                                                    @endif
                                                </td>
                                                <td class="account__table--body__child--items">{{ $orderItem->product->title }}</td>
                                                <td class="account__table--body__child--items">
                                                    BS{{ number_format($orderItem->price * $orderItem->quantity, 2) }}
                                                </td>
                                            </tr>
                                        @endforeach
                                    @endforeach
                                </tbody>


                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- my account section end -->

    <!-- Start shipping section -->
    <section class="shipping__section">
        <div class="container">
            <div class="shipping__inner style2 d-flex">
                <div class="shipping__items style2 d-flex align-items-center">
                    <div class="shipping__icon">
                        <img src="assets/img/other/shipping1.webp" alt="icon-img">
                    </div>
                    <div class="shipping__content">
                        <h2 class="shipping__content--title h3">Free Shipping</h2>
                        <p class="shipping__content--desc">Free shipping over $100</p>
                    </div>
                </div>
                <div class="shipping__items style2 d-flex align-items-center">
                    <div class="shipping__icon">
                        <img src="assets/img/other/shipping2.webp" alt="icon-img">
                    </div>
                    <div class="shipping__content">
                        <h2 class="shipping__content--title h3">Support 24/7</h2>
                        <p class="shipping__content--desc">Contact us 24 hours a day</p>
                    </div>
                </div>
                <div class="shipping__items style2 d-flex align-items-center">
                    <div class="shipping__icon">
                        <img src="assets/img/other/shipping3.webp" alt="icon-img">
                    </div>
                    <div class="shipping__content">
                        <h2 class="shipping__content--title h3">100% Money Back</h2>
                        <p class="shipping__content--desc">You have 30 days to Return</p>
                    </div>
                </div>
                <div class="shipping__items style2 d-flex align-items-center">
                    <div class="shipping__icon">
                        <img src="assets/img/other/shipping4.webp" alt="icon-img">
                    </div>
                    <div class="shipping__content">
                        <h2 class="shipping__content--title h3">Payment Secure</h2>
                        <p class="shipping__content--desc">We ensure secure payment</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End shipping section -->

</main>

@endsection
