<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use App\Models\product;
use Cartalyst\Stripe\Api\Products;
use Illuminate\Support\Facades\Auth;

class AdminProductComponent extends Component
{
    public $searchTerm;
    public function deleteProduct($id){

        $product = product::find($id);
        if($product->image){
            unlink('assets/images/products'.'/'.$product->image);
        }
        if($product->images){
            $images = explode(",",$product->images);
            foreach($images as $image){
                if($image){
                    unlink('assets/images/products'.'/'.$image);
                }
            }
        }
        $product->delete();
        Session()->flash('message', 'Product has been deleted Successfully');
    }
    public function updateProductStatus($id,$status){
        $product = product::find($id);
        $product->status = $status;
        if($status == "approved"){
            $product->status = "approved";
            $message = 'Product has been APPROVED successfully!';
        }
        elseif($status == "rejected"){
            $product->status = "rejected";
            $message = 'Product has been REJECTED successfully!';
        }
        $product->save();
        session()->flash('message',$message);

    }
    public function render()
    {
            $search = '%'. $this->searchTerm . '%';
            $products = product::where('name','LIKE',$search)
                                    ->orwhere('stock_status','LIKE',$search)
                                    ->orwhere('regular_price','LIKE',$search)
                                    ->orwhere('sale_price','LIKE',$search)
                                    ->orderBy('id','DESC')->paginate(10);

            if(Auth::user()->usertype === 'vendor'){
                $products = product::where('shop_id', Auth::user()->shopseller->id)
                                        ->where(function($query) use ($search){
                                        return $query
                                        ->where('name','LIKE',$search)
                                        ->orwhere('stock_status','LIKE',$search)
                                        ->orwhere('regular_price','LIKE',$search)
                                        ->orwhere('sale_price','LIKE',$search);
                                        })->orderBy('id','DESC')->paginate(10);
            }
        return view('livewire.admin.admin-product-component',['products'=>$products])->layout('layouts.admin');
    }
}
