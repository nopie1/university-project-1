<?php

namespace App\Http\Livewire\Admin;

use App\Models\Sale;
use Livewire\Component;

class AdminSaleComponent extends Component
{
    public $status;
    public $sale_date;

    public function mount(){
        $sale = Sale::find(1);
        $this->status = $sale->status;
        $this->sale_date = $sale->sale_date;
    }
    public function updateSale(){
        $sale = Sale::find(1);
        $sale->sale_date = $this->sale_date;
        $sale->status = $this->status;
        $sale->save();
        session()->flash('message', 'Sale Date has been updated successfully');
    }
    public function render()
    {
        return view('livewire.admin.admin-sale-component')->layout('layouts.admin');
    }
}
