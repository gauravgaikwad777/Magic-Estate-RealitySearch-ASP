<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StockQuote.aspx.cs" Inherits="Assign5.StockQuote" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
      <div>
            <div>
                <asp:ScriptManager ID="Manager1" runat="server"></asp:ScriptManager>
                <asp:Timer ID="Timer1" runat="server" Interval="30000" OnTick="Timer1_Tick"></asp:Timer>
                <asp:MultiView EnableTheming="false" ID="MultiView1" ActiveViewIndex="0" runat="server">
                    <asp:View ID="View1" runat="server">
                        <asp:LinkButton ID="LinkButton2" runat="Server" Text="<< Back" OnClick="lnkBack_Click2"></asp:LinkButton>
                        <strong><center><font color="660000"><h2 class="auto-style1">Stock Web Service Application</h2></font></center></strong><br />

                        <table style="margin: 0 auto;">
                            <tr>
                                <td>Enter Stock:
                        <asp:TextBox ID="Yelpid" runat="server" ></asp:TextBox>&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button1" runat="server" Text="Get" OnClick="Button1_Click" Width="57px" />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                       <asp:LinkButton ID="lnkBack" runat="Server" Text="<< Back" OnClick="lnkBack_Click"></asp:LinkButton>
                         <table style="margin: 0 auto;">
                           
                            <tr>
                                <td style="margin-left: 30px;">&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                </td>

                            </tr>
                        </table>

                    </asp:View>
                </asp:MultiView>
            </div>
        </div>
    </form>
</body>
</html>
