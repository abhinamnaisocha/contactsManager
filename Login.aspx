<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

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
   
   <title>Contacts Login</title>
   
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
    <div id="lblwidth"></div>
    
        <header class="mainheader">
            <div class="container-fluid text-center">
                <h1 >LoL Contact Manager</h1>
                <p>A Place to keep your Contacts safe and secure</p>
            </div>   
       </header>
       <div class="container-fluid">
           <div class="row">
               <div class="col-xs-12">
    
    </div>
    </div>
    <div class="row" id="login_form">
     <div id="main" class="col-xs-12 col-xs-offset-0 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-4 col-lg-offset-4" style="background-color:#ececec;border-radius:4px;margin-top:20px;padding-bottom:5px;">
        
             <h2 class="text-center">Login</h2>
         <form id="form1" runat="server">
             <asp:Login id="Login1" runat="server" RenderOuterTable="false" OnAuthenticate="validateUser">
                <LayoutTemplate>
    <div class="form-group">
        <label for="inputEmail">User Name</label>
        <asp:Textbox class="form-control" id="UserName" runat="server" placeholder="Email"></asp:Textbox>       
        <asp:requiredfieldvalidator id="UserNameRequired" runat="server" ControlToValidate="UserName" Text="Required" ForeColor="Red"></asp:requiredfieldvalidator>

    </div>
    <div class="form-group">
        <label for="inputPassword">Password</label>
        <asp:textbox id="Password" runat="server" textMode="Password" class="form-control" placeholder="Password"></asp:textbox>
        <asp:requiredfieldvalidator id="PasswordRequired" runat="server" ControlToValidate="Password" Text="Required" ForeColor="Red"></asp:requiredfieldvalidator>

    </div>
    <div class="checkbox">
        <label><asp:Checkbox id="RememberMe" runat="server"></asp:Checkbox>Remember me</label>
    </div>
    <p style="color:red"><asp:Literal id="FailureText" runat="server"></asp:Literal></p>
    <asp:Button runat="server" CommandName="Login" class="btn btn-primary submitbutton" id="Login" Text="Login"></asp:Button>
                    </LayoutTemplate>
            </asp:Login>
             <p>Or <a href="Signup.aspx">Signup</a> </p>
</form>
       
     </div>
     </div>
     </div>
     <p></p>
     <p></p>
     <aside id="sidebar" class="container footer navbar-default navbar-bottom">
        <div class="row">
        <div class="col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-12 col-xs-offset-0">
             <h4 class="text-center">Social Links</h4>
                    <div class="col-sm-2 col-xs-2"> <a href="https://www.facebook.com"> <img src="Images/fbook.png" alt="facebook"></a> </div>
                    <div class="col-sm-2 col-xs-2""> <a href="https://www.twitter.com"> <img src="Images/twiter.png" alt="twitter"></a> </div>
               
                
                    <div class="col-sm-2 col-xs-2""> <a href="https://www.youtube.com"> <img src="Images/youtube.png" alt="youtube"></a> </div>
                    <div class="col-sm-2 col-xs-2""> <a href="https://www.linkedin.com"> <img src="Images/linkedin.jpg" alt="linkedin"></a> </div>
             
                    <div class="col-sm-2 col-xs-2""> <a href="https://www.yahoo.com"> <img src="Images/yahoo.jpg" alt="yahoo"></a> </div>
                    <div class="col-sm-2 col-xs-2""> <a href="https://www.gmail.com"> <img src="Images/google.png" alt="gplus"></a> </div>
        </div>
        </div>
     </aside>
   
    

   
</body>
</html>