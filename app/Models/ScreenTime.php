<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ScreenTime extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'url',
        'time_spent'
    ];
}
