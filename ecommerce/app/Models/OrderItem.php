<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderItem extends Model
{
    use HasFactory;
    protected $table = "order_items";

    public function order(){
        return $this->belongsTo(Order::class);
    }

    public function product(){
        return $this->belongsTo(product::class);
    }
    public function review(){
        return $this->hasOne(Reveiw::class,'order_item_id');
    }
    public function shop(){
        return $this->belongsTo(ShopSeller::class, 'shop_id');
    }
}
