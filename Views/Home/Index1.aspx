<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<treasurehunter.Models.MyAppUser>" %>
<%@ Import Namespace="System.Data" %>
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


    protected void checkusername()
    {
        Hiddenfield1.Value = Model.Name;
        Hiddenfield1.Value = Hiddenfield1.Value.Replace(" ", "");
        Application["loggeduser"] = Model.Name;
        if (Hiddenfield1.Value != null)
        {

            //Insert User into appuser,loggeduser,ordercounter,treasureprize;
            AccessDataSource1.SelectCommand = "SELECT uname FROM appuserdetails WHERE (uname = '" + Hiddenfield1.Value + "')";

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
                AccessDataSource1.InsertCommand = "INSERT INTO appuserdetails(uname, uloggedin, winner, wintimes, paid, amount, currenttspot) VALUES ('" + Hiddenfield1.Value + "', 'no', 'no', '0', 'no', '0', '')";
                AccessDataSource1.Insert();
                AccessDataSource1.SelectCommand = "SELECT * FROM loggedusers";
                AccessDataSource1.InsertCommand = "INSERT INTO loggedusers(luname, luid, luposition, luimg, luspriteimg, lucrisboos, luloggedin, lutspots, lulogintimes, luinvites) VALUES ('" + Hiddenfield1.Value + "', '" + Model.Id + "', '{left : 0, top:0}', '" + Model.ProfilePicture.Data.Url + "', '" + Model.ProfilePicture.Data.Url + "', '100', 'no', '0', '0', '0')";
                AccessDataSource1.Insert();
                AccessDataSource1.SelectCommand = "SELECT * FROM ordercounter";
                AccessDataSource1.InsertCommand = "INSERT INTO ordercounter(uname, ccounter) Values ('" + Hiddenfield1.Value + "','0')";
                AccessDataSource1.Insert();
                AccessDataSource1.SelectCommand = "SELECT * FROM winners";
                AccessDataSource1.InsertCommand = "INSERT INTO winners(uname, crisboos) Values ('" + Hiddenfield1.Value + "','0')";
                AccessDataSource1.Insert();
            }

        }
        else
        {

            Response.Redirect("~/Tspot/buy");
        }
    }


    public class FacebookFriend
    {
        public string name { get; set; }
        public string id { get; set; }
    }



    protected void addfriends()
    {
        //IList myfriends = Model.Friends.Data.ToList();
        Random one = new Random();
        if (Model.Friends.Data.Count != 0)
        {
            int r1 = one.Next(1, Model.Friends.Data.Count);
            Application["friend1"] = Model.Friends.Data.ElementAt(r1).Name;
        }
    }

    protected void verifysettings()
    {
        AccessDataSource1.SelectCommand = "SELECT luname, lulogintimes, luloggedin, lutspots FROM loggedusers";
        DataView dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
        DataTable dt = new DataTable();
        dt = dv.ToTable();
        DataView uniname = dt.DefaultView;
        logintimes = dt.Rows[0].Field<string>("lulogintimes"); //usethis to get field value
        btspots = dt.Rows[0].Field<string>("lutspots"); //usethis to get field value

        if (logintimes == "0" && btspots == "0")
        {
            AccessDataSource1.UpdateCommand = "UPDATE loggedusers SET lulogintimes = '" + Convert.ToString(Convert.ToInt16(logintimes) + 1) + "', luloggedin='yes' where luname='" + Hiddenfield1.Value + "'";
            AccessDataSource1.Update();
            Response.Redirect("~/Play/play");


        }

        AccessDataSource1.SelectCommand = "SELECT * FROM settings";
        dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        uniname = dt.DefaultView;
        invites = dt.Rows[0].Field<string>("invites"); //usethis to get field value
        reset = dt.Rows[0].Field<string>("loginreset"); //usethis to get field value
        tspots = dt.Rows[0].Field<string>("tspots"); //usethis to get field value
        AccessDataSource1.SelectCommand = "SELECT tscompleted FROM tspots where tscompleted = 'no'";
        dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        uniname = dt.DefaultView;
        if (dt.Rows.Count != 0)
        {
            tscompleted = dt.Rows[0].Field<string>("tscompleted"); //usethis to get field value
        }
        if (dt.Rows.Count != 0)
        {
            Response.Redirect("~/Creator/create");
        }

        AccessDataSource1.SelectCommand = "SELECT tsprice, tsname, tsbidder, tsbid, tsaward FROM tspots where tsbid ='yes' and tsaward = 'yes' and tsbidder ='" + Hiddenfield1.Value + "'";
        dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        uniname = dt.DefaultView;
        if (dt.Rows.Count != 0)
        {
            string tsname = dt.Rows[0].Field<string>("tsname"); //usethis to get field value
            string tsprice = dt.Rows[0].Field<string>("tsprice"); //usethis to get field value

            if (tsname != null)
            {
                Application["tspotname"] = tsname;
                Application["tsprice"] = tsprice;
                Application["tsselltype"] = "bid";
                Response.Redirect("~/Tspot/buy");
            }
        }

        AccessDataSource1.SelectCommand = "SELECT tbprice, tbname, tbbidder, tbbid, tbaward FROM toolbox where tbbid ='yes' and tbaward = 'yes' and tbbidder ='" + Hiddenfield1.Value + "'";
        dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        uniname = dt.DefaultView;
        if (dt.Rows.Count != 0)
        {
            string tsname2 = dt.Rows[0].Field<string>("tbname"); //usethis to get field value
            string tbprice = dt.Rows[0].Field<string>("tbprice"); //usethis to get field value
            if (tsname2 != null)
            {
                Application["toolboxname"] = tsname2;
                Application["tbprice"] = tbprice;
                Application["tbselltype"] = "bid";
                Response.Redirect("~/Tspot/buy");
            }
        }

        AccessDataSource1.SelectCommand = "SELECT tbcompleted FROM toolbox where tbcompleted = 'no'";
        dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        uniname = dt.DefaultView;
        if (dt.Rows.Count != 0)
        {
            tbcompleted = dt.Rows[0].Field<string>("tbcompleted"); //usethis to get field value
            if (dt.Rows.Count != 0)
            {
                Response.Redirect("~/Toolbox/tools");
            }
        }

        if (logintimes == invites)
        {
            AccessDataSource1.SelectCommand = "SELECT * FROM loggedusers";
            AccessDataSource1.UpdateCommand = "UPDATE loggedusers SET lulogintimes = '" + Convert.ToString(Convert.ToInt16(logintimes) + 1) + "', luloggedin='no' where luname='" + Hiddenfield1.Value + "'";
            AccessDataSource1.Update();
            Response.Redirect("~/Invite/friends");

        }
        if (logintimes == reset)
        {
            AccessDataSource1.SelectCommand = "SELECT * FROM loggedusers";
            AccessDataSource1.UpdateCommand = "UPDATE loggedusers SET lulogintimes = '3', luloggedin='no' where luname='" + Hiddenfield1.Value + "'";
            AccessDataSource1.Update();
            Response.Redirect("~/Tspot/buy");

        }

        if (logintimes == "6" && btspots != tspots)
        {
            Response.Redirect("~/Tspot/buy");
        }

        if (btspots == "0" && Convert.ToInt16(logintimes) > 0)
        {
            Response.Redirect("~/Tspot/buy");
        }

        AccessDataSource1.SelectCommand = "SELECT * FROM loggedusers";
        AccessDataSource1.UpdateCommand = "UPDATE loggedusers SET lulogintimes = '" + Convert.ToString(Convert.ToInt16(logintimes) + 1) + "', luloggedin='no' where luname='" + Hiddenfield1.Value + "'";
        AccessDataSource1.Update();

    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        checkusername();
        addfriends();
        verifysettings();
    }

    
