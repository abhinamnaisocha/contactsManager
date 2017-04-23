<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signout.aspx.cs" Inherits="signout" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link href="Css/styles.css" rel="stylesheet" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
    <script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

    <title>Contacts Home</title>

    <script>
        var showWidth = 1;
        if (showWidth == 1) {

            $(document).ready(function () {
                $(window).resize(function () {
                    var width = $(window).width();
                    document.getElementById('lblwidth').innerHTML = "Browser-Width:" + width.toString();
                });
            });
        }

    </script>
</head>
<body>
    <header class="mainheader">
        <div class="container-fluid text-center">
            <h1>LoL Contact Manager</h1>
            <p>A Place to keep your Contacts safe and secure</p>

        </div>
    </header>
    <div class="container-fluid">

        <form id="form1" runat="server">
            <div class="row">
                <h3 class="col-xs-12">Signed Out <span class="text-success">successfully</span></h3>
                <h5 class="col-xs-12">Take me back to <a href="Login.aspx" class="text-danger">Login Page</a></h5>
            </div>
        </form>
    </div>
</body>
</html>
