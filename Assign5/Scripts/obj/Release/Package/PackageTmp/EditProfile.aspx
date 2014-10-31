<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="Assign5.EditProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 124px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="back" runat="server" Text="Back" Width="79px" OnClick="back_Click" />
            &nbsp;&nbsp;&nbsp;  
            <asp:Button ID="SignOut" runat="server" Text="Sign Out" OnClick="SignOut_Click" Width="79px" />
            <h1>Edit Profile</h1>
            <table>
                <tr>
                    <td class="auto-style2">User Name</td>
                    <td>
                        <asp:TextBox ID="TextBox3" Enabled="false" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="TextBox3" ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Mandatory"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">First Name</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="TextBox1" ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Mandatory"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Last Name</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="TextBox2" ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Mandatory"></asp:RequiredFieldValidator>
                    </td>
                </tr>


                <tr>
                    <td class="auto-style2">Password</td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ControlToValidate="TextBox4" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Password must be atleast 6 character long" ValidationExpression="^.{6,}$"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ControlToValidate="TextBox4" ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Mandatory"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">Confirm Password</td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server">
                        </asp:TextBox><asp:RegularExpressionValidator ControlToValidate="TextBox5" ID="RegularExpressionValidator2" runat="server" ErrorMessage="RegularExpressionValidator" ValidationExpression="^.{6,}$"></asp:RegularExpressionValidator>
                        <asp:CompareValidator ControlToValidate="TextBox5" ControlToCompare="TextBox4" ID="CompareValidator1" runat="server" ErrorMessage="Password does not match"></asp:CompareValidator>
                        <asp:RequiredFieldValidator ControlToValidate="TextBox5" ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Mandatory"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">Email ID</td>
                    <td>
                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ControlToValidate="TextBox6" ID="RegularExpressionValidator3" runat="server" ErrorMessage="RegularExpressionValidator" ValidationExpression="^[\.\w\-]{2,}@[\.\w\-]+(\.\w\-)*\.(com|org|net|edu)$"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ControlToValidate="TextBox6" ID="RequiredFieldValidator6" runat="server" ErrorMessage="*Mandatory"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">Security Question</td>
                    <td>
                        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="TextBox7" ID="RequiredFieldValidator7" runat="server" ErrorMessage="*Mandatory"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">Security Answer</td>
                    <td>
                        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="TextBox8" ID="RequiredFieldValidator8" runat="server" ErrorMessage="*Mandatory"></asp:RequiredFieldValidator>
                    </td>
                </tr>

            </table>

        </div>
        <br />
        <div>
            <asp:Button ID="Button1" runat="server" Text="Save Changes" OnClick="Button1_Click" />

        </div>
    </form>
</body>
</html>
