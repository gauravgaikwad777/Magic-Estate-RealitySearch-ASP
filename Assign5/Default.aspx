<%@ Page Title="" Language="C#" MasterPageFile="~/MagicEstate.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Assign5.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div id="navigation">

         <h1 style="font-size: 35px">Featured Properties</h1>
        
        </div>
       <ul class="slides" id="slider">
    <input type="radio" name="radio-btn" id="img-1" checked="checked" />
    <li class="slide-container" >
		<div class="slide">
			<a href="propertyinfo.aspx?property_id=1000"><img style="padding:0px -30px 0px 0px" src="images/watterson.jpg" /></a>
        </div>
		<div class="nav">
			<label for="img-6" class="prev">&#x2039;</label>
			<label for="img-2" class="next">&#x203a;</label>
		</div>
    </li>

    <input type="radio" name="radio-btn" id="img-2" />
    <li class="slide-container">
        <div class="slide">
          <a href="propertyinfo.aspx?property_id=1001"><img style="padding:0px -30px 0px 0px" src="images/ban1.jpg" /></a>
        </div>
		<div class="nav">
			<label for="img-1" class="prev">&#x2039;</label>
			<label for="img-3" class="next">&#x203a;</label>
		</div>
    </li>

    <input type="radio" name="radio-btn" id="img-3" />
    <li class="slide-container">
        <div class="slide">
          <a href="propertyinfo.aspx?property_id=1005"><img style="padding:0px -30px 0px 0px" src="images/prop.jpg" /></a>
        </div>
		<div class="nav">
			<label for="img-2" class="prev">&#x2039;</label>
			<label for="img-4" class="next">&#x203a;</label>
		</div>
    </li>

    <input type="radio" name="radio-btn" id="img-4" />
    <li class="slide-container">
        <div class="slide">
          <a href="propertyinfo.aspx?property_id=1006"><img style="padding:0px -30px 0px 0px" src="images/farm.jpg" /></a>
        </div>
		<div class="nav">
			<label for="img-3" class="prev">&#x2039;</label>
			<label for="img-5" class="next">&#x203a;</label>
		</div>
    </li>

    <input type="radio" name="radio-btn" id="img-5" />
    <li class="slide-container">
        <div class="slide" >
          <a href="propertyinfo.aspx?property_id=1007"><img style="padding:0px -30px 0px 0px" src="images/ou.jpg" /></a>
        </div>
		<div class="nav">
			<label for="img-4" class="prev">&#x2039;</label>
			<label for="img-6" class="next">&#x203a;</label>
		</div>
    </li>

    <input type="radio" name="radio-btn" id="img-6" />
    <li class="slide-container">
        <div class="slide">
          <a href="propertyinfo.aspx?property_id=1002"><img style="padding:0px -30px 0px 0px" src="images/shop1.jpg" /></a>
        </div>
		<div class="nav">
			<label for="img-5" class="prev">&#x2039;</label>
			<label for="img-1" class="next">&#x203a;</label>
		</div>
    </li>

    <li class="nav-dots">
      <label for="img-1" class="nav-dot" id="img-dot-1"></label>
      <label for="img-2" class="nav-dot" id="img-dot-2"></label>
      <label for="img-3" class="nav-dot" id="img-dot-3"></label>
      <label for="img-4" class="nav-dot" id="img-dot-4"></label>
      <label for="img-5" class="nav-dot" id="img-dot-5"></label>
      <label for="img-6" class="nav-dot" id="img-dot-6"></label>
    </li>
</ul>



    <center><h1 style="font-size: 15px">Click On Property to View</h1></center>



</asp:Content>
