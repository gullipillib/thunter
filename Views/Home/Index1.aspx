<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<treasurehunter.Models.MyAppUser>"   Culture="auto"  meta:resourcekey="PageResource1" UICulture="auto" EnableSessionState="True" Debug="true" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>

<!DOCTYPE html>

<script runat="server">
    
    string username = "";
    string logintimes = "";
    string tspots = "";
    string invites = "";
    string reset = "";
    string btspots = "";
    string tscompleted = "";
    string tbcompleted = "";
    string tsrplayers = "0";
    
    string Hiddenfield1;

    protected void addfriends()
    {

        if (tsrplayers == "0")
        {

        }
        if (tsrplayers != "0")
        {

        }


        Random one = new Random();
        
        
            if (Model.Friends != null && Model.Friends.Data != null && Model.Friends.Data.Count > 0)
        {
            if (Model.Friends.Data.Count > 5)
            {
                int r1 = one.Next(1, Model.Friends.Data.Count);
                Session["friend1"] = Model.Friends.Data.ElementAt(r1).Name;
                Session["friend1pic"] = Model.Friends.Data.ElementAt(r1).Picture.Data.Url;
                int r2 = one.Next(2, Model.Friends.Data.Count);
                Session["friend2"] = Model.Friends.Data.ElementAt(r2).Name;
                Session["friend2pic"] = Model.Friends.Data.ElementAt(r1).Picture.Data.Url;
                int r3 = one.Next(3, Model.Friends.Data.Count);
                Session["friend3"] = Model.Friends.Data.ElementAt(r3).Name;
                Session["friend3pic"] = Model.Friends.Data.ElementAt(r1).Picture.Data.Url;
                int r4 = one.Next(4, Model.Friends.Data.Count);
                Session["friend4"] = Model.Friends.Data.ElementAt(r4).Name;
                Session["friend4pic"] = Model.Friends.Data.ElementAt(r1).Picture.Data.Url;
                int r5 = one.Next(5, Model.Friends.Data.Count);
                Session["friend5"] = Model.Friends.Data.ElementAt(r5).Name;
                Session["friend5pic"] = Model.Friends.Data.ElementAt(r1).Picture.Data.Url;
            }

        }
        else
        {
            Session["friend1"] = "sussie carr";
            Session["friend2"] = "robert thomson";
            Session["friend3"] = "annie san";
            Session["friend4"] = "sui chang";
            Session["friend5"] = "marie jane";
        }

    }
    
    protected void checkusername()
    {
       
        Hiddenfield1 = Model.Name;
        Hiddenfield1 = Hiddenfield1.Replace(" ", "");
        Session["loggeduser"] = Model.Name;
        Session["loggeduserid"] = Model.Id;
        Session["loggeduserurl"] = Model.ProfilePicture.Data.Url;
        
        if (Hiddenfield1 != null)
        {

            //Insert User into appuser,loggeduser,ordercounter,treasureprize;
            SqlDataSource1.SelectCommand = "SELECT uname FROM appuserdetails WHERE (uname = '" + Hiddenfield1 + "')";

            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();
            //DataTable dtr = dt;
            //DataRow[] uniname = dt.Select("uname");
            //username = dt.Rows[0].Field<string>("uname"); usethis to get field value
            //Label3.Text = dt.Rows[0][0].ToString();
            if (dt.Rows.Count == 0)
            {
                //Insert User into appuser,loggeduser,ordercounter,winners;
                SqlDataSource1.SelectCommand = "SELECT * FROM appuserdetails";
                SqlDataSource1.InsertParameters["uname"].DefaultValue = Hiddenfield1;
                SqlDataSource1.InsertParameters["uloggedin"].DefaultValue = "no";
                SqlDataSource1.InsertParameters["winner"].DefaultValue = "no";
                SqlDataSource1.InsertParameters["wintimes"].DefaultValue = "0";
                SqlDataSource1.InsertParameters["paid"].DefaultValue = "no";
                SqlDataSource1.InsertParameters["amount"].DefaultValue = "0";
                SqlDataSource1.InsertParameters["currenttspot"].DefaultValue = "";
                
                
                //SqlDataSource1.InsertCommand = "INSERT INTO appuserdetails(uname, uloggedin, winner, wintimes, paid, amount, currenttspot) VALUES ('" + Hiddenfield1 + "', 'no', 'no', '0', 'no', '0', '')";
                SqlDataSource1.Insert();
                
                SqlDataSource4.SelectCommand = "SELECT * FROM loggedusers";
                SqlDataSource4.InsertParameters["luname"].DefaultValue = Hiddenfield1;
                SqlDataSource4.InsertParameters["luid"].DefaultValue = Model.Id;
                SqlDataSource4.InsertParameters["luposition"].DefaultValue = "{left : 0, top:0}";
                SqlDataSource4.InsertParameters["luimg"].DefaultValue = Model.ProfilePicture.Data.Url;
                SqlDataSource4.InsertParameters["luspriteimg"].DefaultValue = Model.ProfilePicture.Data.Url;
                SqlDataSource4.InsertParameters["lucrisboos"].DefaultValue = "0";
                SqlDataSource4.InsertParameters["luloggedin"].DefaultValue = "no";
                SqlDataSource4.InsertParameters["lutspots"].DefaultValue = "0";
                SqlDataSource4.InsertParameters["lulogintimes"].DefaultValue = "0";
                SqlDataSource4.InsertParameters["luinvites"].DefaultValue = "0";
                
                
                //SqlDataSource4.InsertCommand = "INSERT INTO loggedusers(luname, luid, luposition, luimg, luspriteimg, lucrisboos, luloggedin, lutspots, lulogintimes, luinvites) VALUES ('" + Hiddenfield1 + "', '" + Model.Id + "', '{left : 0, top:0}', '" + Model.ProfilePicture.Data.Url + "', '" + Model.ProfilePicture.Data.Url + "', '100', 'no', '0', '0', '0')";
                SqlDataSource4.Insert();
                
                SqlDataSource5.SelectCommand = "SELECT * FROM ordercounter";
                
                SqlDataSource5.InsertParameters["uname"].DefaultValue = Hiddenfield1;
                SqlDataSource5.InsertParameters["ccounter"].DefaultValue = "0";
                
                //SqlDataSource5.InsertCommand = "INSERT INTO ordercounter(uname, ccounter) Values ('" + Hiddenfield1 + "','0')";
                SqlDataSource5.Insert();
                
                SqlDataSource6.SelectCommand = "SELECT * FROM winners";
                SqlDataSource6.InsertParameters["uname"].DefaultValue = Hiddenfield1;
                SqlDataSource6.InsertParameters["crisboos"].DefaultValue = "0";
                
                //SqlDataSource6.InsertCommand = "INSERT INTO winners(uname, crisboos) Values ('" + Hiddenfield1 + "','0')";
                SqlDataSource6.Insert();
                Session["reached"] = "yes";
            }

        }
        else
        {

            Response.Redirect("~/buy.aspx");
        }
    }


    public class FacebookFriend
    {
        public string name { get; set; }
        public string id { get; set; }
    }


    protected void verifysettings()
    {
        SqlDataSource4.SelectCommand = "SELECT luname, lulogintimes, luloggedin, lutspots FROM loggedusers";
        DataView dv = (DataView)SqlDataSource4.Select(DataSourceSelectArguments.Empty);
        DataTable dt = new DataTable();
        dt = dv.ToTable();
        DataView uniname = dt.DefaultView;
        logintimes = dt.Rows[0].Field<string>("lulogintimes"); //usethis to get field value
        btspots = dt.Rows[0].Field<string>("lutspots"); //usethis to get field value

        if (logintimes == "0" && btspots == "0")
        {
            SqlDataSource4.UpdateCommand = "UPDATE loggedusers SET lulogintimes = '" + Convert.ToString(Convert.ToInt16(logintimes) + 1) + "', luloggedin='yes' where luname='" + Hiddenfield1 + "'";
            SqlDataSource4.Update();
            Response.Redirect("~/Play/play");


        }

        SqlDataSource7.SelectCommand = "SELECT * FROM settings";
        dv = (DataView)SqlDataSource7.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        uniname = dt.DefaultView;
        invites = dt.Rows[0].Field<string>("invites"); //usethis to get field value
        reset = dt.Rows[0].Field<string>("loginreset"); //usethis to get field value
        tspots = dt.Rows[0].Field<string>("tspots"); //usethis to get field value
        SqlDataSource8.SelectCommand = "SELECT tscompleted FROM tspots where tscompleted = 'no'";
        dv = (DataView)SqlDataSource8.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        uniname = dt.DefaultView;
        if (dt.Rows.Count != 0)
        {
            tscompleted = dt.Rows[0].Field<string>("tscompleted"); //usethis to get field value
        }
        if (dt.Rows.Count == 0)
        {
            Response.Redirect("~/create.aspx");
        }

        SqlDataSource8.SelectCommand = "SELECT tsprice, tsname, tsbidder, tsbid, tsaward FROM tspots where tsbid ='yes' and tsaward = 'yes' and tsbidder ='" + Hiddenfield1 + "'";
        dv = (DataView)SqlDataSource8.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        uniname = dt.DefaultView;
        if (dt.Rows.Count != 0)
        {
            string tsname = dt.Rows[0].Field<string>("tsname"); //usethis to get field value
            string tsprice = dt.Rows[0].Field<string>("tsprice"); //usethis to get field value

            if (tsname != null)
            {
                Session["tspotname"] = tsname;
                Session["tsprice"] = tsprice;
                Session["tsselltype"] = "bid";
                Response.Redirect("~/buy.aspx");
            }
        }

        SqlDataSource9.SelectCommand = "SELECT tbprice, tbname, tbbidder, tbbid, tbaward FROM toolbox where tbbid ='yes' and tbaward = 'yes' and tbbidder ='" + Hiddenfield1 + "'";
        dv = (DataView)SqlDataSource9.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        uniname = dt.DefaultView;
        if (dt.Rows.Count != 0)
        {
            string tsname2 = dt.Rows[0].Field<string>("tbname"); //usethis to get field value
            string tbprice = dt.Rows[0].Field<string>("tbprice"); //usethis to get field value
            if (tsname2 != null)
            {
                Session["toolboxname"] = tsname2;
                Session["tbprice"] = tbprice;
                Session["tbselltype"] = "bid";
                Response.Redirect("~/buy.aspx");
            }
        }

        SqlDataSource9.SelectCommand = "SELECT tbcompleted FROM toolbox where tbcompleted = 'no'";
        dv = (DataView)SqlDataSource9.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        uniname = dt.DefaultView;
        if (dt.Rows.Count != 0)
        {
            tbcompleted = dt.Rows[0].Field<string>("tbcompleted"); //usethis to get field value
            if (dt.Rows.Count != 0)
            {
                Response.Redirect("~/tools.aspx");
            }
        }

        if (logintimes == invites)
        {
            SqlDataSource4.SelectCommand = "SELECT * FROM loggedusers";
            SqlDataSource4.UpdateCommand = "UPDATE loggedusers SET lulogintimes = '" + Convert.ToString(Convert.ToInt16(logintimes) + 1) + "', luloggedin='no' where luname='" + Hiddenfield1 + "'";
            SqlDataSource4.Update();
            Response.Redirect("~/Invite/friends");

        }
        if (logintimes == reset)
        {
            SqlDataSource4.SelectCommand = "SELECT * FROM loggedusers";
            SqlDataSource4.UpdateCommand = "UPDATE loggedusers SET lulogintimes = '3', luloggedin='no' where luname='" + Hiddenfield1 + "'";
            SqlDataSource4.Update();
            Response.Redirect("~/buy.aspx");

        }

        if (logintimes == "6" && btspots != tspots)
        {
            Response.Redirect("~/buy.aspx");
        }

        if (btspots == "0" && Convert.ToInt16(logintimes) > 0)
        {
            Response.Redirect("~/buy.aspx");
        }

        SqlDataSource4.SelectCommand = "SELECT * FROM loggedusers";
        SqlDataSource4.UpdateCommand = "UPDATE loggedusers SET lulogintimes = '" + Convert.ToString(Convert.ToInt16(logintimes) + 1) + "', luloggedin='no' where luname='" + Hiddenfield1 + "'";
        SqlDataSource4.Update();

    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Browser.IsMobileDevice)
        {
            Response.Redirect("https://treasurehunter/apphb.com/Indexmobile/indexmobile");
        }

        
        checkusername();
        addfriends();
        if (Session["reached"] != null)
        {

            if (Convert.ToString(Session["reached"]) == "no")
            {
        verifysettings();
            }  
        }
        
    }

    
