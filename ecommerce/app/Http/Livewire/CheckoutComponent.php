<?php

namespace App\Http\Livewire;

use App\Mail\OrderMail;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\product;
use App\Models\Shipping;
use App\Models\ShopSeller;
use App\Models\Transaction;
use App\Models\User;
use App\Providers\RouteServiceProvider;
use Cart;
use Exception;
use Stripe;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Livewire\Component;

class CheckoutComponent extends Component
{
    public $ship_to_different;

    // billing address properties
    public $firstname;
    public $lastname;
    public $email;
    public $mobile;
    public $line1;
    public $line2;
    public $city;
    public $province;
    public $country;
    public $zipcode;

    // send order to it's vendor
    public $shop_id;

    // billing address properties
    public $s_firstname;
    public $s_lastname;
    public $s_email;
    public $s_mobile;
    public $s_line1;
    public $s_line2;
    public $s_city;
    public $s_province;
    public $s_country;
    public $s_zipcode;

    public $paymentmode;

    public $thankyou;

    // pay with card properties
    public $card_no;
    public $exp_month;
    public $exp_year;
    public $cvc;

    public function updated($fields){
        // validation for billing address
        $this->validateOnly($fields,[
            'lastname' => 'required',
            'mobile' => 'required|numeric',
            'line1' => 'required',
            'city' => 'required',
            'province' => 'required',
            'country' => 'required',
            'zipcode' => 'required',
            'paymentmode' => 'required'
        ]);
       // validation for shiping address
        if($this->ship_to_different){
            $this->validateOnly($fields,[
                's_firstname' => 'required',
                's_lastname' => 'required',
                's_email' => 'required|email',
                's_mobile' => 'required|numeric',
                's_line1' => 'required',
                's_city' => 'required',
                's_province' => 'required',
                's_country' => 'required',
                's_zipcode' => 'required'
            ]);
            // validation for pay with card
            if($this->paymentmode == 'card'){
                $this->validateOnly($fields,[
                    'card_no' => 'required|numeric',
                    'exp_month' => 'required|numeric',
                    'exp_year' => 'required|numeric',
                    'cvc'  => 'required|numeric',
                ]);
            }
        }
    }
    public function placeOrder(){
        $this->validate([
            'lastname' => 'required',
            'mobile' => 'required|numeric',
            'line1' => 'required',
            'city' => 'required',
            'province' => 'required',
            'country' => 'required',
            'zipcode' => 'required',
            'paymentmode' => 'required'
        ]);
        if($this->paymentmode == 'card'){
            $this->validate([
                'card_no' => 'required|numeric',
                'exp_month' => 'required|numeric',
                'exp_year' => 'required|numeric',
                'cvc'  => 'required|numeric',
            ]);
        }
         //store order details
        $order = new Order();
        $order->user_id = Auth::user()->id;
        $order->subtotal = session()->get('checkout')['subtotal'];
        $order->discount = session()->get('checkout')['discount'];
        $order->tax = session()->get('checkout')['tax'];
        $order->total = session()->get('checkout')['total'];
        $order->firstname = Auth::user()->name;
        $order->lastname = $this->lastname;
        $order->email = Auth::user()->email;
        $order->mobile = $this->mobile;
        $order->line1 = $this->line1;
        $order->line2 = $this->line2;
        $order->city = $this->city;
        $order->province = $this->province;
        $order->country = $this->country;
        $order->zipcode = $this->zipcode;
        $order->status = 'ordered';
        $order->is_shipping_different = $this->ship_to_different ? 1:0;
        $order->save();

          //store orderItem details
        foreach(Cart::instance('cart')->content() as $item){
            $orderItem = new OrderItem();
            $orderItem->product_id = $item->id;
            $orderItem->order_id =$order->id;
            $shop = product::find($item->id);
            $orderItem->shop_id = $shop->shop_id;
            $orderItem->price = $item->price;
            $orderItem->quantity = $item->qty;
            if($item->options){
                $orderItem->options = serialize($item->options);
            }
            $orderItem->save();
        }

        if($this->ship_to_different){
            $this->validate([
                's_firstname' => 'required',
                's_lastname' => 'required',
                's_email' => 'required|email',
                's_mobile' => 'required|numeric',
                's_line1' => 'required',
                's_city' => 'required',
                's_province' => 'required',
                's_country' => 'required',
                's_zipcode' => 'required'
            ]);
            //store Shipping details
            $shipping = new Shipping();
            $shipping->order_id = $order->id;
            $shipping->firstname = $this->s_firstname;
            $shipping->lastname = $this->s_lastname;
            $shipping->email = $this->s_email;
            $shipping->mobile = $this->s_mobile;
            $shipping->line1 = $this->s_line1;
            $shipping->line2 = $this->s_line2;
            $shipping->city = $this->s_city;
            $shipping->province = $this->s_province;
            $shipping->country = $this->s_country;
            $shipping->zipcode = $this->s_zipcode;
            $shipping->save();
        }
            //store transaction details
        if($this->paymentmode == 'cod'){
            $this->makeTransaction($order->id, 'pending');
            $this->resetCart();
        }
        else if($this->paymentmode == 'card'){
          $stripe = Stripe::make(env('STRIPE_KEY'));
          try{
              $token = $stripe->tokens()->create([
                  'card'=>[
                      'number' => $this->card_no,
                      'exp_month' => $this->exp_month,
                      'exp_year' => $this->exp_year,
                      'cvc' => $this->cvc
                  ]
                ]);

                if(!isset($token['id'])){
                    session()->flash('stripe_error','The Stripe token was generated correctlly!');
                    $this->thankyou = 0;
                }

                $customer = $stripe->customers()->create([
                    'name' => $this->firstname . '.' . $this->lastname,
                    'email' => $this->email,
                    'phone' => $this->mobile,
                    'address' => [
                        'line1' => $this->line1,
                        'postal_code' => $this->zipcode,
                        'city' => $this->city,
                        'state' => $this->province,
                        'country' => $this->country
                    ],
                    'shipping' => [
                        'name' => $this->firstname . '.' . $this->lastname,
                        'address' => [
                            'line1' => $this->line1,
                            'postal_code' => $this->zipcode,
                            'city' => $this->city,
                            'state' => $this->province,
                            'country' => $this->country
                        ],
                    ],
                    'source' => $token['id']
                ]);
                $charge = $stripe->charges()->create([
                    'customer' => $customer['id'],
                    'currency' => 'USD',
                    'amount' => session()->get('checkout')['total'],
                    'description' => 'payment for order no' . $order->id
                ]);

                if($charge['status'] == 'succeeded'){
                    $this->makeTransaction($order->id, 'approved');
                    $this->resetCart();
                }
                else{
                    session()->flash('stripe_error', 'Error in Transaction');
                    $this->thankyou = 0;
                }
          }
          catch(Exception $e){
            session()->flash('stripe_error',$e->getMessage());
            $this->thankyou =0;
          }

        }
        $this->sendOrderConfirmationMail($order);

    }
    public function resetCart(){
        $this->thankyou = 1;
        Cart::instance('cart')->destroy();
        session()->forget('checkout');
    }

    public function makeTransaction($order_id, $status){
        $transaction = new Transaction();
        $transaction->user_id = Auth::user()->id;
        $transaction->order_id = $order_id;
        $transaction->mode = $this->paymentmode;
        $transaction->status = $status;
        $transaction->save();
    }

    // send mail after order placed
    public function sendOrderConfirmationMail($order){
        Mail::to($order->email)->send(new OrderMail($order));
    }
    //verify for checkout if user-loggedin or user-cart is empty
    public function verifyForCheckout(){
        if(!Auth::check()){
             return redirect()->route('login');
        }
        else if($this->thankyou){
            return redirect()->route('thankyou');
        }
        else if(!session()->get('checkout')){
            return redirect()->route('product.cart');
        }

    }
    public function render()
    {
        $this->verifyForCheckout();
        return view('livewire.checkout-component')->layout('layouts.home');
    }
}
