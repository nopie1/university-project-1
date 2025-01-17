<div>
    <div class="container" style="padding: 30px 0;">
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-8">
                <div class="card p-5">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <p class="card-title">Edit Shop</p>
                            </div>
                            <div class="col-md-6">
                                @if (Auth::user()->usertype === 'vendor')
                                    <a href="{{route('vendor.manageshops')}}" class="btn btn-success pull-right">View Your Shop</a>
                                @else
                                    <a href="{{route('admin.manageshops')}}" class="btn btn-success pull-right">All Shops</a>
                                @endif

                            </div>
                        </div>
                    </div>
                        @if (Session::has('message'))
                            <div class="alert alert-success" role="alert">{{Session::get('message')}}</div>
                        @endif
                        <form wire:submit.prevent="updateShops" class="form-samles">
                            <div class="form-group">
                                <label>Vendor Name</label>
                                <input type="text" class="form-control input-md" placeholder="Vendor Name" wire:model="v_name">
                                @error('v_name')<span class="text-danger">{{$message}}</span> @enderror <br>
                            </div>

                            <div class="form-group">
                                <label>Vendor Email</label>
                                <input type="text" class="form-control input-md" placeholder="Vendor Email" wire:model="email">
                                @error('email')<span class="text-danger">{{$message}}</span> @enderror <br>
                            </div>

                            <div class="form-group">
                                <label>Shop Name</label>
                                <input type="text" class="form-control input-md" placeholder="Shop Name" wire:model="name">
                                @error('name')<span class="text-danger">{{$message}}</span> @enderror <br>
                            </div>

                            <div class="form-group">
                                <label>Shop Description</label>
                                <input type="text" class="form-control input-md" placeholder="Shop Description" wire:model="description">
                                @error('description')<span class="text-danger">{{$message}}</span> @enderror <br>
                            </div>

                            <div class="form-group">
                                <label>Activate This Shop</label>
                                    <select class="form-control input-md" wire:model="is_active">
                                        <option value="0">Inactive</option>
                                        <option value="1">Active</option>
                                  </select>
                                  @error('status')<span class="text-danger">{{$message}}</span> @enderror
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


