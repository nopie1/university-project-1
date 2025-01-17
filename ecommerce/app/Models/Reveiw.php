<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Reveiw extends Model
{
    use HasFactory;
    protected $table = "reveiws";

    public function orderItem(){
        return $this->belongsTo(OrderItem::class);
    }
}
