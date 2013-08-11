﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<treasurehunter.Models.MyAppUser>" %>
<%@ Import Namespace="System.Data" %>  
<%@ Import Namespace="System.Data.SqlClient" %>  
<%@ Import Namespace="System.Configuration" %>  


<!DOCTYPE html>
<script runat="server">
    System.Net.WebClient webClient = new System.Net.WebClient();
    string mytoken = "";
    string permanenttoken = "";
    string tempstring = "";
    string myid = "";
    string receiptno = "";

protected void checkusername()
{
    Hiddenfield1.Value = Model.Name;
    if (Hiddenfield1.Value != null)
    {
       
    }
    else
    {
        Response.Redirect("http://apps.facebook.com/gullipilli");
    }
}

protected void Page_Load(object sender, EventArgs e)
{
    checkusername();
}

protected void Button1_Click(object sender, EventArgs e)
{
    //SqlDataSource1.Insert();
    DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
    DataTable dt = new DataTable();
    dt = dv.ToTable();

    //DataTable dtr = dt;
    //DataRow[] uniname = dtr.Select("tsname");
    Label1.Text = dt.Rows[0].Field<string>("tsname");
}
</script>


<html>
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width" />
    <title></title>
     <script type="text/javascript" src="http://code.jquery.com/jquery-2.0.0.min.js"></script> 
   

<script>

    var marginl = 0;
    var margint = 0;
    var checked = 0;

    var started = 0;
    var fired = 1;
    var enemyhits = 0;
    var currentl = 0;
    var currentt = 0;
    var myaddctrl = window.setTimeout(function () { addCtrl() }, 1000);

    function addCtrl() {
        if (started == 0) {
            var $ctrl = $('<img/>').attr({ id: 'ctrl1', src: 'Images/fplane.gif', style: 'width:80px; height:60px; position:relative; top: 307px; left: 247px; z-index: 2; right: 532px; visibility: visible: margin-left: 0px; margin-top: 0px' });
            $('#form1').append($ctrl);
            started = 1
        }
    }

    $(document).ready(function () {



        $(window).keydown(function (event) {



            if (event.which == 37) {

                //$('#viewer').addClass("twoto3d sidepan");

                $('#crosshair').css("left", "-=10");
                marginl = $('#crosshair').css("left");
            }

            if (event.which == 39) {

                //$('#viewer').addClass("twoto3d sidepan");

                $('#crosshair').css("left", "+=10");
                marginl = $('#crosshair').css("left");
            }

            if (event.which == 38) {

                //$('#viewer').addClass("twoto3d sidepan");

                $('#crosshair').css("top", "-=10");
                margint = $('#crosshair').css("top");
            }

            if (event.which == 40) {

                //$('#viewer').addClass("twoto3d sidepan");

                $('#crosshair').css("top", "+=10");
                margint = $('#crosshair').css("top");
            }

            if (event.which == 83) {

                //$('#viewer').addClass("twoto3d sidepan");
                if (fired == 1) {
                    $('#explosion').css("width", "50");
                    $('#explosion').css("height", "50");
                    $('#explosion').css("left", $('#crosshair').css("left"));
                    $('#explosion').css("top", $('#crosshair').css("top"));
                    $('#explosion').css("right", $('#crosshair').css("right"));
                    $('#explosion').css("visibility", "visible");
                    fired = 0;
                }

                var myaddctrl = window.setTimeout(function () { removeexplosion() }, 3000);
                if (fired == 0) {
                    function removeexplosion() {
                        $('#explosion').css("visibility", "hidden");
                        fired = 1;
                        checked = 1;
                    }
                }

                if (checked == 1) {
                    fired = 0;
                    checked = 0;
                    marginl = $('#crosshair').css("left");

                    currentl = parseInt(marginl.replace("px", ""));
                    currentt = $('#crosshair').css("top");

                    currentt = parseInt(currentt.replace("px", ""));


                    margint = $('#ctrl1').css("top");
                    margint = parseInt(margint.replace("px", ""));
                    marginl = $('#ctrl1').css("left");
                    marginl = parseInt(marginl.replace("px", ""));


                    if (currentl >= marginl && currentl <= (marginl + 30) || currentt >= margint && (currentt <= margint + 30)) {
                        $('#explosion').css("width", "10");
                        $('#explosion').css("height", "10");
                        $('#ctrl1').remove();
                        enemyhits = enemyhits + 1;
                        $('#ehits').text(enemyhits);

                        started = 0;
                        fired = 0;
                    }

                    var myaddctrl = window.setTimeout(function () { addCtrl() }, 1000);
                    if (started == 0) {
                        function addCtrl() {
                            if (started == 0) {
                                $('#explosion').css("visibility", "hidden");
                                var $ctrl = $('<img/>').attr({ id: 'ctrl1', src: 'Images/fplane.gif', style: 'width:80px; height:60px; position:relative; top: 307px; left: 247px; z-index: 2; right: 532px; visibility: visible' }).addClass("twoto3d");
                                $('#form1').append($ctrl);
                                started = 1

                            }
                        }
                    }


                }

            }

        }



        )
    });
