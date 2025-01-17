<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Heer-Sare</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="{{asset('admin/vendors/feather/feather.css')}}">
  <link rel="stylesheet" href="{{asset('admin/vendors/ti-icons/css/themify-icons.css')}}">
  <link rel="stylesheet" href="{{asset('admin/vendors/css/vendor.bundle.base.css')}}">
  <!-- endinject -->
  {{-- font awesome  --}}
  <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/font-awesome.min.css')}}">
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="{{asset('admin/vendors/datatables.net-bs4/dataTables.bootstrap4.css')}}">
  <link rel="stylesheet" href="{{asset('admin/vendors/ti-icons/css/themify-icons.css')}}">
  <link rel="stylesheet" type="text/css" href="{{asset('admin/js/select.dataTables.min.css')}}">
  <!-- End plugin css for this page -->
  {{-- font awesome  --}}
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <!-- inject:css -->
  <link rel="stylesheet" href="{{asset('admin/css/vertical-layout-light/style.css')}}">
  <!-- endinject -->
  <link rel="shortcut icon" type="image/x-icon" href="{{ asset('assets/images/favicon.ico')}}">

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" integrity="sha512-nMNlpuaDPrqlEls3IX/Q56H36qvBASwb3ipuo3MxeWbsQB1881ox0cRv7UPTgBlriqoynt35KjEwgGUeUXIPnw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css" integrity="sha512-WWc9iSr5tHo+AliwUnAQN1RfGK9AnpiOFbmboA0A0VJeooe69YR2rLgHw13KxF1bOSLmke+SNnLWxmZd8RTESQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.5.1/nouislider.min.css" integrity="sha512-qveKnGrvOChbSzAdtSs8p69eoLegyh+1hwOMbmpCViIwj7rn4oJjdmMvWOuyQlTOZgTlZA0N2PXA7iA8/2TUYA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

  <script src="https://cdn.tiny.cloud/1/3z580xmf0ykwrugicwxygg24o05x2utaux60dxxjpcfb98bi/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
  @livewireStyles
</head>
<body>
  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo mr-5" href="{{route('admin.dashboard')}}"><img src="{{asset('assets/images/log3.jpg')}}" class="mr-2" alt="logo"/></a>
        <a class="navbar-brand brand-logo-mini" href="{{route('admin.dashboard')}}"><img src="{{asset('assets/images/log3.jpg')}}" alt="logo"/></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
          <span class="icon-menu"></span>
        </button>
        <ul class="navbar-nav mr-lg-2">
          <li class="nav-item nav-search d-none d-lg-block">
            <div class="input-group">
              <div class="input-group-prepend hover-cursor" id="navbar-search-icon">
                <span class="input-group-text" id="search">
                  <i class="icon-search"></i>
                </span>
              </div>
              <input type="text" class="form-control" id="navbar-search-input" placeholder="Search now" aria-label="search" aria-describedby="search">
            </div>
          </li>
        </ul>
        <ul class="navbar-nav navbar-nav-right">
          <li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
                <img class="img-profile" src="{{asset('assets/images/profile/default.png')}}" width="100%" alt="">
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
              <a class="dropdown-item" href="">
                <i class="ti-user text-primary"></i>
                Profile
              </a>
              <a class="dropdown-item"  href="{{route('logout')}}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                <i class="ti-power-off text-primary"></i>
                Logout
              </a>
              <form id="logout-form" action="{{route('logout')}}" method="POST">
                @csrf
            </form>
            </div>
          </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="icon-menu"></span>
        </button>
      </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_settings-panel.html -->
      <div class="theme-setting-wrapper">
        <div id="settings-trigger"><i class="ti-settings"></i></div>
        <div id="theme-settings" class="settings-panel">
          <i class="settings-close ti-close"></i>
          <p class="settings-heading">SIDEBAR SKINS</p>
          <div class="sidebar-bg-options selected" id="sidebar-light-theme"><div class="img-ss rounded-circle bg-light border mr-3"></div>Light</div>
          <div class="sidebar-bg-options" id="sidebar-dark-theme"><div class="img-ss rounded-circle bg-dark border mr-3"></div>Dark</div>
          <p class="settings-heading mt-2">HEADER SKINS</p>
          <div class="color-tiles mx-0 px-4">
            <div class="tiles success"></div>
            <div class="tiles warning"></div>
            <div class="tiles danger"></div>
            <div class="tiles info"></div>
            <div class="tiles dark"></div>
            <div class="tiles default"></div>
          </div>
        </div>
      </div>
      <div id="right-sidebar" class="settings-panel">
        <i class="settings-close ti-close"></i>
        <ul class="nav nav-tabs border-top" id="setting-panel" role="tablist">
          <li class="nav-item">
            <a class="nav-link active" id="todo-tab" data-toggle="tab" href="#todo-section" role="tab" aria-controls="todo-section" aria-expanded="true">TO DO LIST</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="chats-tab" data-toggle="tab" href="#chats-section" role="tab" aria-controls="chats-section">CHATS</a>
          </li>
        </ul>
      </div>
      <!-- partial -->
      <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">

