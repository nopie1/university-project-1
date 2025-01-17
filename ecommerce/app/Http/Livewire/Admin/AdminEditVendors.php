<?php

namespace App\Http\Livewire\Admin;

use App\Models\User;
use Livewire\Component;
use App\Models\ShopSeller;
use Illuminate\Support\Facades\Auth;

class AdminEditVendors extends Component
{
    public $v_name;
    public $email;
    public $name;
    public $description;
    public $is_active;
    public $vendor_id;
    public $user_id;

    public function mount($vendor_id){
        $vendor = ShopSeller::find($vendor_id);
        $this->v_name = $vendor->owner->name;
        $this->email = $vendor->owner->email;
        $this->name = $vendor->name;
        $this->description = $vendor->description;
        $this->is_active = $vendor->is_active;
        $this->vendor_id = $vendor->id;
        $this->user_id = $vendor->user_id;
    }
    public function updated($fields){
        $this->validateOnly($fields, [
            'v_name'=>'required',
            'email'=>'required',
            'name'=>'required',
            'description'=>'required',
            'is_active'=>'required'
        ]);
    }
    public function updateShops(){
        $this->validate([
            'v_name'=>'required',
            'email'=>'required',
            'name'=>'required',
            'description'=>'required',
            'is_active'=>'required'
        ]);
     $user = User::find($this->user_id);
     $user->name = $this->v_name;
     $user->email = $this->email;
     $user->save();
     $vendor = ShopSeller::find($this->vendor_id);
     $vendor->name = $this->name;
     $vendor->description = $this->description;
     $vendor->is_active = $this->is_active;
     $vendor->save();
     session()->flash('message', 'vendor has been updated successfully');
    }
    public function render()
    {
        return view('livewire.admin.admin-edit-vendors')->layout('layouts.admin');
    }
}
