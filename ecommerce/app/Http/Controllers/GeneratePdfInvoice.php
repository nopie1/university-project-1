<?php

namespace App\Http\Controllers;
use PDF;
use App\Models\Order;
use Illuminate\Http\Request;

class GeneratePdfInvoice extends Controller
{
    public function invoice($order_id){
        if(Order::where('id',$order_id)->exists()){
            $order = Order::find($order_id);
            $data = [
                'order' => $order,
            ];
            $pdf = app('dompdf.wrapper');
            $pdf->loadView('livewire.admin.admin-generate-invoice', $data);
            return  $pdf->stream('invoice.pdf');
        }
    }
}
