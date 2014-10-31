<%@ Page Title="" Language="C#" MasterPageFile="~/MagicEstate.Master" AutoEventWireup="true" CodeBehind="chechkout.aspx.cs" Inherits="Assign5.chechkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 237px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <center>
            <div class="newframe" style="width:700px">


<asp:Button class="myButton" ID="Button2" runat="server" Text="Back" CausesValidation="false" OnClick="Button2_Click"/>
    <div>
    <center>
        <h1>Checkout</h1></center>
        <p>
            <table style="width:100%">
                <tr>
                    <td class="auto-style1">Full Name</td>

                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Width="210px"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextBox1" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Address Line 1</td>
                    
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" Width="214px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TextBox2" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Address Line 2</td>
                
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" Width="213px"></asp:TextBox>
                    </td>
                </tr>
                  <tr>
                    <td class="auto-style1">City</td>
                
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server" Width="214px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TextBox4" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                      </td>
                </tr>
                  <tr>
                    <td class="auto-style1">State/Province/Region</td>
                
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server" Width="211px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TextBox5" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                      </td>
                </tr>
                  <tr>
                    <td class="auto-style1">ZIP</td>
                
                    <td>
                        <asp:TextBox ID="TextBox6" runat="server" Width="214px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="TextBox6" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="TextBox6" runat="server" ErrorMessage="Invalid" ValidationExpression="^([\d]{5})+([-]+([\d]{4}))?$"></asp:RegularExpressionValidator>
                      </td>
                </tr>
                  <tr>
                    <td class="auto-style1">Country</td>
                
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" Width="218px">
                            <asp:ListItem>Select Your Country</asp:ListItem>
                            <asp:ListItem>USA</asp:ListItem>
                            <asp:ListItem>India</asp:ListItem>
                            <asp:ListItem>Malaysia</asp:ListItem>
                            <asp:ListItem>China</asp:ListItem>
                            <asp:ListItem>Thailand</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="DropDownList1" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                      </td>
                </tr>
                  <tr>
                    <td class="auto-style1">Phone Number</td>
                
                    <td>
                        <asp:TextBox ID="TextBox7" runat="server" Width="217px"></asp:TextBox>
                      </td>
                </tr>
                  <tr>
                    <td class="auto-style1">Credit Card Number:</td>
                
                    <td>
                        <asp:TextBox ID="TextBox8" runat="server" Width="219px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="TextBox8" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="TextBox8" runat="server" ErrorMessage="Invalid" ValidationExpression="^3[47][0-9]{13}$|^5[1-5][0-9]{14}$|^4[0-9]{12}$|^4[0-9]{15}$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
        </p>
        <div style="float:right">
        <asp:Label ID="lbltotalcost" runat="server" BorderColor="Black" BorderStyle="Solid" ></asp:Label><br/><br/>
            <asp:Button ID="shipButton" class="myButton" runat="server" Text="Confirm Order" Width="180px" OnClick="shipButton_Click" />
       </div>
             <br />
        </div><br />
        
    
                </div></center>
                </form>
</body>
</html>
    </asp:Content>