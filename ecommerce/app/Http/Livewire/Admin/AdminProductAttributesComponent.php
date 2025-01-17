<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use App\Models\ProductAttribute;
use Illuminate\Support\Facades\Auth;

class AdminProductAttributesComponent extends Component
{
    public function deleteAttribute($attribute_id){
        $pattribute = ProductAttribute::find($attribute_id);
        $pattribute->delete();
        session()->flash('message','Attribute has been deleted successfully!');
    }
    public function render()
    {
        if(Auth::user()->usertype === 'vendor'){
            $pattributes = ProductAttribute::where('shop_id', Auth::user()->shopseller->id)->orderBy('id','DESC')->paginate(5);
        }
        else{
            $pattributes = ProductAttribute::paginate(10);
        }
        return view('livewire.admin.admin-product-attributes-component',['pattributes'=>$pattributes])->layout('layouts.admin');
    }
}
