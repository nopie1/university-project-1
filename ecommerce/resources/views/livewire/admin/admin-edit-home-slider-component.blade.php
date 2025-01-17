<div>
    <div class="container" style="padding: 30px 0;">
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-8">
                <div class="card p-5">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <p class="card-title">Edit Slide</p>
                            </div>
                            <div class="col-md-6">
                                <a href="{{route('admin.homeslider')}}" class="btn btn-success pull-right">All Slides</a>
                            </div>
                        </div>
                    </div>
                        @if (Session::has('message'))
                            <div class="alert alert-success" role="alert">{{Session::get('message')}}</div>
                        @endif
                        <form wire:submit.prevent="updateSlide" class="form-horizontal" enctype="multipart/form-data">
                          <div class="form-group">
                              <label>Title</label>
                              <input type="text" class="form-control input-md" placeholder="Title" wire:model="title">
                          </div>
                          <div class="form-group">
                              <label>Subtitle</label>
                              <input type="text" class="form-control input-md" placeholder="Subtitle" wire:model="subtitle">
                          </div>
                          <div class="form-group">
                            <label>Price</label>
                            <input type="text" class="form-control input-md" placeholder="Price" wire:model="price">
                        </div>
                          <div class="form-group">
                            <label>Link</label>
                            <input type="text" class="form-control input-md" placeholder="Link" wire:model="link">
                          </div>
                          <div class="form-group">
                            <label>Status</label>
                              <select class="form-control" wire:model="status">
                                  <option value="0">Inactive</option>
                                  <option value="1">Active</option>
                              </select>
                            </div>
                          <div class="form-group">
                            <label>Image</label>
                              <input type="file" class="form-control input-file" wire:model="newimage">
                                @if ($newimage)
                                    <img src="{{ $newimage->temporaryUrl() }}" width="120">
                                @else
                                    <img src="{{asset('assets/images/sliders')}}/{{$image}}" width="120">
                                @endif
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



