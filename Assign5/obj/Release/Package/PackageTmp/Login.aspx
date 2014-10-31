

<%@ Page Title="" Language="C#" MasterPageFile="~/MagicEstate.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Assign5.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head >
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
        <center>
            <div class="newframe" style="width:300px; text-align:center; flex-item-align:center" onfocus="TextBox1">


        <div>
            

            <h1>Central Login</h1>
            <br/><br/>
            <table>
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
                        <asp:RegularExpressionValidator ControlToValidate="TextBox2" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Atleast 6 character long" ValidationExpression="^.{6,}$"></asp:RegularExpressionValidator>

                    </td>
                </tr>
                
                <tr>
                    <td>
                        <asp:Button Width="100%" class="myButton" ID="Button1" runat="server" Text="Sign In" OnClick="Button1_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button CausesValidation="false" class="myButton" Width="100%" ID="Button2" runat="server" Text="Sign Up" OnClick="Button2_Click" />
                        <br />
                       
                        <asp:LinkButton ID="LinkButtonforgot" CausesValidation="false" runat="server" OnClick="LinkButtonforgot_Click">Forgot Password?</asp:LinkButton>
                    </td>
                </tr>


            </table>

            <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
            <br />

        </div>
              </div>  </center>
    </form>
</body>
</html>
</asp:Content>