</script>

<html>
<head runat="server">
    
    <meta name="viewport" content="width=device-width" />
<meta name="description" content="Free Online Game TreasureHunter Facebook">
    <meta name="keywords" content="free online games, Treasure Hunter, FaceBook Game, Addicting Games, Earn Real Money in Game, Multi Player, 3D, Real Sound, Viral Game, Fun, Invite Your Friends, Play Now, New Facebook Game "/>
    <title>Treasurehunter Free Online Game</title>
</head>
<script type="text/javascript">
adroll_adv_id = "ULS24Y37NRAJDFZWJ4UKE7";
adroll_pix_id = "3FTYTXZLMBBWPDIH7TF7TB";
(function () {
var oldonload = window.onload;
window.onload = function(){
   __adroll_loaded=true;
   var scr = document.createElement("script");
   var host = (("https:" == document.location.protocol) ? "https://s.adroll.com" : "http://a.adroll.com");
   scr.setAttribute('async', 'true');
   scr.type = "text/javascript";
   scr.src = host + "/j/roundtrip.js";
   ((document.getElementsByTagName('head') || [null])[0] ||
    document.getElementsByTagName('script')[0].parentNode).appendChild(scr);
   if(oldonload){oldonload()}};
}());
</script>

<body style="height: 587px; overflow: hidden;" class="body">
<style type="text/css">
    .twoto3d {
            
           width:201px;
height:147px;
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

.body {
  background:url('~/images/bg.jpg');
  background-color:#339966;
}

 </style>

    <form id="form1" runat="server">

    <div>
    
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="35pt" ForeColor="#FFFFCC" style=" z-index: 1; left: 320px; top: 4px; position: absolute; bottom: 514px; width: 357px; margin-bottom: 0px;" Text="Treasure Hunter" BorderStyle="None" Font-Names="Victorian LET"></asp:Label>
    
    </div>
    <div id="fb-root" style="width: 71px">
        <asp:Label ID="Label3" runat="server" Font-Bold="True" style=" z-index: 1; left: 354px; top: 56px; position: absolute; width: 202px; border-radius:20px;" Text="3D Game - Multi Player" ForeColor="White" BorderStyle="None" Font-Names="Staccato222 BT" Font-Size="14pt"></asp:Label>
        </div>


<script src="https://connect.facebook.net/en_US/all.js">
    FB.init({
        appId: '123405257731200',
        cookie: true,
        status: true,
        xfbml: true
    });
</script>
<script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "https://connect.facebook.net/en_US/all.js#xfbml=1&appId=123405257731200";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>


<script>
var myaddctrl = window.setTimeout(function () { showlike() }, 2000);
var myaddctrl = window.setTimeout(function () { showbuy() }, 5000);
var myaddctrl = window.setTimeout(function () { feed() }, 9000);

var myaddctrl = window.setTimeout(function () { filllabel() }, 1000);
function filllabel() {
    document.getElementById('TextBox7').setAttribute("value", "Like Treasure Hunter and Earn 5 Gold Coins For Free");
    var myaddctrl = window.setTimeout(function () { hidelabel() }, 4000);
}
function hidelabel() {
    document.getElementById('TextBox7').style.visibility = "hidden";

}

    function FacebookInviteFriends() {
        FB.ui({
            method: 'apprequests',
            message: 'You are Invited to Play Treasure Hunter 3D MultiPlayer Game with me'
        });
    }

function feed() {
            FB.ui({
                method: 'feed',
		redirect_uri: 'https://apps.facebook.com/treasure_huntermp',
                link: 'https://treasurehunter.apphb.com/',
                caption: 'Treasure Hunter 3D Multiplayer Game - Like this Game',
            }, function (response) { });
        }

function  showbuy(){
	
		FB.api(
  'me/treasure_huntermp:purchase',
  'post',
  {
    buy: "https://treasurehunter.apphb.com/purchase.html"
  },
  function(response) {
    // handle the response
  }
);

	}


function  showlike(){
FB.api(
  'me/og.likes',
  'post',
  {
    object: "https://treasurehunter.apphb.com/like.html"
  },
  function(response) {
    // handle the response
  }
);
}
</script>




<a href="https://plus.google.com/103286494679541419770" rel="publisher" style="z-index: 1; left: 784px; top: 17px; position: absolute; text-decoration: none; color: #FFFFFF;">Google+</a>      
<a href='https://treasurehunter.apphb.com/buygoggles.aspx' onclick="" style="position:absolute;left:420px; top:169px; width:44px; text-decoration:none; color: #FFFFFF; background-color: #FF9900;  border-radius:20px; text-align: center;">Buy</a>
<a href='https://treasurehunter.apphb.com/Invite/friends' onclick="FacebookInviteFriends();" style="position:absolute; left:683px; top:139px; width:109px; text-decoration:none; color: #FFFFFF; background-color: #0000FF;  border-radius:20px; text-align: center; right: 92px; height: 18px; font-family: 'Victorian LET';">Invite Friends</a>
<a href='https://treasurehunter.apphb.com/gamesettings.aspx'  style="position:absolute;left:807px; top:139px; width:57px; text-decoration:none; color: #FFFFFF; background-color: #0000FF;  border-radius:20px; text-align: left; font-family: 'Victorian LET';">My Gamee</a>
   <a href="https://treasurehunter.apphb.com/Play/play" target="_self" style="position:absolute;left:227px; top:136px; width:152px; text-decoration:none; background-color: #0000FF; color: #FFFFFF;  border-radius:20px; right: 505px; text-align: center; font-family: 'Victorian LET';" > Go On a TreasureHunt </a> 
   <a href="https://treasurehunter.apphb.com/thhelp.aspx" target="_self" style="position:absolute;left:241px; top:170px; width:152px; text-decoration:none; background-color: #0000FF; color: #FFFFFF;  border-radius:20px; right: 479px; text-align: center; " > Game Instructions</a> 
        <a href="https://treasurehunter.apphb.com/prizes.html" target="_self" style="position: absolute; left: 699px; top: 114px; width: 152px; text-decoration: none; background-color: #FF00FF; color: #FFFFFF; border-radius: 20px; right: 33px; text-align: center;">Prizes</a>
    <a href="https://treasurehunter.apphb.com/buy.aspx" target="_self" style="position:absolute;left:387px; top:136px; width:144px; text-decoration:none; color: #FFFFFF; background-color: #0000FF;  border-radius:20px; text-align: center; right: 353px; font-family: 'Victorian LET';" > Buy a Treasure Spot </a> 
    <a href="https://treasurehunter.apphb.com/buy.aspx" target="_self" style="position:absolute;left:537px; top:138px; width:136px; text-decoration:none; color: #FFFFFF; background-color: #0000FF;  border-radius:20px; text-align: center; font-family: 'Victorian LET';" > Buy a ToolBox Item </a>                  

        <asp:Label ID="Label1" runat="server" style="border: thick ridge #CC66FF; z-index: 1; left: 45px; top: 196px; position: absolute; border-radius:20px; width: 825px; height: 108px; bottom: 252px;" Text="A True 3D Game where multiple players will be playing. A fun filled treasure hunting adventure is there. Collect as many gold coins as possible, renewable lives, real sound and great visual effects. A player need to have to create a treasure spot of his or her, owned salable. A treasure bounty is there hidden in the treasure spots. Invbite as many friends as possible to make the hunt more interesting. A secret society members will be encountered, destroy them, remove or overcome other players and creatures to collect and reach the treasure. All is fair in game and war. Treasure Hunter is a never ending game. Have FUN. To start click on Go On a Treasure Hunt." BackColor="#FFCCFF" Font-Names="calligraph421 bt, 9pt"></asp:Label>
        <asp:Label ID="Label4" runat="server" Font-Bold="True" style=" z-index: 1; left: 320px; top: 89px; position: absolute; right: 204px;" Text="Interactive Gaming with Fun Filled Places and Adventure" ForeColor="White" BorderStyle="None" Font-Names="Calligraph421 BT" Font-Size="9pt"></asp:Label>
        <asp:TextBox ID="TextBox7" runat="server" BackColor="#FFFF99" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" Style="z-index: 700; left: 4px; top: 243px; position: absolute; width: 966px; right: 9px; height: 70px; vertical-align: middle;" ForeColor="#0000CC" meta:resourcekey="livesResource1" ViewStateMode="Enabled" Font-Bold="True" Font-Names="Tahoma" Font-Size="13pt"></asp:TextBox>
   
        <img alt="" class="twoto3d" src="https://treasurehunter.apphb.com/Images/landscape.jpg" style="border: thick ridge #CC66FF; z-index: 1; left: 8px; top: 7px; border-radius:70px; position: absolute" />
                  
    
        <img alt="" src="https://treasurehunter.apphb.com/Images/3dglass.gif" style="z-index: 1; left: 474px; top: 166px; position: absolute; height: 27px; width: 56px" />
         <img alt="" src="https://treasurehunter.apphb.com/Images/amazon.png" style="z-index: 1; left: 700px; top: 44px; position: absolute; height: 62px; width: 166px" />         
        <asp:Label ID="Label5" runat="server" Font-Size="8pt" style="z-index: 1; left: 401px; top: 587px; position: absolute" Text="Treasure Hunter - 2013"></asp:Label>
       
        
   <a href="https://treasurehunter.apphb.com/tools.aspx" target="_self" style="position:absolute;left:733px; top:170px; width:152px; text-decoration:none; background-color: #0000FF; color: #FFFFFF; border-radius:20px; right: -13px; text-align: center; height: 22px;" > Go to My ToolsBox </a> 

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT * FROM appuserdetails" InsertCommand="INSERT INTO appuserdetails(uname, uloggedin, winner, wintimes, paid, amount, currenttspot) VALUES (@uname, @uloggedin, @winner, @wintimes, @paid, @amount, @currenttspot)" UpdateCommand="UPDATE appuserdetails SET @uloggedin='yes'">
<InsertParameters>
                <asp:Parameter Name="uname" />
                <asp:Parameter Name="uloggedin" />
                <asp:Parameter Name="winner" />
                <asp:Parameter Name="wintimes" />
                <asp:Parameter Name="paid" />
                <asp:Parameter Name="amount" />
                <asp:Parameter Name="currenttspot" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="uloggedin" />
            </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT TOP 5 luname, lucrisboos, luimg FROM loggedusers  order by lucrisboos desc ">
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT TOP 5 uname, amount FROM payments Order by amount DESC">
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT * FROM loggedusers" InsertCommand="INSERT INTO loggedusers(luname, luid, luposition, luimg, luspriteimg, lucrisboos, luloggedin, lutspots, lulogintimes, luinvites) Values (@luname, @luid, @luposition, @luimg, @luspriteimg, @lucrisboos, @luloggedin, @lutspots, @lulogintimes, @luinvites)" UpdateCommand="UPDATE appuserdetails SET @uloggedin='yes'">
<InsertParameters>
                <asp:Parameter Name="luname" />
                <asp:Parameter Name="luid" />
                <asp:Parameter Name="luposition" />
                <asp:Parameter Name="luimg" />
                <asp:Parameter Name="luspriteimg" />
                <asp:Parameter Name="lucrisboos" />
                <asp:Parameter Name="luloggedin" />
                <asp:Parameter Name="lutspots" />
                <asp:Parameter Name="lulogintimes" />
                <asp:Parameter Name="luinvites" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="uloggedin" />
            </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT * FROM ordercounter" InsertCommand="INSERT INTO ordercounter(uname, ccounter) Values (@uname, @ccounter)" UpdateCommand="UPDATE ordercounter SET @uname=''">
            <InsertParameters>
                <asp:Parameter Name="uname" />
                <asp:Parameter Name="ccounter" />
                
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="uname" />
            </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT * FROM winners" InsertCommand="INSERT INTO winners(uname, crisboos) Values (@uname, @crisboos)" UpdateCommand="UPDATE winners SET @uname=''">
            <InsertParameters>
                <asp:Parameter Name="uname" />
                <asp:Parameter Name="crisboos" />
                
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="uname" />
            </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT * FROM settings">
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT * FROM tspots">
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT * FROM toolbox">
</asp:SqlDataSource>

   
                <asp:DataList ID="DataList1" runat="server" BackColor="#FFCCFF" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataSourceID="SqlDataSource2" RepeatDirection="Horizontal" ShowFooter="False" ShowHeader="False" style="border: thick ridge #CC66FF; z-index: 1; left: 15px; top: 367px; position: absolute; height: 187px; width: 410px; right: 436px;" Font-Names="calligraph421 bt, 9pt">
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <ItemStyle BackColor="#DEDFDE" ForeColor="Black" />
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("luimg") %>' style=" thick ridge #CC66FF; z-index: 1; left: 4px; top: 17px; position: absolute; width:60px; height:60px" />
                <br />
                <br />
                <asp:Label ID="unameLabel" runat="server" Text='<%# Eval("luname") %>' />
                <br />
                <asp:Label ID="crisboosLabel" runat="server" Text='<%# Eval("lucrisboos") %>'  />
                <asp:Label ID="Label8" runat="server" Text="Gold Coins"  />
            </ItemTemplate>
            <SelectedItemStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        </asp:DataList>

        
   <a href="https://treasurehunter.apphb.com/create.aspx" target="_self" style="position:absolute;top:170px; width:160px; text-decoration:none; background-color: #0000FF; color: #FFFFFF;  border-radius:20px; right: 174px; text-align: center; height: 23px;" > Go to My TreasureSpot </a> 
   
        <asp:DataList ID="DataList2" runat="server" BackColor="#FFCCFF" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataSourceID="SqlDataSource3" RepeatDirection="Horizontal" ShowFooter="False" ShowHeader="False" style="border: thick ridge #CC66FF; z-index: 1; left: 455px; top: 367px; position: absolute; height: 183px; width: 426px" Font-Names="calligraph421 bt, 9pt">
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <ItemStyle BackColor="#DEDFDE" ForeColor="Black" />
            <ItemTemplate>
                Name
                <asp:Label ID="unameLabel" runat="server" Text='<%# Eval("uname") %>' />
                <br />
                Amount($)
                <asp:Label ID="amountLabel" runat="server" Text='<%# Eval("amount") %>' />
                
                <br />
                <br />
            </ItemTemplate>
            <SelectedItemStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        </asp:DataList>
        <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="20pt" style="z-index: 1; left: 534px; top: 325px; position: absolute; width: 236px; height:30px;" Text="Recent Top Winners" BorderStyle="Ridge" ForeColor="#CCCCFF" Font-Names="Victorian LET"></asp:Label>
        <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="20pt" style="z-index: 1; left: 102px; top: 324px; position: absolute; right: 531px; width: 243px;  height:30px;" Text="Recent Top Players" BorderStyle="Ridge" ForeColor="#CCCCFF" Font-Names="Victorian LET" Width="200px"></asp:Label>
<div class="fb-like" data-href="https://www.facebook.com/TreasureHuntergame" data-width="100" data-layout="button" data-action="like" data-show-faces="true" data-share="true" style="z-index: 351; position: absolute; width: 128px; height: 24px; top: 3px; right: 289px; bottom: 539px; left: 562px"></div>
        
    
</form>
                  
    </body>
</html>
