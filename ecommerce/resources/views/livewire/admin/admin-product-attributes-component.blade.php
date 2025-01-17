<div>
    <style>
        .sclist{
            list-style: none;
        }
        .sclist li{
            line-height: 33px;
            border-bottom: 1px solid #ccc;
        }
        .slink i{
            font-size: 16px;
            margin-left: 12px;
        }
    </style>
    <div class="container" style="padding: 30px 0;">
        <div class="row">
            <div class="col-md-12">
                <div class="card p-5">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <p class="pull-left card-title">All Attributes</p>
                            </div>
                            <div class="col-md-6">
                                @if (Auth::user()->usertype === 'vendor')
                                    <a href="{{route('vendor.add_attributes')}}" class="btn btn-success pull-right">Add Attribute</a>
                                @else
                                    <a href="{{route('admin.add_attributes')}}" class="btn btn-success pull-right">Add Attribute</a>
                                @endif

                            </div>
                        </div>
                    </div>
                    <div class="tabel-responsive">
                        @if (Session::has('message'))
                           <div class="alert alert-success" role="alert">{{Session::get('message')}}</div>
                        @endif
                        <table class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Attribute Name</th>
                                    <th>Created At</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($pattributes as $pattribute)
                                    <tr>
                                        <td>{{$pattribute->id}}</td>
                                        <td>{{$pattribute->name}}</td>
                                        <td>{{$pattribute->created_at}}</td>
                                        <td>
                                            @if (Auth::user()->usertype === 'vendor')
                                                <a href="{{route('vendor.edit_attributes',['attribute_id'=>$pattribute->id])}}"><i class="fa fa-edit fa-2x"></i></a>
                                                <a href="#" onclick="confirm('Are you sure to Delete this Attribute?') || event.stopImmediatePropagation()" wire:click.prevent="deleteAttribute({{$pattribute->id}})"><i class="fa fa-times fa-2x text-danger" style="margin-left: 10px;"></i></a>
                                            @else
                                                <a href="{{route('admin.edit_attributes',['attribute_id'=>$pattribute->id])}}"><i class="fa fa-edit fa-2x"></i></a>
                                                <a href="#" onclick="confirm('Are you sure to Delete this Attribute?') || event.stopImmediatePropagation()" wire:click.prevent="deleteAttribute({{$pattribute->id}})"><i class="fa fa-times fa-2x text-danger" style="margin-left: 10px;"></i></a>
                                            @endif
                                        </td>
                                    </tr>
                                @endforeach

                            </tbody>
                        </table>
                        <div class="wrap-pagination-info">
                            {{$pattributes->links()}}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

