<div class="container" style="padding:30px; 0">
    <div class="row">
        <div class="panel panel-default">
            <div class="panel-heading">
                Update Profile
            </div>
            <div class="panel-body">
                @if (Session::has('message'))
                    <div class="alert alert-success" role="alert">{{Session::get('message')}}</div>
                @endif
                <form wire:submit.prevent="updateProfile">
                    <div class="col-md-4">
                        @if ($newimage)
                            <img src="{{$newimage->temporaryUrl()}}" width="100%" alt="">
                        @elseif ($image)
                            <img src="{{asset('assets/images/profile')}}/{{$image}}" width="100%" alt="">
                        @else
                            <img src="{{asset('assets/images/profile/default.png')}}" width="100%" alt="">
                        @endif
                        <input type="file" class="form-control" wire:model="newimage">
                    </div>
                    <div class="col-md-8">
                        <p><b>Name:</b><input type="text" class="form-control" wire:model="name"></p>
                        <p><b>Email:</b>{{$email}}</p>
                        <p><b>Phone No:</b><input type="text" class="form-control" wire:model="mobile"></p>
                        <hr>
                        <p><b>Line1:</b><input type="text" class="form-control" wire:model="line1"></p>
                        <p><b>Line2:</b><input type="text" class="form-control" wire:model="line2"></p>
                        <p><b>City:</b><input type="text" class="form-control" wire:model="city"></p>
                        <p><b>Province:</b><input type="text" class="form-control" wire:model="province"></p>
                        <p><b>Country:</b><input type="text" class="form-control" wire:model="country"></p>
                        <p><b>ZipCode:</b><input type="text" class="form-control" wire:model="zipcode"></p>
                        <button type="submit" class="btn btn-info pull-right">Update</button>
                    </div>
                </form>
             </div>
        </div>
    </div>

</div>

