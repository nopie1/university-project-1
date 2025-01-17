<div>
    <div class="container" style="padding: 30px 0;">
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-8">
                <div class="card p-5">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <p class="card-title">Edit Coupon</p>
                            </div>
                            <div class="col-md-6">
                            @if(Auth::user()->usertype === 'vendor')
                                <a href="{{route('vendor.coupons')}}" class="btn btn-success pull-right">All Coupons</a>
                            @else
                                <a href="{{route('admin.coupons')}}" class="btn btn-success pull-right">All Coupons</a>
                            @endif
                            </div>
                        </div>
                    </div>
                        @if (Session::has('message'))
                            <div class="alert alert-success" role="alert">{{Session::get('message')}}</div>
                        @endif
                        <form wire:submit.prevent="updateCoupon" class="form-samples">
                          <div class="form-group">
                              <label>Coupon Code</label>
                              <input type="text" class="form-control input-md" placeholder="Coupon Code" wire:model="code">
                              @error('code')<span class="text-danger">{{$message}}</span> @enderror <br>

                          </div>
                          <div class="form-group">
                            <label>Coupon Type</label>
                              <select class="form-control" wire:model="type">
                                  <option value="">Select</option>
                                  <option value="percent">Percent</option>
                                  <option value="fixed">Fixed</option>
                              </select>
                              @error('type')<span class="text-danger">{{$message}}</span> @enderror <br>
                          </div>
                          <div class="form-group">
                            <label>Coupon Value</label>
                            <input type="text" class="form-control input-md" placeholder="Coupon Value" wire:model="value">
                            @error('value')<span class="text-danger">{{$message}}</span> @enderror <br>
                        </div>
                          <div class="form-group">
                            <label>Cart Value</label>
                              <input type="text" class="form-control input-md" placeholder="Cart Value" wire:model="cart_value">
                              @error('cart_value')<span class="text-danger">{{$message}}</span> @enderror <br>
                          </div>
                          <div class="form-group">
                            <label>Expiry Date</label>
                            <div wire:ignore>
                              <input type="text" id="expiry_date" class="form-control input-md" placeholder="Expiry Date" wire:model="expiry_date">
                              @error('expiry_date')<span class="text-danger">{{$message}}</span> @enderror <br>
                          </div>
                        </div>
                          <div class="form-group text-center">
                             <button type="submit" class="btn btn-success">Update</button>
                          </div>
                        </form>
                </div>
            </div>
        </div>
    </div>
</div>


@push('scripts')
    <script>
        $(function(){
            $('#expiry_date').datetimepicker({
                format: 'Y-MM-DD'
            })
            .on('dp.change', function(ev){
                var data = $('#expiry_date').val();
                @this.set('expiry_date',data);
            })
        })
    </script>
@endpush