</script>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>TreasureHunter</title>
</head>

<body style="height: 587px; overflow: hidden;">
<style type="text/css">
    .twoto3d {
            
           width:219px;
height:157px;
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
    
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="35pt" ForeColor="Red" style="z-index: 1; left: 325px; top: 10px; position: absolute; bottom: 530px" Text="Treasure Hunter"></asp:Label>
    
    </div>
    <div id="fb-root">
        <asp:Label ID="Label3" runat="server" Font-Bold="True" style="z-index: 1; left: 396px; top: 69px; position: absolute" Text="3D Game - Multi Player"></asp:Label>
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
    function FacebookInviteFriends() {
        FB.ui({
            method: 'apprequests',
            message: 'You are Invited to Play Treasure Hunter Game with me'
        });
    }
</script>




      
<a href='../../buygoggles.aspx' onclick="" style="position:absolute;left:505px; top:157px; width:44px; text-decoration:none; color: #FFFFFF; background-color: #FF9900; webkit-border-radius:20px; moz-border-radius:20px; border-radius:20px; text-align: center;">Buy</a>
<a href='#' onclick="FacebookInviteFriends();" style="position:absolute; left:694px; top:127px; width:98px; text-decoration:none; color: #FFFFFF; background-color: #0000FF; webkit-border-radius:20px; moz-border-radius:20px; border-radius:20px; text-align: center; right: 190px; height: 18px;">Invite Friends</a>
<a href='Cpanel/gamesettings'  style="position:absolute;left:802px; top:126px; width:91px; text-decoration:none; color: #FFFFFF; background-color: #0000FF; webkit-border-radius:20px; moz-border-radius:20px; border-radius:20px; text-align: center;">My Game</a>
   <a href="Play/play" target="_self" style="position:absolute;left:252px; top:126px; width:152px; text-decoration:none; background-color: #0000FF; color: #FFFFFF; webkit-border-radius:20px; moz-border-radius:20px; border-radius:20px; right: 496px; text-align: center;" > Go On a TreasureHunt </a> 
   
    <a href="Tspot/buy" target="_self" style="position:absolute;left:414px; top:126px; width:126px; text-decoration:none; color: #FFFFFF; background-color: #0000FF; webkit-border-radius:20px; moz-border-radius:20px; border-radius:20px; text-align: center; right: 360px;" > Buy a Treasure Spot </a> 
    <a href="Tspot/buy" target="_self" style="position:absolute;left:549px; top:126px; width:136px; text-decoration:none; color: #FFFFFF; background-color: #0000FF; webkit-border-radius:20px; moz-border-radius:20px; border-radius:20px; text-align: center; right: 215px;" > Buy a ToolBox Item </a>                  

        <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 11px; top: 202px; position: absolute; width: 822px; height: 110px; bottom: 296px;" Text="A True 3D Game where multiple players will be playing. A fun filled treasure hunting adventure is there. Collect as many gold coins as possible, renewable lives, real sound and great visual effects. A player need to have to create a treasure spot of his or her, owned salable. A treasure bounty is there hidden in the treasure spots. Invbite as many friends as possible to make the hunt more interesting. A secret society members will be encountered, destroy them, remove or overcome other players and creatures to collect and reach the treasure. All is fair in game and war. Treasure Hunter is a never ending game. Have FUN. To start click on Go On a Treasure Hunt."></asp:Label>
        <asp:Label ID="Label4" runat="server" Font-Bold="True" style="z-index: 1; left: 293px; top: 96px; position: absolute" Text="Interactive Gaming with Fun Filled Places and Adventure"></asp:Label>
        
    <p>
        <img alt="" class="twoto3d" src="../../Images/landscape.jpg" style="z-index: 1; left: 8px; top: 7px; position: absolute" /></p>
                  
    <p>
        <img alt="" src="../../Images/3dglass.jpg" style="z-index: 1; left: 436px; top: 155px; position: absolute; height: 27px; width: 56px" /></p>
                  
        <asp:Label ID="Label5" runat="server" Font-Size="8pt" style="z-index: 1; left: 401px; top: 587px; position: absolute" Text="Treasure Hunter - 2013"></asp:Label>
        <asp:hiddenfield ID="Hiddenfield1" runat="server"></asp:hiddenfield>
        
   <a href="Creator/create" target="_self" style="position:absolute;left:720px; top:155px; width:152px; text-decoration:none; background-color: #0000FF; color: #FFFFFF; webkit-border-radius:20px; moz-border-radius:20px; border-radius:20px; right: 143px; text-align: center; height: 22px;" > Go to My TreasureSpot </a> 
   
        <asp:AccessDataSource id="AccessDataSource1" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT uname FROM appuserdetails WHERE (uname = '<%=Hiddenfield1.Value%>')"> </asp:AccessDataSource>
        <asp:AccessDataSource id="AccessDataSource2" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT TOP 5 winners.uname, winners.crisboos, loggedusers.luname, loggedusers.luimg FROM loggedusers,winners WHERE loggedusers.luname = winners.uname"> </asp:AccessDataSource>
        <asp:AccessDataSource id="AccessDataSource3" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT TOP 5 uname, amount FROM payments Order by amount DESC"> </asp:AccessDataSource>

        <asp:DataList ID="DataList1" runat="server" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataSourceID="AccessDataSource2" RepeatDirection="Horizontal" ShowFooter="False" ShowHeader="False" style="z-index: 1; left: 15px; top: 367px; position: absolute; height: 187px; width: 410px">
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <ItemStyle BackColor="#DEDFDE" ForeColor="Black" />
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("luimg") %>' style="z-index: 1; left: 4px; top: 20px; position: absolute; width:60px; height:60px" />
                <br />
                <br />
                <asp:Label ID="unameLabel" runat="server" Text='<%# Eval("uname") %>' />
                <br />
                <asp:Label ID="crisboosLabel" runat="server" Text='<%# Eval("crisboos") %>'  />
                <asp:Label ID="Label8" runat="server" Text="Gold Coins"  />
            </ItemTemplate>
            <SelectedItemStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        </asp:DataList>

        <asp:DataList ID="DataList2" runat="server" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataSourceID="AccessDataSource3" RepeatDirection="Horizontal" ShowFooter="False" ShowHeader="False" style="z-index: 1; left: 455px; top: 367px; position: absolute; height: 183px; width: 426px">
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
        <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="20pt" style="z-index: 1; left: 534px; top: 332px; position: absolute" Text="Recent Top Winners"></asp:Label>
        <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="20pt" style="z-index: 1; left: 102px; top: 328px; position: absolute" Text="Recent Top Players"></asp:Label>
    </form>
                  
    </body>
</html>
