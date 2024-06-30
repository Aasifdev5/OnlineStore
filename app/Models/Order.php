<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id',
        'full_name',
        'address',
        'city',
        'country',
        'postal_code',
        'total_amount',
    ];

    public function orderItems()
    {
        return $this->hasMany(OrderItem::class);
    }
}
