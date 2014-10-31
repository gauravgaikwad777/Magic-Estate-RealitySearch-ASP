<%@ Page Title="" Language="C#" MasterPageFile="~/MagicEstate.Master" AutoEventWireup="true" CodeBehind="Confirmation.aspx.cs" Inherits="Assign5.Confirmation" %>
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
            <asp:Button ID="SignOut" class="myButton" runat="server" Text="Sign Out" OnClick="SignOut_Click" /><br /><br />
            <asp:Button ID="Button1" class="myButton" runat="server" Text="Post Property Advertise" OnClick="Button1_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" class="myButton" runat="server" Text="Search Property" OnClick="Button2_Click" /><br/><br/>
            <h1>Profile Information</h1>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <asp:Button ID="Edit" class="myButton" runat="server" Text="Edit Profile" OnClick="Edit_Click" />
        </div>

         </div></center>
        </form>
    </body>
    </html>
</asp:Content>
