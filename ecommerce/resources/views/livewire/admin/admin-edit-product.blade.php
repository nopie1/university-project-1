<div>
    <div class="container" style="padding: 30px 0;">
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-8">
                <div class="card p-5">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <p class="card-title">Edit Product</p>
                            </div>
                            <div class="col-md-6">
                                @if(Auth::user()->usertype === 'vendor')
                                    <a href="{{route('vendor.products')}}" class="btn btn-success pull-right">All Products</a>
                                @else
                                    <a href="{{route('admin.products')}}" class="btn btn-success pull-right">All Products</a>
                                @endif
                            </div>
                        </div>
                    </div>
                        @if (Session::has('message'))
                            <div class="alert alert-success" role="alert">{{Session::get('message')}}</div>
                        @endif
                        <form wire:submit.prevent="updateProduct" class="form-horizontal" enctype="multipart/form-data">
                          <div class="form-group">
                              <label>Product Name</label>
                              <input type="text" class="form-control input-md" placeholder="Product Name" wire:model="name" wire:keyup="generateSlug">
                              @error('name')<span class="text-danger">{{$message}}</span> @enderror <br>
                          </div>
                          <div class="form-group">
                              <label>Product Slug</label>
                              <input type="text" class="form-control input-md" placeholder="Product Slug" wire:model="slug">
                              @error('slug')<span class="text-danger">{{$message}}</span> @enderror <br>
                          </div>
                          <div class="form-group">
                              <label>Short Description</label>
                              <textarea type="text" class="form-control input-md" id="short_description" rows="5" placeholder="Short Description" wire:model="short_description"></textarea>
                              @error('short_description')<span class="text-danger">{{$message}}</span> @enderror <br>
                          </div>
                          <div class="form-group">
                              <label>Description</label>
                              <textarea type="text" class="form-control input-md" id="description" rows="5" placeholder="Description" wire:model="description"></textarea>
                              @error('description')<span class="text-danger">{{$message}}</span> @enderror <br>
                          </div>
                          <div class="form-group">
                            <label>Regular Price</label>
                            <input type="text" class="form-control input-md" placeholder="Regular Price" wire:model="regular_price">
                            @error('regular_price')<span class="text-danger">{{$message}}</span> @enderror <br>
                        </div>
                          <div class="form-group">
                            <label>Sale Price</label>
                            <input type="text" class="form-control input-md" placeholder="Sale Price" wire:model="sale_price">
                            @error('sale_price')<span class="text-danger">{{$message}}</span> @enderror <br>
                          </div>
                          <div class="form-group">
                            <label>SKU</label>
                            <input type="text" class="form-control input-md" placeholder="SKU" wire:model="SKU">
                            @error('SKU')<span class="text-danger">{{$message}}</span> @enderror <br>
                          </div>
                          <div class="form-group">
                            <label>Stock</label>
                              <select name="" id="" class="form-control">
                                  <option value="instock">InStock</option>
                                  <option value="outofstock">out Of Stock</option>
                              </select>
                              @error('stock_status')<span class="text-danger">{{$message}}</span> @enderror <br>
                          </div>
                          <div class="form-group">
                            <label>Featured</label>
                              <select name="" id="" class="form-control">
                                  <option value="0">No</option>
                                  <option value="1">Yes</option>
                              </select>
                          </div>
                          <div class="form-group">
                            <label>Quantity</label>
                            <input type="text" class="form-control input-md" placeholder="Quantity" wire:model="quantity">
                            @error('quantity')<span class="text-danger">{{$message}}</span> @enderror <br>
                          </div>
                          <div class="form-group">
                            <label>Product Image</label>
                              <input type="file" class="form-control input-file" wire:model="newimage">
                                @if ($newimage)
                                    <img src="{{ $newimage->temporaryUrl() }}" width="120">
                                @else
                                    <img src="{{asset('assets/images/products')}}/{{$image}}" width="120">
                                @endif
                                @error('newimage')<span class="text-danger">{{$message}}</span> @enderror <br>
                          </div>

                          <div class="form-group">
                            <label>Product Gallery</label>
                              <input type="file" class="form-control input-file" wire:model="newimages" multiple>
                                @if ($newimages)
                                    @foreach ($newimages as $newimage)
                                        @if ($newimage)
                                            <img src="{{ $newimage->temporaryUrl() }}" width="120">
                                        @endif
                                    @endforeach
                                @else
                                    @foreach ($images as $image)
                                        @if ($image)
                                            <img src="{{asset('assets/images/products')}}/{{$image}}" width="120">
                                        @endif
                                    @endforeach
                                @endif

                            </div>

                          <div class="form-group">
                            <label>Category</label>
                              <select name="" id="" class="form-control" wire:model="category_id" wire:change="changeSubcategory">
                                  <option value="">Select Category</option>
                                  @foreach ($categories as $category)
                                    <option value="{{$category->id}}">{{$category->name}}</option>
                                  @endforeach
                              </select>
                              @error('category_id')<span class="text-danger">{{$message}}</span> @enderror <br>
                          </div>

                          <div class="form-group">
                            <label>SubCategory</label>
                              <select name="" id="" class="form-control" wire:model="scategory_id">
                                  <option value="0">Select SubCategory</option>
                                  @foreach ($scategories as $scategory)
                                    <option value="{{$scategory->id}}">{{$scategory->name}}</option>
                                  @endforeach
                              </select>
                              @error('scategory_id')<span class="text-danger">{{$message}}</span> @enderror <br>
                            </div>

                          <div class="form-group">
                            <label>Product Attribute</label>
                              <select name="" id="" class="form-control" wire:model="attr">
                                  <option value="0">Select Attribute</option>
                                  @foreach ($pattributes as $pattribute)
                                    <option value="{{$pattribute->id}}">{{$pattribute->name}}</option>
                                  @endforeach
                              </select>
                            <div class="col-md-1 mt-2">
                                <button type="button" class="btn btn-info btn-sm" wire:click.prevent="add">Add</button>
                            </div>
                          </div>

                          @foreach ($inputs as $key => $value)
                            <div class="form-group">
                                <label>{{$pattributes->where('id',$attribute_arr[$key])->first()->name}}</label>
                                <input type="text" class="form-control input-md" placeholder="{{$pattributes->where('id',$attribute_arr[$key])->first()->name}}" wire:model="attribute_values.{{$value}}">
                                <div class="col-md-1 mt-2">
                                    <button type="button" class="btn btn-danger btn-sm" wire:click.prevent="remove({{$key}})">Remove</button>
                                </div>
                            </div>
                          @endforeach

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
        tinymce.init({
            selector:'#short_description',
            setup:function(editor) {
                editor.on('change',function(e){
                    tinyMCE.triggerSave();
                    var sd_data = $('#short_description').val();
                    @this.set('short_description', sd_data);
                });
            }
        });

        tinymce.init({
            selector:'#description',
            setup:function(editor) {
                editor.on('change',function(e){
                    tinyMCE.triggerSave();
                    var d_data = $('#description').val();
                    @this.set('description', d_data);
                });
            }
        })
    });
</script>
@endpush




