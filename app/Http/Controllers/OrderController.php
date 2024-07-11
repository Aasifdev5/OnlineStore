<?php

namespace App\Http\Controllers;

use App\Mail\OrderPlaced;
use App\Models\Cart;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Payment;
use App\Models\Product;
use App\Models\ProductVariations;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;

class OrderController extends Controller
{
    public function store(Request $request)
    {
        $request->validate([
            'full_name' => 'required|string|max:255',
            'amount' => 'required|numeric',
            'payment_receipt' => 'image|mimes:jpeg,png,jpg,gif|max:2048',
            'address' => 'required|string|max:255',
            'city' => 'required|string|max:255',
            'country' => 'required|string|max:255',
            'cart_products' => 'required|array',
            'cart_products.*.product_id' => 'required|integer',
            'cart_products.*.quantity' => 'required|integer|min:1',
            'cart_products.*.price' => 'required|numeric|min:0',
        ]);

        $user_id = Session::get('LoggedIn');
        $total_amount = 0;

        foreach ($request->cart_products as $cart_product) {
            $total_amount += $cart_product['price'] * $cart_product['quantity'];
        }

        DB::transaction(function () use ($request, $user_id, $total_amount) {
            // Create the order
            $order = Order::create([
                'user_id' => $user_id,
                'full_name' => $request->full_name,
                'address' => $request->address,
                'city' => $request->city,
                'country' => $request->country,
                'postal_code' => $request->postal_code,
                'total_amount' => $total_amount,
            ]);

            // Attach products to the order
            foreach ($request->cart_products as $cart_product) {
                $productSku= Product::where('id',$cart_product['product_id'])->first();
                $color = ProductVariations::where('sku',$productSku->sku)->first()->color;

                OrderItem::create([
                    'order_id' => $order->id,
                    'product_id' => $cart_product['product_id'],
                    'color'=>$color,
                    'quantity' => $cart_product['quantity'],
                    'price' => $cart_product['price'],
                ]);

                // Update product stock
                $product = Product::find($cart_product['product_id']);
                if ($product) {
                    $product->stock_qty -= $cart_product['quantity'];
                    $product->save();
                } else {
                    return response()->json(['error' => 'Product not found'], 404);
                }
            }

            // Serialize the product data for the payment
            $productDetails = array_map(function ($cart_product) {
                return [
                    'product_id' => $cart_product['product_id'],
                    'quantity' => $cart_product['quantity'],
                    'price' => $cart_product['price'],
                ];
            }, $request->cart_products);

            $serializedProductDetails = json_encode($productDetails);
            $payer = User::find($order->user_id);

            // Create a new payment
            $payment = Payment::create([
                'order_id' => $order->id,
                'name' => $payer->name,
                'payer_email' => $payer->email,
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
                $payment->save();
            }

            // Send the email
            Mail::to($payer->email)->send(new OrderPlaced($order));

            // Clear the user's cart
            Cart::where('user_id', $user_id)->delete();
        });

        return redirect()->route('order.success');
    }
}
