<?php

namespace App\Http\Livewire\Admin;

use App\Models\Coupon;
use Livewire\Component;
use Illuminate\Support\Facades\Auth;

class AdminCouponsComponent extends Component
{
    public function deletecoupon($coupon_id){
        $coupon = Coupon::find($coupon_id);
        $coupon->delete();
        session()->flash('message', 'Coupon has been deleted successfully!');
    }
    public function render()
    {
        if(Auth::user()->usertype === 'vendor'){
            $coupons = Coupon::where('shop_id', Auth::user()->shopseller->id)->get();
        }
        else{
            $coupons = Coupon::all();
        }

        return view('livewire.admin.admin-coupons-component',['coupons'=>$coupons])->layout('layouts.admin');
    }
}
