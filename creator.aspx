<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage"   %>

<!DOCTYPE html>
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        
        
    }


    
</script>


<html>
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width" />
    <title></title>
     <script type="text/javascript" src="http://code.jquery.com/jquery-2.0.0.min.js"></script> 
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
   

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
    var userscounter = 3;
    var useridctrl = "ctrl";


    function addCtrl() {
        if (started == 0) {
            for (var x = 1; x <= userscounter; x++) {
                useridctrl = useridctrl.concat(x);

                var $ctrl = $('<img/>').attr({ id: useridctrl, src: 'Images/crosshair.png', style: 'width:33px; height:25px; position:relative; top: 307px; left: 247px; z-index: 2; right: 532px; visibility: visible; margin-left: 0px; margin-top: 0px' });
                $('#viewer').append($ctrl);
                useridctrl = "ctrl";
                //var $ctrl = $('<img/>').attr({ id: 'ctrl2', src: 'Images/crosshair.png', style: 'width:33px; height:25px; position:relative; top: 307px; left: 247px; z-index: 2; right: 532px; visibility: visible; margin-left: 0px; margin-top: 0px' });
                //$('#viewer').append($ctrl);
                //var $ctrl = $('<img/>').attr({ id: 'ctrl3', src: 'Images/explosion.gif', style: 'width:33px; height:25px; position:relative; top: 307px; left: 247px; z-index: 2; right: 532px; visibility: hidden; margin-left: 0px; margin-top: 0px' });
                //$('#viewer').append($ctrl);

                started = 1;
            }
        }
    }

    $(document).ready(function () {

        

        $(window).keydown(function (event) {



            if (event.which == 37) {
                $('#uplayer').css({ '-moz-transform': 'rotate(1deg)', WebkitTransform: 'rotate(1deg)', '-ms-transform': 'rotate(1deg)' });
                if (parseInt($('#ctrl2').css("left").replace("px", "")) > 10) {
                    $('#ctrl2').css("left", "-=10");
                    marginl = $('#ctrl2').css("left");
                }
            }

            if (event.which == 39) {

                //$('#viewer').addClass("twoto3d sidepan");
                $('#uplayer').css({ '-moz-transform': 'rotate(-2deg)', WebkitTransform: 'rotate(-2deg)', '-ms-transform': 'rotate(-2deg)' });
                if (parseInt($('#ctrl2').css("left").replace("px", "")) < 580) {
                    $('#ctrl2').css("left", "+=10");
                    marginl = $('#ctrl2').css("left");
                }
            }

            if (event.which == 38) {

                //$('#viewer').addClass("twoto3d sidepan");
                if (parseInt($('#ctrl2').css("top").replace("px", "")) > 10) {
                    $('#ctrl2').css("top", "-=10");
                    margint = $('#ctrl2').css("top");
                }
            }

            if (event.which == 40) {

                //$('#viewer').addClass("twoto3d sidepan");
                if (parseInt($('#ctrl2').css("top").replace("px", "")) < 320) {
                    $('#ctrl2').css("top", "+=10");
                    margint = $('#ctrl2').css("top");
                }
            }

            if (event.which == 83) {

                //$('#viewer').addClass("twoto3d sidepan");
                if (fired == 1) {
                    $('#ctrl3').css("width", "50");
                    $('#ctrl3').css("height", "50");
                    $('#ctrl3').css("left", $('#ctrl2').css("left"));
                    $('#ctrl3').css("top", $('#ctrl2').css("top"));
                    $('#ctrl3').css("right", $('#ctrl2').css("right"));
                    $('#ctrl3').css("visibility", "visible");
                    fired = 0;
                }

                var myaddctrl = window.setTimeout(function () { removeexplosion() }, 3000);
                if (fired == 0) {
                    function removeexplosion() {
                        $('#ctrl3').css("visibility", "hidden");
                        fired = 1;
                        checked = 1;
                    }
                }

                if (checked == 1) {
                    fired = 0;
                    checked = 0;
                    marginl = $('#ctrl2').css("left");

                    currentl = parseInt(marginl.replace("px", ""));
                    currentt = $('#ctrl2').css("top");

                    currentt = parseInt(currentt.replace("px", ""));


                    margint = $('#ctrl1').css("top");
                    margint = parseInt(margint.replace("px", ""));
                    marginl = $('#ctrl1').css("left");
                    marginl = parseInt(marginl.replace("px", ""));


                    if (currentl >= marginl && currentl <= (marginl + 30) || currentt >= margint && (currentt <= margint + 30)) {
                        $('#ctrl3').css("width", "10");
                        $('#ctrl3').css("height", "10");
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
                                $('#ctrl3').css("visibility", "hidden");
                                var $ctrl = $('<img/>').attr({ id: 'ctrl1', src: 'Images/fplane.gif', style: 'width:80px; height:60px; position:relative; top: 307px; left: 247px; z-index: 2; right: 532px; visibility: visible; margin-left: 0px; margin-top: 0px' }).addClass("twoto3d");
                                $('#viewer').append($ctrl);
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

.leftskewl {
 
  transform: -webkit-perspective( 50px ) rotateY( 25deg );
  transform: -moz-perspective( 50px ) rotateY( 25deg );
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

    </style>

 
    </head>   
<body style="height: 585px">
    
    <form id="form1" runat="server" >
     <label style="position: absolute; top: 20px; left: 15px; right: 773px; height: 19px; color: #FFCC00;" >Achievements   </label> 
        <label id="ehits" style="position: absolute; top: 20px; width: 39px; left: 110px; height: 19px; color: #FFFFFF;" > </label>
        <label style="position: absolute; top: 20px; left: 169px; height: 19px; right: 671px; color: #FFCC00;" >Lives   </label>    
      
        <label id="lives" style="position: absolute; top: 20px; width: 39px; left: 211px; height: 19px; color: #FFFFFF;" > </label>
        <label style="position: absolute; top: 20px; left: 280px; height: 19px; color: #FFCC00;" >Caribbs   </label> 
        <label id="points" style="position: absolute; top: 20px; width: 81px; left: 341px; height: 19px; color: #FFFFFF;" > </label>
        <label style="position: absolute; top: 20px; left: 450px; height: 19px; color: #FFCC00;" >Treasure   </label> 
        <label id="treasure" style="position: absolute; top: 20px; width: 118px; left: 521px; height: 19px; color: #FFFFFF;" > </label>

         
        
         
        <div  id="viewer" class="twoto3d perspective3d" tabindex="0" style="width: 658px; height: 299px; z-index: 1; left: 0px; top: 92px; position: relative"  >
 
<object id="Object1" style="height: 390px; width: 640px; z-index: 0; position:absolute;background-color:transparent">
    <param name="movie" value="https://www.youtube.com/v/XAbMQx-D7rE?version=3&feature=player_embedded&wmode=transparent&autoplay=1&controls=0&loop=1&playlist=XAbMQx-D7rE">
    <param name="allowFullScreen" value="true">
    <param name="allowScriptAccess" value="always">
    <embed id="uplayer" src="https://www.youtube.com/v/XAbMQx-D7rE?version=3&feature=player_embedded&wmode=transparent&autoplay=1&controls=0&loop=1&playlist=XAbMQx-D7rE" type="application/x-shockwave-flash" allowfullscreen="true" allowScriptAccess="always" wmode="transparent" width="640" height="390" style="position:relative">
</object>



   
                    
</div>        
       
        
        
        
       
        
        
        <label style="position: absolute; top: 24px; left: 663px; height: 100px; color: #FFCC00; width: 179px;" id="idstatus" >There are six steps
        <br />
        to be completed, use your order_id for communication</label></form>
   
    
        
   
</body>
</html>
