<?php

namespace App\Http\Livewire\Admin;

use App\Models\Order;
use App\Models\OrderItem;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Livewire\Component;

class AdminOrderComponent extends Component
{
    public function updateOrderStatus($order_id, $status)
    {
        $order = Order::find($order_id);
        $isAuthorized = Auth::user()->usertype === 'ADM' ||
            (Auth::user()->usertype === 'vendor' &&
             OrderItem::where('order_id', $order_id)
                      ->where('shop_id', Auth::user()->shopseller->id)
                      ->exists());

        if ($isAuthorized) {
            $order->status = $status;

            if ($status == "delivered") {
                $order->delivered_date = DB::raw('CURRENT_DATE');
            } elseif ($status == "canceled") {
                $order->canceled_date = DB::raw('CURRENT_DATE');
            }

            $order->save();
            session()->flash('order_message', 'Order status has been updated successfully!');
        } else {
            session()->flash('order_message', 'You do not have permission to update this order.');
        }
    }

    public function render()
    {
        if (Auth::user()->usertype === 'vendor') {
            $orders = OrderItem::with('order')
                ->where('shop_id', Auth::user()->shopseller->id)
                ->orderBy('created_at', 'DESC')
                ->paginate(12);
        } else {
            $orders = Order::orderBy('created_at', 'DESC')->paginate(12);
        }

        return view('livewire.admin.admin-order-component', ['orders' => $orders])->layout('layouts.admin');
    }
}