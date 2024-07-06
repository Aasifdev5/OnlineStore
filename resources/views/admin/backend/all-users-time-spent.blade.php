@extends('admin.Master')
@section('title')
    All Users Time Spent
@endsection
@section('content')
<div class="page-body">
    <br>
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h1>All Users Time Spent on Platform</h1>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table id="advance-1" class="table table-striped">
                       <thead>
            <tr>
                <th>User Name</th>
                <th>Time Spent Today</th>
                <th>Time Spent This Week</th>
            </tr>
        </thead>
        <tbody>
            @foreach($usersTimeSpent as $userData)
                <tr>
                    <td>{{ $userData['user']->name }}</td>
                    <td>{{ $userData['timeSpentToday'] }}</td>
                    <td>{{ $userData['timeSpentThisWeek'] }}</td>
                </tr>
            @endforeach
        </tbody>
                    </table>
                </div>

            </div>
        </div>



    </div>
</div>

@endsection


