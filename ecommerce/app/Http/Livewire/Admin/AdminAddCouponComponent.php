<?php

namespace App\Http\Livewire\Admin;

use App\Models\Coupon;
use Livewire\Component;
use Illuminate\Support\Facades\Auth;

class AdminAddCouponComponent extends Component
{
    public $code;
    public $type;
    public $value;
    public $cart_value;
    public $expiry_date;
    public $shop_id;

    public function updated($fields){
        $this->validateOnly($fields, [
            'code'=>'required|unique:coupons',
            'type'=>'required',
            'value'=>'required|numeric',
            'cart_value'=>'required|numeric',
            'expiry_date'=>'required'
        ]);
    }
    public function storeCoupon(){
        $this->validate([
            'code'=>'required|unique:coupons',
            'type'=>'required',
            'value'=>'required|numeric',
            'cart_value'=>'required|numeric',
            'expiry_date'=>'required'
        ]);
     $coupon = new Coupon();
     $coupon->code = $this->code;
     $coupon->type = $this->type;
     $coupon->value = $this->value;
     $coupon->cart_value = $this->cart_value;
     $coupon->expiry_date = $this->expiry_date;
     if(Auth::user()->usertype === 'vendor'){
        $coupon->shop_id = Auth::user()->shopseller->id;
    }
     $coupon->save();
     session()->flash('message', 'Coupon has been added successfully');
    }
    public function render()
    {
        return view('livewire.admin.admin-add-coupon-component')->layout('layouts.admin');
    }
}
