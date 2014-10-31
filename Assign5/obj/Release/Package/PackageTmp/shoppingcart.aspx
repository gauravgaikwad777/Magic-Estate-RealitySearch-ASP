<%@ Page Title="" Language="C#" MasterPageFile="~/MagicEstate.Master" AutoEventWireup="true" CodeBehind="shoppingcart.aspx.cs" Inherits="Assign5.shoppingcart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <title></title>
</head>
<body>
    
    
    <form id="form1" runat="server">
            
            <center>
            <div class="newframe" style="width:1000px">
        <div>
            <h1>Your Shopping Cart page !</h1><br/><br/>
            <asp:Label ID="Labelcart" runat="server" Text="" CssClass="CSSTableGenerator"></asp:Label>

            <br />

            <div style="float: right;">
                <asp:Label ID="lblCheckoutCost" runat="server" ></asp:Label>

            </div>
            <br /><br />
            <br /><br /><br />
            <div style="float: left;">

                <asp:Button ID="ContinueButton" class="myButton" runat="server" Text="Continue Shopping" OnClick="ContinueButton_Click" Width="229px" />
            </div>
            <div style="float: right;">
                <asp:Button ID="CheckoutButton" class="myButton" runat="server" Text="Checkout" OnClick="CheckoutButton_Click" /><br/><br/>
            </div>
        </div>
                <br/>
                <br/>


    </div></center>
        </form>
    </body>
    </html>
</asp:Content>
