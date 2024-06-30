<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Payment;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class OrderController extends Controller
{
    public function store(Request $request)
    {
        // dd($request->all());
        $request->validate([
            'full_name' => 'required|string|max:255',
            'amount' => 'required|numeric',
            'payment_receipt' => 'image|mimes:jpeg,png,jpg,gif|max:2048',
            'address' => 'required|string|max:255',
            'city' => 'required|string|max:255',
            'country' => 'required|string|max:255',
            'postal_code' => 'required|string|max:10',
            'cart_products' => 'required|array',
            'cart_products.*.product_id' => 'required|integer|exists:products,id',
            'cart_products.*.quantity' => 'required|integer|min:1',
            'cart_products.*.price' => 'required|numeric|min:0',
        ]);

        $user_id = Session::get('LoggedIn');
        $total_amount = 0;
        $payer = User::find($user_id);

        foreach ($request->cart_products as $cart_product) {
            $total_amount += $cart_product['price'] * $cart_product['quantity'];
        }

        $order = Order::create([
            'user_id' => $user_id,
            'full_name' => $request->full_name,
            'address' => $request->address,
            'city' => $request->city,
            'country' => $request->country,
            'postal_code' => $request->postal_code,
            'total_amount' => $total_amount,
        ]);

        foreach ($request->cart_products as $cart_product) {
            OrderItem::create([
                'order_id' => $order->id,
                'product_id' => $cart_product['product_id'],
                'quantity' => $cart_product['quantity'],
                'price' => $cart_product['price'],
            ]);
        }
        // Serialize the product data
        $productDetails = [];
        foreach ($request->cart_products as $cart_product) {
            $productDetails[] = [
                'product_id' => $cart_product['product_id'],
                'quantity' => $cart_product['quantity'],
                'price' => $cart_product['price'],
            ];
        }
        $serializedProductDetails = json_encode($productDetails);

        // Create a new payment
        $payment = Payment::create([
            'name' => $payer->payer_name,
            'payer_email' => $payer->payer_email,
            'user_id' => $user_id,
            'product_details' => $serializedProductDetails,
            'amount' => $request->amount,
            'accepted' => false,
        ]);
        if ($request->hasFile('payment_receipt')) {
            $payment_receipt = $request->file('payment_receipt');
            $imageName = $payment_receipt->getClientOriginalName();
            $payment_receipt->move(public_path('payment_receipt'), $imageName);

            $payment->payment_receipt = 'payment_receipt/' . $imageName;
        }

        $payment->save();
        // Clear the user's cart
        Cart::where('user_id', $user_id)->delete();

        return redirect()->route('order.success');
    }
}