{{-- Admin Routes  --}}
    @if (Route::has('login'))
        @if (Auth::user()->usertype === 'ADM')
          <li class="nav-item {{ request()->is('*admin/dashboard*') ? 'active' : '' }}">
            <a class="nav-link" href="{{route('admin.dashboard')}}">
              <i class="icon-grid menu-icon"></i>
              <span class="menu-title">Dashboard</span>
            </a>
          </li>

          <li class="nav-item {{ request()->is('*admin/users*') ? 'active' : '' }}">
            <a class="nav-link" href="{{route('admin.users')}}">
              <i class="icon-grid fa-solid fa-certificate icon-grid menu-icon"></i>
              <span class="menu-title">Manage Users</span>
            </a>
          </li>


          <li class="nav-item {{ request()->is('*admin/categories*') ? 'active' : '' }}">
            <a class="nav-link" href="{{route('admin.categories')}}">
              <i class="icon-grid fa-solid fa-certificate icon-grid menu-icon"></i>
              <span class="menu-title">Manage Categories</span>
            </a>
          </li>

          <li class="nav-item {{ request()->is('') ? 'active' : '' }}">
            <a class="nav-link" href="{{route('admin.manageshops')}}">
              <i class="icon-grid fa-solid fa-certificate icon-grid menu-icon"></i>
              <span class="menu-title">Manage Shops</span>
            </a>
          </li>

          <li class="nav-item {{ request()->is('*admin/products*') ? 'active' : '' }}">
            <a class="nav-link" href="{{route('admin.products')}}">
              <i class="fa-solid fa-computer icon-grid menu-icon"></i>
              <span class="menu-title">Manage Products</span>
            </a>
          </li>

          <li class="nav-item {{ request()->is('*admin/attributes*') ? 'active' : '' }}">
            <a class="nav-link" href="{{route('admin.attributes')}}">
              <i class="fa-solid fa-rectangle-pro icon-grid menu-icon"></i>
              <span class="menu-title">Manage Product Attributes</span>
            </a>
          </li>

          <li class="nav-item {{ request()->is('*admin/slider*') ? 'active' : '' }}">
            <a class="nav-link" href="{{route('admin.homeslider')}}">
              <i class="fa-solid fa-house icon-grid menu-icon"></i>
              <span class="menu-title">Manage Home Slider</span>
            </a>
          </li>

          <li class="nav-item {{ request()->is('*admin/homeCategories*') ? 'active' : '' }}">
            <a class="nav-link" href="{{route('admin.homecategories')}}">
             <i class="icon-grid fa-solid fa-certificate icon-grid menu-icon"></i>
              <span class="menu-title">Manage Home Categories</span>
            </a>
          </li>

          <li class="nav-item {{ request()->is('*admin/sale*') ? 'active' : '' }}">
            <a class="nav-link" href="{{route('admin.sale')}}">
              <i class="fa-brands fa-salesforce icon-grid menu-icon"></i>
              <span class="menu-title">Manage OnSale Products</span>
            </a>
          </li>

          <li class="nav-item {{ request()->is('*admin/coupons*') ? 'active' : '' }}">
            <a class="nav-link" href="{{route('admin.coupons')}}">
                <i class="fa-solid fa-tags icon-grid menu-icon"></i>
              <span class="menu-title">Manage Coupons</span>
            </a>
          </li>

          <li class="nav-item {{ request()->is('*admin/orders*') ? 'active' : '' }}">
            <a class="nav-link" href="{{route('admin.orders')}}">
              <i class="fa-solid fa-bag-shopping icon-grid menu-icon"></i>
              <span class="menu-title">Manage Orders</span>
            </a>
          </li>

          <li class="nav-item {{ request()->is('*admin/contacts*') ? 'active' : '' }}">
            <a class="nav-link" href="{{route('admin.contacts')}}">
                <i class="fa-solid fa-comment-dots icon-grid menu-icon"></i>
              <span class="menu-title">Latest Contacts</span>
            </a>
          </li>

          <li class="nav-item {{ request()->is('*admin/settings*') ? 'active' : '' }}">
            <a class="nav-link" href="{{route('admin.settings')}}">
              <i class="ti-settings icon-grid menu-icon"></i>
              <span class="menu-title">Manage Settings</span>
            </a>
          </li>


