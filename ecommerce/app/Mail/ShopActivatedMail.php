<?php

namespace App\Mail;

use App\Models\ShopSeller;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class ShopActivatedMail extends Mailable
{
    use Queueable, SerializesModels;

    public ShopSeller $shopSeller;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($shopSeller)
    {
        $this->shopSeller = $shopSeller;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->markdown('mails.shopactivatedmail');
    }
}
