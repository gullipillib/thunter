<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<treasurehunter.Models.MyAppUser>"   Culture="auto"  meta:resourcekey="PageResource1" UICulture="auto" EnableSessionState="True" Debug="true" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>


<!DOCTYPE html>
<script runat="server">
    //public static System.Timers.Timer timer = new System.Timers.Timer(280000); // This will raise the event every one minute.
    //public static System.Timers.Timer timer1 = new System.Timers.Timer(40000); // This will raise the event every one minute.
    
    string tsname = "";
    string tsitems = "";
    string tsrplayers = "";
    string tsdplayers = "";
    string tsrplayersdetails = "";
    string tsdplayersdetails = "";
    
    string ts1itemsfulldetails = "";
    string tsrplayerfulldetails = "";
    string tb1fulldetails = "";
    string tb2fulldetails = "";
    string tb3fulldetails = "";
    string tb4fulldetails = "";
    string tb5fulldetails = "";
    string iframeurl;
    string ctrl1mainurl;
    string ctrl1mainres;
    string ctrl1mainleft;
    string ctrl1maintop;
    string ctrl1mainwidth;
    string ctrl1mainheight;
    string ctrl1mainname;
    string ctrl2mainurl;
    string ctrl2mainres;
    string ctrl2mainname;
    string ctrl2mainleft;
    string ctrl2maintop;
    string ctrl2mainwidth;
    string ctrl2mainheight;
    string ctrl3mainurl;
    string ctrl3mainres;
    string ctrl3mainname;
    string ctrl3mainleft;
    string ctrl3maintop;
    string ctrl3mainwidth;
    string ctrl3mainheight;
    string ctrl4mainurl;
    string ctrl4mainres;
    string ctrl4mainname;
    string ctrl4mainleft;
    string ctrl4maintop;
    string ctrl4mainwidth;
    string ctrl4mainheight;
    string ctrl5mainurl;
    string ctrl5mainres;
    string ctrl5mainname;
    string ctrl5mainleft;
    string ctrl5maintop;
    string ctrl5mainwidth;
    string ctrl5mainheight;
    string propurl;
    string collisionurl;
    string ctrl1mainsound;
    dynamic tsitemsfulldetails;
    dynamic tb1itemsfulldetails;
    dynamic tb2itemsfulldetails;
    dynamic tb3itemsfulldetails;
    dynamic tb4itemsfulldetails;
    dynamic tb5itemsfulldetails;
    string tsitems1;
    string tbitems1;
    string tbitems2;
    string tbitems3;
    string tbitems4;
    string tbitems5;


    public class Playersdetails
    {
        public string tsrPlayerName { get; set; }
        public string tsdPlayerName { get; set; }
        public string tsrPlayerPosition { get; set; }
        public string tsdPlayerPosition { get; set; }
    }

    string username = "";
    string logintimes = "";
    string tspots = "";
    string invites = "";
    string reset = "";
    string btspots = "";
     public string goldcoins = "100";
    string Hiddenfield1;

    protected void checkusername()
    {

        Hiddenfield1 = Model.Name;
        Hiddenfield1 = Hiddenfield1.Replace(" ", "");
        Session["reached"] = "yes";
        
    }
public string one1 = "";
public string one2 = "";
public string one3 = "";
public string one4 = "";
public string one5 = "";

    protected void gettreasurespot()
    {

        SqlDataSource8.SelectCommand = "SELECT tsname, tsitems, tsrplayers, tsdplayers, tsrplayersdetails, tsdplayersdetails, tsapproved, tsactive, tsurl FROM tspots where tsapproved = 'yes' and tsactive = 'yes'";
        DataView dv = (DataView)SqlDataSource8.Select(DataSourceSelectArguments.Empty);
        DataTable dt = new DataTable();
        dt = dv.ToTable();
	if (dt.Rows.Count != 0)
        {
		
            Random one = new Random();
            int t1 = one.Next(0, dt.Rows.Count);
		tsitems = dt.Rows[t1].Field<string>("tsurl"); //usethis to get field value
		one1 = tsitems;

		one = new Random();
            	t1 = one.Next(1, dt.Rows.Count);
                tsitems = dt.Rows[t1].Field<string>("tsurl"); //usethis to get field value
                one2 = tsitems;
		
		one = new Random();
            	t1 = one.Next(2, dt.Rows.Count);
                tsitems = dt.Rows[t1].Field<string>("tsurl"); //usethis to get field value
                one3 = tsitems;

		one = new Random();
            	t1 = one.Next(3, dt.Rows.Count);
                tsitems = dt.Rows[t1].Field<string>("tsurl"); //usethis to get field value
                one4 = tsitems;
		
		one = new Random();
            	t1 = one.Next(4, dt.Rows.Count);
                tsitems = dt.Rows[t1].Field<string>("tsurl"); //usethis to get field value
                one5 = tsitems;
		
        }   
	     

	if (dt.Rows.Count != 0)
        {

            Random one = new Random();
            int t1 = one.Next(0, dt.Rows.Count);
            tsname = dt.Rows[t1].Field<string>("tsname"); //usethis to get field value
            tsitems = dt.Rows[t1].Field<string>("tsitems"); //usethis to get field value
            tsrplayers = dt.Rows[t1].Field<string>("tsrplayers"); //usethis to get field value
            tsdplayers = dt.Rows[t1].Field<string>("tsrplayers"); //usethis to get field value
            tsrplayersdetails = dt.Rows[t1].Field<string>("tsrplayersdetails"); //usethis to get field value
            tsdplayersdetails = dt.Rows[t1].Field<string>("tsdplayersdetails"); //usethis to get field value
        }
       


        tsitemsfulldetails = Json.Decode(tsitems);
        tsitems1 = tsitems;

        
        
        iframeurl = tsitemsfulldetails.tsUrl;
        ctrl1mainres = tsitemsfulldetails.tsctrl1res;
        ctrl1mainname = tsitemsfulldetails.tsctrl1name;
        ctrl1mainleft = tsitemsfulldetails.tsctrl1left;
        ctrl1maintop = tsitemsfulldetails.tsctrl1top;
        ctrl1mainwidth = tsitemsfulldetails.tsctrl1width;
        ctrl1mainheight = tsitemsfulldetails.tsctrl1height;
        ctrl2mainres = tsitemsfulldetails.tsctrl2res;
        ctrl2mainname = tsitemsfulldetails.tsctrl2name;
        ctrl2mainleft = tsitemsfulldetails.tsctrl2left;
        ctrl2maintop = tsitemsfulldetails.tsctrl2top;
        ctrl2mainwidth = tsitemsfulldetails.tsctrl2width;
        ctrl2mainheight = tsitemsfulldetails.tsctrl2height;
        ctrl3mainres = tsitemsfulldetails.tsctrl3res;
        ctrl3mainname = tsitemsfulldetails.tsctrl3name;
        ctrl3mainleft = tsitemsfulldetails.tsctrl3left;
        ctrl3maintop = tsitemsfulldetails.tsctrl3top;
        ctrl3mainwidth = tsitemsfulldetails.tsctrl3width;
        ctrl3mainheight = tsitemsfulldetails.tsctrl3height;
        ctrl4mainres = tsitemsfulldetails.tsctrl4res;
        ctrl4mainname = tsitemsfulldetails.tsctrl4name;
        ctrl4mainleft = tsitemsfulldetails.tsctrl4left;
        ctrl4maintop = tsitemsfulldetails.tsctrl4top;
        ctrl4mainwidth = tsitemsfulldetails.tsctrl4width;
        ctrl4mainheight = tsitemsfulldetails.tsctrl4height;
        ctrl5mainres = tsitemsfulldetails.tsctrl5res;
        ctrl5mainname = tsitemsfulldetails.tsctrl5name;
        ctrl5mainleft = tsitemsfulldetails.tsctrl5left;
        ctrl5maintop = tsitemsfulldetails.tsctrl5top;
        ctrl5mainwidth = tsitemsfulldetails.tsctrl5width;
        ctrl5mainheight = tsitemsfulldetails.tsctrl5height;

        Label1.Text = tsitemsfulldetails.tsName;
        string mytemp = tsitemsfulldetails.tsctrl1name;

        SqlDataSource9.SelectCommand = "SELECT tbname, tbdetails FROM toolbox where tbname = '" + tsitemsfulldetails.tsctrl1name + "'";
        dv = (DataView)SqlDataSource9.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        tb1fulldetails = dt.Rows[0].Field<string>("tbdetails");
        tb1itemsfulldetails = Newtonsoft.Json.JsonConvert.DeserializeObject(tb1fulldetails);
        tbitems1 = tb1fulldetails;
        ctrl1mainurl = tb1itemsfulldetails.tbMain;

        propurl = tb1itemsfulldetails.tbProp;
        collisionurl = tb1itemsfulldetails.tbCollionResult;
        ctrl1mainsound = tb1itemsfulldetails.tbMainSound;

       


        SqlDataSource9.SelectCommand = "SELECT tbname, tbdetails FROM toolbox where tbname = '" + tsitemsfulldetails.tsctrl2name + "'";
        dv = (DataView)SqlDataSource9.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        tb2fulldetails = dt.Rows[0].Field<string>("tbdetails");
        tb2itemsfulldetails = Newtonsoft.Json.JsonConvert.DeserializeObject(tb2fulldetails);
        tbitems2 = tb2fulldetails;
        //tb2itemsfulldetails = Json.Decode(tb2itemsfulldetails);
        ctrl2mainurl = tb2itemsfulldetails.tbMain;

       

        SqlDataSource9.SelectCommand = "SELECT tbname, tbdetails FROM toolbox where tbname = '" + tsitemsfulldetails.tsctrl3name + "'";
        dv = (DataView)SqlDataSource9.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        tb3fulldetails = dt.Rows[0].Field<string>("tbdetails");

        tb3itemsfulldetails = Newtonsoft.Json.JsonConvert.DeserializeObject(tb3fulldetails);
        tbitems3 = tb3fulldetails;
        ctrl3mainurl = tb3itemsfulldetails.tbMain;

        


        SqlDataSource9.SelectCommand = "SELECT tbname, tbdetails FROM toolbox where tbname = '" + tsitemsfulldetails.tsctrl4name + "'";
        dv = (DataView)SqlDataSource9.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        tb4fulldetails = dt.Rows[0].Field<string>("tbdetails");
        tb4itemsfulldetails = Newtonsoft.Json.JsonConvert.DeserializeObject(tb4fulldetails);

        ctrl4mainurl = tb4itemsfulldetails.tbMain;
        tbitems4 = tb4fulldetails;
        


        SqlDataSource9.SelectCommand = "SELECT tbname, tbdetails FROM toolbox where tbname = '" + tsitemsfulldetails.tsctrl5name + "'";
        dv = (DataView)SqlDataSource9.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        tb5fulldetails = dt.Rows[0].Field<string>("tbdetails");

        tb5itemsfulldetails = Newtonsoft.Json.JsonConvert.DeserializeObject(tb5fulldetails);
        
        ctrl5mainurl = tb5itemsfulldetails.tbMain;
        tbitems5 = tb5fulldetails;
        


    }
    protected void addloggedusers()
    {

        {
            SqlDataSource8.SelectCommand = "SELECT tsname, tsitems, tsrplayers, tsdplayers, tsrplayersdetails, tsdplayersdetails, tsapproved, tsactive FROM tspots where tsapproved = 'yes' and tsactive = 'yes' and tsrplayers = '0' and  tsrplayers = '0'";
            DataView dv = (DataView)SqlDataSource8.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();

            if (dt.Rows.Count != 0)
            {
                Random one = new Random();
                int t1 = one.Next(1, dt.Rows.Count);
                tsname = dt.Rows[t1].Field<string>("tsname"); //usethis to get field value
                tsitems = dt.Rows[t1].Field<string>("tsitems"); //usethis to get field value
                tsrplayers = dt.Rows[t1].Field<string>("tsrplayers"); //usethis to get field value
                tsdplayers = dt.Rows[t1].Field<string>("tsrplayers"); //usethis to get field value
                tsrplayersdetails = dt.Rows[t1].Field<string>("tsrplayersdetails"); //usethis to get field value
                tsdplayersdetails = dt.Rows[t1].Field<string>("tsdplayersdetails"); //usethis to get field value
            }

        }


    }

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

    protected void gettreasureprize()
    {
        SqlDataSource10.SelectCommand = "SELECT treasurevalue FROM treasureprize";
        DataView dv = (DataView)SqlDataSource10.Select(DataSourceSelectArguments.Empty);
        DataTable dt = new DataTable();
        dt = dv.ToTable();
        treasure.Text = dt.Rows[0].Field<string>("treasurevalue");
        SqlDataSource1.SelectCommand = "SELECT lucrisboos FROM loggedusers where luname='" + Hiddenfield1 + "'";
        dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        if (dt.Rows.Count != 0)
        {
            goldcoins = dt.Rows[0].Field<string>("lucrisboos");
        }
        

    }

    
    protected void Page_Load(object sender, EventArgs e)
    {
        

        if (Page.IsPostBack == false)
        {

            if (Session["reached"] == null)
            {

                if (Convert.ToString(Session["reached"]) == "no")
                {
                    Response.Redirect("~/Home/Index1");
                }
            }
            else if (Session["reached"] != null)
            {
                if (Convert.ToString(Session["reached"]) == "no")
                {
                    Response.Redirect("~/Home/Index1");
                }
            }
            checkusername();
            SqlDataSource1.UpdateCommand = "UPDATE loggedusers SET luloggedin='yes' where luname='" + Hiddenfield1 + "'";
            SqlDataSource1.Update();
            gettreasurespot();
            addfriends();
            gettreasureprize();
            //timer.Enabled = true;
            //timer.Elapsed += new System.Timers.ElapsedEventHandler(startupdatecoins);
            
        }


        if (Page.IsPostBack == false)
        {
            SqlDataSource1.SelectCommand = "SELECT luname, lulogintimes, luloggedin, lutspots FROM loggedusers";
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();
            DataView uniname = dt.DefaultView;
            if (dt.Rows.Count != 0)
            {
                logintimes = dt.Rows[0].Field<string>("lulogintimes"); //usethis to get field value
                btspots = dt.Rows[0].Field<string>("lutspots"); //usethis to get field value
            }
            if (logintimes != "0" && btspots != "0")
            {
                //Timer1.Enabled = true;
                SqlDataSource1.SelectCommand = "SELECT * FROM loggedusers";
                SqlDataSource1.UpdateCommand = "UPDATE loggedusers SET lulogintimes = '" + Convert.ToString(Convert.ToInt16(logintimes) + 1) + "', luloggedin='yes' where luname='" + Hiddenfield1 + "'";
                SqlDataSource1.Update();
            }

            if (logintimes != "0" && btspots == "0")
            {
                Response.Redirect("~/Tspot/buy");

            }
        }
    
    }

    //public  int runnow(string c)
    //{
    //    goldcoins = c;
    //    SqlDataSource1.SelectCommand = "SELECT lucrisboos FROM loggedusers where luname='" + Hiddenfield1 + "'";
    //    SqlDataSource1.UpdateCommand = "UPDATE loggedusers SET luloggedin='yes', lucrisboos='" + goldcoins + "' where luname='" + Hiddenfield1 + "'";

    //    SqlDataSource1.Update();
    //    gettreasurespot();
    //    return 1;
    //}

    protected void startupdatecoins(object sender, System.Timers.ElapsedEventArgs e)
    {

        //timer1.Enabled = true;
        //timer1.Elapsed += new System.Timers.ElapsedEventHandler(updatecoins);
        //gettreasurespot();

    }


    //public static string mycoins = "";

    //public void updatecoins(object sender, System.Timers.ElapsedEventArgs e)
    //{

    //    if (Session["mycoins"] != null)

    //        goldcoins = Session["mycoins"].ToString();
             
    //            SqlDataSource1.SelectCommand = "SELECT lucrisboos FROM loggedusers where luname='" + Hiddenfield1 + "'";
    //            SqlDataSource1.UpdateCommand = "UPDATE loggedusers SET luloggedin='yes', lucrisboos='" + goldcoins + "' where luname='" + Hiddenfield1 + "'";

    //            SqlDataSource1.Update();
    //            gettreasurespot();

            
    //}


   
