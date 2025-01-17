<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use App\Models\ShopSeller;
use Illuminate\Support\Facades\Auth;

class AdminManageVendors extends Component
{
    public function deleteShop($id){
        $shop = ShopSeller::find($id);
        $shop->delete();
        session()->flash('message','Shop has been deleted successfully');
    }
    public function render()
    {
        if(Auth::user()->usertype === 'vendor'){
            $vendors = ShopSeller::where('id', Auth::user()->shopseller->id)->orderBy('id','DESC')->paginate(10);
        }
        else{
            $vendors = ShopSeller::paginate(10);
        }
        return view('livewire.admin.admin-manage-vendors',['vendors'=>$vendors])->layout('layouts.admin');
    }
}
