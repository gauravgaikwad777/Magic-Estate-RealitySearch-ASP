<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="searchad.aspx.cs" Inherits="Assign5.searchad" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 123px;
        }
        </style>

</head>
<body style="margin-right: 0px; height: 824px;">
    <form id="form1" runat="server">
    <div style="font-family: Verdana, Geneva, Tahoma, sans-serif; color: #000000; font-style: normal; background-color: #FFFFFF; height: inherit;">
        
            &nbsp;&nbsp;
        
            <asp:Button ID="Button2" runat="server" Text="Back" OnClick="Button2_Click" CausesValidation="false" style="margin-left: 0px" Width="59px" />
        
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
            <asp:Button ID="Button4" CausesValidation="false" runat="server" OnClick="Button4_Click" Text="Sign Out" Width="63px" />
        
            <h2 style="margin-left: 6px">
       
        Search For Items Here!</h2>
            <table>

                <tr>
                    <td class="auto-style2" style="color: #000000">Category of Interest</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" >
                            
                            <asp:ListItem Value="All"></asp:ListItem>
                            
                            <asp:ListItem Value="Properties of Bloomington Normal"></asp:ListItem>
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
      <br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
       <asp:Button ID="Button3"  runat="server" Text="Search !" Width="202px" BackColor="Silver" ForeColor="Black" OnClick="Button3_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Refresh" runat="server" Text="Refresh" OnClick="Refresh_Click" />
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
    
            <br />
    <br />
    
    </div>
    </form>
</body>
</html>
