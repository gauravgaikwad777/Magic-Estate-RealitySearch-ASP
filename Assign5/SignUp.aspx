<%@ Page Language="C#" MasterPageFile="~/MagicEstate.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Assign5.SignUp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title></title>
        <script type="text/javascript">
            function RefreshUpdatePanel() {
                __doPostBack('up1', ''); // force a postback
            };
        </script>
    </head>
    <body>

        <form id="form1" runat="server">
            <center>
            <div class="newframe" style="width:700px">
            <div><div style="float:left; width: 436px;">
                <asp:Button ID="back" class="myButton" runat="server" Text="Back" OnClick="back_Click" CausesValidation="false"></asp:Button>
            &nbsp;<asp:Button ID="Button2" class="myButton" runat="server" Text="Sign In" OnClick="Button2_Click" CausesValidation="false" />&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label6" runat="server" Text=""></asp:Label></div>
                <div style="float:right"><asp:Button Class="myButton" ID="Button3" runat="server" Text="Sign Out" OnClick="Button3_Click" CausesValidation="false"/></div>
                <br/><br/><asp:Panel ID="Panel1" runat="server"></asp:Panel>
            <h1 class="text">Sign Up</h1><br/>
                <h6>*Every entry is </h6>
                    
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

            <table class="text">
                <tr>
                    <td  class="text" style="width: 148px">First Name</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox1" CssClass="glyphicon-star" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="TextBox1" ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" style="width: 148px">Last Name</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="TextBox2" ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>


                
                <tr>
                    <td>
                        
    User Name </td>
                    <td class="auto-style1">
                        <div style="float:left"><asp:TextBox runat="server" id="TextBox3" OnTextChanged="Username_Changed" /></div>
                        <asp:UpdatePanel runat="server" ID="up1" ChildrenAsTriggers="True">
 <%-- <ContentTemplate>
    <div runat="server" id="UserAvailability" style="float:right"></div>
  </ContentTemplate>--%>
<%--onkeyup="RefreshUpdatePanel();"--%>

            <ContentTemplate>
                <asp:Label ID="UserAvailability" runat="server" Text=""></asp:Label>
            </ContentTemplate>
            <Triggers>
        <asp:AsyncPostBackTrigger ControlID="TextBox3" />
    </Triggers>
    

</asp:UpdatePanel>
                        <asp:RequiredFieldValidator ControlToValidate="TextBox3" ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>

                </tr>

                <tr>
                    <td class="auto-style2" style="width: 148px">Password</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox4" TextMode="Password" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="TextBox4" ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ControlToValidate="TextBox4" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Atleast 6 character long" ValidationExpression="^.{6,}$"></asp:RegularExpressionValidator>

                    </td>
                </tr>

                <tr>
                    <td class="auto-style2" style="width: 148px">Confirm Password</td>
                    <td class="auto-style1">
                        <div style="float:left"><asp:TextBox ID="TextBox5" TextMode="Password" runat="server"> </asp:TextBox></div>
                        <div style="float:right">
                        <asp:RequiredFieldValidator ControlToValidate="TextBox5" ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>

                        <asp:CompareValidator ControlToValidate="TextBox5" ControlToCompare="TextBox4" ID="CompareValidator1" runat="server" ErrorMessage="Password does not match"></asp:CompareValidator>
                        <asp:RegularExpressionValidator ControlToValidate="TextBox5" ID="RegularExpressionValidator2" runat="server" ErrorMessage="Atleast 6 character" ValidationExpression="^.{6,}$"></asp:RegularExpressionValidator>
                    </div>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2" style="width: 148px">Email ID</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="TextBox6" ID="RequiredFieldValidator6" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ControlToValidate="TextBox6" ID="RegularExpressionValidator3" runat="server" ErrorMessage="Please enter a valid email id" ValidationExpression="^[\.\w\-]{2,}@[\.\w\-]+(\.\w\-)*\.(com|org|net|edu|in)$"></asp:RegularExpressionValidator>

                    </td>
                </tr>

                <tr>
                    <td class="auto-style2" style="width: 148px">Security Question</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="TextBox7" ID="RequiredFieldValidator7" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2" style="width: 148px">Security Answer</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="TextBox8" ID="RequiredFieldValidator8" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2" style="width: 148px">Category of Interest</td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem Value="All" Selected="True"></asp:ListItem>
                            <asp:ListItem Value="Farm Land">Farm Land</asp:ListItem>
                            <asp:ListItem Value="Residential Properties"></asp:ListItem>
                            <asp:ListItem Value="Commercial Land"></asp:ListItem>
                            <asp:ListItem Value="Recreation Land"></asp:ListItem>

                        </asp:DropDownList>

                    </td>
                </tr>


                <tr>
                    <td class="auto-style2" style="width: 148px">Cost</td>
                    <td class="auto-style1">Minimum
                        <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ControlToValidate="TextBox9" ID="RegularExpressionValidator4" runat="server" ErrorMessage="Please enter number" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="TextBox9" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>

                        <br />

                        Maximum<asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="TextBox10" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ControlToValidate="TextBox10" ID="RegularExpressionValidator5" runat="server" ErrorMessage="Please enter number" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>

                        <asp:Label ID="Label3" runat="server" Text=""></asp:Label>

                        <br />

                    </td>
                </tr>

                <tr>
                    <td class="auto-style2" style="width: 148px">Size</td>
                    <td class="auto-style1">Minimum&nbsp;
                        <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="TextBox11" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>


                        <asp:RegularExpressionValidator ControlToValidate="TextBox11" ID="RegularExpressionValidator6" runat="server" ErrorMessage="Please enter number" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
                        <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                        <br />


                        Maximum
                        <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="TextBox11" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ControlToValidate="TextBox12" ID="RegularExpressionValidator7" runat="server" ErrorMessage="Please enter number" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
                        <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
        </table>
</div>
        <br />
                <center>
        <asp:Button ID="Button1" class="myButton" runat="server" Text="Create Account" OnClick="Button1_Click" />
        </center>
 
    
 </div></center>
            </asp:Panel>
        </form>
    </body>
    </html>
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="cp_Head">
    <style type="text/css">
        .auto-style1 {
            width: 460px;
        }
    </style>
</asp:Content>

