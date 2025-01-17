<?php

namespace App\Http\Livewire;

use App\Models\product;
use Livewire\Component;
use Livewire\WithPagination;
use Cart;
use App\Models\category;
use App\Models\subcategory;
use Illuminate\Support\Facades\Auth;

class CategoryComponent extends Component
{
    public $sorting;
    public $pageSize;
    public $category_slug;
    public $scategory_slug;

    public $min_price;
    public $max_price;

    public function mount($category_slug, $scategory_slug=null){
        $this->sorting ="default";
        $this->pageSize = 12;
        $this->category_slug = $category_slug;
        $this->scategory_slug = $scategory_slug;

        $this->min_price = 1;
        $this->max_price = 1000;
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
        $category_id = null;
        $category_name = "";
        $filter = "";

        if($this->scategory_slug){
            $scategory = subcategory::where('slug',$this->scategory_slug)->first();
            $category_id = $scategory->id;
            $category_name = $scategory->name;
            $filter = "sub";
        }
        else{
            $category = category::where('slug',$this->category_slug)->first();
            $category_id = $category->id;
            $category_name = $category->name;
            $filter = "";
        }


        if($this->sorting == 'date'){
            $products = product::whereBetween('regular_price',[$this->min_price,$this->max_price])->where($filter.'category_id',$category_id)->where('status','approved')->orderBy('created_at','DESC')->paginate($this->pageSize);
         }
         else if($this->sorting == 'price'){
             $products = product::whereBetween('regular_price',[$this->min_price,$this->max_price])->where($filter.'category_id',$category_id)->where('status','approved')->orderBy('regular_price','ASC')->paginate($this->pageSize);
          }
          else if($this->sorting == 'price-desc'){
             $products = product::whereBetween('regular_price',[$this->min_price,$this->max_price])->where($filter.'category_id',$category_id)->where('status','approved')->orderBy('regular_price','DESC')->paginate($this->pageSize);
          }
          else{
             $products = product::whereBetween('regular_price',[$this->min_price,$this->max_price])->where($filter.'category_id',$category_id)->where('status','approved')->paginate($this->pageSize);
          }

         $categories = category::all();

         if(Auth::check()){
            Cart::instance('cart')->store(Auth::user()->email);
            Cart::instance('wishlist')->store(Auth::user()->email);
        }
         $popular_products = product::inRandomOrder()->limit(4)->where('status','approved')->get();
        return view('livewire.category-component',['products'=>$products, 'categories'=>$categories, 'category_name'=>$category_name,'popular_products'=>$popular_products])->layout('layouts.home');
    }
}
