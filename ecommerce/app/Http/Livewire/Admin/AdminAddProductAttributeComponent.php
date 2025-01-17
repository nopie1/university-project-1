<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use App\Models\ProductAttribute;
use Illuminate\Support\Facades\Auth;

class AdminAddProductAttributeComponent extends Component
{
    public $name;
    public $shop_id;

    public function updated($fields){
        $this->validateOnly($fields,[
            'name' => 'required',
        ]);
    }
    public function storeAttribute(){
        $this->validate([
            'name' => 'required',
        ]);

        $pattribute = new ProductAttribute();
        $pattribute->name = $this->name;
        if(Auth::user()->usertype === 'vendor'){
            $pattribute->shop_id = Auth::user()->shopseller->id;
        }
        $pattribute->save();
        session()->flash('message','Attribute has been added Successfully!');
    }
    public function render()
    {
        return view('livewire.admin.admin-add-product-attribute-component')->layout('layouts.admin');
    }
}
