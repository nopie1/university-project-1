<div>
    <div class="container" style="padding: 30px 0;">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <div class="card p-5">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <p class="card-title">Sale Settings</p>
                            </div>
                            <div class="col-md-6">
                            </div>
                        </div>
                    </div>
                        @if (Session::has('message'))
                            <div class="alert alert-success" role="alert">{{Session::get('message')}}</div>
                        @endif
                        <form wire:submit.prevent="updateSale" class="form-horizontal">
                          <div class="form-group">
                            <label>Sale Status</label>
                              <select class="form-control" wire:model = "status">
                                  <option value="0">Inactive</option>
                                  <option value="1">Active</option>
                              </select>
                          </div>
                          <div class="form-group">
                            <label>Sale Date</label>
                            <div wire:ignore>
                              <input type="text" id="sale-date" class="form-control input-md" placeholder="YYYY/MM/DD H:M:S" wire:model="sale_date">
                            </div>
                        </div>
                          <div class="form-group text-center">
                            <button type="submit" class="btn btn-primary">Submit</button>
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
            $('#sale-date').datetimepicker({
                format: 'Y-MM-DD'
            })
            .on('dp.change', function(ev){
                var data = $('#sale-date').val();
                @this.set('sale_date',data);
            })
        })
    </script>
@endpush

{{-- @push('scripts')
    <script>
        $(function(){
            $('#sale-date').datetimepicker({
                format : 'Y-MM-DD h:m:s',
            })
            .on('dp.change',function(ev){
               var data = $('#sale-date').val();
               @this.set('sale_date',data);
            });
        });
    </script>
@endpush --}}


