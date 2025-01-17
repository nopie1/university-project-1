<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductAttribute extends Model
{
    use HasFactory;

    public function attributeValues(){
        return $this->hasMany(AttributeValue::class);
    }

    public function shop(){
        return $this->belongsTo(ShopSeller::class,'shop_id');
    }
}
