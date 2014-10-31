<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Assign5.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
        }

        .auto-style3 {
            width: 627px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button2" runat="server" Text="Sign In" OnClick="Button2_Click" CausesValidation="false" />
            <h1>Sign Up</h1>
            <table>
                <tr>
                    <td class="auto-style2">First Name</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="TextBox1" ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Mandatory"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Last Name</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="TextBox2" ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Mandatory"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">User Name</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        &nbsp;<asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        <asp:RequiredFieldValidator ControlToValidate="TextBox3" ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Mandatory"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">Password</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox4" TextMode="Password" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="TextBox4" ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Mandatory"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ControlToValidate="TextBox4" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Password must be atleast 6 character long" ValidationExpression="^.{6,}$"></asp:RegularExpressionValidator>

                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">Confirm Password</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox5" TextMode="Password" runat="server">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="TextBox5" ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Mandatory"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ControlToValidate="TextBox5" ID="RegularExpressionValidator2" runat="server" ErrorMessage="Password must be atleast 6 character long" ValidationExpression="^.{6,}$"></asp:RegularExpressionValidator>
                        <asp:CompareValidator ControlToValidate="TextBox5" ControlToCompare="TextBox4" ID="CompareValidator1" runat="server" ErrorMessage="Password does not match"></asp:CompareValidator>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">Email ID</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="TextBox6" ID="RequiredFieldValidator6" runat="server" ErrorMessage="*Mandatory"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ControlToValidate="TextBox6" ID="RegularExpressionValidator3" runat="server" ErrorMessage="RegularExpressionValidator" ValidationExpression="^[\.\w\-]{2,}@[\.\w\-]+(\.\w\-)*\.(com|org|net|edu)$"></asp:RegularExpressionValidator>

                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">Security Question</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="TextBox7" ID="RequiredFieldValidator7" runat="server" ErrorMessage="*Mandatory"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">Security Answer</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="TextBox8" ID="RequiredFieldValidator8" runat="server" ErrorMessage="*Mandatory"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">Category of Interest</td>
                    <td class="auto-style3">
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem Value="All" Selected="True"></asp:ListItem>
                            <asp:ListItem Value="Properties of Bloomington Normal"></asp:ListItem>
                            <asp:ListItem Value="Farm Land">Farm Land</asp:ListItem>
                            <asp:ListItem Value="Residential Properties"></asp:ListItem>
                            <asp:ListItem Value="Commercial Land"></asp:ListItem>
                            <asp:ListItem Value="Recreation Land"></asp:ListItem>

                        </asp:DropDownList>

                    </td>
                </tr>


                <tr>
                    <td class="auto-style2">Cost</td>
                    <td class="auto-style3">Minimum
                        <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ControlToValidate="TextBox9" ID="RegularExpressionValidator4" runat="server" ErrorMessage="Please enter number" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>

                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>

                        <br />

                        Maximum<asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ControlToValidate="TextBox10" ID="RegularExpressionValidator5" runat="server" ErrorMessage="Please enter number" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>

                        <asp:Label ID="Label3" runat="server" Text=""></asp:Label>

                        <br />

                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">Size</td>
                    <td class="auto-style3">Minimum&nbsp;
                        <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>


                        <asp:RegularExpressionValidator ControlToValidate="TextBox11" ID="RegularExpressionValidator6" runat="server" ErrorMessage="Please enter number" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
                        <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                        <br />


                        Maximum
                        <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ControlToValidate="TextBox12" ID="RegularExpressionValidator7" runat="server" ErrorMessage="Please enter number" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
                        <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
        </table>
</div>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Create Account" OnClick="Button1_Click" />
    </form>
</body>
</html>
