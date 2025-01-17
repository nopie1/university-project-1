<?php

namespace App\Http\Livewire\Admin;

use App\Models\User;
use Livewire\Component;

class AdminManageUsers extends Component
{
    public function deleteUser($id){
        $user = User::find($id);
        $user->delete();
        session()->flash('message','User has been deletd successfully');
    }
    public function render()
    {
        $users = User::paginate(5);
        return view('livewire.admin.admin-manage-users',['users'=>$users])->layout('layouts.admin');
    }
}
