<%@ Page Title="" Language="C#" MasterPageFile="~/MagicEstate.Master" AutoEventWireup="true" CodeBehind="forgotpass.aspx.cs" Inherits="Assign5.forgotpass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title></title>
    </head>
    <body>
        <form id="form1" runat="server" defaultfocus="TextBox1">
            <center>

            <div class="newframe" style="width:300px; text-align:center; flex-item-align:center" onfocus="TextBox1">


        <div style="float:left">
            <asp:Button ID="back" runat="server" Text="Back" class="myButton" OnClick="back_Click" ></asp:Button><br /></div><br/>
            <br />
                
           <center> <h1>Recover Your Password</h1></center>
                <p>
     
                    Username: <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
     <asp:RequiredFieldValidator ControlToValidate="TextBox1" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Mandatory"></asp:RequiredFieldValidator>
    </p>
            <p>
     
                <asp:Button ID="Button1" Width="100%" class="myButton" runat="server" OnClick="recover_Click" Text="Send via Mail" />
     
    </p>
            <p>
     
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
     
    </p>

 </div>
              </div> 
               
    </center>

        </form>
    </body>
    </html>




</asp:Content>
