<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ScreenTime;
use App\Models\TimeLog;
use Illuminate\Support\Collection;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class ScreenTimeController extends Controller
{
   public function showAllUsersTimeSpent(Request $request)
{
    if (Session::has('LoggedIn')) {
        $user_session = User::where('id', Session::get('LoggedIn'))->first();

        // Fetch users where is_super_admin is 0
        $users = User::where('is_super_admin', 0)->get();

        // Initialize an empty array to store user time spent data
        $usersTimeSpent = new Collection();

        // Iterate through each user to calculate time spent per day, week, and total
        foreach ($users as $user) {
            $userId = $user->id;

            // Calculate time spent per day, week, and total for the current user
            $timeSpentToday = $this->timeSpentPerDay($userId);
            $timeSpentThisWeek = $this->timeSpentPerWeek($userId);
            $timeSpentTotal = $this->timeSpentTotal($userId);

            // Parse last_seen as Carbon instance
            $lastSeen = $user->last_seen ? Carbon::parse($user->last_seen)->format('d-m-Y H:i:s') : 'Never';

            // Add user data to the collection
            $usersTimeSpent->push([
                'user' => $user,
                'timeSpentToday' => gmdate('H:i:s', $timeSpentToday),
                'timeSpentThisWeek' => gmdate('H:i:s', $timeSpentThisWeek),
                'timeSpentTotal' => gmdate('H:i:s', $timeSpentTotal),
                'lastSeen' => $lastSeen
            ]);
        }

        // Pass data to the view
        return view('admin.backend.all-users-time-spent', [
            'usersTimeSpent' => $usersTimeSpent,
        ], compact('user_session')); 

    } else {
        return Redirect()->with('fail', 'You have to login first');
    }
}

private function timeSpentPerDay($userId)
{
    // Calculate time spent today using UTC
    $today = Carbon::today('UTC');
    $timeLogsToday = TimeLog::where('user_id', $userId)
        ->whereDate('start_time', $today)
        ->get();

    $totalTimeToday = $timeLogsToday->sum(function ($log) {
        return $log->end_time ? $log->start_time->diffInSeconds($log->end_time) : 0;
    });

    return $totalTimeToday; // Return total time spent in seconds for today
}

private function timeSpentPerWeek($userId)
{
    // Calculate time spent this week using UTC
    $startOfWeek = Carbon::now('UTC')->startOfWeek();
    $endOfWeek = Carbon::now('UTC')->endOfWeek();
    $timeLogsWeek = TimeLog::where('user_id', $userId)
        ->whereBetween('start_time', [$startOfWeek, $endOfWeek])
        ->get();

    $totalTimeWeek = $timeLogsWeek->sum(function ($log) {
        return $log->end_time ? $log->start_time->diffInSeconds($log->end_time) : 0;
    });

    return $totalTimeWeek; // Return total time spent in seconds for this week
}

private function timeSpentTotal($userId)
{
    // Calculate total time spent using UTC
    $timeLogsTotal = TimeLog::where('user_id', $userId)->get();

    $totalTime = $timeLogsTotal->sum(function ($log) {
        return $log->end_time ? $log->start_time->diffInSeconds($log->end_time) : 0;
    });

    return $totalTime; // Return total time spent in seconds
}
}
