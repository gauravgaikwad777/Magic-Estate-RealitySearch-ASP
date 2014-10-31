<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registered.aspx.cs" Inherits="Assign5.Registered" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" method="get">
    <div>
   <h2> Congratulations, You have successfully Signed Up!!!</h2>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><br/>
        <asp:Button ID="Button1" runat="server" Text="Continue" OnClick="Button1_Click" />
    </div>
    </form>
</body>
</html>
