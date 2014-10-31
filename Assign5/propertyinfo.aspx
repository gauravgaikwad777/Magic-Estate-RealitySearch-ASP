<%@ Page Title="" Language="C#" MasterPageFile="~/MagicEstate.Master" AutoEventWireup="true" CodeBehind="propertyinfo.aspx.cs" Inherits="Assign5.propertyinfo" %>

<asp:Content ContentPlaceHolderID="cp_Head"
    runat="server">
    <link href="Content/css/magic.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #map-canvas {
            height: 500px;
        }
        .auto-style1 {
            width: 174px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    
    <script type="text/javascript"
        src="https://maps.googleapis.com/maps/api/js?sensor=true&key=AIzaSyAB7Ic6u_WlYzgookptRK8UhT55_5dm94E">
    </script>
    <script type="text/javascript">
        var geocoder, map;
        function initialize(address) {
            geocoder = new google.maps.Geocoder();

            var mapOptions = {
                center: new google.maps.LatLng(-34.397, 150.644),
                zoom: 16,
                mapTypeId: google.maps.MapTypeId.SATELLITE
            };
            map = new google.maps.Map(document.getElementById("map-canvas"),
                mapOptions);
            codeAddress(address);
        }


        function codeAddress(address) {
            geocoder.geocode({ 'address': address }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    map.setCenter(results[0].geometry.location);
                    var marker = new google.maps.Marker({
                        map: map,
                        position: results[0].geometry.location
                    });
                } else {
                    
                }
            });
        }

       
    </script>
    <form runat="server">

        <center>
            <div class="newframe" style="width:1000px">
                <asp:Button ID="back" class="myButton" runat="server" Text="Back" OnClick="back_Click"></asp:Button><br/><br/>
    <center>
                <table >
                    <tr>
                    <td style="width:50%">
                    
                <div>
        <h1><strong>Property Information</strong></h1><br />
      
       
        <asp:Label ID="Labelproperty" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        
    </div>
                </td>
        
                

                <td style="width:50%">
                    <center>
                <table>
                <tr>
                    <td>
                        <div>
                            <h1>Location</h1><br/>
                            
                                <div id="map-canvas" style="width: 400px; height: 600px; color:black; border-radius:20px; border:2px solid black"></div>
                            
                        </div>
                    </td>
                    <td>
                        <asp:Label ID="lblZillowData" runat="server" style="color:black; font-weight:bold;" BackColor="Black"></asp:Label>

                    </td>
                </tr>
            </table>
                        </center>
                </td>
                </tr>
                </table>
        </center>
                <br/>
                <asp:Button ID="Button1" class="myButton" runat="server" Text="Add to Cart" OnClick="Button1_Click"></asp:Button>
                    </div></center>

              
        <center>
        <table>
            <tr>
        <td>
                <div class="newframe" >
            <table style="margin: auto; ">
                <tr>
                    <td>
                        <div id="form-main">
                            <h3>Request For More Information</h3>
                            <div id="form-div">
                                <p class="name">
                                    
                                    <asp:TextBox placeholder="Name" name="name" ID="name" class="validate[required,custom[onlyLetter],length[0,100]] feedback-input" runat="server"></asp:TextBox>
                                </p>

                                <p class="email">
                                    
                                    <asp:TextBox name="email" ID="email" placeholder="Email" class="validate[required,custom[email]] feedback-input" runat="server"></asp:TextBox>
                                </p>

                                <p >
                                    <asp:TextBox ID="comment" runat="server" placeholder="Request Information" TextMode="MultiLine" Height="131px" Width="305px"></asp:TextBox>
                                    
                                </p>


                                <div class="submit">
                                    
                                    <asp:Button runat="server" CssClass="myButton" Text="Request" OnClick="buttonblue_Click" ID="buttonblue" />
                                    <div class="ease"></div>
                                </div>
                            </div>
                        </div>
                    </td>
                    
                </tr>
                </table>
            


                    <%--FORM--%>


        </div>
        </td>
        <td>
        <div class="newframe"  >


            <table style="margin: auto; ">
                <tr>
                    <td>
                        <div id="Div1">
                            <h3>Schedule Appointment</h3>
                            <div id="Div2">
                               <table>
                                <tr>
                                <td style="width:200px;">
                                 <p >
                                    <asp:TextBox placeholder="Name" ID="name_sche" runat="server"></asp:TextBox>
                                    
                                </p>

                                <p >
                                    <asp:TextBox placeholder="Email" ID="email_sche" runat="server"></asp:TextBox>
                                    
                                </p>

                                <p >
                                    <asp:TextBox ID="subject" placeholder="Subject" runat="server"></asp:TextBox>
                                    
                                </p>

                                    <p>
                                        <asp:DropDownList ID="time_sche" runat="server">
                                            <asp:ListItem Value="Select Time"></asp:ListItem>
                                            <asp:ListItem Value="9 AM"></asp:ListItem>
                                            <asp:ListItem Value="10 AM"></asp:ListItem>
                                            <asp:ListItem Value="11 AM"></asp:ListItem>
                                            <asp:ListItem Value="12 PM"></asp:ListItem>
                                            <asp:ListItem Value="1 PM"></asp:ListItem>
                                            <asp:ListItem Value="2 PM"></asp:ListItem>
                                            <asp:ListItem Value="3 PM"></asp:ListItem>
                                            <asp:ListItem Value="4 PM"></asp:ListItem>
                                        </asp:DropDownList>
                                        </p>
                                </td>
                    <td>
                                <p>
                                    <asp:Calendar ID="Calendar1" runat="server" OnDayRender="Calendar1_DayRender" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="73px" NextPrevFormat="FullMonth" Width="158px" >
                                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                        <OtherMonthDayStyle ForeColor="#999999" />
                                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                        <TodayDayStyle BackColor="#CCCCCC" />
                                    </asp:Calendar>
                                    </p>
                                </td>
                    </tr>
                                </table>
                                <div>
                                    
                                    <asp:Button runat="server" class="myButton" Text="Schedule Appointment" ID="scheduleapp" EnableViewState="false" OnClick="scheduleapp_Click"  />
                                    
                                </div>
                            </div>
                        </div>
                    </td>
                    
                </tr>
                </table>
            

            </div>
        </td>
        </tr>
        </table>
        </center>
        <br/>






        


    </form>

</asp:Content>
