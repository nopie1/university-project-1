<div>
    <div class="container" style="padding: 30px 0;">
       <div class="row">
        <div class="col-md-2"></div>
           <div class="col-md-8">
               <div class="card p-5">
                   <div class="panel-heading">
                      <p class="card-title">Settings</p>
                   </div>
                       @if (Session::has('message'))
                           <div class="alert alert-success" role="alert">{{Session::get('message')}}</div>
                       @endif
                       <form class="form-horizontal" wire:submit.prevent="saveSettings">
                           <div class="form-group">
                               <label>Email</label>
                                <input type="text" class="form-control input-md" placeholder="Email" wire:model="email">
                                @error('email') <span class="text-danger">{{$message}}</span> @enderror
                           </div>
                           <div class="form-group">
                               <label>Phone</label>
                                <input type="text" class="form-control input-md" placeholder="Phone" wire:model="phone">
                                @error('phone') <span class="text-danger">{{$message}}</span> @enderror
                           </div>
                           <div class="form-group">
                               <label>Phone2</label>
                                <input type="text" class="form-control input-md" placeholder="Phone2" wire:model="phone2">
                                @error('phone2') <span class="text-danger">{{$message}}</span> @enderror
                           </div>
                           <div class="form-group">
                               <label>Address</label>
                                <input type="text" class="form-control input-md" placeholder="Address" wire:model="address">
                                @error('address') <span class="text-danger">{{$message}}</span> @enderror
                           </div>
                           <div class="form-group">
                               <label>Map</label>
                                <input type="text" class="form-control input-md" placeholder="Map" wire:model="map">
                                @error('map') <span class="text-danger">{{$message}}</span> @enderror
                           </div>
                           <div class="form-group">
                               <label>Twitter</label>
                                <input type="text" class="form-control input-md" placeholder="Twitter" wire:model="twitter">
                                @error('twitter') <span class="text-danger">{{$message}}</span> @enderror
                           </div>
                           <div class="form-group">
                               <label>Facebook</label>
                                <input type="text" class="form-control input-md" placeholder="Facebook" wire:model="facebook">
                                @error('facebook') <span class="text-danger">{{$message}}</span> @enderror
                           </div>
                           <div class="form-group">
                               <label>Pinterest</label>
                                <input type="text" class="form-control input-md" placeholder="Pinterest" wire:model="pinterest">
                                @error('pinterest') <span class="text-danger">{{$message}}</span> @enderror
                           </div>
                           <div class="form-group">
                               <label>Instgram</label>
                                <input type="text" class="form-control input-md" placeholder="Instgram" wire:model="instgram">
                                @error('instgram') <span class="text-danger">{{$message}}</span> @enderror
                           </div>
                           <div class="form-group">
                               <label>Youtube</label>
                                <input type="text" class="form-control input-md" placeholder="Youtube" wire:model="youtube">
                                @error('youtube') <span class="text-danger">{{$message}}</span> @enderror
                           </div>
                           <div class="form-group text-center">
                                <button type="submit" class="btn btn-primary">Save</button>
                           </div>
                       </form>
               </div>
           </div>
       </div>
    </div>
 </div>
