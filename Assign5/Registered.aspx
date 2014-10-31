<%@ Page Title="" Language="C#" MasterPageFile="~/MagicEstate.Master" AutoEventWireup="true" CodeBehind="Registered.aspx.cs" Inherits="Assign5.Registered" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <title></title>
</head>
<body>
    <form id="form1" runat="server" method="get">
        <center>
            <div class="newframe" style="width:500px">
    <div>
   <h2> Congratulations, You have successfully Signed Up!!!</h2>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><br/>
        <asp:Button ID="Button1" class="myButton" runat="server" Text="Continue" OnClick="Button1_Click" />
    </div>
    </div></center>
        </form>
    </body>
    </html>
</asp:Content>
