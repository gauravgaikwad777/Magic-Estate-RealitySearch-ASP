<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Assign5.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        $('[placeholder]').focus(function () {
            var input = $(this);
            if (input.val() == input.attr('placeholder')) {
                input.val('');
                input.removeClass('placeholder');
            }
        }).blur(function () {
            var input = $(this);
            if (input.val() == '' || input.val() == input.attr('placeholder')) {
                input.addClass('placeholder');
                input.val(input.attr('placeholder'));
            }
        }).blur();

    </script>
    </head>
<body>
    <form id="form1" runat="server" defaultfocus="TextBox1">
        <div>
            <a href="Default.aspx">Home</a>
            <h1>Central Login</h1>

            <table style="width: 295px">
                <tr>

                    <td>
                        <asp:TextBox Width="100%" placeholder="User Name" ID="TextBox1" runat="server" ></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="TextBox1" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter your User Name here" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>

                    <td>
                        <asp:TextBox Width="100%" TextMode="Password" placeholder="Password" ID="TextBox2" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="TextBox2" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter your Password here" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator><br/>
                        <asp:RegularExpressionValidator ControlToValidate="TextBox2" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Password must be atleast 6 character long" ValidationExpression="^.{6,}$"></asp:RegularExpressionValidator>

                    </td>
                </tr>
                
                <tr>
                    <td>
                        <asp:Button Width="100%" ID="Button1" runat="server" Text="Sign In" OnClick="Button1_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button CausesValidation="false" Width="100%" ID="Button2" runat="server" Text="Sign Up" OnClick="Button2_Click" />
                    </td>
                </tr>


            </table>

        </div>

    </form>
</body>
</html>
