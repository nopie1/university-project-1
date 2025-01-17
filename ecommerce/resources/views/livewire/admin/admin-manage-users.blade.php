<div>
    <div class="container" style="padding: 30px 0;">
        <div class="row">
            <div class="col-md-12">
                <div class="card p-5">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <p class="pull-left card-title">All Users on the Site</p>
                            </div>
                            <div class="col-md-6">
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        @if (Session::has('message'))
                            <div class="alert alert-success" role="alert">{{Session::get('message')}}</div>
                        @endif
                        <table class="table table-striped table-bordered mb-3">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>User Name</th>
                                    <th>User Email</th>
                                    <th>User Type</th>
                                    <th colspan="2" class="text-center">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($users  as $user)
                                    <tr>
                                        <td>{{$user->id}}</td>
                                        <td>{{$user->name}}</td>
                                        <td>{{$user->email}}</td>
                                        <td>
                                            @if($user->usertype === "ADM")
                                                <span class="bg-success p-1 rounded-circle text-light">Admin</span>
                                            @else
                                                <span>{{$user->usertype}}</span>
                                            @endif
                                        </td>
                                        <td>
                                            @if($user->usertype === "ADM")
                                                <a href="{{route('admin.editusers',['user_id'=>$user->id])}}"><i class="fa fa-edit fa-2x"></i></a>
                                            @else
                                                <a href="{{route('admin.editusers',['user_id'=>$user->id])}}"><i class="fa fa-edit fa-2x"></i></a>
                                                <a href="#" onclick="confirm('Are you sure to delete this User?') || event.stopImmediatePropagation()" wire:click.prevent="deleteUser({{$user->id}})"><i class="fa fa-times fa-2x text-danger" style="margin-left: 10px;"></i></a>
                                            @endif
                                        </td>
                                    </tr>
                                @endforeach

                            </tbody>
                        </table>
                        {{$users->links()}}
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
