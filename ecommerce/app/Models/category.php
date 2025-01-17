<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class category extends Model
{
    use HasFactory;
    protected $table = "categories";

    public function subcategories(){
        return $this->hasMany(subcategory::class,'category_id');
    }
    public function shop(){
        return $this->belongsTo(ShopSeller::class, 'shop_id');
    }
}
