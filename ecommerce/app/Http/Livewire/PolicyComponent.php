<?php

namespace App\Http\Livewire;

use Livewire\Component;

class PolicyComponent extends Component
{
    public function render()
    {
        return view('livewire.policy-component')->layout('layouts.home');
    }
}
