@extends('master')
@section('title')
    Checkout
@endsection
@section('content')
    <main class="main__content_wrapper">

        <!-- Start checkout page area -->
        <div class="checkout__page--area section--padding">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 col-md-6">
                        <div class="main checkout__mian">
                            <form action="{{ route('order.store') }}" method="POST" enctype="multipart/form-data">
                                @csrf
                                <div class="checkout__content--step section__shipping--address">
                                    <div class="section__header mb-25">
                                        <h2 class="section__header--title h3">Billing Details</h2>
                                    </div>
                                    <div class="section__shipping--address__content">
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 mb-20">
                                                <div class="checkout__input--list">
                                                    <label class="checkout__input--label mb-5" for="full_name">Full Name
                                                        <span class="checkout__input--label__star">*</span></label>
                                                    <input class="checkout__input--field border-radius-5"
                                                        placeholder="Full name" id="full_name" name="full_name"
                                                        type="text" value="{{$user_session->name}}" required>
                                                </div>
                                            </div>
                                            <div class="col-sm-12">
                                                @php
                                            $total = \App\Models\Cart::where('user_id', Session::get('LoggedIn'))
                                                                    ->selectRaw('SUM(price * quantity) as total')
                                                                    ->pluck('total')
                                                                    ->first();
                                            $formattedTotal = $total ? '' . number_format($total, 2) : '0.00';
                                        @endphp
                                                <label for="amount" class="form-label">Monto</label>
                                                <input type="text" class="form-control" id="amount" name="amount" value="{{ $formattedTotal }}">
                                            </div>
                                            <div class="col-sm-12">
                                                <label for="payment_receipt" class="form-label">Recibo de Pago</label>
                                                <input type="file" class="form-control" id="payment_receipt" name="payment_receipt"
                                                    accept="image/*">
                                            </div>
                                            <div class="col-12 mb-20">
                                                <div class="checkout__input--list">
                                                    <label class="checkout__input--label mb-5" for="address">Address <span
                                                            class="checkout__input--label__star">*</span></label>
                                                    <input class="checkout__input--field border-radius-5"
                                                        placeholder="Apartment, suite, etc. (optional)" id="address"
                                                        name="address" type="text" value="{{$user_session->location}}" required>
                                                </div>
                                            </div>

                                            <div class="col-12 mb-20">
                                                <div class="checkout__input--list">
                                                    <label class="checkout__input--label mb-5" for="city">Town/City
                                                        <span class="checkout__input--label__star">*</span></label>
                                                    <input class="checkout__input--field border-radius-5" placeholder="City"
                                                        id="city" name="city" value="{{$user_session->city}}" type="text" required>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 mb-20">
                                                <div class="checkout__input--list">
                                                    <label class="checkout__input--label mb-5" for="country">Country/region
                                                        <span class="checkout__input--label__star">*</span></label>
                                                    <div class="checkout__input--select select">
                                                        <select class="checkout__input--select__field border-radius-5"
                                                            id="country" name="country" required>
                                                            <option value="Bolivia">Bolivia</option>

                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                                @foreach ($carts as $row)
                                    <input type="hidden" name="cart_products[{{ $loop->index }}][product_id]"
                                        value="{{ $row->product_id }}">
                                    <input type="hidden" name="cart_products[{{ $loop->index }}][quantity]"
                                        value="{{ $row->quantity }}">
                                    <input type="hidden" name="cart_products[{{ $loop->index }}][price]"
                                        value="{{ $row->price }}">
                                @endforeach

                                <div class="checkout__content--step__footer d-flex align-items-center">
                                    <a class="continue__shipping--btn primary__btn border-radius-5">Continue To Shipping</a>
                                    <a class="previous__link--content" href="{{ url('cart') }}">Return to cart</a>
                                </div>


                        </div>
                    </div>
                    <div class="col-lg-5 col-md-6">
                        <aside class="checkout__sidebar sidebar border-radius-10">
                            <h2 class="checkout__order--summary__title text-center mb-15">Your Order Summary</h2>
                            <div class="cart__table checkout__product--table">
                                <table class="cart__table--inner">
                                    <tbody class="cart__table--body">
                                        @foreach ($carts as $row)
                                            @php
                                                $total = $row->price * $row->quantity;
                                                $product_details = \App\Models\Product::find($row->product_id);
                                            @endphp
                                            @if ($product_details)
                                                <tr class="cart__table--body__items">
                                                    <td class="cart__table--body__list">
                                                        <div class="product__image two  d-flex align-items-center">
                                                            <div class="product__thumbnail border-radius-5">
                                                                <a class="display-block"
                                                                    href="{{ url('product-details/' . $product_details->slug) }}"><img
                                                                        class="display-block border-radius-5"
                                                                        src="{{ asset('product_images/' . $product_details->f_thumbnail) }}"
                                                                        alt="{{ $product_details->title }}"></a>
                                                                <span
                                                                    class="product__thumbnail--quantity">{{ $row->quantity }}</span>
                                                            </div>
                                                            <div class="product__description">
                                                                <h4 class="product__description--name"> <a
                                                                        href="{{ url('product-details/' . $product_details->slug) }}">{{ $product_details->title }}</a>
                                                                </h4>
                                                                {{-- <span class="product__description--variant">COLOR: Blue</span> --}}
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="cart__table--body__list">
                                                        <span class="cart__price">

                                                            {{ 'BS' . $row->price }}
                                                        </span>
                                                    </td>
                                                </tr>
                                            @endif
                                        @endforeach


                                    </tbody>
                                </table>
                            </div>

                            <div class="checkout__total">
                                <table class="checkout__total--table">
                                    <tbody class="checkout__total--body">
                                        <tr class="checkout__total--items">
                                            <td class="checkout__total--title text-left">Subtotal </td>
                                            <td class="checkout__total--amount text-right">@php
                                                $total = \App\Models\Cart::where('user_id', Session::get('LoggedIn'))
                                                    ->selectRaw('SUM(price * quantity) as total')
                                                    ->pluck('total')
                                                    ->first();
                                                $formattedTotal = $total ? 'BS' . number_format($total, 2) : 'BS0.00';
                                            @endphp
                                                {{ $formattedTotal }}</td>
                                        </tr>
                                        <!--<tr class="checkout__total--items">-->
                                        <!--    <td class="checkout__total--title text-left">Shipping</td>-->
                                        <!--    <td class="checkout__total--calculated__text text-right">Calculated at next-->
                                        <!--        step</td>-->
                                        <!--</tr>-->
                                    </tbody>
                                    <tfoot class="checkout__total--footer">
                                        <tr class="checkout__total--footer__items">
                                            <td
                                                class="checkout__total--footer__title checkout__total--footer__list text-left">
                                                Total </td>
                                            <td
                                                class="checkout__total--footer__amount checkout__total--footer__list text-right">
                                                @php
                                                    $total = \App\Models\Cart::where(
                                                        'user_id',
                                                        Session::get('LoggedIn'),
                                                    )
                                                        ->selectRaw('SUM(price * quantity) as total')
                                                        ->pluck('total')
                                                        ->first();
                                                    $formattedTotal = $total
                                                        ? 'BS' . number_format($total, 2)
                                                        : 'BS0.00';
                                                @endphp
                                                {{ $formattedTotal }}</td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <div class="payment__history mb-30">
                                <h3 class="payment__history--title mb-20">Payment</h3>
                                <ul class="payment__history--inner d-flex">
                                    <img class="img-radius img-70 align-top m-r-15"
                                        src="{{ asset('qrcode/' . $qrcode->qrcode_path) }}" height="70px"
                                        alt="">


                                </ul>

                                    @if (!empty($qrcode))
                                    <a href="{{ asset('qrcode/' . $qrcode->qrcode_path) }}" class="btn btn-block btn-primary"
                                        download="qr_code.png">
                                        <i class="fa fa-download"></i>
                                        <h4>Descargar Código QR</h4>
                                    </a>
                                @endif
                            </div>
                            <button class="checkout__now--btn primary__btn" type="submit">Checkout Now</button>
                        </aside>
                    </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- End checkout page area -->

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
