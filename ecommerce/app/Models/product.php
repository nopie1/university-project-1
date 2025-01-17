<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class product extends Model
{
    use HasFactory;
    protected $table = "products";

    public function category(){
        return $this->belongsTo(category::class,'category_id');
    }
    public function orderItems(){
        return $this->hasMany(OrderItem::class,'product_id');
    }

    public function subcategories(){
        return $this->belongsTo(subcategory::class,'subcategory_id');
    }

    public function attributeValues(){
        return $this->hasMany(AttributeValue::class,'product_id');
    }

    public function shop(){
        return $this->belongsTo(ShopSeller::class, 'shop_id');
    }
}
