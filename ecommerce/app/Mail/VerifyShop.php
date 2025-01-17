<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class VerifyShop extends Mailable
{
    use Queueable, SerializesModels;
    public $verifyshop;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($verifyshop)
    {
        $this->verifyshop = $verifyshop;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject('Verify Shop')->view('mails.verify-shops');
    }
}
