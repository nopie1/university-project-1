<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Heer-Sare</title>
    <link rel="shortcut icon" type="image/x-icon" href="{{ asset('assets/images/favicon.ico')}}">
    <style>
        body{
            background-color: #F6F6F6;
            margin: 0;
            padding: 0;
        }
        h1,h2,h3,h4,h5,h6{
            margin: 0;
            padding: 0;
        }
        p{
            margin: 0;
            padding: 0;
        }
        .container{
            width: 80%;
            margin-right: auto;
            margin-left: auto;
        }
        .brand-section{
           background-color: rgb(170, 112, 6);
           /* padding: 10px 40px; */
           padding-top: 0;
           padding-right: 10;
           padding-bottom: 60px;
           padding-left: 10;
        }
        .logo{
            width: 50%;
            margin-top: 10px;
        }

        .row{
            display: flex;
            flex-wrap: wrap;
        }
        .col-6{
            width: 50%;
            flex: 0 0 auto;
        }
        .text-white{
            color: #fff;
        }
        .company-details{
            float: right;
            text-align: right;
            padding-bottom: 10px;
        }
        .body-section{
            padding: 16px;
            border: 1px solid gray;

        }
        .heading{
            font-size: 20px;
            margin-bottom: 08px;
        }
        .sub-heading{
            color: #262626;
            margin-bottom: 05px;
        }
        table{
            background-color: #fff;
            width: 100%;
            border-collapse: collapse;
        }
        table thead tr{
            border: 1px solid #111;
            background-color: #f2f2f2;
        }
        table td {
            vertical-align: middle !important;
            text-align: center;
        }
        table th, table td {
            padding-top: 08px;
            padding-bottom: 08px;
        }
        .table-bordered{
            box-shadow: 0px 0px 5px 0.5px gray;
        }
        .table-bordered td, .table-bordered th {
            border: 1px solid #dee2e6;
        }
        .text-right{
            text-align: end;
        }
        .w-20{
            width: 20%;
        }
        .float-right{
            float: right;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="brand-section">
            <div>
                <div class="logo">
                    <h1 class="text-white">Heer Sare</h1>
                </div>
                <div>
                    <div class="company-details">
                        <p class="text-white">Heer-Sare</p>
                        <p class="text-white">Heer-Sare - Online shopping</p>
                        <p class="text-white">+8801730931984</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="body-section">
            <div class="row">
                <div class="">
                    <h2 class="heading">Invoice No.: {{$order->id}}</h2>
                    <p class="sub-heading">Order Date: {{$order->created_at}} </p>
                    <p class="sub-heading">Email Address: {{$order->email}} </p>
                </div>
                <div class="">
                    <p class="sub-heading">Full Name:  {{$order->firstname}} - {{$order->lastname}}</p>
                    <p class="sub-heading">Address:  {{$order->line1}} - {{$order->line2}}</p>
                    <p class="sub-heading">Phone Number:  {{$order->mobile}}</p>
                    <p class="sub-heading">City,State,Pincode: {{$order->city}} - {{$order->province}} - {{$order->zipcode}} </p>
                </div>
            </div>
        </div>

        <div class="body-section">
            <h3 class="heading">Ordered Items</h3>
            <br>
            <table class="table-bordered">
                <thead>
                    <tr>
                        <th>Product Name</th>
                        <th class="w-20">Price: </th>
                        <th class="w-20">Quantity</th>
                        <th class="w-20">Grandtotal</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($order->orderItems as $item)
                    <tr>
                        <td>{{$item->product->name}}</td>
                        <td>${{$item->price}}</td>
                        <td>{{$item->quantity}}</td>
                        <td>${{$order->subtotal}}</td>
                    </tr>
                    @endforeach
                    <tr>
                        <td colspan="3" class="text-right">Sub Total</td>
                        <td> ${{$order->subtotal}}</td>
                    </tr>
                    <tr>
                        <td colspan="3" class="text-right">Tax</td>
                        <td> ${{$order->tax}}</td>
                    </tr>
                    <tr>
                        <td colspan="3" class="text-right">Shipping</td>
                        <td> Free Shipping</td>
                    </tr>
                    <tr>
                        <td colspan="3" class="text-right">Grand Total</td>
                        <td> ${{$order->total}}</td>
                    </tr>
                </tbody>
            </table>
            <br>
            <h3 class="heading">Payment Status: {{$order->transactions->status}}</h3>
            <h3 class="heading">Payment Mode: {{$order->transactions->mode}}</h3>
        </div>

        <div class="body-section">
            <p>&copy; Copyright 2024 - Heer-Sare. All rights reserved.
                <a href="http://127.0.0.1:8000" class="float-right">www.Heer-sare.com</a>
            </p>
        </div>
    </div>

</body>
</html>