{{-- Vendor routes and rules  --}}
        @elseif(Auth::user()->usertype === 'vendor')
            <li class="nav-item ">
                <a class="nav-link" href="{{route('vendor.dashboard')}}">
                <i class="icon-grid menu-icon"></i>
                <span class="menu-title">Dashboard</span>
                </a>
            </li>

              <li class="nav-item">
                <a class="nav-link" href="{{route('vendor.manageshops')}}">
                  <i class="icon-grid fa-solid fa-certificate icon-grid menu-icon"></i>
                  <span class="menu-title">My Shop</span>
                </a>
              </li>

              <li class="nav-item">
                <a class="nav-link" href="{{route('vendor.products')}}">
                  <i class="fa-solid fa-computer icon-grid menu-icon"></i>
                  <span class="menu-title">Manage Products</span>
                </a>
              </li>

              <li class="nav-item">
                <a class="nav-link" href="{{route('vendor.attributes')}}">
                  <i class="fa-solid fa-rectangle-pro icon-grid menu-icon"></i>
                  <span class="menu-title">Manage Product Attributes</span>
                </a>
              </li>


          <li class="nav-item">
            <a class="nav-link" href="{{route('vendor.coupons')}}">
                <i class="fa-solid fa-tags icon-grid menu-icon"></i>
              <span class="menu-title">Manage Coupons</span>
            </a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="{{route('vendor.orders')}}">
              <i class="fa-solid fa-bag-shopping icon-grid menu-icon"></i>
              <span class="menu-title">Manage Orders</span>
            </a>
          </li>
        @endif
    @endif

        </ul>
      </nav>
      <!-- partial -->


      <div class="main-panel">
        <div class="content-wrapper">
            {{$slot}}


            <footer class="footer">
                <div class="d-sm-flex justify-content-center justify-content-sm-between">
                  <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2025. <span class="text-primary">Heer-Sare Brands</span> All rights reserved.</span>
                </div>
            </footer>
        </div>
      </div>





    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->


  <!-- plugins:js -->
  <script src="{{asset('admin/vendors/js/vendor.bundle.base.js')}}"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="{{asset('admin/vendors/chart.js/Chart.min.js')}}"></script>
  <script src="{{asset('admin/vendors/datatables.net/jquery.dataTables.js')}}"></script>
  <script src="{{asset('admin/vendors/datatables.net-bs4/dataTables.bootstrap4.js')}}"></script>
  <script src="{{asset('admin/js/dataTables.select.min.js')}}"></script>

  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="{{asset('admin/js/off-canvas.js')}}"></script>
  <script src="{{asset('admin/js/hoverable-collapse.js')}}"></script>
  <script src="{{asset('admin/js/template.js')}}"></script>
  <script src="{{asset('admin/js/settings.js')}}"></script>
  <script src="{{asset('admin/js/todolist.js')}}"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="{{asset('admin/js/dashboard.js')}}"></script>
  <script src="{{asset('admin/js/Chart.roundedBarCharts.j')}}s"></script>
  <!-- End custom js for this page-->

  <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js" integrity="sha512-2ImtlRlf2VVmiGZsjm9bEyhjGW4dU7B6TNwh/hx/iSByxNENtj3WVE6o/9Lj4TJeVXPi4bnOIMXFIJJAeufa0A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.19.1/moment.min.js" integrity="sha512-Dz4zO7p6MrF+VcOD6PUbA08hK1rv0hDv/wGuxSUjImaUYxRyK2gLC6eQWVqyDN9IM1X/kUA8zkykJS/gEVOd3w==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js" integrity="sha512-Y+0b10RbVUTf3Mi0EgJue0FoheNzentTMMIE2OreNbqnUPNbQj8zmjK3fs5D2WhQeGWIem2G2UkKjAL/bJ/UXQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.5.1/nouislider.min.js" integrity="sha512-T5Bneq9hePRO8JR0S/0lQ7gdW+ceLThvC80UjwkMRz+8q+4DARVZ4dqKoyENC7FcYresjfJ6ubaOgIE35irf4w==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>



  @livewireScripts
  @stack('scripts')
</body>

</html>

