<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ScreenTime;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
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
    public function index()
    {
        if (Session::has('LoggedIn')) {

            $user_session = User::where('id', Session::get('LoggedIn'))->first();

            $trackedTimes = ScreenTime::with(['product', 'user'])
                ->join('users', 'screen_times.user_id', '=', 'users.id')
                ->select(
                    'screen_times.product_id',
                    'screen_times.user_id',
                    DB::raw('SUM(screen_times.time_spent) as total_time_spent'),
                    'screen_times.url' // Include the 'url' field
                )
                ->where('users.is_super_admin', 0)
                ->groupBy('screen_times.product_id', 'screen_times.user_id', 'screen_times.url') // Group by 'url' if necessary
                ->orderBy('screen_times.created_at', 'desc')
                ->get();

            $title = 'Track Time Of Products';
            return view('admin.backend.index', compact('trackedTimes', 'title', 'user_session'));
        } else {
            return Redirect()->with('fail', 'You have to login first');
        }
    }
}
