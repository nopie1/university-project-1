<?php

namespace App\Http\Livewire\Admin;

use App\Models\category;
use App\Models\HomeCategory;
use Livewire\Component;

class AdminHomeCategoriesComponent extends Component
{
    public $selected_categories = [];
    public $numberofproducts;

    public function mount(){
        $category = HomeCategory::find(1);
        $this->selected_categories = explode(',',$category->sel_categories);
        $this->numberofproducts = $category->no_of_products;
    }

    public function updateHomeCategory(){
        $category = HomeCategory::find(1);
        $category->sel_categories = implode(',',$this->selected_categories);
        $category->no_of_products = $this->numberofproducts;
        $category->save();
        session()->flash('message', 'Home Category has been updated successfully');
    }
    public function render()
    {
        $categories = category::all();
        return view('livewire.admin.admin-home-categories-component',['categories'=>$categories])->layout('layouts.admin');
    }
}
