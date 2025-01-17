<?php

namespace App\Http\Livewire;

use Cart;
use App\Models\Sale;
use App\Models\Coupon;
use App\Models\product;
use Livewire\Component;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;

class CartComponent extends Component
{
    public $haveCode;
    public $couponCode;
    public $discount;
    public $subtotalAfterDiscount;
    public $taxAfterDiscount;
    public $totalAfterDiscount;

      // increasing cart quantity
      public function increaseQuantity($rowId){
        $product = Cart::instance('cart')->get($rowId);
        $qty = $product->qty + 1;
        Cart::instance('cart')->update($rowId,$qty);
        $this->emitTo('cart-count-component','refreshComponent');
    }
      // decreasing cart quantity
    public function decreaseQuantity($rowId){
        $product = Cart::instance('cart')->get($rowId);
        $qty = $product->qty - 1;
        Cart::instance('cart')->update($rowId,$qty);
        $this->emitTo('cart-count-component','refreshComponent');
    }
    //deleting item form the cart
    public function destroy($rowId){
        Cart::instance('cart')->remove($rowId);
        $this->emitTo('cart-count-component','refreshComponent');
        Session()->flash('success_message', 'Item has been removed');
    }
    // deleting all items form cart
    public function destroyAll(){
        Cart::instance('cart')->destroy();
        $this->emitTo('cart-count-component','refreshComponent');
        Session()->flash('success_message', 'All Items has been removed');
    }
    // swith item to the save Later
    public function switchSaveLater($rowId){
        $item = Cart::instance('cart')->get($rowId);
        Cart::instance('cart')->remove($rowId);
        Cart::instance('saveForLater')->add($item->id,$item->name,1,$item->price)->associate('App\Models\Product');
        $this->emitTo('cart-count-component','refreshComponent');
        Session()->flash('success_message', 'item added to Save For Later');
    }
    // move item from save later to cart
    public function moveToCart($rowId){
        $item = Cart::instance('saveForLater')->get($rowId);
        Cart::instance('saveForLater')->remove($rowId);
        Cart::instance('cart')->add($item->id,$item->name,1,$item->price)->associate('App\Models\Product');
        $this->emitTo('cart-count-component','refreshComponent');
        Session()->flash('s_success_message', 'item added to the Cart');
    }
    // delete item from save later
    public function deleteFromSaveLater($rowId){
        Cart::instance('saveForLater')->remove($rowId);
        Session()->flash('s_success_message', 'item Deleted From Saved Later');
    }
    // Apply coupon Code
    public function applyCouponCode(){
        $coupon = Coupon::where('code',$this->couponCode)->where('expiry_date','>=',Carbon::today())->where('cart_value','<=',Cart::instance('cart')->subtotal())->first();
        if(!$coupon){
            session()->flash('coupon_message','Coupon is invalid');
            return;
        }
        session()->put('coupon',[
            'code' => $coupon->code,
            'type' => $coupon->type,
            'value' => $coupon->value,
            'cart_value' => $coupon->cart_value
        ]);

    }
    // Discount calculating after discount
    public function calculateAfterDicount(){
        if(session()->has('coupon')){
            if(session()->get('coupon')['type'] == 'fixed'){
                $this->discount = session()->get('coupon')['value'];
            }
            else{
                $this->discount = (Cart::instance('cart')->subtotal() * session()->get('coupon')['value'])/100;
            }
            $this->subtotalAfterDiscount = Cart::instance('cart')->subtotal() - $this->discount;
            $this->taxAfterDiscount = ($this->subtotalAfterDiscount * config('cart.tax'))/100;
            $this->totalAfterDiscount = $this->subtotalAfterDiscount + $this->taxAfterDiscount;
        }
    }
    //remove coupon code
    public function removeCoupon(){
        session()->forget('coupon');
    }
    //access checkout if user is logged-in
    public function checkout(){
        if(Auth::check()){
            return redirect()->route('checkout');
        }
        else{
            return redirect()->route('login');
        }
    }
    // set amount for the checkout
    public function setAmountForCheckout(){
        if(!Cart::instance('cart')->count() > 0){
            session()->forget('checkout');
            return;
        }
        if(session()->has('coupon')){
            session()->put('checkout',[
                'discount' =>$this->discount,
                'subtotal' =>$this->subtotalAfterDiscount,
                'tax' =>$this->taxAfterDiscount,
                'total' =>$this->totalAfterDiscount
            ]);
        }
        else{
            session()->put('checkout',[
                'discount' => 0,
                'subtotal' =>Cart::instance('cart')->subtotal(),
                'tax' =>Cart::instance('cart')->tax(),
                'total' =>Cart::instance('cart')->total()
            ]);
        }
    }
    public function render()
    {
        if(session()->has('coupon')){
            if(Cart::instance('cart')->subtotal() < session()->get('coupon')['cart_value']){
                session()->forget('coupon');
            }
            else{
                $this->calculateAfterDicount();
            }
        }
        $this->setAmountForCheckout();

        if(Auth::check()){
            Cart::instance('cart')->store(Auth::user()->email);
            Cart::instance('wishlist')->store(Auth::user()->email);
        }
        $sale = Sale::find(1);
        $popular_products = product::inRandomOrder()->limit(4)->where('status','approved')->get();
        return view('livewire.cart-component',['popular_products'=>$popular_products,'sale'=>$sale])->layout('layouts.home');
    }
}
