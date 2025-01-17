<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use App\Models\category;
use App\Models\subcategory;
use Illuminate\Support\Facades\Auth;

class AdminCategoryComponent extends Component
{
    public function deleteCategory($id){
        $category = category::find($id);
        $category->delete();
        session()->flash('message','One category has been deleted Successfully!');
    }

    public function deleteSubcategory($id){
        $scategory = subcategory::find($id);
        $scategory->delete();
        session()->flash('message','subcategory has been deleted Successfully!');
    }
    public function render()
    {
        $categoires = category::paginate(5);
        return view('livewire.admin.admin-category-component',['categories'=>$categoires])->layout('layouts.admin');
    }
}
