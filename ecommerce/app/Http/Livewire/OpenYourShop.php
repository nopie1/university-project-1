<?php

namespace App\Http\Livewire;

use App\Models\Commision;
use App\Models\ShopSeller;
use Exception;
use Stripe;
use Livewire\Component;
use Illuminate\Support\Facades\Auth;

class OpenYourShop extends Component
{
    // shop information
    public $name;
    public $description;
    public $commision_id;

    // pay with card properties
    public $card_no;
    public $exp_month;
    public $exp_year;
    public $cvc;


    public function registerShop(){
        $shop = new ShopSeller();
        if(Auth::user()){
            $shop->user_id = Auth::user()->id;
            $shop->name = $this->name;
            $shop->description = $this->description;
            $shop->save();
        }
            // commission transaction through stripe
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
                      }

                      $customer = $stripe->customers()->create([
                          'name' => $this->name,
                          'description' => $this->description,
                          'source' => $token['id']
                      ]);
                      $charge = $stripe->charges()->create([
                          'customer' => $customer['id'],
                          'currency' => 'USD',
                          'amount' => 500,
                          'description' => 'payment for commission no' . $shop->id
                      ]);

                      if($charge['status'] == 'succeeded'){
                          $this->makeCommsioin('approved');
                      }
                      else{
                          session()->flash('stripe_error', 'Error in Transaction');
                      }
                }
                catch(Exception $e){
                  session()->flash('stripe_error',$e->getMessage());
                  $this->thankyou =0;
                }
        session()->flash('message','You registered as seller successfully! wait to activate your shop');
    }

    public function makeCommsioin($status){
        $commision = new Commision();
        $commision->user_id = Auth::user()->id;
        $commision->status = $status;
        $commision->save();
    }
    public function render()
    {
        return view('livewire.open-your-shop')->layout('layouts.home');
    }
}
