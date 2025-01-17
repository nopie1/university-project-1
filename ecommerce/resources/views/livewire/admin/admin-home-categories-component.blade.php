<div>
    <div class="container" style="padding: 30px 0;">
       <div class="row">
           <div class="col-md-1"></div>
           <div class="col-md-8">
               <div class="card p-5">
                   <div class="card-body">
                      <p class="card-title">Manage Home Categories</p>
                   </div>
                    @if (Session::has('message'))
                        <div class="alert alert-success" role="alert">{{Session::get('message')}}</div>
                    @endif
                       <form class="form-horizontal" wire:submit.prevent="updateHomeCategory">
                           <div class="form-group">
                               <label>Choose Categoreis</label>
                               <div wire:ignore>
                                   <select name="categories[]" class="sel_categories form-control" multiple="multiple" wire:model="selected_categories">
                                       @foreach ($categories as $category)
                                           <option value="{{$category->id}}">{{$category->name}}</option>
                                       @endforeach
                                   </select>
                               </div>
                           </div>
                           <div class="form-group">
                               <label>No. of Products</label>
                                <input type="text" class="form-control input-md" wire:model="numberofproducts">
                           </div>
                           <div class="form-group">
                               <button type="submit" class="btn btn-success">Save</button>
                           </div>
                       </form>
               </div>
           </div>
       </div>
    </div>
</div>

@push('scripts')
    <script>
        $(document).ready(function(){
         $('.sel_categories').select2();
         $('.sel_categories').on('change',function(e){
             var data = $('.sel_categories').select2("val");
             @this.set('selected_categories',data);
         });
        });
    </script>
@endpush
