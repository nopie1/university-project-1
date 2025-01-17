<div>
    <div class="container" style="padding: 30px 0;">
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-8">
                <div class="card p-5">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <p class="card-title">Edit Attribute</p>
                            </div>
                            <div class="col-md-6">
                                @if (Auth::user()->usertype === 'vendor')
                                    <a href="{{route('vendor.attributes')}}" class="btn btn-success pull-right">All Attributes</a>
                                @else
                                    <a href="{{route('admin.attributes')}}" class="btn btn-success pull-right">All Attributes</a>
                                @endif

                            </div>
                        </div>
                    </div>
                        @if (Session::has('message'))
                            <div class="alert alert-success" role="alert">{{Session::get('message')}}</div>
                        @endif
                        <form wire:submit.prevent="updateAttribute" class="form-horizontal">
                            <div class="form-group">
                                <label>Attribute Name</label>
                                <input type="text" class="form-control input-md" placeholder="Attribute name" wire:model="name">
                                @error('name')<span class="text-danger">{{$message}}</span> @enderror <br>
                            </div>

                            <div class="form-group">
                               <button type="submit" class="btn btn-success">Update</button>
                            </div>
                        </form>
                </div>
            </div>
        </div>
    </div>
</div>


