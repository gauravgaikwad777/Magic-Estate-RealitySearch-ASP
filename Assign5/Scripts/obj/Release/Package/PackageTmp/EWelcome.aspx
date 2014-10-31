<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EWelcome.aspx.cs" Inherits="Assign5.EWelcome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Welcome to the Assignment 5 </h1>
            <br />
            <br />
            Submitted by:<br />
            Mohit Jain<br />
            Gaurav Gaikwad<br />
            <br />

            <h2>You Must Sign In / Sign Up first to access the application<br />
            </h2>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Sign In</asp:HyperLink><br />
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/SignUp.aspx">Sign Up</asp:HyperLink>
        </div>
    </form>
</body>
</html>
