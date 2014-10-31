<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirmation.aspx.cs" Inherits="Assign5.Confirmation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="SignOut" runat="server" Text="Sign Out" OnClick="SignOut_Click" /><br /><br />
            <asp:Button ID="Button1" runat="server" Text="Post a Ad" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="Search an Ad" OnClick="Button2_Click" />
            <h1>Profile Information</h1>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <asp:Button ID="Edit" runat="server" Text="Edit Profile" OnClick="Edit_Click" />
        </div>
    </form>
</body>
</html>
