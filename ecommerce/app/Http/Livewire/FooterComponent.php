<?php

namespace App\Http\Livewire;

use App\Models\Setting;
use Livewire\Component;

class FooterComponent extends Component
{
    public function render()
    {
        $settings = Setting::find(1);
        return view('livewire.footer-component',['settings'=>$settings]);
    }
}
