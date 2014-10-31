<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="postad.aspx.cs" Inherits="Assign5.postad" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <style type="text/css">
        .auto-style1 {
            width: 477px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>

    <h1>Post Property for Sale</h1>
        *Mandatory
            <table>
                <tr>
                    <td >Title*</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox1" runat="server" Width="208px" ></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="TextBox1" ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Mandatory"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                
                <tr>
                    <td >Description</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Height="61px" Width="208px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >Cost*</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ControlToValidate="TextBox3" ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please enter number" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
                     <asp:RequiredFieldValidator ControlToValidate="TextBox3" ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Mandatory"></asp:RequiredFieldValidator>

                    </td>
                </tr>


                <tr>
                    <td >Size (sqft)</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ControlToValidate="TextBox4" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter number" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">Category of Interest*</td>
                    <td class="auto-style1">
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                            <asp:ListItem Value="Properties of Bloomington Normal"></asp:ListItem>
                            <asp:ListItem Value="Farm Land">Farm Land</asp:ListItem>
                            <asp:ListItem Value="Residential Properties"></asp:ListItem>
                            <asp:ListItem Value="Commercial Land"></asp:ListItem>
                            <asp:ListItem Value="Recreation Land"></asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ControlToValidate="RadioButtonList1" ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Mandatory"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td >Upload photo</td>
                    <td class="auto-style1">
                        <asp:FileUpload ID="uplPhoto" runat="server" ClientIDMode="Static"/>
                        <asp:Label ID="lblPhotoName" runat="server" Text="" ForeColor ="Green" ClientIDMode="Static"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td >Summary</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox5" runat="server" TextMode="MultiLine" Height="42px" Width="215px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:CheckBox ID="CheckBox1" runat="server" Text="Send Me an Email Confirmation" />
                    </td>
                </tr>

           </table>
        <br/>
        <asp:Button ID="Button1" runat="server" Text="Post Ad" OnClick="Button1_Click" />

    </div>
    </form>
</body>
</html>
