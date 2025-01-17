
<style>
    .img-profile{
        width: 20px;
        border-radius: 50%;
    }
    .name{
        font-size: 12px;
        margin-left: 5px;
    }
</style>
<li class="menu-item menu-item-has-children parent" >
    <a title="account" href="#">
        @if ($user->profile->image)
            <img class="img-profile" src="{{asset('assets/images/profile')}}/{{$user->profile->image}}" width="100%" alt="">
        @else
            <img class="img-profile" src="{{asset('assets/images/profile/default.png')}}" width="100%" alt="">
        @endif
        <span class="name">{{Auth::user()->name}}</span><i class="fa fa-angle-down" aria-hidden="true"></i>
    </a>
    <ul class="submenu curency" >
        <li class="menu-item" >
            <a title="My Profile" href="{{route('user.profile')}}">My Profile</a>
        </li>
        <li class="menu-item" >
            <a title="Orders" href="{{route('user.orders')}}">My Orders</a>
        </li>
        <li class="menu-item" >
            <a title="Change-password" href="{{route('user.changepassword')}}">Change Password</a>
        </li>
        <li class="menu-item" >
            <a title="history" href="{{route('user.dashboard')}}">History</a>
        </li>
        <hr>
        <li class="menu-item">
            <a href="{{route('logout')}}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">Logout</a>
        </li>
        <form id="logout-form" action="{{route('logout')}}" method="POST">
            @csrf
        </form>
    </ul>
</li>
