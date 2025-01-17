<?php

namespace App\Http\Livewire\Admin;

use Carbon\Carbon;
use App\Models\Order;
use Livewire\Component;
use App\Models\OrderItem;
use Illuminate\Support\Facades\Auth;

class AdminComponent extends Component
{
    public function render()
    {
        if(Auth::user()->usertype === 'vendor'){
            $orders = OrderItem::where('shop_id',Auth::user()->shopseller->id)->orderBy('created_at','DESC')->paginate(12);
            $totalSales = Order::where('status','delivered')->count();
            $totalRevenue = Order::where('status','delivered')->sum('total');
            $todaySales = Order::where('status','delivered')->whereDate('created_at',Carbon::today())->count();
            $todayRevenue = Order::where('status','delivered')->whereDate('created_at',Carbon::today())->sum('total');
        }
        else{
            $orders = Order::orderBy('created_at','DESC')->paginate(12);
            $totalSales = Order::where('status','delivered')->count();
            $totalRevenue = Order::where('status','delivered')->sum('total');
            $todaySales = Order::where('status','delivered')->whereDate('created_at',Carbon::today())->count();
            $todayRevenue = Order::where('status','delivered')->whereDate('created_at',Carbon::today())->sum('total');
        }
        return view('livewire.admin.admin-component',['orders'=>$orders,'totalSales'=>$totalSales,'totalRevenue'=>$totalRevenue,'todaySales'=>$todaySales,'todayRevenue'=>$todayRevenue])->layout('layouts.admin');
    }
}
