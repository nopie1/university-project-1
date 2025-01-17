<div>
    <div class="container" style="padding: 30px 0;">
        <div class="row">
            <div class="col-md-12">
                <div class="card p-5">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <p class="card-title">All Coupons</p>
                            </div>
                            <div class="col-md-6">
                            @if(Auth::user()->usertype === 'vendor')
                                <a href="{{route('vendor.addcoupon')}}" class="btn btn-success pull-right">Add Coupon</a>
                            @else
                                <a href="{{route('admin.addcoupon')}}" class="btn btn-success pull-right">Add Coupon</a>
                            @endif
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        @if (Session::has('message'))
                           <div class="alert alert-success" role="alert">{{Session::get('message')}}</div>
                        @endif
                        <table class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Coupon Code</th>
                                    <th>Coupon Type</th>
                                    <th>Coupon Value</th>
                                    <th>Cart Value</th>
                                    <th>Expiry Date</th>
                                    @if (Auth::user()->usertype === 'ADM')
                                        <th>Shop Name</th>
                                    @endif
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($coupons as $coupon)
                                    <tr>
                                        <td>{{$coupon->id}}</td>
                                        <td>{{$coupon->code}}</td>
                                        <td>{{$coupon->type}}</td>
                                        @if($coupon->type == 'fixed')
                                          <td>${{$coupon->value}}</td>
                                        @else
                                           <td>{{$coupon->value}}%</td>
                                        @endif

                                        <td>{{$coupon->cart_value}}</td>
                                        <td>{{$coupon->expiry_date}}</td>
                                        @if (Auth::user()->usertype === 'ADM')
                                            <td>{{$coupon->shop->name}}</td>
                                        @endif
                                        <td>
                                            @if(Auth::user()->usertype === 'vendor')
                                                <a href="{{route('vendor.editcoupon',['coupon_id'=>$coupon->id])}}"><i class="fa fa-edit fa-2x"></i></a>
                                                <a href="#" onclick="confirm('Are you sure to Delete this Coupon?') || event.stopImmediatePropagation()" wire:click.prevent="deletecoupon({{$coupon->id}})"><i class="fa fa-times fa-2x text-danger" style="margin-left: 10px;"></i></a>
                                            @else
                                                <a href="{{route('admin.editcoupon',['coupon_id'=>$coupon->id])}}"><i class="fa fa-edit fa-2x"></i></a>
                                                <a href="#" onclick="confirm('Are you sure to Delete this Coupon?') || event.stopImmediatePropagation()" wire:click.prevent="deletecoupon({{$coupon->id}})"><i class="fa fa-times fa-2x text-danger" style="margin-left: 10px;"></i></a>
                                            @endif
                                        </td>
                                    </tr>
                                @endforeach

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

