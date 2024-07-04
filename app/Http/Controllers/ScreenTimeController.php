<?php

namespace App\Http\Controllers;

use App\Models\ScreenTime;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class ScreenTimeController extends Controller
{
    public function trackTime(Request $request)
    {
        // dd($request->json()->all());
        $data = $request->json()->all();

        // Assuming you have a ScreenTime model to save the data
        ScreenTime::create([
            'user_id' => Session::get('LoggedIn'), // Assuming you have authentication
            'url' => $data['url'],
            'product_id' => $data['productId'], // Corrected to match the sent data
            'time_spent' => $data['timeSpent']
        ]);

        return response()->json(['status' => 'success']);
    }
}
