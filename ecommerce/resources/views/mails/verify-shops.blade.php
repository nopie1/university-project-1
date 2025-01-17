
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Verify Shops</title>
</head>
<body>
        <h2>Hello Admin,</h2><br>
       Verify this Shop : {{ $verifyshop->name }}<br>
        Here are the details:<br>
        <b>Name:</b> {{ $verifyshop->name }}<br>
        <b>description:</b> {{ $verifyshop->description }}<br>
        <b style="text-decoration: underline;">Vendor Information</b><br>
            <b>Vendor Name:</b>{{$verifyshop->owner->name}}<br>
            <b>Vendor Email:</b>{{$verifyshop->owner->email}}<br><br>
        <a href="http://127.0.0.1:8000/admin/shops" style="background: blue; padding:10px; margin-top:20px; border-radius:20px; text-decoration:none; color:#fff; text-align:center;">Verify This Shop</a>
</body>
</html>