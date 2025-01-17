<?php

namespace App\Observers;

use App\Models\User;
use App\Models\ShopSeller;
use App\Mail\ShopActivatedMail;
use Illuminate\Support\Facades\Mail;

class ShopObserver
{
    /**
     * Handle the ShopSeller "created" event.
     *
     * @param  \App\Models\ShopSeller  $shopSeller
     * @return void
     */
    public function created(ShopSeller $shopSeller)
    {
        //
    }

    /**
     * Handle the ShopSeller "updated" event.
     *
     * @param  \App\Models\ShopSeller  $shopSeller
     * @return void
     */
    public function updated(ShopSeller $shopSeller)
    {
        // check if active column is changed from in_active to active
        if($shopSeller->getOriginal('is_active') == false && $shopSeller->is_active == true){
            //send mail to user that shop activated
            Mail::to($shopSeller->owner->email)->send(new ShopActivatedMail($shopSeller));
            // after activation change user role to vendor role
            $user_id = $shopSeller->user_id;
            $user = User::find($user_id);
            $user->usertype = 'vendor';
            $user->save();
        }
    }

    /**
     * Handle the ShopSeller "deleted" event.
     *
     * @param  \App\Models\ShopSeller  $shopSeller
     * @return void
     */
    public function deleted(ShopSeller $shopSeller)
    {
        //
    }

    /**
     * Handle the ShopSeller "restored" event.
     *
     * @param  \App\Models\ShopSeller  $shopSeller
     * @return void
     */
    public function restored(ShopSeller $shopSeller)
    {
        //
    }

    /**
     * Handle the ShopSeller "force deleted" event.
     *
     * @param  \App\Models\ShopSeller  $shopSeller
     * @return void
     */
    public function forceDeleted(ShopSeller $shopSeller)
    {
        //
    }
}
