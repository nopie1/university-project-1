<?php

namespace App\Http\Livewire\Admin;

use App\Models\User;
use Livewire\Component;

class AdminEditUsers extends Component
{
    public $name;
    public $email;
    public $usertype;
    public $user_id;

    public function mount($user_id){
        $user = User::find($user_id);
        $this->name = $user->name;
        $this->email = $user->email;
        $this->usertype = $user->usertype;
        $this->user_id = $user->id;
    }
    public function updated($fields){
        $this->validateOnly($fields,[
            'name'=>'required',
            'email'=>'required',
            'usertype'=>'required',
        ]);
    }
    public function updateUsers(){
        $this->validate([
            'name'=>'required',
            'email'=>'required',
            'usertype'=>'required',
        ]);

        $user = User::find($this->user_id);
            $user->name = $this->name;
            $user->email = $this->email;
            $user->usertype = $this->usertype;
            $user->save();
            session()->flash('message','User data has been updated successfully');
    }
    public function render()
    {
        return view('livewire.admin.admin-edit-users')->layout('layouts.admin');
    }
}
