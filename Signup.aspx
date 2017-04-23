<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Signup.aspx.cs" Inherits="Signup" %>

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
   
   <title>Contacts SignUp</title>
   
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
           
    <div class="row" id="login_form">
       <h2 class="text-center">Contacts Manager</h2>
     <div id="main" class="col-xs-12 col-xs-offset-0 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-4 col-lg-offset-4" style="background-color:#ececec;border-radius:4px;margin-top:20px;padding-bottom:5px;">
        
             <h2 class="text-center">Signup</h2>
         <form runat="server">
    <div class="form-group">
        <label for="inputUsername">UserName</label>
       <asp:Textbox ID="txtUsername" class="form-control" runat="server"/>
        <label><asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtUsername"
                runat="server" /></label>
    </div>
              <div class="form-group">
        <label for="pass">Password</label>
   <asp:TextBox ID="txtPassword" runat="server" class="form-control" TextMode="Password" />
        <label><asp:RequiredFieldValidator ID="RequiredFieldValidator2" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtPassword"
                runat="server" /></label>
    </div>
             <div class="form-group">
        <label for="confirmpass">Confirm Password</label>
            <asp:TextBox ID="txtConfirmPassword" runat="server" class="form-control" TextMode="Password" />
        <label><asp:CompareValidator ID="CompareValidator1" ErrorMessage="Passwords do not match." ForeColor="Red" ControlToCompare="txtPassword"
                ControlToValidate="txtConfirmPassword" runat="server" /></label>
    </div>
         <div class="form-group">
        <label for="inputPassword">Email</label>
 <asp:TextBox ID="txtEmail" class="form-control" runat="server" />
              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ErrorMessage="Required" Display="Dynamic" ForeColor="Red"
                ControlToValidate="txtEmail" runat="server" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid email address." />
         </div>
 <asp:Button Text="Submit" runat="server"   class="btn btn-primary submitbutton" ID="submitButton" OnClick="RegisterUser"/>
</form>
       
     </div>
     </div>
    
   
    <div class="row">
     <div id="main2" class="col-sm-12">
        
             <p>&nbsp;</p>
       
     </div>
     </div>
    </div>
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