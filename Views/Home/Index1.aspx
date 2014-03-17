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
            AccessDataSource1.SelectCommand = "SELECT uname FROM appuserdetails WHERE (uname = '" + Hiddenfield1 + "')";

            DataView dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();
            //DataTable dtr = dt;
            //DataRow[] uniname = dt.Select("uname");
            //username = dt.Rows[0].Field<string>("uname"); usethis to get field value
            //Label3.Text = dt.Rows[0][0].ToString();
            if (dt.Rows.Count == 0)
            {
                //Insert User into appuser,loggeduser,ordercounter,winners;
                AccessDataSource1.SelectCommand = "SELECT * FROM appuserdetails";
                AccessDataSource1.InsertParameters["uname"].DefaultValue = Hiddenfield1;
                AccessDataSource1.InsertParameters["uloggedin"].DefaultValue = "no";
                AccessDataSource1.InsertParameters["winner"].DefaultValue = "no";
                AccessDataSource1.InsertParameters["wintimes"].DefaultValue = "0";
                AccessDataSource1.InsertParameters["paid"].DefaultValue = "no";
                AccessDataSource1.InsertParameters["amount"].DefaultValue = "0";
                AccessDataSource1.InsertParameters["currenttspot"].DefaultValue = "";
                
                
                //AccessDataSource1.InsertCommand = "INSERT INTO appuserdetails(uname, uloggedin, winner, wintimes, paid, amount, currenttspot) VALUES ('" + Hiddenfield1 + "', 'no', 'no', '0', 'no', '0', '')";
                AccessDataSource1.Insert();
                
                AccessDataSource4.SelectCommand = "SELECT * FROM loggedusers";
                AccessDataSource4.InsertParameters["luname"].DefaultValue = Hiddenfield1;
                AccessDataSource4.InsertParameters["luid"].DefaultValue = Model.Id;
                AccessDataSource4.InsertParameters["luposition"].DefaultValue = "{left : 0, top:0}";
                AccessDataSource4.InsertParameters["luimg"].DefaultValue = Model.ProfilePicture.Data.Url;
                AccessDataSource4.InsertParameters["luspriteimg"].DefaultValue = Model.ProfilePicture.Data.Url;
                AccessDataSource4.InsertParameters["lucrisboos"].DefaultValue = "0";
                AccessDataSource4.InsertParameters["luloggedin"].DefaultValue = "no";
                AccessDataSource4.InsertParameters["lutspots"].DefaultValue = "0";
                AccessDataSource4.InsertParameters["lulogintimes"].DefaultValue = "0";
                AccessDataSource4.InsertParameters["luinvites"].DefaultValue = "0";
                
                
                //AccessDataSource4.InsertCommand = "INSERT INTO loggedusers(luname, luid, luposition, luimg, luspriteimg, lucrisboos, luloggedin, lutspots, lulogintimes, luinvites) VALUES ('" + Hiddenfield1 + "', '" + Model.Id + "', '{left : 0, top:0}', '" + Model.ProfilePicture.Data.Url + "', '" + Model.ProfilePicture.Data.Url + "', '100', 'no', '0', '0', '0')";
                AccessDataSource4.Insert();
                
                AccessDataSource5.SelectCommand = "SELECT * FROM ordercounter";
                
                AccessDataSource5.InsertParameters["uname"].DefaultValue = Hiddenfield1;
                AccessDataSource5.InsertParameters["ccounter"].DefaultValue = "0";
                
                //AccessDataSource5.InsertCommand = "INSERT INTO ordercounter(uname, ccounter) Values ('" + Hiddenfield1 + "','0')";
                AccessDataSource5.Insert();
                
                AccessDataSource6.SelectCommand = "SELECT * FROM winners";
                AccessDataSource6.InsertParameters["uname"].DefaultValue = Hiddenfield1;
                AccessDataSource6.InsertParameters["crisboos"].DefaultValue = "0";
                
                //AccessDataSource6.InsertCommand = "INSERT INTO winners(uname, crisboos) Values ('" + Hiddenfield1 + "','0')";
                AccessDataSource6.Insert();
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
        AccessDataSource4.SelectCommand = "SELECT luname, lulogintimes, luloggedin, lutspots FROM loggedusers";
        DataView dv = (DataView)AccessDataSource4.Select(DataSourceSelectArguments.Empty);
        DataTable dt = new DataTable();
        dt = dv.ToTable();
        DataView uniname = dt.DefaultView;
        logintimes = dt.Rows[0].Field<string>("lulogintimes"); //usethis to get field value
        btspots = dt.Rows[0].Field<string>("lutspots"); //usethis to get field value

        if (logintimes == "0" && btspots == "0")
        {
            AccessDataSource4.UpdateCommand = "UPDATE loggedusers SET lulogintimes = '" + Convert.ToString(Convert.ToInt16(logintimes) + 1) + "', luloggedin='yes' where luname='" + Hiddenfield1 + "'";
            AccessDataSource4.Update();
            Response.Redirect("~/Play/play");


        }

        AccessDataSource7.SelectCommand = "SELECT * FROM settings";
        dv = (DataView)AccessDataSource7.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        uniname = dt.DefaultView;
        invites = dt.Rows[0].Field<string>("invites"); //usethis to get field value
        reset = dt.Rows[0].Field<string>("loginreset"); //usethis to get field value
        tspots = dt.Rows[0].Field<string>("tspots"); //usethis to get field value
        AccessDataSource8.SelectCommand = "SELECT tscompleted FROM tspots where tscompleted = 'no'";
        dv = (DataView)AccessDataSource8.Select(DataSourceSelectArguments.Empty);
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

        AccessDataSource8.SelectCommand = "SELECT tsprice, tsname, tsbidder, tsbid, tsaward FROM tspots where tsbid ='yes' and tsaward = 'yes' and tsbidder ='" + Hiddenfield1 + "'";
        dv = (DataView)AccessDataSource8.Select(DataSourceSelectArguments.Empty);
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

        AccessDataSource9.SelectCommand = "SELECT tbprice, tbname, tbbidder, tbbid, tbaward FROM toolbox where tbbid ='yes' and tbaward = 'yes' and tbbidder ='" + Hiddenfield1 + "'";
        dv = (DataView)AccessDataSource9.Select(DataSourceSelectArguments.Empty);
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

        AccessDataSource9.SelectCommand = "SELECT tbcompleted FROM toolbox where tbcompleted = 'no'";
        dv = (DataView)AccessDataSource9.Select(DataSourceSelectArguments.Empty);
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
            AccessDataSource4.SelectCommand = "SELECT * FROM loggedusers";
            AccessDataSource4.UpdateCommand = "UPDATE loggedusers SET lulogintimes = '" + Convert.ToString(Convert.ToInt16(logintimes) + 1) + "', luloggedin='no' where luname='" + Hiddenfield1 + "'";
            AccessDataSource4.Update();
            Response.Redirect("~/Invite/friends");

        }
        if (logintimes == reset)
        {
            AccessDataSource4.SelectCommand = "SELECT * FROM loggedusers";
            AccessDataSource4.UpdateCommand = "UPDATE loggedusers SET lulogintimes = '3', luloggedin='no' where luname='" + Hiddenfield1 + "'";
            AccessDataSource4.Update();
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

        AccessDataSource4.SelectCommand = "SELECT * FROM loggedusers";
        AccessDataSource4.UpdateCommand = "UPDATE loggedusers SET lulogintimes = '" + Convert.ToString(Convert.ToInt16(logintimes) + 1) + "', luloggedin='no' where luname='" + Hiddenfield1 + "'";
        AccessDataSource4.Update();

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
    
    <title>treasurehunter</title>
</head>

<body style="height: 587px; overflow: hidden; background-repeat: repeat; background-color: #339966;">
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

var myaddctrl = window.setTimeout(function () { showbuy() }, 2000);
var myaddctrl = window.setTimeout(function () { feed() }, 2000);
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
</script>




<a href="https://plus.google.com/103286494679541419770" rel="publisher" style="z-index: 1; left: 784px; top: 17px; position: absolute; text-decoration: none; color: #FFFFFF;">Google+</a>      
<a href='https://treasurehunter.apphb.com/buygoggles.aspx' onclick="" style="position:absolute;left:420px; top:166px; width:44px; text-decoration:none; color: #FFFFFF; background-color: #FF9900;  border-radius:20px; text-align: center;">Buy</a>
<a href='https://treasurehunter.apphb.com/Invite/friends' onclick="FacebookInviteFriends();" style="position:absolute; left:683px; top:139px; width:109px; text-decoration:none; color: #FFFFFF; background-color: #0000FF;  border-radius:20px; text-align: center; right: 92px; height: 18px; font-family: 'Victorian LET';">Invite Friends</a>
<a href='https://treasurehunter.apphb.com/gamesettings.aspx'  style="position:absolute;left:807px; top:139px; width:57px; text-decoration:none; color: #FFFFFF; background-color: #0000FF;  border-radius:20px; text-align: left; font-family: 'Victorian LET';">My Gamee</a>
   <a href="https://treasurehunter.apphb.com/Play/play" target="_self" style="position:absolute;left:227px; top:136px; width:152px; text-decoration:none; background-color: #0000FF; color: #FFFFFF;  border-radius:20px; right: 505px; text-align: center; font-family: 'Victorian LET';" > Go On a TreasureHunt </a> 
   <a href="https://treasurehunter.apphb.com/thhelp.aspx" target="_self" style="position:absolute;left:241px; top:170px; width:152px; text-decoration:none; background-color: #0000FF; color: #FFFFFF;  border-radius:20px; right: 479px; text-align: center; font-family: 'Victorian LET';" > Game Instructions</a> 
   
    <a href="https://treasurehunter.apphb.com/buy.aspx" target="_self" style="position:absolute;left:387px; top:136px; width:144px; text-decoration:none; color: #FFFFFF; background-color: #0000FF;  border-radius:20px; text-align: center; right: 353px; font-family: 'Victorian LET';" > Buy a Treasure Spot </a> 
    <a href="https://treasurehunter.apphb.com/buy.aspx" target="_self" style="position:absolute;left:537px; top:138px; width:136px; text-decoration:none; color: #FFFFFF; background-color: #0000FF;  border-radius:20px; text-align: center; font-family: 'Victorian LET';" > Buy a ToolBox Item </a>                  

        <asp:Label ID="Label1" runat="server" style="border: thick ridge #CC66FF; z-index: 1; left: 45px; top: 200px; position: absolute; border-radius:20px; width: 825px; height: 102px; bottom: 252px;" Text="A True 3D Game where multiple players will be playing. A fun filled treasure hunting adventure is there. Collect as many gold coins as possible, renewable lives, real sound and great visual effects. A player need to have to create a treasure spot of his or her, owned salable. A treasure bounty is there hidden in the treasure spots. Invbite as many friends as possible to make the hunt more interesting. A secret society members will be encountered, destroy them, remove or overcome other players and creatures to collect and reach the treasure. All is fair in game and war. Treasure Hunter is a never ending game. Have FUN. To start click on Go On a Treasure Hunt." BackColor="#FFCCFF" Font-Names="calligraph421 bt, 9pt"></asp:Label>
        <asp:Label ID="Label4" runat="server" Font-Bold="True" style=" z-index: 1; left: 320px; top: 89px; position: absolute; right: 204px;" Text="Interactive Gaming with Fun Filled Places and Adventure" ForeColor="White" BorderStyle="None" Font-Names="Calligraph421 BT" Font-Size="9pt"></asp:Label>
        
   
        <img alt="" class="twoto3d" src="https://treasurehunter.apphb.com/Images/landscape.jpg" style="border: thick ridge #CC66FF; z-index: 1; left: 8px; top: 7px; border-radius:70px; position: absolute" /></p>
                  
    
        <img alt="" src="https://treasurehunter.apphb.com/Images/3dglass.gif" style="z-index: 1; left: 474px; top: 166px; position: absolute; height: 27px; width: 56px" />
         <img alt="" src="https://treasurehunter.apphb.com/Images/amazon.png" style="z-index: 1; left: 700px; top: 47px; position: absolute; height: 62px; width: 166px" />         
        <asp:Label ID="Label5" runat="server" Font-Size="8pt" style="z-index: 1; left: 401px; top: 587px; position: absolute" Text="Treasure Hunter - 2013"></asp:Label>
       
        
   <a href="https://treasurehunter.apphb.com/tools.aspx" target="_self" style="position:absolute;left:733px; top:170px; width:152px; text-decoration:none; background-color: #0000FF; color: #FFFFFF; border-radius:20px; right: -13px; text-align: center; height: 22px;" > Go to My ToolsBox </a> 
   
        <asp:AccessDataSource id="AccessDataSource1" DataFile="~/App_Data/th.mdb" runat="server"  SelectCommand="SELECT * FROM appuserdetails" InsertCommand="INSERT INTO appuserdetails(uname, uloggedin, winner, wintimes, paid, amount, currenttspot) VALUES (@uname, @uloggedin, @winner, @wintimes, @paid, @amount, @currenttspot)" UpdateCommand="UPDATE appuserdetails SET @uloggedin='yes'">
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
        </asp:AccessDataSource>
        <asp:AccessDataSource id="AccessDataSource2" DataFile="~/App_Data/th.mdb" runat="server"  SelectCommand="SELECT TOP 5 luname, lucrisboos, luimg FROM loggedusers  order by lucrisboos desc "> </asp:AccessDataSource>
        <asp:AccessDataSource id="AccessDataSource3" DataFile="~/App_Data/th.mdb" runat="server"  SelectCommand="SELECT TOP 5 uname, amount FROM payments Order by amount DESC"> </asp:AccessDataSource>
        <asp:AccessDataSource id="AccessDataSource4" DataFile="~/App_Data/th.mdb" runat="server"  SelectCommand="SELECT * FROM loggedusers" InsertCommand="INSERT INTO loggedusers(luname, luid, luposition, luimg, luspriteimg, lucrisboos, luloggedin, lutspots, lulogintimes, luinvites) Values (@luname, @luid, @luposition, @luimg, @luspriteimg, @lucrisboos, @luloggedin, @lutspots, @lulogintimes, @luinvites)" UpdateCommand="UPDATE appuserdetails SET @uloggedin='yes'">
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
        </asp:AccessDataSource>
        <asp:AccessDataSource id="AccessDataSource5" DataFile="~/App_Data/th.mdb" runat="server"  SelectCommand="SELECT * FROM ordercounter" InsertCommand="INSERT INTO ordercounter(uname, ccounter) Values (@uname, @ccounter)" UpdateCommand="UPDATE ordercounter SET @uname=''">
            <InsertParameters>
                <asp:Parameter Name="uname" />
                <asp:Parameter Name="ccounter" />
                
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="uname" />
            </UpdateParameters>
        </asp:AccessDataSource>
        <asp:AccessDataSource id="AccessDataSource6" DataFile="~/App_Data/th.mdb" runat="server"  SelectCommand="SELECT * FROM winners" InsertCommand="INSERT INTO winners(uname, crisboos) Values (@uname, @crisboos)" UpdateCommand="UPDATE winners SET @uname=''">
            <InsertParameters>
                <asp:Parameter Name="uname" />
                <asp:Parameter Name="crisboos" />
                
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="uname" />
            </UpdateParameters>
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDataSource7" DataFile="~/App_Data/th.mdb" runat="server" SelectCommand="SELECT * FROM settings">
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDataSource8" DataFile="~/App_Data/th.mdb" runat="server" SelectCommand="SELECT * FROM tspots">
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDataSource9" DataFile="~/App_Data/th.mdb" runat="server" SelectCommand="SELECT * FROM toolbox">
        </asp:AccessDataSource>
        <asp:DataList ID="DataList1" runat="server" BackColor="#FFCCFF" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataSourceID="AccessDataSource2" RepeatDirection="Horizontal" ShowFooter="False" ShowHeader="False" style="border: thick ridge #CC66FF; z-index: 1; left: 15px; top: 367px; position: absolute; height: 187px; width: 410px; right: 459px;" Font-Names="calligraph421 bt, 9pt">
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

        
   <a href="https://treasurehunter.apphb.com/create.aspx" target="_self" style="position:absolute;left:562px; top:170px; width:160px; text-decoration:none; background-color: #0000FF; color: #FFFFFF;  border-radius:20px; right: 150px; text-align: center; height: 23px;" > Go to My TreasureSpot </a> 
   
        <asp:DataList ID="DataList2" runat="server" BackColor="#FFCCFF" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataSourceID="AccessDataSource3" RepeatDirection="Horizontal" ShowFooter="False" ShowHeader="False" style="border: thick ridge #CC66FF; z-index: 1; left: 455px; top: 367px; position: absolute; height: 183px; width: 426px" Font-Names="calligraph421 bt, 9pt">
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
        <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="20pt" style="z-index: 1; left: 534px; top: 325px; position: absolute; width: 236px;" Text="Recent Top Winners" BorderStyle="Ridge" ForeColor="#CCCCFF" Font-Names="Victorian LET"></asp:Label>
        <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="20pt" style="z-index: 1; left: 102px; top: 324px; position: absolute; right: 531px; width: 243px;" Text="Recent Top Players" BorderStyle="Ridge" ForeColor="#CCCCFF" Font-Names="Victorian LET" Width="200px"></asp:Label>
    </form>
                  
    </body>
</html>
