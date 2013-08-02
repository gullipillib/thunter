<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title></title>
<style type="text/css">
    .twoto3d {
            
           width:235px;
height:201px;
position:relative;
animation:mymove 0.05s infinite;
-webkit-animation:mymove 0.25s infinite;
        top: 7px;
        left: 8px;
    }

@keyframes mymove
{
from {left:8px;}
to {left:10px;}
}

@-webkit-keyframes mymove /* Safari and Chrome */
{
from {left:8px;}
to {left:10px;}
}
 </style>
</head>
<body>


    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="35pt" ForeColor="Red" style="z-index: 1; left: 325px; top: 10px; position: absolute; bottom: 530px" Text="Treasure Hunter"></asp:Label>
    
    </div>
    <div id="fb-root">
        <asp:Label ID="Label3" runat="server" Font-Bold="True" style="z-index: 1; left: 396px; top: 69px; position: absolute" Text="3D Game - Multi Player"></asp:Label>
        </div>
<script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "http://connect.facebook.net/en_US/all.js#xfbml=1&appId=123405257731200";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>



<script src="http://connect.facebook.net/en_US/all.js">
    FB.init({
        appId: '123405257731200',
        cookie: true,
        status: true,
        xfbml: true
    });

    function FacebookInviteFriends() {
        FB.ui({
            method: 'apprequests',
            message: 'You are Invited to Play Treasure Hunter Game with me'
        });
    }
</script>




      
<a href='#' onclick="" style="position:absolute;left:505px; top:172px; width:44px; text-decoration:none; color: #FFFFFF; background-color: #FF9900;; webkit-border-radius:20px; moz-border-radius:20px; border-radius:20px; text-align: center;">Buy</a>
<a href='#' onclick="FacebookInviteFriends();" style="position:absolute;left:667px; top:128px; width:110px; text-decoration:none; color: #FFFFFF; background-color: #0000FF;; webkit-border-radius:20px; moz-border-radius:20px; border-radius:20px; text-align: center;">Invite Friends</a>

   <a href="play.aspx" target="_self" style="position:absolute;left:252px; top:126px; width:162px; text-decoration:none; background-color: #0000FF; color: #FFFFFF; webkit-border-radius:20px; moz-border-radius:20px; border-radius:20px; right: 440px; text-align: center;" > Go On a TreasureHunt </a> 
   
    <a href="https://treasurehunter.apphb.com/tspot.aspx" target="_self" style="position:absolute;left:460px; top:126px; width:161px; text-decoration:none; color: #FFFFFF; background-color: #0000FF;; webkit-border-radius:20px; moz-border-radius:20px; border-radius:20px; text-align: center; right: 233px;" > Buy a Treasure Spot </a> 
                  

        <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 11px; top: 228px; position: absolute; width: 822px; height: 110px" Text="A True 3D Game where multiple players will be playing. A fun filled treasure hunting adventure is there. Collect as many crisboos as possible, renewable lives, real sound and great visual effects. A player need to have to create a treasure spot of his or her, owned salable. A treasure bounty is there hidden in the treasure spots. Invbite as many friends as possible to make the hunt more interesting. A secret society members will be encountered, destroy them, remove or overcome other players and creatures to collect and reach the treasure. All is fair in game and war. Treasure Hunter is a never ending saga. Have FUN. To start click on Go On a Treasure Hunt."></asp:Label>
        <asp:Label ID="Label4" runat="server" Font-Bold="True" style="z-index: 1; left: 293px; top: 96px; position: absolute" Text="Interactive Gaming with Fun Filled Places and Adventure"></asp:Label>
        
    <p>
        <img alt="" class="twoto3d" src="Images/treasure_hunt.jpg" style="z-index: 1; left: 8px; top: 7px; position: absolute" /></p>
                  
    <p>
        <img alt="" src="Images/3dglass.jpg" style="z-index: 1; left: 436px; top: 169px; position: absolute; height: 27px; width: 56px" /></p>
                  
        <asp:Label ID="Label5" runat="server" Font-Size="8pt" style="z-index: 1; left: 401px; top: 560px; position: absolute" Text="Treasure Hunter - 2013"></asp:Label>
        
    </form>
                  
    </body>
</html>