</script>

<style type="text/css">
    .twoto3d {
            
           width:412px;
height:359px;
position:relative;
animation:mymove 0.05s infinite;
-webkit-animation:mymove 0.25s infinite;
        top: 92px;
        left: 0px;
    }

@keyframes mymove
{
from {left:0px;}
to {left:2px;}
}

@-webkit-keyframes mymove /* Safari and Chrome */
{
from {left:0px;}
to {left:2px;}
}
.zoom {
    zoom:1;
}
    .perspective3d {
    perspective:300;
-webkit-perspective:300; /* Safari and Chrome */
perspective-origin: 40% 20%;
-webkit-perspective-origin: 40% 20%; /* Safari and Chrome */
backface-visibility: hidden;
-webkit-backface-visibility: hidden;
transform-style: preserve-3d;
 -webkit-transform-style: preserve-3d;    
    }

    #form1 {
        z-index: 1;
        left: 10px;
        top: 34px;
        position: absolute;
        height: 29px;
        width: 852px;
    }

    </style>

 
    </head>   
<body style="height: 585px">
    
    <form id="form1" runat="server" >
    <label style="position: absolute; top: -30px; left: -9px; height: 26px; width: 869px; z-index:200" >   </label>
     <label style="position: absolute; top: 20px; left: 15px; right: 773px; height: 19px;" >Achievements   </label> 
        <label id="ehits" style="position: absolute; top: 20px; width: 39px; left: 110px; height: 19px;" > </label>
        <label style="position: absolute; top: 20px; left: 169px; height: 19px; right: 671px;" >Lives   </label>    
      
        <label id="lives" style="position: absolute; top: 20px; width: 39px; left: 211px; height: 19px;" > </label>
        <label style="position: absolute; top: 20px; left: 276px; height: 19px;" >Crisboos   </label> 
        <label id="points" style="position: absolute; top: 20px; width: 81px; left: 341px; height: 19px;" > </label>
        <label style="position: absolute; top: 20px; left: 450px; height: 19px;" >Treasure   </label> 
        <label id="treasure" style="position: absolute; top: 20px; width: 118px; left: 521px; height: 19px;" > </label>

         <img  id="crosshair"   src="Images/crosshair.png"  style="width:33px; height:25px; position:relative; top: 247px; left: 307px; z-index: 21; right: 532px;" >
            <img  id="explosion"   src="Images/explosion.gif" style="width:10px;  height:10px; position:relative; top: 247px; left: 307px; z-index: 21; right: 532px; visibility: hidden; margin-left: 0px; margin-top: 0px;" >

        <div  id="viewer" class="twoto3d perspective3d" tabindex="0" style="width: 658px; height: 299px; z-index: 1; left: 0px; top: 92px; position: absolute;"  >
 


<object id="Object1" style="height: 390px; width: 640px; z-index: 0; position:absolute;background-color:transparent">
    <param name="movie" value="https://www.youtube.com/v/XAbMQx-D7rE?version=3&feature=player_embedded&wmode=transparent&autoplay=1&controls=0&loop=1&playlist=XAbMQx-D7rE">
    <param name="allowFullScreen" value="true">
    <param name="allowScriptAccess" value="always">
    <embed id="uplayer" src="https://www.youtube.com/v/XAbMQx-D7rE?version=3&feature=player_embedded&wmode=transparent&autoplay=1&controls=0&loop=1&playlist=XAbMQx-D7rE" type="application/x-shockwave-flash" allowfullscreen="true" allowScriptAccess="always" wmode="transparent" width="640" height="390" style="position:relative">
</object> 
                    
</div>        
       
       
             
        
        <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 640px; top: 55px; position: absolute; width: 187px" Text="Label"></asp:Label>
       
       <a href='#' onclick="FacebookInviteFriends();" style="position:absolute;left:600px;top:700px;width:89px">Invite Friends</a>

   <a href="play.aspx" target="_self" style="border: medium outset #0000FF; position:absolute; left:316px; top:600px;width:143px; background-color: #0099FF; color: #FFFFFF; text-decoration:none" > Go On a TreasureHunt </a> 
   
    <a href="tspotbuy.html" target="_self" style="position:absolute;left:500px;top:600px;width:100px" > Pay for TSpot </a> 
        
	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT tspots.* FROM tspots" InsertCommand="INSERT INTO tspots(tsname, tsowner, tssell, tsbid, tsbidder, tsitems, tsapproved, tsreported, tsapprover, tsproductid, tsstatus) VALUES ('Desert Air Strike', 'Gullipilli Bhaskar', 'yes', 'no', 'none','', 'yes', 'no', 'Gullipilli Bhaskar', '', '')" UpdateCommand="UPDATE tspots SET tsitems = 'test'"></asp:SqlDataSource>
         
        
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="z-index: 1; left: 702px; top: 198px; position: absolute" Text="Button" />
             
      <asp:hiddenfield ID="Hiddenfield1" runat="server"></asp:hiddenfield>  
        
             
        
    </form>
   
    
        
   
</body>
</html>