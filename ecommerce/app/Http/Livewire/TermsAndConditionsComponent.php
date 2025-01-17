<?php

namespace App\Http\Livewire;

use Livewire\Component;

class TermsAndConditionsComponent extends Component
{
    public function render()
    {
        return view('livewire.terms-and-conditions-component')->layout('layouts.home');
    }
}
