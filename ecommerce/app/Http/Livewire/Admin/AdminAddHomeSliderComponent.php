<?php

namespace App\Http\Livewire\Admin;

use App\Models\HomeSlider;
use Illuminate\Support\Carbon;
use Livewire\Component;
use Livewire\WithFileUploads;
class AdminAddHomeSliderComponent extends Component
{
    use WithFileUploads;
    public $title;
    public $subtitle;
    public $price;
    public $link;
    public $status;
    public $image;

    public function mount(){
        $this->status = 0;
    }

    public function updated($fields){
        $this->validateOnly($fields,[
            'title' => 'required',
            'subtitle' => 'required',
            'price' => 'required',
            'link' => 'required',
            'status' => 'required',
            'image' => 'required'
        ]);
    }

    public function addSlide(){
        $this->validate([
            'title' => 'required',
            'subtitle' => 'required',
            'price' => 'required',
            'link' => 'required',
            'status' => 'required',
            'image' => 'required'
        ]);

        $slider = new HomeSlider();
        $slider->title = $this->title;
        $slider->subtitle =$this->subtitle;
        $slider->price = $this->price;
        $slider->link = $this->link;
        $slider->status = $this->status;

        $imagename = Carbon::now()->timestamp.'.'. $this->image->extension();
        $this->image->storeAs('sliders',$imagename);
        $slider->image = $imagename;

        $slider->save();
        session()->flash('message','Slide has been created successfully');
    }
    public function render()
    {
        return view('livewire.admin.admin-add-home-slider-component')->layout('layouts.admin');
    }
}
