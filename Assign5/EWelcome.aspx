<%@ Page Title="" Language="C#" MasterPageFile="~/MagicEstate.Master" AutoEventWireup="true" CodeBehind="EWelcome.aspx.cs" Inherits="Assign5.EWelcome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <center>
            <div class="newframe" style="width:500px">
        <div>
            <h1>Welcome to Magic Estate Property Dealers</h1>
            <br />
            <br />
            

            <h2>You Must Sign In / Sign Up first to access the application<br />
            </h2>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="SignIn" class="myButton" runat="server" Text="Sign In" OnClick="SignIn_Click"></asp:Button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="SignUp" class="myButton" runat="server" Text="Sign Up" OnClick="SignUp_Click"></asp:Button><br/>
            
        </div>
    
    </div></center>
    </form>
</body>
</html>

     </asp:Content>
