<%@ Page Language="C#" MasterPageFile="~/MagicEstate.Master" AutoEventWireup="true" CodeBehind="Unsubscribe.aspx.cs" Inherits="Assign5.Unsubscribe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <form id="form1" runat="server">
 
    <br />
   




        <center>
            <div class="newframe" style="width:1000px">
                   
        <div>
            <h2 class="auto-style1">Please enter EmailId to unsubscribe from email list!</h2>
            <asp:Label ID="Labelcart" runat="server" Text=""></asp:Label>

            <br />

           
 <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
    <asp:Button class="myButton" ID="btnUnsubscribe" runat="server" Text="Unsubscribe" OnClick="btnUnsubscribe_Click" />
            </div>
 
         
        </div>



    </center>

    </form>


</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="cp_Head">
    <style type="text/css">
    .auto-style1 {
        font-weight: normal;
    }
</style>
</asp:Content>

