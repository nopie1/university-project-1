<?php

namespace App\Http\Livewire;

use App\Models\product;
use App\Models\Sale;
use Livewire\Component;
use Cart;
class DetailsComponent extends Component
{
    public $slug;
    public $qty;
    public $sattr = [];


    public function mount($slug){
        $this->slug = $slug;
        $this->qty =1;
    }
    public function store($product_id, $product_name, $product_price){
        Cart::instance('cart')->add($product_id,$product_name, $this->qty, $product_price,$this->sattr)->associate('App\Models\Product');
        session()->flash('success_message', 'Item added to the Cart');
        return redirect()->route('product.cart');
    }
    public function increaseQuantity(){
        $product = product::where('slug',$this->slug)->where('status','approved')->first();
        if( $this->qty < $product->quantity){
        $this->qty++;
        }
    }
    public function decreaseQuantity(){
        if($this->qty > 1){
            $this->qty--;
        }
    }

    // add product to wish-list
    public function addToWishlist($product_id, $product_name, $product_price){
        Cart::instance('wishlist')->add($product_id,$product_name, 1, $product_price)->associate('App\Models\Product');
        $this->emitTo('wishlist-count-component','refreshComponent');

        session()->flash('message','Product has been added to the wishlist');
    }

    public function render()
    {
        $product = product::where('slug',$this->slug)->where('status','approved')->first();
        $popular_products = product::inRandomOrder()->limit(4)->where('status','approved')->get();
        $related_products = product::where('category_id',$product->category_id)->inRandomOrder()->limit(5)->where('status','approved')->get();
        $sale = Sale::find(1);
        return view('livewire.details-component',['product'=>$product, 'popular_products'=>$popular_products, 'related_products'=>$related_products,'sale'=>$sale])->layout('layouts.home');
    }
}
