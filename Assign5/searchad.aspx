<%@ Page Title="" Language="C#" MasterPageFile="~/MagicEstate.Master" AutoEventWireup="true" CodeBehind="searchad.aspx.cs" Inherits="Assign5.searchad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    
</head>
<body>
    <form id="form1" runat="server">
        <center>
            <div class="newframe" style="width:1100px">
    <div>
        <asp:Button class="myButton" ID="Button2" runat="server" Text="Back" OnClick="Button2_Click" CausesValidation="false"/>
    <asp:Button class="myButton" ID="Button4" CausesValidation="false" runat="server" OnClick="Button4_Click" Text="Sign Out"  />
        
        <asp:Button class="myButton" ID="Refresh" runat="server" Text="Refresh" OnClick="Refresh_Click" />
        
            <h2 >
       
        Search For Items Here!</h2>
            <table>

                <tr>
                    <td>Category of Interest</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" >
                            
                            <asp:ListItem Value="All"></asp:ListItem>
                            <asp:ListItem Value="Farm Land">Farm Land</asp:ListItem>
                            <asp:ListItem Value="Residential Properties"></asp:ListItem>
                            <asp:ListItem Value="Commercial Land"></asp:ListItem>
                            <asp:ListItem Value="Recreation Land"></asp:ListItem>
                        </asp:DropDownList>
                        
                    </td>
                </tr>
                 
                <tr>
                    <td class="auto-style1" >Title</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Width="208px" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Cost</td>
                    <td>
                        Minimum <asp:TextBox ID="TextBox9" runat="server" Width="128px" ></asp:TextBox>
                        <asp:RegularExpressionValidator ControlToValidate="TextBox9" ID="RegularExpressionValidator4" runat="server" ErrorMessage="Please enter number" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
                        <br />

                        Maximum 
                        <asp:TextBox ID="TextBox10" runat="server" Width="122px"></asp:TextBox>
                        <asp:RegularExpressionValidator ControlToValidate="TextBox10" ID="RegularExpressionValidator5" runat="server" ErrorMessage="Please enter number" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>

                        <asp:Label ID="Label4" runat="server" Text=""></asp:Label>

                        <br />

                    </td>
                </tr>

                 <tr>
                    <td class="auto-style2">Size</td>
                    <td>
                     
                        Minimum <asp:TextBox ID="TextBox11" runat="server" Width="126px"></asp:TextBox>
                        
                        
                        <asp:RegularExpressionValidator ControlToValidate="TextBox11" ID="RegularExpressionValidator6" runat="server" ErrorMessage="Please enter number" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
                        <br />
                        
                        
                        Maximum <asp:TextBox ID="TextBox12" runat="server" Width="121px"></asp:TextBox>
                        <asp:RegularExpressionValidator ControlToValidate="TextBox12" ID="RegularExpressionValidator7" runat="server" ErrorMessage="Please enter number" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
                       
                           <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                       
                           </td>
                </tr>
</table>
      <br />
            
       <asp:Button ID="Button3" class="myButton" runat="server" Text="Search !" OnClick="Button3_Click" />
            
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="" CssClass="CSSTableGenerator"></asp:Label>
    
     
   </div>
    

                </div></center>
        </form>
    </body>
    </html>
</asp:Content>
