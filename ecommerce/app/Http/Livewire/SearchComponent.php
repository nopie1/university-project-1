<?php

namespace App\Http\Livewire;

use App\Models\product;
use Livewire\Component;
use Livewire\WithPagination;
use Cart;
use App\Models\category;

class SearchComponent extends Component
{
    public $sorting;
    public $pageSize;
    public $search;
    public $product_cat;
    public $product_cat_id;

    public $min_price;
    public $max_price;

    public function mount(){
        $this->sorting ="default";
        $this->pageSize = 12;

        $this->min_price = 1;
        $this->max_price = 1000;

        $this->fill(request()->only('search','product_cat','product_cat_id'));
    }

    // add product to cart list
    public function store($product_id, $product_name, $product_price){
        Cart::instance('cart')->add($product_id,$product_name, 1, $product_price)->associate('App\Models\Product');
        session()->flash('success_message', 'Item added to the Cart');
        return redirect()->route('product.cart');
       }
    // add product to wish-list
    public function addToWishlist($product_id, $product_name, $product_price){
        Cart::instance('wishlist')->add($product_id,$product_name, 1, $product_price)->associate('App\Models\Product');
        $this->emitTo('wishlist-count-component','refreshComponent');
    }
    // remove product from wishlist
    public function removeFromWishlist($product_id){
        foreach(Cart::instance('wishlist')->content() as $witem){
            if($witem->id == $product_id){
                Cart::instance('wishlist')->remove($witem->rowId);
                $this->emitTo('wishlist-count-component','refreshComponent');
                return;
            }
        }
    }
    // use WithPagination;
    public function render()
    {
        if($this->sorting == 'date'){
           $products = product::where('name', 'like','%'.$this->search .'%')->where('category_id', 'like', '%'.$this->product_cat_id.'%')->whereBetween('regular_price',[$this->min_price,$this->max_price])->where('status','approved')->orderBy('created_at','DESC')->paginate($this->pageSize);
        }
        else if($this->sorting == 'price'){
            $products = product::where('name', 'like','%'.$this->search .'%')->where('category_id', 'like', '%'.$this->product_cat_id.'%')->whereBetween('regular_price',[$this->min_price,$this->max_price])->where('status','approved')->orderBy('regular_price','ASC')->paginate($this->pageSize);
         }
         else if($this->sorting == 'price-desc'){
            $products = product::where('name', 'like','%'.$this->search .'%')->where('category_id', 'like', '%'.$this->product_cat_id.'%')->whereBetween('regular_price',[$this->min_price,$this->max_price])->where('status','approved')->orderBy('regular_price','DESC')->paginate($this->pageSize);
         }
         else{
            $products = product::where('name', 'like','%'.$this->search .'%')->where('category_id', 'like', '%'.$this->product_cat_id.'%')->whereBetween('regular_price',[$this->min_price,$this->max_price])->where('status','approved')->paginate($this->pageSize);
         }

         $categories = category::all();
         $popular_products = product::inRandomOrder()->where('status','approved')->limit(4)->get();
        return view('livewire.search-component',['products'=>$products, 'categories'=>$categories,'popular_products'=>$popular_products])->layout('layouts.home');
    }
}