</script>


<html>
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width" />
<meta name="description" content="Free Online Game TreasureHunter Facebook">
    <meta name="keywords" content="free online games, Treasure Hunter, FaceBook Game, Addicting Games, Earn Real Money in Game, Multi Player, 3D, Real Sound, Viral Game, Fun, Invite Your Friends, Play Now, New Facebook Game "/>
    <title>The Treasurehunter, A Free Online Game, Have Fun</title>
</head>

<!-- Google Code for Remarketing Tag -->
<!--------------------------------------------------
Remarketing tags may not be associated with personally identifiable information or placed on pages related to sensitive categories. See more information and instructions on how to setup the tag on: http://google.com/ads/remarketingsetup
--------------------------------------------------->
<script type="text/javascript">
var google_tag_params = {
ecomm_prodid: '101_th',
ecomm_pagetype: 'product',
ecomm_totalvalue: '2.00',
};
</script>
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 967011017;
var google_custom_params = window.google_tag_params;
var google_remarketing_only = true;
/* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/967011017/?value=0&amp;guid=ON&amp;script=0"/>
</div>
</noscript>


<body   onbeforeunload="getcoins" style="height: 507px; background-color: #000000; width: 967px; overflow: hidden; margin-top: 15px;" onmouseover="moveprop(event)" onmousedown="explodeprop(event)" onkeydown="check(e)">

    <style type="text/css">
        .twoto3d {
            width: 480px;
            height: 378px;
            position: relative;
            animation: mymove 0.05s infinite;
            -webkit-animation: mymove 0.25s infinite;
            top: 130px;
            left: 365px;
        }

        @keyframes mymove {
            from {
                left: 365px;
            }

            to {
                left: 366px;
            }
        }

        @-webkit-keyframes mymove /* Safari and Chrome */
        {
            from {
                left: 365px;
            }

            to {
                left: 366px;
            }
        }

        .zoom {
            zoom: 1;
        }

        .perspective3d {
            perspective: 300;
            -webkit-perspective: 300; /* Safari and Chrome */
            perspective-origin: 40% 20%;
            -webkit-perspective-origin: 40% 20%; /* Safari and Chrome */
            backface-visibility: hidden;
            -webkit-backface-visibility: hidden;
            transform-style: preserve-3d;
            -webkit-transform-style: preserve-3d;
        }

        
        .fb-activity
        {
            z-index: 1;
            left: 773px;
            top: 32px;
            position: absolute;
            height: 19px;
            width: 106px;
        }

        
    </style>

    

