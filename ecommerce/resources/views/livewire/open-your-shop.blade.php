<div>
        <!--main area-->
        <main id="main" class="main-site left-sidebar">

        <div class="container">

        <div class="wrap-breadcrumb">
        <ul>
            <li class="item-link"><a href="#" class="link">home</a></li>
            <li class="item-link"><span>Register as seller</span></li>
        </ul>
        </div>
        <div class="row">
        <div class="col-lg-6 col-sm-6 col-md-6 col-xs-12 col-md-offset-3">
            <div class=" main-content-area">
                <div class="wrap-login-item ">
                    <div class="register-form form-item ">
                        @if (Session::has('message'))
                            <div class="alert alert-success" role="alert">{{Session::get('message')}}</div>
                        @endif
                        <form class="form-stl" wire:submit.prevent="registerShop" >
                            <fieldset class="wrap-title">
                                <h3 class="form-title">Open Your Shop</h3>
                                <h4 class="form-subtitle">Shop Infomation</h4>
                            </fieldset>
                            <fieldset class="wrap-input">
                                <label for="frm-reg-lname">Shop Name*</label>
                                <input type="text" id="frm-reg-lname" placeholder="Enter Shop Name*" required wire:model="name">
                            </fieldset>
                            <fieldset class="wrap-title">
                                <h3 class="form-title">Other Information</h3>
                            </fieldset>
                            <fieldset class="wrap-input">
                                <label for="frm-reg-lname">Description*</label>
                                <input type="text" id="frm-reg-lname" placeholder="Shop Description" required wire:model="description">
                            </fieldset>
                            <span style="color: green; margin-top:10px;">If you want to be a life-time partner you must pay <span style="color: red; font-weight:bold;">$100</span> for a commission</span>
                            {{-- commision transaction  --}}
                            <div class="summary summary-checkout m-5">
                                <div class="summary-item payment-method">
                                    <h4 class="title-box">Payment Information</h4>
                                    {{-- @if() --}}
                                    <div class="wrap-address-billing">
                                        @if (Session::has('stripe_error'))
                                            <div class="alert alert-danger" role="alert">{{Session::get('stripe_error')}}</div>
                                        @endif
                                        <p class="">
                                            <label for="card-no">Card Number:</label>
                                            <input type="text" name="card-no" value="" placeholder="Card number" wire:model="card_no">
                                            @error('card_no') <span class="text-danger"> {{$message}}</span> @enderror
                                        </p>

                                        <p class="">
                                            <label for="exp-month">Expiry Month:</label>
                                            <input type="text" name="exp-month" value="" placeholder="MM" wire:model="exp_month">
                                            @error('exp_month') <span class="text-danger"> {{$message}}</span> @enderror
                                        </p>

                                        <p class="row-in-form">
                                            <label for="exp-year">Expiry Year:</label>
                                            <input type="text" name="exp-year" value="" placeholder="YYYY" wire:model="exp_year">
                                            @error('exp_year') <span class="text-danger"> {{$message}}</span> @enderror
                                        </p>

                                        <p class="row-in-form">
                                            <label for="cvc">CVC</label>
                                            <input type="password" name="cvc" value="" placeholder="CVC" wire:model="cvc">
                                            @error('cvc') <span class="text-danger"> {{$message}}</span> @enderror
                                        </p>
                                    </div>
                                <input type="submit" class="btn btn-sign" value="Register" name="register">
                            </div>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        </div>

        </div>

        </main>

</div>
