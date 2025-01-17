<div>
    <div class="container" style="padding: 30px 0;">
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-8">
                <div class="card p-5">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <p class="card-title">Edit Users</p>
                            </div>
                            <div class="col-md-6">
                                <a href="{{route('admin.users')}}" class="btn btn-success pull-right">All Shops</a>
                            </div>
                        </div>
                    </div>
                        @if (Session::has('message'))
                            <div class="alert alert-success" role="alert">{{Session::get('message')}}</div>
                        @endif
                        <form wire:submit.prevent="updateUsers" class="form-samles">
                            <div class="form-group">
                                <label>User Name</label>
                                <input type="text" class="form-control input-md" placeholder="User Name" wire:model="name">
                                @error('name')<span class="text-danger">{{$message}}</span> @enderror <br>
                            </div>

                            <div class="form-group">
                                <label>User Email</label>
                                <input type="text" class="form-control input-md" placeholder="User Email" wire:model="email">
                                @error('email')<span class="text-danger">{{$message}}</span> @enderror <br>
                            </div>

                            <div class="form-group">
                                <label>User Type</label>
                                    <select class="form-control input-md" wire:model="usertype">
                                        <option value="ADM">Admin</option>
                                        <option value="USR">User</option>
                                        <option value="vendor">Vendor</option>
                                  </select>
                                  @error('usertype')<span class="text-danger">{{$message}}</span> @enderror
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