<script src="https://treasurehunter.apphb.com/Scripts/jquery-1.8.2.js"></script>
<script src="https://treasurehunter.apphb.com/Scripts/jquery-ui-1.10.3.js"></script>
<script src="https://treasurehunter.apphb.com/Scripts/jquery.signalR-2.0.1.js"></script>    
<script src="https://treasurehunter.apphb.com/SignalR/hubs"></script>
    `<script>
        var chat = $.connection.chatmessages;
        var pname = '<%=Hiddenfield1%>';
         
        $(function () {
            
            // Reference the auto-generated proxy for the hub.  
           
            // Create a function that the hub can call back to display messages.
           chat.client.hello = function (messages, values) {

                // Add the message to the page. 
                if ($('#Text2').val().length > 500) {
                    $('#Text2').val("");

                }
                $('#Text2').val($('#Text2').val() + "\r\n" + messages + " " + values);
                $('#Text1').val("");
                var textArea = $('#Text1');
                textArea.blur();
                textArea.focus();
               
            };
            
           
            // Start the connection.

            
            $.connection.hub.start().done(function () {
                //chat.server.Hello(pname + ":", $('#Text1').val());
                chat.server.Hello(pname + ":", $('#attacked').val()).done(function () {
                });
                chat.server.Hello(pname + ":", $('#Text1').val()).done(function () {
                });
                    
         });     
        });

        function checkEnter(event) {
            if (event.keyCode == 13) {

                return false;
            }
        }

        function send2server() {

            if ($('#Text1').val() != null) {


                chat.server.Hello(pname + ":", $('#Text1').val()).done(function () {
                });
            }
        }
         </script>
        
        <script type="text/javascript">
            var enemyhits = sessionStorage.getItem("achievements");
            var mygoldcoins = sessionStorage.getItem("points");


            var lifes = 0;
            var myctrl1 = JSON.parse('<%=tbitems1%>');
            var myctrl2 = JSON.parse('<%=tbitems2%>');
            var myctrl3 = JSON.parse('<%=tbitems3%>');
            var myctrl4 = JSON.parse('<%=tbitems4%>');
            var myctrl5 = JSON.parse('<%=tbitems5%>');
            var mytsdetails = JSON.parse('<%=tsitems1%>');



            document.addEventListener('DOMContentLoaded', function () {
                //alert(ctrl1.height);
                //alert(ctrl1.width);
                //alert(ctrl2.height);
                //alert(ctrl2.width);
                //alert(ctrl3.height);
                //alert(ctrl3.width);
                //alert(ctrl4.height);
                //alert(ctrl5.width);
                //alert(Img1.height);
                //alert(Img1.width);
                //alert(Img2.height);
                //alert(Img2.width);
                //alert(Img3.height);
                //alert(Img3.width);
                //alert(Img4.height);
                //alert(Img4.width);
                //alert(Img5.height);
                //alert(Img5.width);

                var noofhits = 0;
                var noofcoins = 0;
                var ranhits = Math.floor(Math.random() * 40 - 20 + 1) + 20;
                var rancoins = Math.floor(Math.random() * 30 - 10 + 1) + 20;
                document.getElementById('TextBox4').setAttribute("value", rancoins - noofcoins);
                document.getElementById('TextBox6').setAttribute("value", ranhits - noofhits);

                var myaddctrl = window.setTimeout(function () { filllabel() }, 1000);
                function filllabel() {
                    document.getElementById('TextBox7').setAttribute("value", "Collect " +  rancoins + " Gold Coins or Conqueor other " + ranhits  + " Players in the Next 2 Mins");
                    var myaddctrl = window.setTimeout(function () { hidelabel() }, 4000);
                    }
                function hidelabel() {
                    document.getElementById('TextBox7').style.visibility = "hidden";
               
                }

                var myaddctrl1 = window.setInterval(function () { tcounter() }, 1000);
                function tcounter() {
                    var mycounter = document.getElementById('TextBox2').getAttribute("value");
                    mycounter = parseInt(mycounter, 10) - 1;
                    if (mycounter < 0) {
                        mycounter = 0;
                    }
                    document.getElementById('TextBox2').setAttribute("value", mycounter);
                    
			var showshower = 0;
			
                    
                    if (noofcoins == rancoins) {
                        won = 1;
                        noofcoins = -150;
			showshower = 1;
                    }
                    if (showshower == 1) {
                        if (won == 1) {
                            document.getElementById('attacked').setAttribute("value", "You Have Completed this Treasure Spot Keep Playing");
                            Img9.style.visibility = "visibile";
                           
                                feed();
                                document.getElementById('TextBox2').setAttribute("value", "0");
                            }
                        
                        document.getElementById('TextBox4').setAttribute("value", rancoins - noofcoins);
                        document.getElementById('TextBox6').setAttribute("value", ranhits - noofhits);

                    }
                }

                var myaddctrl1 = window.setInterval(function () { getTspot() }, 140000);
                function getTspot() {



                document.getElementById('divplayer').getElementsByTagName('ctrl1').src = '<%=ctrl1mainurl%>';
                document.getElementById('divplayer').getElementsByTagName('ctrl2').src = '<%=ctrl1mainurl%>';
                document.getElementById('divplayer').getElementsByTagName('ctrl3').src = '<%=ctrl1mainurl%>';
                document.getElementById('divplayer').getElementsByTagName('ctrl4').src = '<%=ctrl1mainurl%>';
                document.getElementById('divplayer').getElementsByTagName('ctrl5').src = '<%=ctrl1mainurl%>';
                document.getElementById('divplayer').getElementsByTagName('Img1').src = '<%=ctrl1mainurl%>';
                document.getElementById('divplayer').getElementsByTagName('Img2').src = '<%=ctrl2mainurl%>';
                document.getElementById('divplayer').getElementsByTagName('Img3').src = '<%=ctrl3mainurl%>';
                document.getElementById('divplayer').getElementsByTagName('Img4').src = '<%=ctrl4mainurl%>';
                document.getElementById('divplayer').getElementsByTagName('Img5').src = '<%=ctrl5mainurl%>';
                document.getElementById('fplayer').src = '<%=iframeurl%>';
                document.getElementById('divplayer').getElementsByTagName('explosion').src = '<%=collisionurl%>';
                document.getElementById('divplayer').getElementsByTagName('crosshair').src = '<%=propurl%>';

                document.getElementById('Button1').click();

            }

            function getcoins() {

            }

            var myaddctrl1 = window.setInterval(function () { getTcoins() }, 60000);
            function getTcoins() {




                if (enemyhits != null) {
                    //myframe.children.namedItem("Label4").setAttribute("value", enemyhits);
                    //myframe.src = "~/Play/jsresult/" + enemyhits;
                    // window.location.href("jsresult/" + enemyhits);
                    document.getElementById("myframe").setAttribute("src", "https://treasurehunter.apphb.com/updatecoins.aspx?coins=" + document.getElementById("points").getAttribute("value"));

                }

            }



            var myaddctrl1 = window.setInterval(function () { randomCtrlhide() }, 10000);
            function randomCtrlhide() {

                mygoldcoins = document.getElementById('points').getAttribute("value");

                if (attacked.style.visibility == "visible") {
                    attacked.style.visibility = "hidden";
                }
                if (ctrl1.style.visibility == "visible") {
                    ctrl1.style.visibility = "hidden";
                }
                if (ctrl2.style.visibility == "visible") {
                    ctrl2.style.visibility = "hidden";
                }
                if (ctrl3.style.visibility == "visible") {
                    ctrl3.style.visibility = "hidden";
                }
                if (ctrl4.style.visibility == "visible") {
                    ctrl4.style.visibility = "hidden";
                }
                if (ctrl5.style.visibility == "visible") {
                    ctrl5.style.visibility = "hidden";
                }
                if (Img1.style.visibility == "visible") {
                    Img1.style.visibility = "hidden";
                }
                if (Img2.style.visibility == "visible") {
                    Img2.style.visibility = "hidden";
                }
                if (Img3.style.visibility == "visible") {
                    Img3.style.visibility = "hidden";
                }
                if (Img4.style.visibility == "visible") {
                    Img4.style.visibility = "hidden";
                }
                if (Img5.style.visibility == "visible") {
                    Img5.style.visibility = "hidden";
                }

            }
            var temp = '<%=ctrl1mainres%>';
                var temp = parseInt(temp.replace("px", ""), 10);
                var temp = 275 - temp;
            var visible1 = "no";
            var visible2 = "no";
            var visible3 = "no";
            var visible4 = "no";
            var visible5 = "no";

            var myaddctrl1 = window.setInterval(function () { randomCtrl1() }, 3000);
            function randomCtrl1() {




                Img9.style.visibility = "hidden";

                ctrl1.style.width = "60px";

                ctrl2.style.width = "60px";

                ctrl3.style.width = "60px";

                ctrl4.style.width = "60px";

                ctrl5.style.width = "60px";
                Img1.style.width = "60px";
                Img1.style.height = "60px";
                Img2.style.width = "60px";
                Img2.style.height = "60px";
                Img3.style.width = "60px";
                Img3.style.height = "60px";
                Img4.style.width = "60px";
                Img4.style.height = "60px";
                Img5.style.width = "60px";
                Img5.style.height = "60px";
                Label3.style.visibility = "hidden";

                //temp = temp.replace("px", "");
                //temp = parseInt(temp, 10);
                var randno1 = Math.floor(Math.random() * 5 - 1 + 1) + 1;
                var randno2 = Math.floor(Math.random() * 6 - 10 + 1) + 6;
                var randno3 = Math.floor(Math.random() * 10 - 1 + 1) + 1;

                if (randno1 == 1 || randno2 == 1 || randno3 == 1) {
                    ctrl1.style.visibility = "visible";
                    ctrl1.style.width = '<%=ctrl1mainwidth%>';
                    ctrl1.style.height = '<%=ctrl1mainwidth%>';
                    ctrl1.style.left = Math.floor(Math.random() * 480 - 1 + 1) + 1 + "px";
                    var mytemp = Math.floor(Math.random() * (temp - 1) + 1);
                    mytemp = mytemp + temp + "px";
                    ctrl1.style.top = mytemp;
                    visible1 = "yes";
                }
                if (randno1 == 2 || randno2 == 2 || randno3 == 2) {
                    ctrl2.style.visibility = "visible";
                    ctrl2.style.width = '<%=ctrl2mainwidth%>';
                    ctrl2.style.height = '<%=ctrl2mainwidth%>';
                    ctrl2.style.left = Math.floor(Math.random() * 480 - 1 + 1) + 1 + "px";
                    var mytemp = Math.floor(Math.random() * (temp - 1) + 1);
                    mytemp = mytemp + temp + "px";
                    ctrl2.style.top = mytemp;
                    visible2 = "yes";
                }
                if (randno1 == 3 || randno2 == 3 || randno3 == 3) {
                    ctrl3.style.visibility = "visible";
                    ctrl3.style.width = '<%=ctrl3mainwidth%>';
                    ctrl3.style.height = '<%=ctrl3mainwidth%>';
                    ctrl3.style.left = Math.floor(Math.random() * 480 - 1 + 1) + 1 + "px";
                    var mytemp = Math.floor(Math.random() * (temp - 1) + 1);
                    mytemp = mytemp + temp + "px";
                    ctrl3.style.top = mytemp;
                    visible3 = "yes";
                }
                if (randno1 == 4 || randno2 == 4 || randno3 == 4) {
                    ctrl4.style.visibility = "visible";
                    ctrl4.style.width = '<%=ctrl4mainwidth%>';
                    ctrl4.style.height = '<%=ctrl4mainwidth%>';
                    ctrl4.style.left = Math.floor(Math.random() * 480 - 1 + 1) + 1 + "px";
                    var mytemp = Math.floor(Math.random() * (temp - 1) + 1);
                    mytemp = mytemp + temp + "px";
                    ctrl4.style.top = mytemp;
                    visible4 = "yes";
                }
                if (randno1 == 5 || randno2 == 5 || randno3 == 5) {
                    ctrl5.style.visibility = "visible";
                    ctrl5.style.width = '<%=ctrl5mainwidth%>';
                    ctrl5.style.height = '<%=ctrl5mainwidth%>';
                    ctrl5.style.left = Math.floor(Math.random() * 480 - 1 + 1) + 1 + "px";
                    var mytemp = Math.floor(Math.random() * (temp - 1) + 1);
                    mytemp = mytemp + temp + "px";
                    ctrl5.style.top = mytemp;
                    visible5 = "yes";
                }
                if (randno1 == 6 || randno2 == 6 || randno3 == 6) {
                    Img1.style.visibility = "visible";
                    Img1.style.width = '<%=ctrl1mainwidth%>';
                    Img1.style.height = '<%=ctrl1mainwidth%>';
                    if ('<%=ctrl1mainname%>' == "goldcoins" || '<%=ctrl1mainname%>' == "health") {
                        Img1.style.width = "30px";
                        Img1.style.height = "30px";
                    }
                    Img1.style.left = Math.floor(Math.random() * 480 - 1 + 1) + 1 + "px";
                    var mytemp = Math.floor(Math.random() * (temp - 1) + 1);
                    mytemp = mytemp + temp + "px";
                    Img1.style.top = mytemp;
                }
                if (randno1 == 7 || randno2 == 7 || randno3 == 7) {
                    Img2.style.visibility = "visible";
                    Img2.style.width = '<%=ctrl1mainwidth%>';
                    Img2.style.height = '<%=ctrl1mainwidth%>';
                    if ('<%=ctrl2mainname%>' == "goldcoins" || '<%=ctrl2mainname%>' == "health") {
                        Img2.style.width = "30px";
                        Img2.style.height = "30px";
                    }
                    Img2.style.left = Math.floor(Math.random() * 480 - 1 + 1) + 1 + "px";
                    var mytemp = Math.floor(Math.random() * (temp - 1) + 1);
                    mytemp = mytemp + temp + "px";
                    Img2.style.top = mytemp;
                }
                if (randno1 == 8 || randno2 == 8 || randno3 == 8) {
                    Img3.style.visibility = "visible";
                    Img3.style.width = '<%=ctrl1mainwidth%>';
                    Img3.style.height = '<%=ctrl1mainwidth%>';
                    if ('<%=ctrl3mainname%>' == "goldcoins" || '<%=ctrl3mainname%>' == "health") {
                        Img3.style.width = "30px";
                        Img3.style.height = "30px";
                    }
                    Img3.style.left = Math.floor(Math.random() * 480 - 1 + 1) + 1 + "px";
                    var mytemp = Math.floor(Math.random() * (temp - 1) + 1);
                    mytemp = mytemp + temp + "px";
                    Img3.style.top = mytemp;
                }
                if (randno1 == 9 || randno2 == 9 || randno3 == 9) {
                    Img4.style.visibility = "visible";
                    Img4.style.width = '<%=ctrl1mainwidth%>';
                    Img4.style.height = '<%=ctrl1mainwidth%>';
                    if ('<%=ctrl4mainname%>' == "goldcoins" || '<%=ctrl4mainname%>' == "health") {
                        Img4.style.width = "30px";
                        Img4.style.height = "30px";
                    }
                    Img4.style.left = Math.floor(Math.random() * 480 - 1 + 1) + 1 + "px";
                    var mytemp = Math.floor(Math.random() * (temp - 1) + 1);
                    mytemp = mytemp + temp + "px";
                    Img4.style.top = mytemp;
                }
                if (randno1 == 10 || randno2 == 10 || randno3 == 10) {
                    Img5.style.visibility = "visible";
                    Img5.style.width = '<%=ctrl1mainwidth%>';
                    Img5.style.height = '<%=ctrl1mainwidth%>';
                    if ('<%=ctrl5mainname%>' == "goldcoins" || '<%=ctrl5mainname%>' == "health") {
                        Img5.style.width = "30px";
                        Img5.style.height = "30px";
                    }
                    Img5.style.left = Math.floor(Math.random() * 480 - 1 + 1) + 1 + "px";
                    var mytemp = Math.floor(Math.random() * (temp - 1) + 1);
                    mytemp = mytemp + temp + "px";
                    Img5.style.top = mytemp;
                }


            }
                var myaddctrl = window.setTimeout(function () { randomspots() }, 2000);
                function randomspots()
                {
                    var mytemp = Math.floor(Math.random() * (0 - 1) + 1);
                    if (mytemp == 0)
                    {
                        Image10.src = "https://treasurehunter.apphb.com/Images/crossmark.png";
                    }
                    var mytemp = Math.floor(Math.random() * (0 - 1) + 1);
                    if (mytemp == 0) {
                        Image9.src = "https://treasurehunter.apphb.com/Images/crossmark.png";
                    }
                    var mytemp = Math.floor(Math.random() * (0 - 1) + 1);
                    if (mytemp == 0) {
                        Image8.src = "https://treasurehunter.apphb.com/Images/crossmark.png";
                    }
                    var mytemp = Math.floor(Math.random() * (0 - 1) + 1);
                    if (mytemp == 1) {
                        Image6.src = "https://treasurehunter.apphb.com/Images/tick.png";
                    }
                    var mytemp = Math.floor(Math.random() * (0 - 1) + 1);
                    if (mytemp == 1) {
                        Image7.src = "https://treasurehunter.apphb.com/Images/tick.png";
                    }
                    var mytemp = Math.floor(Math.random() * (0 - 1) + 1);
                    if (mytemp == 1) {
                        Image8.src = "https://treasurehunter.apphb.com/Images/tick.png";
                    }
                }

            var myaddctrl = window.setInterval(function () { hitme() }, 5000);
            function hitme() {
                var myaddctrl = window.setTimeout(function () { hitmeonce() }, 2000);
                explosion.style.visibility = "visible";
                if (visible1 == "yes") {
                    explosion.style.width = "8px";
                    explosion.style.height = "8px";
                    explosion.style.left = ctrl1.style.left;
                    explosion.style.top = ctrl1.style.top;
                }
                else if (visible2 == "yes") {
                    explosion.style.width = "8px";
                    explosion.style.height = "8px";
                    explosion.style.left = ctrl2.style.left;
                    explosion.style.top = ctrl2.style.top;
                }
                else if (visible3 == "yes") {
                    explosion.style.width = "8px";
                    explosion.style.height = "8px";
                    explosion.style.left = ctrl3.style.left;
                    explosion.style.top = ctrl3.style.top;
                }
                else if (visible4 == "yes") {
                    explosion.style.width = "8px";
                    explosion.style.height = "8px";
                    explosion.style.left = ctrl4.style.left;
                    explosion.style.top = ctrl4.style.top;
                }
                else if (visible5 == "yes") {
                    explosion.style.width = "8px";
                    explosion.style.height = "8px";
                    explosion.style.left = ctrl5.style.left;
                    explosion.style.top = ctrl5.style.top;
                }
            }
            function hitmeonce() {
                if (myctrl1.tbPropType == "movable") {
                    explosion.style.width = "30px";
                    explosion.style.height = "30px";
                }

                attacked.style.visibility = "visible";
                document.getElementById('attacked').setAttribute("value", "You are Targetted Now Move " + positionresult);

                explosion.style.left = crosshair.style.left;
                explosion.style.top = crosshair.style.top;
                explosion.style.right = crosshair.style.right;
                explosion.style.visibility = "visible";


                var myaddctrl = window.setTimeout(function () { removeexplosion() }, 1000);

                function removeexplosion() {

                    explosion.style.visibility = "hidden";
                    if (positionresult != "") {

                        if (visible1 == "yes") {

                            if (myctrl1.tbEscape == positionresult) {
                                document.getElementById('attacked').setAttribute("value", "You have escaped");
                                positionresult = "";
                            }
                            else {

                                lifes = lives.getAttribute("value");
                                lifes = lifes - 1;
                                lives.setAttribute("value", lifes);
                                document.getElementById('attacked').setAttribute("value", "You Lost a Life");
                                positionresult = "";
                            }
                        }
                        else if (visible2 == "yes") {

                            if (myctrl2.tbEscape == positionresult) {
                                document.getElementById('attacked').setAttribute("value", "You have escaped");
                                positionresult = "";
                            }
                            else {

                                lifes = lives.getAttribute("value");
                                lifes = lifes - 1;
                                lives.setAttribute("value", lifes);
                                document.getElementById('attacked').setAttribute("value", "You Lost a Life");
                                positionresult = "";
                            }
                        }
                        else if (visible3 == "yes") {

                            if (myctrl3.tbEscape == positionresult) {
                                document.getElementById('attacked').setAttribute("value", "You have escaped");
                                positionresult = "";
                            }
                            else {

                                lifes = lives.getAttribute("value");
                                lifes = lifes - 1;
                                lives.setAttribute("value", lifes);
                                document.getElementById('attacked').setAttribute("value", "You Lost a Life");
                                positionresult = "";
                            }
                        }
                        else if (visible4 == "yes") {

                            if (myctrl4.tbEscape == positionresult) {
                                document.getElementById('attacked').setAttribute("value", "You have escaped");
                                positionresult = "";
                            }
                            else {

                                lifes = lives.getAttribute("value");
                                lifes = lifes - 1;
                                lives.setAttribute("value", lifes);
                                document.getElementById('attacked').setAttribute("value", "You Lost a Life");
                                positionresult = "";
                            }
                        }
                        else if (visible5 == "yes") {

                            if (myctrl5.tbEscape == positionresult) {
                                document.getElementById('attacked').setAttribute("value", "You have escaped");
                                positionresult = "";
                            }
                            else {

                                lifes = lives.getAttribute("value");
                                lifes = lifes - 1;
                                lives.setAttribute("value", lifes);
                                document.getElementById('attacked').setAttribute("value", "You Lost a Life");
                                positionresult = "";
                            }
                        }

                    }

                    if (lifes == 0) {
                        lives.setAttribute("value", '10');
                    }

                }


            }

            function detectcollision() {

                if (enemyhits == null) {
                    enemyhits = 0;
                }
                if (mygoldcoins == null) {
                    mygoldcoins = 0;
                }
                enemyhits = parseInt(enemyhits, 10);
                mygoldcoins = parseInt(mygoldcoins, 10);

                if (myctrl1.tbPropType == "movable") {
                    if (ctrl1.style.visibility == "visible") {
                        if (parseInt(crosshair.style.left.replace("px", ""), 10) >= parseInt(ctrl1.style.left.replace("px", ""), 10) && parseInt(crosshair.style.right.replace("px", ""), 10) <= parseInt(ctrl1.style.right.replace("px", ""), 10) || parseInt(crosshair.style.top.replace("px", ""), 10) >= parseInt(ctrl1.style.top.replace("px", ""), 10) && parseInt(crosshair.style.bottom.replace("px", ""), 10) <= parseInt(ctrl1.style.bottom.replace("px", ""), 10)) {
                            enemyhits = enemyhits + 1;
                            
                            if (enemyhits == 10) {
                                enemyhits = 0;
                                if (mygoldcoins == null || mygoldcoins == 0) {
                                    mygoldcoins = String(parseInt(enemyhits, 10) + 1);
                                }
                                if (mygoldcoins != null || mygoldcoins != 0) {
                                    mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                                }
                                document.getElementById('points').setAttribute("value", mygoldcoins);
                            }
                            document.getElementById('ehits').setAttribute("value", enemyhits);
                            sessionStorage.setItem("points", mygoldcoins);
                            sessionStorage.setItem("achievements", enemyhits);
                            friendimage.style.visibility = "visible";
                            friendname.style.visibility = "visible";
                            friendimage.src = '<%=Convert.ToString(Session["friend1pic"])%>';
                            friendname.value = '<%=Session["friend1"]%>';
                            sound1.src = myctrl1.tbCollionSound;
                            ctrl1.style.visibility = "hidden";
                            if ('<%=ctrl1mainname%>' == "goldcoins") {
                                if (myctrl1.tbResult == "giveonecrisboo") {
                                    mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                                    document.getElementById('points').setAttribute("value", mygoldcoins);
                                    noofcoins = noofcoins + 1;
                                    document.getElementById('TextBox4').setAttribute("value", rancoins - noofcoins);
                                    
                                }
                                if (myctrl1.tbResult == "takeonecrisboo") {
                                    mygoldcoins = String(parseInt(mygoldcoins, 10) - 1);
                                    document.getElementById('points').setAttribute("value", mygoldcoins);
                                }
                            }
                            if ('<%=ctrl1mainname%>' == "health") {
                                if (myctrl1.tbResult == "giveonelife") {
                                    lifes = String(parseInt(lifes, 10) + 1);
                                    document.getElementById('lives').setAttribute("value", lifes);
                                }
                                if (myctrl1.tbResult == "takeonelife") {
                                    lifes = String(parseInt(lifes, 10) - 1);
                                    document.getElementById('lives').setAttribute("value", lifes);
                                }
                            }
                            if (myctrl1.tbResult == "giveonecrisboo") {
                                mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                                document.getElementById('points').setAttribute("value", mygoldcoins);
                            }
                            if (myctrl1.tbResult == "takeonecrisboo") {
                                mygoldcoins = String(parseInt(mygoldcoins, 10) - 1);
                                document.getElementById('points').setAttribute("value", mygoldcoins);
                            }
                            if (myctrl1.tbResult == "giveonelife") {
                                lifes = String(parseInt(lifes, 10) + 1);
                                document.getElementById('lives').setAttribute("value", lifes);
                            }
                            if (myctrl1.tbResult == "takeonelife") {
                                lifes = String(parseInt(lifes, 10) - 1);
                                document.getElementById('lives').setAttribute("value", lifes);
                            }
                            if (myctrl1.tbResult == "donothing") {
                                crosshair.style.left = currentlposition;
                                crosshair.style.top = currenttposition;
                            }
                            if (myctrl1.tbResult == "cry") {
                                sound1.src = "http://s1download-universal-soundbank.com/mp3/sounds/355.mp3";
                            }
                            if (myctrl1.tbResult == "laugh") {
                                sound1.src = "http://s1download-universal-soundbank.com/mp3/sounds/1175.mp3";
                            }
                            if (myctrl1.tbResult == "stunned") {
                                crosshair.style.left = "0px";
                                crosshair.style.top = "130px";
                            }
                            if (myctrl1.tbResult == "stunned") {
                                sound1.src = "http://s1download-universal-soundbank.com/mp3/sounds/1175.mp3";
                            }
                            if (myctrl1.tbResult == "applaud") {
                                sound1.src = "http://s1download-universal-soundbank.com/mp3/sounds/1478.mp3";
                            }
                            if (myctrl1.tbResult == "dizzy") {
                                crosshair.style.left = "0px";
                                crosshair.style.top = "130px";
                                crosshair.style.left = "130px";
                                crosshair.style.top = "250px";
                            }
                            noofhits = noofhits + 1;
                            document.getElementById('TextBox6').setAttribute("value", ranhits - noofhits);
                        }
                    }
                    if (ctrl2.style.visibility == "visible") {
                        if (parseInt(crosshair.style.left.replace("px", ""), 10) >= parseInt(ctrl2.style.left.replace("px", ""), 10) && parseInt(crosshair.style.right.replace("px", ""), 10) <= parseInt(ctrl2.style.right.replace("px", ""), 10) || parseInt(crosshair.style.top.replace("px", ""), 10) >= parseInt(ctrl2.style.top.replace("px", ""), 10) && parseInt(crosshair.style.bottom.replace("px", ""), 10) <= parseInt(ctrl2.style.bottom.replace("px", ""), 10)) {
                            enemyhits = enemyhits + 1;

                            if (enemyhits == 10) {
                                enemyhits = 0;
                                if (mygoldcoins == null || mygoldcoins == 0) {
                                    mygoldcoins = String(parseInt(enemyhits, 10) + 1);
                                }
                                if (mygoldcoins != null || mygoldcoins != 0) {
                                    mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                                }
                                document.getElementById('points').setAttribute("value", mygoldcoins);
                            }
                            document.getElementById('ehits').setAttribute("value", enemyhits);
                            sessionStorage.setItem("points", mygoldcoins);
                            sessionStorage.setItem("achievements", enemyhits);
                            friendimage.style.visibility = "visible";
                            friendname.style.visibility = "visible";
                            friendimage.src = '<%=Convert.ToString(Session["friend2pic"])%>';
                            friendname.value = '<%=Session["friend2"]%>';
                            sound1.src = myctrl2.tbCollionSound;
                            ctrl2.style.visibility = "hidden";
                            if ('<%=ctrl2mainname%>' == "goldcoins") {
                            if (myctrl2.tbResult == "giveonecrisboo") {
                                mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                                document.getElementById('points').setAttribute("value", mygoldcoins);
                            }
                            if (myctrl2.tbResult == "takeonecrisboo") {
                                mygoldcoins = String(parseInt(mygoldcoins, 10) - 1);
                                document.getElementById('points').setAttribute("value", mygoldcoins);
                            }
                        }
                        if ('<%=ctrl2mainname%>' == "health") {
                                if (myctrl2.tbResult == "giveonelife") {
                                    lifes = String(parseInt(lifes, 10) + 1);
                                    document.getElementById('lives').setAttribute("value", lifes);
                                }
                                if (myctrl2.tbResult == "takeonelife") {
                                    lifes = String(parseInt(lifes, 10) - 1);
                                    document.getElementById('lives').setAttribute("value", lifes);
                                }
                            }
                            if (myctrl2.tbResult == "giveonecrisboo") {
                                mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                                document.getElementById('points').setAttribute("value", mygoldcoins);
                            }
                            if (myctrl2.tbResult == "takeonecrisboo") {
                                mygoldcoins = String(parseInt(mygoldcoins, 10) - 1);
                                document.getElementById('points').setAttribute("value", mygoldcoins);
                            }
                            if (myctrl2.tbResult == "giveonelife") {
                                lifes = String(parseInt(lifes, 10) + 1);
                                document.getElementById('lives').setAttribute("value", lifes);
                            }
                            if (myctrl2.tbResult == "takeonelife") {
                                lifes = String(parseInt(lifes, 10) - 1);
                                document.getElementById('lives').setAttribute("value", lifes);
                            }
                            if (myctrl2.tbResult == "donothing") {
                                crosshair.style.left = currentlposition;
                                crosshair.style.top = currenttposition;
                            }
                            if (myctrl2.tbResult == "cry") {
                                sound1.src = "http://s1download-universal-soundbank.com/mp3/sounds/355.mp3";
                            }
                            if (myctrl2.tbResult == "laugh") {
                                sound1.src = "http://s1download-universal-soundbank.com/mp3/sounds/1175.mp3";
                            }
                            if (myctrl2.tbResult == "stunned") {
                                crosshair.style.left = "0px";
                                crosshair.style.top = "130px";
                            }
                            if (myctrl2.tbResult == "stunned") {
                                sound1.src = "http://s1download-universal-soundbank.com/mp3/sounds/1175.mp3";
                            }
                            if (myctrl2.tbResult == "applaud") {
                                sound1.src = "http://s1download-universal-soundbank.com/mp3/sounds/1478.mp3";
                            }
                            if (myctrl2.tbResult == "dizzy") {
                                crosshair.style.left = "0px";
                                crosshair.style.top = "130px";
                                crosshair.style.left = "130px";
                                crosshair.style.top = "250px";
                            }
                        }
                    }
                    if (ctrl3.style.visibility == "visible") {
                        if (parseInt(crosshair.style.left.replace("px", ""), 10) >= parseInt(ctrl3.style.left.replace("px", ""), 10) && parseInt(crosshair.style.right.replace("px", ""), 10) <= parseInt(ctrl3.style.right.replace("px", ""), 10) || parseInt(crosshair.style.top.replace("px", ""), 10) >= parseInt(ctrl3.style.top.replace("px", ""), 10) && parseInt(crosshair.style.bottom.replace("px", ""), 10) <= parseInt(ctrl3.style.bottom.replace("px", ""), 10)) {
                            enemyhits = enemyhits + 1;
                            if (enemyhits == 10) {
                                enemyhits = 0;
                                if (mygoldcoins == null || mygoldcoins == 0) {
                                    mygoldcoins = String(parseInt(enemyhits, 10) + 1);
                                }
                                if (mygoldcoins != null || mygoldcoins != 0) {
                                    mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                                }
                                document.getElementById('points').setAttribute("value", mygoldcoins);
                            }
                            document.getElementById('ehits').setAttribute("value", enemyhits);
                            sessionStorage.setItem("points", mygoldcoins);
                            sessionStorage.setItem("achievements", enemyhits);
                            friendimage.style.visibility = "visible";
                            friendname.style.visibility = "visible";
                            friendimage.src = '<%=Convert.ToString(Session["friend3pic"])%>';
                        friendname.value = '<%=Session["friend3"]%>';
                        sound1.src = myctrl3.tbCollionSound;
                        ctrl3.style.visibility = "hidden";
                        if ('<%=ctrl3mainname%>' == "goldcoins") {
                            if (myctrl3.tbResult == "giveonecrisboo") {
                                mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                                document.getElementById('points').setAttribute("value", mygoldcoins);
                            }
                            if (myctrl3.tbResult == "takeonecrisboo") {
                                mygoldcoins = String(parseInt(mygoldcoins, 10) - 1);
                                document.getElementById('points').setAttribute("value", mygoldcoins);
                            }
                        }
                        if ('<%=ctrl3mainname%>' == "health") {
                            if (myctrl3.tbResult == "giveonelife") {
                                lifes = String(parseInt(lifes, 10) + 1);
                                document.getElementById('lives').setAttribute("value", lifes);
                            }
                            if (myctrl3.tbResult == "takeonelife") {
                                lifes = String(parseInt(lifes, 10) - 1);
                                document.getElementById('lives').setAttribute("value", lifes);
                            }
                        }
                        if (myctrl3.tbResult == "giveonecrisboo") {
                            mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                        }
                        if (myctrl3.tbResult == "takeonecrisboo") {
                            mygoldcoins = String(parseInt(mygoldcoins, 10) - 1);
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                        }
                        if (myctrl3.tbResult == "giveonelife") {
                            lifes = String(parseInt(lifes, 10) + 1);
                            document.getElementById('lives').setAttribute("value", lifes);
                        }
                        if (myctrl3.tbResult == "takeonelife") {
                            lifes = String(parseInt(lifes, 10) - 1);
                            document.getElementById('lives').setAttribute("value", lifes);
                        }
                        if (myctrl3.tbResult == "donothing") {
                            crosshair.style.left = currentlposition;
                            crosshair.style.top = currenttposition;
                        }
                        if (myctrl3.tbResult == "cry") {
                            sound1.src = "http://s1download-universal-soundbank.com/mp3/sounds/355.mp3";
                        }
                        if (myctrl3.tbResult == "laugh") {
                            sound1.src = "http://s1download-universal-soundbank.com/mp3/sounds/1175.mp3";
                        }
                        if (myctrl3.tbResult == "stunned") {
                            crosshair.style.left = "0px";
                            crosshair.style.top = "130px";
                        }
                        if (myctrl3.tbResult == "stunned") {
                            sound1.src = "http://s1download-universal-soundbank.com/mp3/sounds/1175.mp3";
                        }
                        if (myctrl3.tbResult == "applaud") {
                            sound1.src = "http://s1download-universal-soundbank.com/mp3/sounds/1478.mp3";
                        }
                        if (myctrl3.tbResult == "dizzy") {
                            crosshair.style.left = "0px";
                            crosshair.style.top = "130px";
                            crosshair.style.left = "130px";
                            crosshair.style.top = "250px";
                        }
                    }
                }
                if (ctrl4.style.visibility == "visible") {
                    if (parseInt(crosshair.style.left.replace("px", ""), 10) >= parseInt(ctrl4.style.left.replace("px", ""), 10) && parseInt(crosshair.style.right.replace("px", ""), 10) <= parseInt(ctrl4.style.right.replace("px", ""), 10) || parseInt(crosshair.style.top.replace("px", ""), 10) >= parseInt(ctrl4.style.top.replace("px", ""), 10) && parseInt(crosshair.style.bottom.replace("px", ""), 10) <= parseInt(ctrl4.style.bottom.replace("px", ""), 10)) {
                        enemyhits = enemyhits + 1;
                        if (enemyhits == 10) {
                            enemyhits = 0;
                            if (mygoldcoins == null || mygoldcoins == 0) {
                                mygoldcoins = String(parseInt(enemyhits, 10) + 1);
                            }
                            if (mygoldcoins != null || mygoldcoins != 0) {
                                mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            }
                            document.getElementById('points').setAttribute("value", mygoldcoins);

                        }
                        document.getElementById('ehits').setAttribute("value", enemyhits);
                        sessionStorage.setItem("points", mygoldcoins);
                        sessionStorage.setItem("achievements", enemyhits);
                        friendimage.style.visibility = "visible";
                        friendname.style.visibility = "visible";
                        friendimage.src = '<%=Convert.ToString(Session["friend4pic"])%>';
                        friendname.value = '<%=Session["friend4"]%>';
                        sound1.src = myctrl4.tbCollionSound;
                        ctrl4.style.visibility = "hidden";
                        if ('<%=ctrl4mainname%>' == "goldcoins") {
                            if (myctrl4.tbResult == "giveonecrisboo") {
                                mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                                document.getElementById('points').setAttribute("value", mygoldcoins);
                            }
                            if (myctrl4.tbResult == "takeonecrisboo") {
                                mygoldcoins = String(parseInt(mygoldcoins, 10) - 1);
                                document.getElementById('points').setAttribute("value", mygoldcoins);
                            }
                        }
                        if ('<%=ctrl4mainname%>' == "health") {
                            if (myctrl4.tbResult == "giveonelife") {
                                lifes = String(parseInt(lifes, 10) + 1);
                                document.getElementById('lives').setAttribute("value", lifes);
                            }
                            if (myctrl4.tbResult == "takeonelife") {
                                lifes = String(parseInt(lifes, 10) - 1);
                                document.getElementById('lives').setAttribute("value", lifes);
                            }
                        }
                        if (myctrl4.tbResult == "giveonecrisboo") {
                            mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                        }
                        if (myctrl4.tbResult == "takeonecrisboo") {
                            mygoldcoins = String(parseInt(mygoldcoins, 10) - 1);
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                        }
                        if (myctrl4.tbResult == "giveonelife") {
                            lifes = String(parseInt(lifes, 10) + 1);
                            document.getElementById('lives').setAttribute("value", lifes);
                        }
                        if (myctrl4.tbResult == "takeonelife") {
                            lifes = String(parseInt(lifes, 10) - 1);
                            document.getElementById('lives').setAttribute("value", lifes);
                        }
                        if (myctrl4.tbResult == "donothing") {
                            crosshair.style.left = currentlposition;
                            crosshair.style.top = currenttposition;
                        }
                        if (myctrl4.tbResult == "cry") {
                            sound1.src = "http://s1download-universal-soundbank.com/mp3/sounds/355.mp3";
                        }
                        if (myctrl4.tbResult == "laugh") {
                            sound1.src = "http://s1download-universal-soundbank.com/mp3/sounds/1175.mp3";
                        }
                        if (myctrl4.tbResult == "stunned") {
                            crosshair.style.left = "0px";
                            crosshair.style.top = "130px";
                        }
                        if (myctrl4.tbResult == "stunned") {
                            sound1.src = "http://s1download-universal-soundbank.com/mp3/sounds/1175.mp3";
                        }
                        if (myctrl4.tbResult == "applaud") {
                            sound1.src = "http://s1download-universal-soundbank.com/mp3/sounds/1478.mp3";
                        }
                        if (myctrl4.tbResult == "dizzy") {
                            crosshair.style.left = "0px";
                            crosshair.style.top = "130px";
                            crosshair.style.left = "130px";
                            crosshair.style.top = "250px";
                        }
                    }
                }
                if (ctrl5.style.visibility == "visible") {
                    if (parseInt(crosshair.style.left.replace("px", ""), 10) >= parseInt(ctrl5.style.left.replace("px", ""), 10) && parseInt(crosshair.style.right.replace("px", ""), 10) <= parseInt(ctrl5.style.right.replace("px", ""), 10) || parseInt(crosshair.style.top.replace("px", ""), 10) >= parseInt(ctrl5.style.top.replace("px", ""), 10) && parseInt(crosshair.style.bottom.replace("px", ""), 10) <= parseInt(ctrl5.style.bottom.replace("px", ""), 10)) {
                        enemyhits = enemyhits + 1;
                        if (enemyhits == 10) {
                            enemyhits = 0;
                            if (mygoldcoins == null || mygoldcoins == 0) {
                                mygoldcoins = String(parseInt(enemyhits, 10) + 1);
                            }
                            if (mygoldcoins != null || mygoldcoins != 0) {
                                mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            }
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                        }
                        document.getElementById('ehits').setAttribute("value", enemyhits);
                        sessionStorage.setItem("points", mygoldcoins);
                        sessionStorage.setItem("achievements", enemyhits);
                        friendimage.style.visibility = "visible";
                        friendname.style.visibility = "visible";
                        friendimage.src = '<%=Convert.ToString(Session["friend5pic"])%>';
                        friendname.value = '<%=Session["friend5"]%>';
                        sound1.src = myctrl5.tbCollionSound;
                        ctrl5.style.visibility = "hidden";
                        if ('<%=ctrl5mainname%>' == "goldcoins") {
                            if (myctrl5.tbResult == "giveonecrisboo") {
                                mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                                document.getElementById('points').setAttribute("value", mygoldcoins);
                            }
                            if (myctrl5.tbResult == "takeonecrisboo") {
                                mygoldcoins = String(parseInt(mygoldcoins, 10) - 1);
                                document.getElementById('points').setAttribute("value", mygoldcoins);
                            }
                        }
                        if ('<%=ctrl5mainname%>' == "health") {
                            if (myctrl5.tbResult == "giveonelife") {
                                lifes = String(parseInt(lifes, 10) + 1);
                                document.getElementById('lives').setAttribute("value", lifes);
                            }
                            if (myctrl5.tbResult == "takeonelife") {
                                lifes = String(parseInt(lifes, 10) - 1);
                                document.getElementById('lives').setAttribute("value", lifes);
                            }
                        }
                        if (myctrl5.tbResult == "giveonecrisboo") {
                            mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                        }
                        if (myctrl5.tbResult == "takeonecrisboo") {
                            mygoldcoins = String(parseInt(mygoldcoins, 10) - 1);
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                        }
                        if (myctrl5.tbResult == "giveonelife") {
                            lifes = String(parseInt(lifes, 10) + 1);
                            document.getElementById('lives').setAttribute("value", lifes);
                        }
                        if (myctrl5.tbResult == "takeonelife") {
                            lifes = String(parseInt(lifes, 10) - 1);
                            document.getElementById('lives').setAttribute("value", lifes);
                        }
                        if (myctrl5.tbResult == "donothing") {
                            crosshair.style.left = currentlposition;
                            crosshair.style.top = currenttposition;
                        }
                        if (myctrl5.tbResult == "cry") {
                            sound1.src = "http://s1download-universal-soundbank.com/mp3/sounds/355.mp3";
                        }
                        if (myctrl5.tbResult == "laugh") {
                            sound1.src = "http://s1download-universal-soundbank.com/mp3/sounds/1175.mp3";
                        }
                        if (myctrl5.tbResult == "stunned") {
                            crosshair.style.left = "0px";
                            crosshair.style.top = "130px";
                        }
                        if (myctrl5.tbResult == "stunned") {
                            sound1.src = "http://s1download-universal-soundbank.com/mp3/sounds/1175.mp3";
                        }
                        if (myctrl5.tbResult == "applaud") {
                            sound1.src = "http://s1download-universal-soundbank.com/mp3/sounds/1478.mp3";
                        }
                        if (myctrl5.tbResult == "dizzy") {
                            crosshair.style.left = "0px";
                            crosshair.style.top = "130px";
                            crosshair.style.left = "130px";
                            crosshair.style.top = "250px";
                        }
                    }
                }
                if (Img1.style.visibility == "visible") {
                    if (parseInt(crosshair.style.left.replace("px", ""), 10) >= parseInt(Img1.style.left.replace("px", ""), 10) && parseInt(crosshair.style.right.replace("px", ""), 10) <= parseInt(Img1.style.right.replace("px", ""), 10) || parseInt(crosshair.style.top.replace("px", ""), 10) >= parseInt(Img1.style.top.replace("px", ""), 10) && parseInt(crosshair.style.bottom.replace("px", ""), 10) <= parseInt(Img1.style.bottom.replace("px", ""), 10)) {
                        enemyhits = enemyhits + 1;
                        if (enemyhits == 10) {
                            enemyhits = 0;
                            if (mygoldcoins == null || mygoldcoins == 0) {
                                mygoldcoins = String(parseInt(enemyhits, 10) + 1);
                            }
                            if (mygoldcoins != null || mygoldcoins != 0) {
                                mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            }
                            document.getElementById('points').setAttribute("value", mygoldcoins);

                        }
                        document.getElementById('ehits').setAttribute("value", enemyhits);
                        sessionStorage.setItem("points", mygoldcoins);
                        sessionStorage.setItem("achievements", enemyhits);
                        sound1.src = myctrl1.tbCollionSound;
                        if ('<%=ctrl1mainname%>' == "goldcoins") {
                            mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                        }
                        if ('<%=ctrl1mainname%>' == "health") {
                            mygoldcoins = String(parseInt(lifes, 10) + 1);
                            document.getElementById('lives').setAttribute("value", lifes);
                        }
                        if ('<%=ctrl3mainname%>' == "goldcoins" || '<%=ctrl3mainname%>' == "health") {

                            Img1.style.visibility = "hidden";

                        }

                    }
                }
                if (Img2.style.visibility == "visible") {
                    if (parseInt(crosshair.style.left.replace("px", ""), 10) >= parseInt(Img2.style.left.replace("px", ""), 10) && parseInt(crosshair.style.right.replace("px", ""), 10) <= parseInt(Img2.style.right.replace("px", ""), 10) || parseInt(crosshair.style.top.replace("px", ""), 10) >= parseInt(Img2.style.top.replace("px", ""), 10) && parseInt(crosshair.style.bottom.replace("px", ""), 10) <= parseInt(Img2.style.bottom.replace("px", ""), 10)) {
                        enemyhits = enemyhits + 1;
                        if (enemyhits == 10) {
                            enemyhits = 0;
                            if (mygoldcoins == null || mygoldcoins == 0) {
                                mygoldcoins = String(parseInt(enemyhits, 10) + 1);
                            }
                            if (mygoldcoins != null || mygoldcoins != 0) {
                                mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            }
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                        }
                        document.getElementById('ehits').setAttribute("value", enemyhits);
                        sessionStorage.setItem("points", mygoldcoins);
                        sessionStorage.setItem("achievements", enemyhits);
                        sound1.src = myctrl2.tbCollionSound;
                        if ('<%=ctrl2mainname%>' == "goldcoins") {
                            mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                        }
                        if ('<%=ctrl2mainname%>' == "health") {
                            mygoldcoins = String(parseInt(lifes, 10) + 1);
                            document.getElementById('lives').setAttribute("value", lifes);
                        }
                        if ('<%=ctrl3mainname%>' == "goldcoins" || '<%=ctrl3mainname%>' == "health") {

                            Img2.style.visibility = "hidden";

                        }

                    }
                }
                if (Img3.style.visibility == "visible") {
                    if (parseInt(crosshair.style.left.replace("px", ""), 10) >= parseInt(Img3.style.left.replace("px", ""), 10) && parseInt(crosshair.style.right.replace("px", ""), 10) <= parseInt(Img3.style.right.replace("px", ""), 10) || parseInt(crosshair.style.top.replace("px", ""), 10) >= parseInt(Img3.style.top.replace("px", ""), 10) && parseInt(crosshair.style.bottom.replace("px", ""), 10) <= parseInt(Img3.style.bottom.replace("px", ""), 10)) {
                        enemyhits = enemyhits + 1;
                        if (enemyhits == 10) {
                            enemyhits = 0;
                            if (mygoldcoins == null || mygoldcoins == 0) {
                                mygoldcoins = String(parseInt(enemyhits, 10) + 1);
                            }
                            if (mygoldcoins != null || mygoldcoins != 0) {
                                mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            }
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                        }
                        document.getElementById('ehits').setAttribute("value", enemyhits);
                        sessionStorage.setItem("points", mygoldcoins);
                        sessionStorage.setItem("achievements", enemyhits);
                        sound1.src = myctrl3.tbCollionSound;
                        if ('<%=ctrl3mainname%>' == "goldcoins") {
                            mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                            noofcoins = noofcoins + 1;
                            document.getElementById('TextBox4').setAttribute("value", rancoins - noofcoins);

                        }
                        if ('<%=ctrl3mainname%>' == "health") {
                            mygoldcoins = String(parseInt(lifes, 10) + 1);
                            document.getElementById('lives').setAttribute("value", lifes);
                        }

                        if ('<%=ctrl3mainname%>' == "goldcoins" || '<%=ctrl3mainname%>' == "health") {
                            Img3.style.visibility = "hidden";
                        }


                    }
                }
                if (Img4.style.visibility == "visible") {
                    if (parseInt(crosshair.style.left.replace("px", ""), 10) >= parseInt(Img4.style.left.replace("px", ""), 10) && parseInt(crosshair.style.right.replace("px", ""), 10) <= parseInt(Img4.style.right.replace("px", ""), 10) || parseInt(crosshair.style.top.replace("px", ""), 10) >= parseInt(Img4.style.top.replace("px", ""), 10) && parseInt(crosshair.style.bottom.replace("px", ""), 10) <= parseInt(Img4.style.bottom.replace("px", ""), 10)) {
                        enemyhits = enemyhits + 1;
                        if (enemyhits == 10) {
                            enemyhits = 0;
                            if (mygoldcoins == null || mygoldcoins == 0) {
                                mygoldcoins = String(parseInt(enemyhits, 10) + 1);
                            }
                            if (mygoldcoins != null || mygoldcoins != 0) {
                                mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            }
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                        }
                        document.getElementById('ehits').setAttribute("value", enemyhits);
                        sessionStorage.setItem("points", mygoldcoins);
                        sessionStorage.setItem("achievements", enemyhits);
                        sound1.src = myctrl4.tbCollionSound;
                        if ('<%=ctrl4mainname%>' == "goldcoins") {
                            mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                        }
                        if ('<%=ctrl4mainname%>' == "health") {
                            mygoldcoins = String(parseInt(lifes, 10) + 1);
                            document.getElementById('lives').setAttribute("value", lifes);
                        }

                        if ('<%=ctrl4mainname%>' == "goldcoins" || '<%=ctrl4mainname%>' == "health") {
                            Img4.style.visibility = "hidden";
                        }

                    }
                }
                if (Img5.style.visibility == "visible") {
                    if (parseInt(crosshair.style.left.replace("px", ""), 10) >= parseInt(Img5.style.left.replace("px", ""), 10) && parseInt(crosshair.style.right.replace("px", ""), 10) <= parseInt(Img5.style.right.replace("px", ""), 10) || parseInt(crosshair.style.top.replace("px", ""), 10) >= parseInt(Img5.style.top.replace("px", ""), 10) && parseInt(crosshair.style.bottom.replace("px", ""), 10) <= parseInt(Img5.style.bottom.replace("px", ""), 10)) {
                        enemyhits = enemyhits + 1;
                        if (enemyhits == 10) {
                            enemyhits = 0;
                            if (mygoldcoins == null || mygoldcoins == 0) {
                                mygoldcoins = String(parseInt(enemyhits, 10) + 1);
                            }
                            if (mygoldcoins != null || mygoldcoins != 0) {
                                mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            }
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                        }
                        document.getElementById('ehits').setAttribute("value", enemyhits);
                        sessionStorage.setItem("points", mygoldcoins);
                        sessionStorage.setItem("achievements", enemyhits);
                        sound1.src = myctrl5.tbCollionSound;
                        if ('<%=ctrl5mainname%>' == "goldcoins") {
                            mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                            noofcoins = noofcoins + 1;
                            document.getElementById('TextBox4').setAttribute("value", rancoins - noofcoins);

                        }
                        if ('<%=ctrl5mainname%>' == "health") {
                            mygoldcoins = String(parseInt(lifes, 10) + 1);
                            document.getElementById('lives').setAttribute("value", lifes);
                        }

                        if ('<%=ctrl5mainname%>' == "goldcoins" || '<%=ctrl5mainname%>' == "health") {
                            Img5.style.visibility = "hidden";
                        }
                        noofhits = noofhits + 1;
                        document.getElementById('TextBox6').setAttribute("value", ranhits - noofhits);
                    }
                }
            }
            if (myctrl1.tbPropType == "fixed") {
                if (ctrl1.style.visibility == "visible") {
                    if (parseInt(explosion.style.left.replace("px", ""), 10) >= parseInt(ctrl1.style.left.replace("px", ""), 10) && parseInt(explosion.style.right.replace("px", ""), 10) <= parseInt(ctrl1.style.right.replace("px", ""), 10) || parseInt(explosion.style.top.replace("px", ""), 10) >= parseInt(ctrl1.style.top.replace("px", ""), 10) && parseInt(explosion.style.bottom.replace("px", ""), 10) <= parseInt(ctrl1.style.bottom.replace("px", ""), 10)) {
                        enemyhits = enemyhits + 1;

                        if (enemyhits == 10) {
                            enemyhits = 0;
                            if (mygoldcoins == null || mygoldcoins == 0) {
                                mygoldcoins = String(parseInt(enemyhits, 10) + 1);
                            }
                            if (mygoldcoins != null || mygoldcoins != 0) {
                                mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            }
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                        }
                        document.getElementById('ehits').setAttribute("value", enemyhits);
                        sessionStorage.setItem("points", mygoldcoins);
                        sessionStorage.setItem("achievements", enemyhits);
                        friendimage.style.visibility = "visible";
                        friendname.style.visibility = "visible";
                        friendimage.src = '<%=Convert.ToString(Session["friend1pic"])%>';
                        friendname.value = '<%=Session["friend1"]%>';
                        sound1.src = myctrl1.tbCollionSound;
                        ctrl1.style.visibility = "hidden";
                        if ('<%=ctrl1mainname%>' == "goldcoins") {
                            mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                        }
                        if ('<%=ctrl1mainname%>' == "health") {
                            mygoldcoins = String(parseInt(lifes, 10) + 1);
                            document.getElementById('lives').setAttribute("value", lifes);
                        }
                        noofhits = noofhits + 1;
                        document.getElementById('TextBox6').setAttribute("value", ranhits - noofhits);
                    }
                }
                if (ctrl2.style.visibility == "visible") {
                    if (parseInt(explosion.style.left.replace("px", ""), 10) >= parseInt(ctrl2.style.left.replace("px", ""), 10) && parseInt(explosion.style.right.replace("px", ""), 10) <= parseInt(ctrl2.style.right.replace("px", ""), 10) || parseInt(explosion.style.top.replace("px", ""), 10) >= parseInt(ctrl2.style.top.replace("px", ""), 10) && parseInt(explosion.style.bottom.replace("px", ""), 10) <= parseInt(ctrl2.style.bottom.replace("px", ""), 10)) {
                        enemyhits = enemyhits + 1;

                        if (enemyhits == 10) {
                            enemyhits = 0;
                            if (mygoldcoins == null || mygoldcoins == 0) {
                                mygoldcoins = String(parseInt(enemyhits, 10) + 1);
                            }
                            if (mygoldcoins != null || mygoldcoins != 0) {
                                mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            }
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                        }
                        document.getElementById('ehits').setAttribute("value", enemyhits);
                        sessionStorage.setItem("points", mygoldcoins);
                        sessionStorage.setItem("achievements", enemyhits);
                        friendimage.style.visibility = "visible";
                        friendname.style.visibility = "visible";
                        friendimage.src = '<%=Convert.ToString(Session["friend2pic"])%>';
                        friendname.value = '<%=Session["friend2"]%>';
                        sound1.src = myctrl2.tbCollionSound;
                        ctrl2.style.visibility = "hidden";
                        if ('<%=ctrl2mainname%>' == "goldcoins") {
                                mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                                document.getElementById('points').setAttribute("value", mygoldcoins);
                            }
                            if ('<%=ctrl2mainname%>' == "health") {
                            mygoldcoins = String(parseInt(lifes, 10) + 1);
                            document.getElementById('lives').setAttribute("value", lifes);
                        }
                    }
                }
                if (ctrl3.style.visibility == "visible") {
                    if (parseInt(explosion.style.left.replace("px", ""), 10) >= parseInt(ctrl3.style.left.replace("px", ""), 10) && parseInt(explosion.style.right.replace("px", ""), 10) <= parseInt(ctrl3.style.right.replace("px", ""), 10) || parseInt(explosion.style.top.replace("px", ""), 10) >= parseInt(ctrl3.style.top.replace("px", ""), 10) && parseInt(explosion.style.bottom.replace("px", ""), 10) <= parseInt(ctrl3.style.bottom.replace("px", ""), 10)) {
                        enemyhits = enemyhits + 1;
                        if (enemyhits == 10) {
                            enemyhits = 0;
                            if (mygoldcoins == null || mygoldcoins == 0) {
                                mygoldcoins = String(parseInt(enemyhits, 10) + 1);
                            }
                            if (mygoldcoins != null || mygoldcoins != 0) {
                                mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            }
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                        }
                        document.getElementById('ehits').setAttribute("value", enemyhits);
                        sessionStorage.setItem("points", mygoldcoins);
                        sessionStorage.setItem("achievements", enemyhits);
                        friendimage.style.visibility = "visible";
                        friendname.style.visibility = "visible";
                        friendimage.src = '<%=Convert.ToString(Session["friend3pic"])%>';
                            friendname.value = '<%=Session["friend3"]%>';
                            sound1.src = myctrl3.tbCollionSound;
                            ctrl3.style.visibility = "hidden";
                            if ('<%=ctrl3mainname%>' == "goldcoins") {
                            mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                        }
                        if ('<%=ctrl3mainname%>' == "health") {
                                mygoldcoins = String(parseInt(lifes, 10) + 1);
                                document.getElementById('lives').setAttribute("value", lifes);
                            }
                        }
                    }
                    if (ctrl4.style.visibility == "visible") {
                        if (parseInt(explosion.style.left.replace("px", ""), 10) >= parseInt(ctrl4.style.left.replace("px", ""), 10) && parseInt(explosion.style.right.replace("px", ""), 10) <= parseInt(ctrl4.style.right.replace("px", ""), 10) || parseInt(explosion.style.top.replace("px", ""), 10) >= parseInt(ctrl4.style.top.replace("px", ""), 10) && parseInt(explosion.style.bottom.replace("px", ""), 10) <= parseInt(ctrl4.style.bottom.replace("px", ""), 10)) {
                            enemyhits = enemyhits + 1;
                            if (enemyhits == 10) {
                                enemyhits = 0;
                                if (mygoldcoins == null || mygoldcoins == 0) {
                                    mygoldcoins = String(parseInt(enemyhits, 10) + 1);
                                }
                                if (mygoldcoins != null || mygoldcoins != 0) {
                                    mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                                }
                                document.getElementById('points').setAttribute("value", mygoldcoins);

                            }
                            document.getElementById('ehits').setAttribute("value", enemyhits);
                            sessionStorage.setItem("points", mygoldcoins);
                            sessionStorage.setItem("achievements", enemyhits);
                            friendimage.style.visibility = "visible";
                            friendname.style.visibility = "visible";
                            friendimage.src = '<%=Convert.ToString(Session["friend4pic"])%>';
                        friendname.value = '<%=Session["friend4"]%>';
                        sound1.src = myctrl4.tbCollionSound;
                        ctrl4.style.visibility = "hidden";
                        if ('<%=ctrl4mainname%>' == "goldcoins") {
                            mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                        }
                        if ('<%=ctrl4mainname%>' == "health") {
                            mygoldcoins = String(parseInt(lifes, 10) + 1);
                            document.getElementById('lives').setAttribute("value", lifes);
                        }
                    }
                }
                if (ctrl5.style.visibility == "visible") {
                    if (parseInt(explosion.style.left.replace("px", ""), 10) >= parseInt(ctrl5.style.left.replace("px", ""), 10) && parseInt(explosion.style.right.replace("px", ""), 10) <= parseInt(ctrl5.style.right.replace("px", ""), 10) || parseInt(explosion.style.top.replace("px", ""), 10) >= parseInt(ctrl5.style.top.replace("px", ""), 10) && parseInt(explosion.style.bottom.replace("px", ""), 10) <= parseInt(ctrl5.style.bottom.replace("px", ""), 10)) {
                        enemyhits = enemyhits + 1;
                        if (enemyhits == 10) {
                            enemyhits = 0;
                            if (mygoldcoins == null || mygoldcoins == 0) {
                                mygoldcoins = String(parseInt(enemyhits, 10) + 1);
                            }
                            if (mygoldcoins != null || mygoldcoins != 0) {
                                mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            }
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                        }
                        document.getElementById('ehits').setAttribute("value", enemyhits);
                        sessionStorage.setItem("points", mygoldcoins);
                        sessionStorage.setItem("achievements", enemyhits);
                        friendimage.style.visibility = "visible";
                        friendname.style.visibility = "visible";
                        friendimage.src = '<%=Convert.ToString(Session["friend5pic"])%>';
                        friendname.value = '<%=Session["friend5"]%>';
                        sound1.src = myctrl5.tbCollionSound;
                        ctrl5.style.visibility = "hidden";
                        if ('<%=ctrl5mainname%>' == "goldcoins") {
                            mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                        }
                        if ('<%=ctrl5mainname%>' == "health") {
                            mygoldcoins = String(parseInt(lifes, 10) + 1);
                            document.getElementById('lives').setAttribute("value", lifes);
                        }
                    }
                }
                if (Img1.style.visibility == "visible") {
                    if (parseInt(explosion.style.left.replace("px", ""), 10) >= parseInt(Img1.style.left.replace("px", ""), 10) && parseInt(explosion.style.right.replace("px", ""), 10) <= parseInt(Img1.style.right.replace("px", ""), 10) || parseInt(explosion.style.top.replace("px", ""), 10) >= parseInt(Img1.style.top.replace("px", ""), 10) && parseInt(explosion.style.bottom.replace("px", ""), 10) <= parseInt(Img1.style.bottom.replace("px", ""), 10)) {
                        enemyhits = enemyhits + 1;
                        if (enemyhits == 10) {
                            enemyhits = 0;
                            if (mygoldcoins == null || mygoldcoins == 0) {
                                mygoldcoins = String(parseInt(enemyhits, 10) + 1);
                            }
                            if (mygoldcoins != null || mygoldcoins != 0) {
                                mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            }
                            document.getElementById('points').setAttribute("value", mygoldcoins);

                        }
                        document.getElementById('ehits').setAttribute("value", enemyhits);
                        sessionStorage.setItem("points", mygoldcoins);
                        sessionStorage.setItem("achievements", enemyhits);
                        sound1.src = myctrl1.tbCollionSound;
                        if ('<%=ctrl1mainname%>' == "goldcoins") {
                            mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                        }
                        if ('<%=ctrl1mainname%>' == "health") {
                            mygoldcoins = String(parseInt(lifes, 10) + 1);
                            document.getElementById('lives').setAttribute("value", lifes);
                        }
                        if ('<%=ctrl3mainname%>' == "goldcoins" || '<%=ctrl3mainname%>' == "health") {

                            Img1.style.visibility = "hidden";

                        }

                    }
                }
                if (Img2.style.visibility == "visible") {
                    if (parseInt(explosion.style.left.replace("px", ""), 10) >= parseInt(Img2.style.left.replace("px", ""), 10) && parseInt(explosion.style.right.replace("px", ""), 10) <= parseInt(Img2.style.right.replace("px", ""), 10) || parseInt(explosion.style.top.replace("px", ""), 10) >= parseInt(Img2.style.top.replace("px", ""), 10) && parseInt(explosion.style.bottom.replace("px", ""), 10) <= parseInt(Img2.style.bottom.replace("px", ""), 10)) {
                        enemyhits = enemyhits + 1;
                        if (enemyhits == 10) {
                            enemyhits = 0;
                            if (mygoldcoins == null || mygoldcoins == 0) {
                                mygoldcoins = String(parseInt(enemyhits, 10) + 1);
                            }
                            if (mygoldcoins != null || mygoldcoins != 0) {
                                mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            }
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                        }
                        document.getElementById('ehits').setAttribute("value", enemyhits);
                        sessionStorage.setItem("points", mygoldcoins);
                        sessionStorage.setItem("achievements", enemyhits);
                        sound1.src = myctrl2.tbCollionSound;
                        if ('<%=ctrl2mainname%>' == "goldcoins") {
                        mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                        document.getElementById('points').setAttribute("value", mygoldcoins);
                    }
                    if ('<%=ctrl2mainname%>' == "health") {
                        mygoldcoins = String(parseInt(lifes, 10) + 1);
                        document.getElementById('lives').setAttribute("value", lifes);
                    }
                    if ('<%=ctrl3mainname%>' == "goldcoins" || '<%=ctrl3mainname%>' == "health") {

                        Img2.style.visibility = "hidden";

                    }

                }
            }
            if (Img3.style.visibility == "visible") {
                if (parseInt(explosion.style.left.replace("px", ""), 10) >= parseInt(Img3.style.left.replace("px", ""), 10) && parseInt(explosion.style.right.replace("px", ""), 10) <= parseInt(Img3.style.right.replace("px", ""), 10) || parseInt(explosion.style.top.replace("px", ""), 10) >= parseInt(Img3.style.top.replace("px", ""), 10) && parseInt(explosion.style.bottom.replace("px", ""), 10) <= parseInt(Img3.style.bottom.replace("px", ""), 10)) {
                    enemyhits = enemyhits + 1;
                    if (enemyhits == 10) {
                        enemyhits = 0;
                        if (mygoldcoins == null || mygoldcoins == 0) {
                            mygoldcoins = String(parseInt(enemyhits, 10) + 1);
                        }
                        if (mygoldcoins != null || mygoldcoins != 0) {
                            mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                        }
                        document.getElementById('points').setAttribute("value", mygoldcoins);
                    }
                    document.getElementById('ehits').setAttribute("value", enemyhits);
                    sessionStorage.setItem("points", mygoldcoins);
                    sessionStorage.setItem("achievements", enemyhits);
                    sound1.src = myctrl3.tbCollionSound;
                    if ('<%=ctrl3mainname%>' == "goldcoins") {
                        mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                        document.getElementById('points').setAttribute("value", mygoldcoins);
                    }
                    if ('<%=ctrl3mainname%>' == "health") {
                        mygoldcoins = String(parseInt(lifes, 10) + 1);
                        document.getElementById('lives').setAttribute("value", lifes);
                    }

                    if ('<%=ctrl3mainname%>' == "goldcoins" || '<%=ctrl3mainname%>' == "health") {
                        Img3.style.visibility = "hidden";
                    }


                }
            }
            if (Img4.style.visibility == "visible") {
                if (parseInt(explosion.style.left.replace("px", ""), 10) >= parseInt(Img4.style.left.replace("px", ""), 10) && parseInt(explosion.style.right.replace("px", ""), 10) <= parseInt(Img4.style.right.replace("px", ""), 10) || parseInt(explosion.style.top.replace("px", ""), 10) >= parseInt(Img4.style.top.replace("px", ""), 10) && parseInt(explosion.style.bottom.replace("px", ""), 10) <= parseInt(Img4.style.bottom.replace("px", ""), 10)) {
                    enemyhits = enemyhits + 1;
                    if (enemyhits == 10) {
                        enemyhits = 0;
                        if (mygoldcoins == null || mygoldcoins == 0) {
                            mygoldcoins = String(parseInt(enemyhits, 10) + 1);
                        }
                        if (mygoldcoins != null || mygoldcoins != 0) {
                            mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                        }
                        document.getElementById('points').setAttribute("value", mygoldcoins);
                    }
                    document.getElementById('ehits').setAttribute("value", enemyhits);
                    sessionStorage.setItem("points", mygoldcoins);
                    sessionStorage.setItem("achievements", enemyhits);
                    sound1.src = myctrl4.tbCollionSound;
                    if ('<%=ctrl4mainname%>' == "goldcoins") {
                        mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                        document.getElementById('points').setAttribute("value", mygoldcoins);
                    }
                    if ('<%=ctrl4mainname%>' == "health") {
                        mygoldcoins = String(parseInt(lifes, 10) + 1);
                        document.getElementById('lives').setAttribute("value", lifes);
                    }

                    if ('<%=ctrl4mainname%>' == "goldcoins" || '<%=ctrl4mainname%>' == "health") {
                        Img4.style.visibility = "hidden";
                    }

                }
            }

            if (Img5.style.visibility == "visible") {
                if (parseInt(explosion.style.left.replace("px", ""), 10) >= parseInt(Img5.style.left.replace("px", ""), 10) && parseInt(explosion.style.right.replace("px", ""), 10) <= parseInt(Img5.style.right.replace("px", ""), 10) || parseInt(explosion.style.top.replace("px", ""), 10) >= parseInt(Img5.style.top.replace("px", ""), 10) && parseInt(explosion.style.bottom.replace("px", ""), 10) <= parseInt(Img5.style.bottom.replace("px", ""), 10)) {
                    enemyhits = enemyhits + 1;
                    if (enemyhits == 10) {
                        enemyhits = 0;
                        if (mygoldcoins == null || mygoldcoins == 0) {
                            mygoldcoins = String(parseInt(enemyhits, 10) + 1);
                        }
                        if (mygoldcoins != null || mygoldcoins != 0) {
                            mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                        }
                        document.getElementById('points').setAttribute("value", mygoldcoins);
                    }
                    document.getElementById('ehits').setAttribute("value", enemyhits);
                    sessionStorage.setItem("points", mygoldcoins);
                    sessionStorage.setItem("achievements", enemyhits);
                    sound1.src = myctrl5.tbCollionSound;
                    if ('<%=ctrl5mainname%>' == "goldcoins") {
                        mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                        document.getElementById('points').setAttribute("value", mygoldcoins);
                    }
                    if ('<%=ctrl5mainname%>' == "health") {
                        mygoldcoins = String(parseInt(lifes, 10) + 1);
                        document.getElementById('lives').setAttribute("value", lifes);
                    }

                    if ('<%=ctrl5mainname%>' == "goldcoins" || '<%=ctrl5mainname%>' == "health") {
                        Img5.style.visibility = "hidden";
                    }

                }
            }
        }
    }

            function explode() {


                explosion.style.width = "30px";
                explosion.style.height = "30px";

                explosion.style.left = crosshair.style.left;
                explosion.style.top = crosshair.style.top;
                //explosion.style.right = crosshair.style.right;
                explosion.style.visibility = "visible";

                var myaddctrl = window.setTimeout(function () { removeexplosion() }, 3000);

                function removeexplosion() {
                    explosion.style.visibility = "hidden";
                }
            }

            var myaddctrl = window.setInterval(function () { moveCtrl() }, 900);
            function moveCtrl() {
                if (parseInt(ctrl1.style.left.replace("px", "")) > 365 && parseInt(ctrl1.style.left.replace("px", "")) < 850) {
                    ctrl1.style.left = parseInt(ctrl1.style.left.replace("px", "")) + 45 + "px";
                }
                if (parseInt(ctrl1.style.top.replace("px", "")) > 130 + parseInt(myctrl1.tsctrl1res).toString().replace("px", "") && parseInt(ctrl1.style.top.replace("px", "")) < 515) {
                    ctrl1.style.top = parseInt(ctrl1.style.top.replace("px", "")) - 45 + "px";
                }
                if (parseInt(ctrl2.style.left.replace("px", "")) > 365 && parseInt(ctrl2.style.left.replace("px", "")) < 850) {
                    ctrl2.style.left = parseInt(ctrl2.style.left.replace("px", "")) + 5 + "px";
                }
                if (parseInt(ctrl2.style.top.replace("px", "")) > 130 + parseInt(myctrl2.tsctrl2res).toString().replace("px", "") && parseInt(ctrl2.style.top.replace("px", "")) < 515) {
                    ctrl2.style.top = parseInt(ctrl2.style.top.replace("px", "")) + 45 + "px";
                }
                if (parseInt(ctrl3.style.left.replace("px", "")) > 365 && parseInt(ctrl3.style.left.replace("px", "")) < 850) {
                    ctrl3.style.left = parseInt(ctrl3.style.left.replace("px", "")) + 45 + "px";
                }
                if (parseInt(ctrl3.style.top.replace("px", "")) > 130 + parseInt(myctrl3.tsctrl3res).toString().replace("px", "") && parseInt(ctrl3.style.top.replace("px", "")) < 515) {
                    ctrl3.style.top = parseInt(ctrl3.style.top.replace("px", "")) + 45 + "px";
                }
                if (parseInt(ctrl4.style.left.replace("px", "")) > 365 && parseInt(ctrl4.style.left.replace("px", "")) < 850) {
                    ctrl4.style.left = parseInt(ctrl4.style.left.replace("px", "")) + 45 + "px";
                }
                if (parseInt(ctrl4.style.top.replace("px", "")) > 130 + parseInt(myctrl4.tsctrl4res).toString().replace("px", "") && parseInt(ctrl4.style.top.replace("px", "")) < 515) {
                    ctrl4.style.top = parseInt(ctrl4.style.top.replace("px", "")) + 45 + "px";
                }
                if (parseInt(ctrl5.style.left.replace("px", "")) > 365 && parseInt(ctrl5.style.left.replace("px", "")) < 850) {
                    ctrl5.style.left = parseInt(ctrl5.style.left.replace("px", "")) + 45 + "px";
                }
                if (parseInt(ctrl5.style.top.replace("px", "")) > 130 + parseInt(myctrl5.tsctrl5res).toString().replace("px", "") && parseInt(ctrl5.style.top.replace("px", "")) < 515) {
                    ctrl5.style.top = parseInt(ctrl5.style.top.replace("px", "")) + 45 + "px";
                }
                divplayer.focus();
            }


            document.addEventListener("keydown", check, false);
            document.addEventListener("mousedown", explodeprop, false);
            document.addEventListener("mousemove", moveprop, false);
            
            var currentlposition = "moveleft";
            var currenttposition = "moveleft";
            var positionresult = "moveleft";
            var won = 0;

            function moveprop(e) {

                document.body.style.cursor = "pointer";
                crosshair.style.visibility = "visible";

                crosshair.style.left = Math.round(e.clientX) + "px";
                crosshair.style.top = Math.round(e.clientY) + "px";


                if (Math.round(e.clientY) < temp, 10) {
                    explosion.style.top = temp + "px";

                }

                else if (Math.round(e.clientX) > 365) {
                    crosshair.style.left = Math.round(e.clientX) - 365 + "px";

                }

                else if (Math.round(e.clientX) < 365) {
                    crosshair.style.left = 1 + "px";

                }

                else if (Math.round(e.clientX) > 879) {
                    crosshair.style.left = 879 + "px";

                }

                else if (Math.round(e.clientY) > 130) {
                    crosshair.style.top = Math.round(e.clientY) - 130 + "px";

                }

                else if (Math.round(e.clientY) < 130) {
                    crosshair.style.top = 130 + "px";

                }

                else if (Math.round(e.clientY) > 275) {
                    crosshair.style.top = 275 + "px";

                }

                if (parseInt(currentlposition.replace("px", ""), 10) > Math.round(e.clientX)) {
                    positionresult = "moveright";
                }
                else if (parseInt(currentlposition.replace("px", ""), 10) < Math.round(e.clientX)) {
                    positionresult = "moveleft";
                }
                else if (parseInt(currentlposition.replace("px", ""), 10) > Math.round(e.clientY)) {
                    positionresult = "moveup";
                }
                else if (parseInt(currentlposition.replace("px", ""), 10) < Math.round(e.clientY)) {
                    positionresult = "movedown";
                }
                else if (parseInt(currentlposition.replace("px", ""), 10) < Math.round(e.clientY) && parseInt(currentlposition.replace("px", ""), 10) < Math.round(e.clientX)) {
                    positionresult = "jump";
                }
                else if (parseInt(currentlposition.replace("px", ""), 10) > Math.round(e.clientY) && parseInt(currentlposition.replace("px", ""), 10) > Math.round(e.clientX)) {
                    positionresult = "crawl";
                }



                if (myctrl1.tbPropType == "movable") {

                    document.body.style.cursor = "none";
                    explosion.style.visibility = "hidden";

                    crosshair.style.height = "30px";
                    crosshair.style.width = "30px";
                    explosion.style.height = "30px";
                    explosion.style.width = "30px";


                    //if (Math.round(e.clientY) > temp, 10) {
                    //    crosshair.style.top = temp + "px";
                    //}
                }
                if (myctrl1.tbPropType == "fixed") {

                    document.body.style.cursor = "none";
                    crosshair.style.top = "275px";
                    crosshair.style.height = "90px";
                    crosshair.style.width = "90px";
                    explosion.style.height = "40px";
                    explosion.style.width = "40px";
                    explosion.style.visibility = "visible";
                    explosion.style.left = Math.round(e.clientX) - 365 + "px";
                    explosion.style.top = Math.round(e.clientY) - temp + "px";
                    crosshair.style.left = explosion.style.left;

                }
                currentlposition = Math.round(e.clientX) + "px";
                currenttposition = Math.round(e.clientX) + "px";
            }

            function explodeprop(e) {
                detectcollision();
                explode();


            }


            function check(e) {
                var code = e.keyCode;



                if (code == 37) {


                    if (parseInt(crosshair.style.left.replace("px", ""), 10) > 1) {

                        crosshair.style.left = parseInt(crosshair.style.left.replace("px", ""), 10) - 10 + "px";
                        if (myctrl1.tbPropType == "fixed") {
                            explosion.style.left = parseInt(explosion.style.left.replace("px", ""), 10) - 10 + "px";

                        }
                    }
                }

                if (code == 39) {

                    if (parseInt(crosshair.style.left.replace("px", ""), 10) < 470) {

                        crosshair.style.left = parseInt(crosshair.style.left.replace("px", ""), 10) + 10 + "px";
                        if (myctrl1.tbPropType == "fixed") {
                            explosion.style.left = parseInt(explosion.style.left.replace("px", ""), 10) + 10 + "px";

                        }
                    }
                }

                if (code == 38) {


                    if (parseInt(crosshair.style.top.replace("px", ""), 10) > parseInt('<%=ctrl1mainres%>')) {

                        if (myctrl1.tbPropType == "movable") {
                            explosion.style.visibility = "hidden";
                            crosshair.style.top = parseInt(crosshair.style.top.replace("px", ""), 10) - 10 + "px";
                            crosshair.style.height = "40px";
                            crosshair.style.width = "40px";
                            explosion.style.height = "40px";
                            explosion.style.width = "40px";
                        }
                        if (myctrl1.tbPropType == "fixed") {
                            crosshair.style.top = "275px";
                            crosshair.style.height = "90px";
                            crosshair.style.width = "90px";
                            explosion.style.height = "40px";
                            explosion.style.width = "40px";
                            explosion.style.visibility = "visible";
                            explosion.style.top = parseInt(explosion.style.top.replace("px", ""), 10) - 10 + "px";
                        }
                    }

                }

                if (code == 40) {

                    if (parseInt(crosshair.style.top.replace("px", ""), 10) < 275) {

                        if (myctrl1.tbPropType == "movable") {
                            explosion.style.visibility = "hidden";
                            crosshair.style.top = parseInt(crosshair.style.top.replace("px", ""), 10) + 10 + "px";
                            crosshair.style.height = "40px";
                            crosshair.style.width = "40px";
                            explosion.style.height = "40px";
                            explosion.style.width = "40px";
                        }
                        if (myctrl1.tbPropType == "fixed") {
                            crosshair.style.top = "275px";
                            crosshair.style.height = "90px";
                            crosshair.style.width = "90px";
                            explosion.style.height = "40px";
                            explosion.style.width = "40px";
                            explosion.style.visibility = "visible";
                            explosion.style.top = parseInt(explosion.style.top.replace("px", ""), 10) + 10 + "px";

                        }
                    }

                }



                if (code == 83) {
                    detectcollision();
                    explode();

                }

            }



        });

        </script>

    <script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=123405257731200";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

function  showbuy(){
		
FB.api(
  'me/treasure_huntermp:treasurespot',
  'post',
  {
    product: "https://treasurehunter.apphb.com/treasurespot.html"
  },
  function(response) {
    // handle the response
  }
);
	}

</script>
 
    <script>!function (d, s, id) {
var js, fjs = d.getElementsByTagName(s)[0]; if (!d.getElementById(id)) {
js = d.createElement

(s); js.id = id; js.src = "https://platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs);
}
}

(document, "script", "twitter-wjs");</script>

    <script>!function (d, s, id) {
var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!

d.getElementById(id)) {
    js = d.createElement(s); js.id = id; js.src = p

    + "://platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs);
}
}(document, "script", "twitter-wjs");</script>
     
    <script type="text/javascript" >
        FB.init({ appId: "123405257731200", status: true, cookie: true });

        // The dialog only opens if you've implemented the
        // Credits Callback payments_get_items.
        function feed() {
            FB.ui({
                method: 'feed',
		redirect_uri: 'https://apps.facebook.com/treasure_huntermp',
                link: 'https://treasurehunter.apphb.com/',
                caption: 'Treasure Hunter 3D Multiplayer Game - Completed TreasureSpot ' + '<%=Label1.Text%>' + ' Collected ' + '<%=points.Text%>' + 'Gold Coins',
            }, function (response) { });
        }
function FacebookInviteFriends() {
        FB.ui({
            method: 'apprequests',
            message: 'You are Invited to Play Treasure Hunter 3D MultiPlayer Game with me'
        });                                                                                                                                                                                                                           
    }
  </script>        
   
        <form id="form1" runat="server" >
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT * FROM loggedusers WHERE (luname = '<%=Hiddenfield1%>')" InsertCommand="INSERT INTO loggedusers(luname, luid, luposition, luimg, luspriteimg, lucrisboos, luloggedin, lutspots, lulogintimes, luinvites) Values (@luname, @luid, @luposition, @luimg, @luspriteimg, @lucrisboos, @luloggedin, @lutspots, @lulogintimes, @luinvites)" UpdateCommand="UPDATE appuserdetails SET @uloggedin='yes'"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT * FROM tspots"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT * FROM toolbox"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT treasurevalue FROM treasureprize"></asp:SqlDataSource>
            

<div class="fb-like-box" data-href="https://www.facebook.com/Treasurehuntergame" data-colorscheme="light" data-show-faces="false" data-header="false" data-stream="false" data-show-border="false" style="z-index: 351; position: absolute; width: 128px; height: 24px; top: 3px; right: 289px; bottom: 539px; left: 562px"></div>
            
            
        



        <asp:Button ID="Button1" runat="server" ClientIDMode="Static" PostBackUrl="~/Play/play" Style="z-index: 1; left: 754px; top: 8px; position: absolute; display: none" Text="Button" CausesValidation="False" />

          <img alt=""  src="https://treasurehunter.apphb.com/Images/amazon.png" style="z-index: 100; left: 803px; top: 27px; position: absolute; height: 62px; width: 166px" />
          <a href="https://treasurehunter.apphb.com/prizes.html" target="_self" style="position: absolute; left: 870px; top: 270px; width: 92px; text-decoration: none; background-color: #FF00FF; color: #FFFFFF; border-radius: 20px; right: 289px; text-align: center;z-index: 1; ">Rewards</a>
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="14pt" ForeColor="#9999FF" Style="z-index: 1; left: 196px; top: 0px; position: absolute; width: 319px; height: 26px" Text="Label" meta:resourcekey="Label1Resource1"></asp:Label>
        <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Size="10pt" ForeColor="#9999FF" Style="z-index: 1; left: 375px; top: 79px; position: absolute; width: 347px; height: 26px" Text="Use Mouse or arrow keys for movement, click or 's' for functions" meta:resourcekey="Label2Resource1"></asp:Label>

        <asp:HyperLink ID="Hyperlink1" runat="server" Font-Underline="False" NavigateUrl="https://treasurehunter.apphb.com/buy.aspx" Style="z-index: 1; border-radius:15px; background-color: #0000FF;  top: 56px; position: absolute; height: 18px; width: 141px; left: 11px;" Target="_self" ForeColor="#FFCC00" meta:resourcekey="Hyperlink1Resource1" ViewStateMode="Enabled">Buy a Treasure Spot</asp:HyperLink>
        <asp:HyperLink ID="Hyperlink2" runat="server" Font-Underline="False" NavigateUrl="https://treasurehunter.apphb.com/buy.aspx" Style="z-index: 1; border-radius:15px; background-color: #0000FF;  top: 107px; position: absolute; width: 141px; left:824px;" Target="_self" ForeColor="#FFCC00" meta:resourcekey="Hyperlink2Resource1" ViewStateMode="Enabled">Buy a ToolBox Item</asp:HyperLink>
        <asp:HyperLink ID="Hyperlink3" runat="server" Font-Underline="False" NavigateUrl="https://treasurehunter.apphb.com/Invite/friends" Style="z-index: 1; border-radius:15px; background-color: #0000FF;  left: 384px; top: 57px; position: absolute" Target="_self" ForeColor="#FFCC00" meta:resourcekey="Hyperlink3Resource1" ViewStateMode="Enabled">Invite Friends</asp:HyperLink>
        <asp:HyperLink ID="Hyperlink4" runat="server" Font-Underline="False" NavigateUrl="https://treasurehunter.apphb.com/gamesettings.aspx" Style="z-index: 1; border-radius:15px; background-color: #0000FF; top: 57px; position: absolute; width: 84px; left: 260px;" Target="_self" ForeColor="#FFCC00" meta:resourcekey="Hyperlink4Resource1" ViewStateMode="Enabled">My Game</asp:HyperLink>
        <asp:hyperlink ID="Hyperlink5" runat="server"  Font-Underline="False" NavigateUrl="~/Play/play" style="z-index: 1; border-radius:15px; background-color: #FF9900;  left: 878px; top: 203px; position: absolute; height: 23px; width: 57px;" Target="_self" ForeColor="White">Winners</asp:hyperlink>
        <asp:hyperlink ID="Hyperlink6" runat="server"  Font-Underline="False" NavigateUrl="http://www.amazon.com/gp/product/B00I2DV2UO" style="z-index: 1; border-radius:15px; background-color: #FF9900;  left: 787px; top: 14px; position: absolute; height: 90px; width: 191px; cursor:pointer;" Target="_self" ForeColor="Transparent"></asp:hyperlink>


        <asp:TextBox ID="ehits" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" Style="z-index: 1; left: 127px; top: 2px; position: absolute; width: 40px; right: 1080px;" ForeColor="#FFCC00" meta:resourcekey="ehitsResource1" ViewStateMode="Enabled"></asp:TextBox>
        <asp:TextBox ID="lives" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" Style="z-index: 1; left: 320px; top: 33px; position: absolute; width: 45px; right: 513px;" ForeColor="#FFCC00" meta:resourcekey="livesResource1" ViewStateMode="Enabled">50</asp:TextBox>
            <asp:TextBox ID="TextBox7" runat="server" BackColor="#FFFF99" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" Style="z-index: 700; left: 4px; top: 243px; position: absolute; width: 966px; right: -90px; height: 70px; vertical-align:middle; " ForeColor="#0000CC" meta:resourcekey="livesResource1" ViewStateMode="Enabled" Font-Bold="True" Font-Names="Tahoma" Font-Size="13pt"></asp:TextBox>
            <asp:TextBox ID="points" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 518px; top: 34px; position: absolute; width: 81px" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false"></asp:TextBox>
        <asp:TextBox ID="treasure" runat="server" AutoPostBack="False" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" Style="z-index: 1; left: 877px; top: 420px; position: absolute; width: 54px; height: 15px;" ForeColor="#FFCC00" meta:resourcekey="treasureResource1" ViewStateMode="Enabled"></asp:TextBox>
 <asp:Label ID="Label3" runat="server" ForeColor="#FFCC00" style="z-index: 1; left: 563px; top: 334px; position: absolute" Text="Loading ......." ClientIDMode="Static"></asp:Label>

    <audio id="sound1" src='<%=ctrl1mainsound%>' autoplay="autoplay">
    </audio>

            <a href="https://twitter.com/share" class="twitter-share-button" data-lang="en" style="text-decoration:none; position: absolute; top: 28px; left: 6px">Tweet</a>
            
    <label style="position: absolute; top: 1px; left: 1px; height: 19px; color: #FFCC00; font-family: 'Jokerman LET'; font-size: large; font-weight: lighter;">Achievements</label>

    <label style="position: absolute; top: 32px; left: 241px; height: 19px; right: 663px; color: #FFCC00; font-family: 'Jokerman LET'; font-size: large;">Lives</label>

    <label style="position: absolute; top: 32px; left: 406px; height: 19px; color: #FFCC00; height: 20px; position: absolute; font-family: 'Jokerman LET'; font-size: large;">Gold Coins</label>

    <label style="position: absolute; top: 385px; left: 862px; height: 19px; color: #FFCC00; font-family: 'Jokerman LET'; font-size: large;">Treasure( $)</label>
    <label style="position: absolute; top: 101px; left: 7px; height: 19px; color: #FFCC00; width: 97px; font-family: 'Victorian LET'; font-size: large;">Achievements</label>
    <div id="divplayer"  style="z-index: 203; background-color: transparent; overflow: hidden;  width: 480px; height: 375px; position: absolute; top: 132px; left: 365px; right: 855px; bottom: 502px; display: inline;">
        <img id="crosshair" src='<%=propurl%>' style="width: 40px; height: 40px; position: absolute; top: '<%=ctrl1mainres%>'; left: 119px; z-index: 202; right: 159px; bottom: 140px;"/>
        <img id="explosion" src='<%=collisionurl%>' style="width: 40px; height: 40px; position: absolute; top: '<%=ctrl1mainres%>'; left: 199px; z-index: 21; visibility: hidden; right: 159px; bottom: 140px;"/>
        <img id="ctrl1" src='<%=ctrl1mainurl%>' style="border: thin solid Transparent; width: '<%=ctrl1mainwidth%>'; height: '<%=ctrl1mainheight%>'; position: absolute; top: '<%=ctrl1maintop%>'; left: '<%=ctrl1mainleft%>'; z-index: 21; visibility: hidden; right: 159px; bottom: 140px; " />
        <img id="ctrl2" src='<%=ctrl2mainurl%>' style="border: thin solid Transparent; width: '<%=ctrl2mainwidth%>'; height: '<%=ctrl2mainheight%>'; position: absolute; top: '<%=ctrl2maintop%>'; left: '<%=ctrl2mainleft%>'; z-index: 21; visibility: hidden; right: 159px; bottom: 140px;" />
        <img id="ctrl3" src='<%=ctrl3mainurl%>' style="border: thin solid Transparent; width:'<%=ctrl3mainwidth%>'; height: '<%=ctrl3mainheight%>'; position: absolute; top: '<%=ctrl3maintop%>'; left: '<%=ctrl3mainleft%>'; z-index: 21; visibility: hidden; right: 159px; bottom: 140px;" />
        <img id="ctrl4" src='<%=ctrl4mainurl%>' style="border: thin solid Transparent; width: '<%=ctrl4mainwidth%>'; height:'<%=ctrl4mainheight%>'; position: absolute; top: '<%=ctrl4maintop%>'; left: '<%=ctrl4mainleft%>'; z-index: 21; visibility: hidden; right: 159px; bottom: 140px;" />
        <img id="ctrl5" src='<%=ctrl5mainurl%>' style="border: thin solid Transparent; width: '<%=ctrl5mainwidth%>'; height: '<%=ctrl5mainheight%>'; position: absolute; top: '<%=ctrl5maintop%>'; left: '<%=ctrl5mainleft%>'; z-index: 21; visibility: hidden; right: 159px; bottom: 140px;" />
        <%--<img id="player1" src="" style="width: 30px; height: 30px; position: absolute; top: 278px; left: 229px; z-index: 21; right: 460px; margin-left: 0px; margin-top: 0px;">
        <img id="player2" src="" style="width: 30px; height: 30px; position: absolute; top: 296px; left: 260px; z-index: 21; right: 562px; margin-left: 0px; margin-top: 0px;">
        <img id="player3" src="" style="width: 30px; height: 30px; position: absolute; top: 78px; left: 229px; z-index: 21; right: 460px; margin-left: 0px; margin-top: 0px;">
        <img id="player4" src="" style="width: 30px; height: 30px; position: absolute; top: 302px; left: 245px; z-index: 21; right: 577px; margin-left: 0px; margin-top: 0px;">
        <img id="player5" src="" style="width: 30px; height: 30px; position: absolute; top: 251px; left: 390px; z-index: 21; right: 299px; margin-left: 0px; margin-top: 0px;">
        --%>
        <img id="Img1" src='<%=ctrl1mainurl%>' style="border: thin solid Transparent; width: '<%=ctrl1mainwidth%>'; height: '<%=ctrl1mainheight%>'; top: '<%=ctrl1maintop%>'; left: '<%=ctrl1mainleft%>'; z-index: 21; visibility: hidden; right: 159px; bottom: 140px;" />
        <img id="Img2" src='<%=ctrl2mainurl%>' style="border: thin solid Transparent; width: '<%=ctrl2mainwidth%>'; height: '<%=ctrl2mainheight%>'; top: '<%=ctrl2maintop%>'; left: '<%=ctrl2mainleft%>'; z-index: 21; visibility: hidden; right: 159px; bottom: 140px;" />
        <img id="Img3" src='<%=ctrl3mainurl%>' style="border: thin solid Transparent; width: '<%=ctrl3mainwidth%>'; height: '<%=ctrl3mainheight%>'; top: '<%=ctrl3maintop%>'; left: '<%=ctrl3mainleft%>'; z-index: 21; visibility: hidden; right: 159px; bottom: 140px;" />
        <img id="Img4" src='<%=ctrl4mainurl%>' style="border: thin solid Transparent; width: '<%=ctrl4mainwidth%>'; height: '<%=ctrl4mainheight%>'; top: '<%=ctrl4maintop%>'; left: '<%=ctrl4mainleft%>'; z-index: 21; visibility: hidden; right: 159px; bottom: 140px;" />
        <img id="Img5" src='<%=ctrl5mainurl%>' style="border: thin solid Transparent; width: '<%=ctrl5mainwidth%>'; height: '<%=ctrl5mainheight%>'; top: '<%=ctrl5maintop%>'; left: '<%=ctrl5mainleft%>'; z-index: 21; visibility: hidden; right: 159px; bottom: 140px;"  />
    <img id="Img9" src="https://treasurehunter.apphb.com/Images/goldshower.gif" style="border: thin solid Transparent; width: 300px; height: 200px; top: 41px; left: 22px; z-index: 1; visibility: hidden; right: 34px; bottom: 54px; position: absolute;" />
    
    </div>
    <input id="friendname" style="visibility: visible; text-decoration: none; height: 77px; background-color: transparent; color: #FFCC00; z-index: 1; left: 7px; top: 219px; position: absolute; width: 91px; cursor:none;" type="text" readonly="true" />
       <img alt="" src="https://treasurehunter.apphb.com/Images/landscape.jpg" style="width: 80px; height: 80px; visibility: visible; z-index: 1; left: 11px; top: 125px; position: absolute; bottom: 308px;" id="friendimage" />
    <img alt="" src='<%=iframeurl%>' style="z-index: 0; left: 365px; top: 130px; position: absolute; background-color: transparent; width: 480px; height: 374px;" class="twoto3d" id="fplayer" />
<label style="position: absolute; top: 320px; left: 7px; height: 18px; color: #FFFFFF; font-family: Script; font-size: 13px; width: 100px;">Talk to Players</label>

<input id="Button2" style="border: medium outset #FF00FF; background-color: #6699FF; color: #FFFFFF; z-index: 1; left: 281px; top: 492px; position: absolute; width: 56px; border-radius:15px; " type="button" value="Send"  onclick="send2server();" /> 
  <div style="position: absolute; z-index: 210; width: 349px; height: 134px; top: 347px; right: 518px; bottom: 85px; left: 5px; overflow: hidden; cursor: crosshair;">
    <textarea id="Text2" class="TextArea1" style="border: 15px ridge #99FF99; position: absolute; left: 0px; top: 0px; background-color: Transparent; color: #FFCC00; width: 316px; height: 99px;" readonly="readonly"></textarea>
  </div>
      <input id="Text1" type="text" style="border: medium ridge #00CC00; position: absolute; left: 12px; top: 493px; width: 242px; background-color: #FFFFCC; color: #000000;" onkeydown="checkEnter(event);"/> 
<iframe id="myframe" src="https://treasurehunter.apphb.com/updatecoins.aspx" runat="server" style="border-style: none; position: absolute; top: 147px; left: 862px; height: 40px; width: 93px; margin-top: 0px;" ></iframe>
<div id="aimg" style="position: absolute; left: 118px; top: 101px; width: 236px; height: 200px;">
    <img alt="" src="https://treasurehunter.apphb.com/Images/achievements.gif" style="width: 232px; height: 199px; visibility: visible; z-index: 300; left: 0px; top: 0px; position: absolute; bottom: 1px; background-color: Transparent;" id="Img6" />
    <img id="Image1" style="z-index: 300; left: 82px; top: 101px; position: absolute; width: 36px; height: 39px;" src='<%=one1%>' />
    <img id="Image2" style="z-index: 300; left: 112px; top: 60px; position: absolute; width: 32px; height: 30px;" src='<%=one2%>' />
    <img id="Image3" style="z-index: 300; left: 159px; top: 30px; position: absolute; width: 34px; height: 32px;" src='<%=one3%>' />
    <img id="Image4" style="z-index: 300; left: 35px; top: 149px; position: absolute; width: 39px; height: 35px;" src='<%=one4%>' />
    <img id="Image5" style="z-index: 300; left: 203px; top: 10px; position: absolute; width: 26px; height: 33px;" src='<%=one5%>' />

    <img id="Image6" style="z-index: 301; left: 81px; top: 158px; position: absolute; width: 18px; height: 18px;" src="https://treasurehunter.apphb.com/Images/tick.png" />
    <img id="Image7" style="z-index: 301; left: 124px; top: 103px; position: absolute; width: 16px; height: 17px;" src="https://treasurehunter.apphb.com/Images/tick.png" />
    <img id="Image8" style="z-index: 301; left: 152px; top: 67px; position: absolute; width: 20px; height: 21px;" src="https://treasurehunter.apphb.com/Images/tick.png" />
    <img id="Image9" style="z-index: 301; left: 201px; top: 44px; position: absolute; width: 18px; height: 18px;" src="https://treasurehunter.apphb.com/Images/tick.png" />
    <img id="Image10" style="z-index: 301; left: 178px; top: 3px; position: absolute; width: 18px; height: 18px;" src="https://treasurehunter.apphb.com/Images/tick.png" />

</div>
  <div id="tooltip" style="position:absolute; top: 218px; left: 494px; width: 107px; height: 104px; visibility: hidden;">
     <input  type="text" id="playername" style="position:absolute; text-decoration:none; background-color:transparent; top: 11px; left: 20px; width: 60px; height: 47px;"/>
      <img id="playerpic" style="position:absolute; background-color:transparent; top: 75px; left: 7px; height: 18px; width: 90px; font-size: 8px;" src='<%=Session["friend1pic"]%>'/>
  </div>  
    <label style="position: absolute; top: 76px; left: 151px; height: 19px; color: #FFCC00; height: 21px; position: absolute; font-size: large; width: 122px; font-family: 'John Handy LET';">Treasure Map</label>
    <asp:TextBox ID="attacked" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 488px; top: 105px; position: absolute; width: 253px" ForeColor="White"  ReadOnly="true"></asp:TextBox>    
<asp:TextBox ID="TextBox1" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 856px; top: 466px; position: absolute; width: 113px; " ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false" Font-Names="OldDreadfulNo7 BT" Font-Size="10pt">Time Remaining</asp:TextBox>
<asp:TextBox ID="TextBox2" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 891px; top: 491px; position: absolute; width: 34px" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false">120</asp:TextBox>
<asp:TextBox ID="TextBox3" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 118px; top: 305px; position: absolute; width: 62px; " ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false" Font-Names="Victorian LET" Font-Size="Medium">Collect</asp:TextBox>
<asp:TextBox ID="TextBox4" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 223px; top: 306px; position: absolute; width: 47px" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false"></asp:TextBox>
<asp:TextBox ID="TextBox5" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 118px; top: 325px; position: absolute; width: 112px; right: 638px;" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false" Font-Names="Victorian LET" Font-Size="Medium">Conquer Players</asp:TextBox>
<asp:TextBox ID="TextBox6" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 252px; top: 325px; position: absolute; width: 36px" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false"></asp:TextBox>
<img id="Img7" src="https://treasurehunter.apphb.com/Images/goldcoin.gif" style="border: thin solid Transparent; width: 15px; height: 15px; position: absolute; top: 300px; left: 323px; z-index: 21; visibility: visible; right: 530px; bottom: 247px; " >
<img id="Img8" src='<%=ctrl1mainurl%>' style="border: thin solid Transparent; width: 15px; height: 15px; position: absolute; top: 322px; left: 310px; z-index: 21; visibility: visible; right: 543px; bottom: 225px; " >        
</form> 

</body>

</html>
