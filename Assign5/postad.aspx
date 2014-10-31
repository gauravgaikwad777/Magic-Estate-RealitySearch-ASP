<%@ Page Title="" Language="C#" MasterPageFile="~/MagicEstate.Master" AutoEventWireup="true" CodeBehind="postad.aspx.cs" Inherits="Assign5.postad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title></title>

        <style type="text/css">
            .auto-style1 {
                width: 477px;
            }

            .auto-style2 {
                width: 212px;
            }

            .auto-style3 {
                height: 150px;
            }

            .auto-style4 {
                float: left;
                height: 150px;
            }
        </style>
    </head>
    <body>
        <form id="form1" runat="server">
            <center>
            <div class="newframe" style="width:550px">
    <div>

    <h1>Post Property for Sale</h1><br/>        
        <asp:Button ID="Back" class="myButton" runat="server" Text="Back" OnClick="Back_Click" CausesValidation="false"></asp:Button><br/><br/>
        *Mandatory
            <table>
                <tr>
                    <td class="auto-style2" >Title*</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox1" runat="server" Width="208px" ></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="TextBox1" ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Mandatory"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                
                <tr>
                    <td class="auto-style2" >Description</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Height="61px" Width="208px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2" >Owner Email</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2" >Cost*</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ControlToValidate="TextBox3" ID="RegularExpressionValidator2" runat="server" ErrorMessage="Numric only" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
                     <asp:RequiredFieldValidator ControlToValidate="TextBox3" ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Mandatory"></asp:RequiredFieldValidator>

                    </td>
                </tr>


                <tr>
                    <td class="auto-style2" >Size (sqft)</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ControlToValidate="TextBox4" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Numric only" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ControlToValidate="TextBox4" ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Mandatory"></asp:RequiredFieldValidator>

                         </td>
                </tr>

                <tr>
                    <td class="auto-style3" >Category of Interest*</td>
                    <td style="grid-row-align:start;flex-align:start; " class="auto-style4" >
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" >
                            
                            <asp:ListItem Value="Farm Land">Farm Land</asp:ListItem>
                            <asp:ListItem Value="Residential Properties"></asp:ListItem>
                            <asp:ListItem Value="Commercial Land"></asp:ListItem>
                            <asp:ListItem Value="Recreation Land"></asp:ListItem>
                            <asp:ListItem Value="Other"></asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ControlToValidate="RadioButtonList1" ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Mandatory"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2" >Upload photo</td>
                    <td class="auto-style1">
                        <asp:FileUpload ID="uplPhoto" runat="server" ClientIDMode="Static"/>
                        <asp:Label ID="lblPhotoName" runat="server" Text="" ForeColor ="Green" ClientIDMode="Static"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2" >Summary</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox5" runat="server" TextMode="MultiLine" Height="42px" Width="215px"></asp:TextBox>
                    </td>
                </tr>

                

                <tr>
                    <td class="auto-style2" >Address</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox6" TextMode="MultiLine" runat="server"></asp:TextBox>
                    </td>
                </tr>

                

           </table>
        
                        <asp:CheckBox ID="CheckBox1" runat="server" Text="Send Me an Email Confirmation" />
                 
        <br/><br/>
        <asp:Button ID="Button1" class="myButton" runat="server" Text="Post Ad" OnClick="Button1_Click" />

    </div>
    </div></center>
        </form>
    </body>
    </html>

</asp:Content>
