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
    <title>The Treasurehunter, A Free Online Game, Have Fun</title>
</head>
<<<<<<< HEAD
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
=======

>>>>>>> 6ace8276edb67373beea8a9a1a4673dd5ca3ba6a


<body style="height: 587px; overflow: hidden;" class="body">
<style type="text/css">
    .twoto3d {
            
<<<<<<< HEAD
           width:201px;
height:147px;
position:relative;
animation:mymove 0.05s infinite;
-webkit-animation:mymove 0.25s infinite;
        top: 7px;
        left: 8px;
=======
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
			
                    if (noofhits == ranhits) {
                        noofhits = -100;
			showshower = 1;
                    }
                    if (noofcoins == rancoins) {
                        noofcoins = -150;
			showshower = 1;
                    }
                    if (showshower == 1) {
                        
                            document.getElementById('attacked').setAttribute("value", "You Have Completed this Treasure Spot Keep Playing");
                            Img9.style.visibility = "visibile";
                            feed();
                            document.getElementById('TextBox2').setAttribute("value", "0");
                            
                        
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
                document.getElementById('attacked').setAttribute("value", "You are Targetted Now");

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
>>>>>>> 6ace8276edb67373beea8a9a1a4673dd5ca3ba6a
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
<<<<<<< HEAD
}(document, 'script', 'facebook-jssdk'));</script>
=======
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
>>>>>>> 6ace8276edb67373beea8a9a1a4673dd5ca3ba6a


<script>

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
<<<<<<< HEAD
=======
  </script>        
   
        <form id="form1" runat="server" >
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT * FROM loggedusers WHERE (luname = '<%=Hiddenfield1%>')" InsertCommand="INSERT INTO loggedusers(luname, luid, luposition, luimg, luspriteimg, lucrisboos, luloggedin, lutspots, lulogintimes, luinvites) Values (@luname, @luid, @luposition, @luimg, @luspriteimg, @lucrisboos, @luloggedin, @lutspots, @lulogintimes, @luinvites)" UpdateCommand="UPDATE appuserdetails SET @uloggedin='yes'"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT * FROM tspots"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT * FROM toolbox"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT treasurevalue FROM treasureprize"></asp:SqlDataSource>
            

<div class="fb-like-box" data-href="https://www.facebook.com/Treasurehuntergame" data-colorscheme="light" data-show-faces="false" data-header="false" data-stream="false" data-show-border="false" style="z-index: 351; position: absolute; width: 128px; height: 24px; top: 3px; right: 289px; bottom: 539px; left: 562px"></div>
            
            
        



        <asp:Button ID="Button1" runat="server" ClientIDMode="Static" PostBackUrl="~/Play/play" Style="z-index: 1; left: 754px; top: 8px; position: absolute; display: none" Text="Button" CausesValidation="False" />



        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="14pt" ForeColor="#9999FF" Style="z-index: 1; left: 196px; top: 0px; position: absolute; width: 353px; height: 26px" Text="Label" meta:resourcekey="Label1Resource1"></asp:Label>
        <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Size="14pt" ForeColor="#9999FF" Style="z-index: 1; left: 360px; top: 75px; position: absolute; width: 505px; height: 26px" Text="Use Mouse or arrow keys for movement, click or 's' for functions" meta:resourcekey="Label2Resource1"></asp:Label>
>>>>>>> 6ace8276edb67373beea8a9a1a4673dd5ca3ba6a

</script>



<<<<<<< HEAD
=======
        <asp:TextBox ID="ehits" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" Style="z-index: 1; left: 17px; top: 2px; position: absolute; width: 40px; right: 660px;" ForeColor="#FFCC00" meta:resourcekey="ehitsResource1" ViewStateMode="Enabled"></asp:TextBox>
        <asp:TextBox ID="lives" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" Style="z-index: 1; left: 320px; top: 33px; position: absolute; width: 45px; right: 513px;" ForeColor="#FFCC00" meta:resourcekey="livesResource1" ViewStateMode="Enabled">50</asp:TextBox>
            <asp:TextBox ID="TextBox7" runat="server" BackColor="#FFFF99" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" Style="z-index: 700; left: 4px; top: 243px; position: absolute; width: 966px; right: -90px; height: 70px; vertical-align:middle; " ForeColor="#0000CC" meta:resourcekey="livesResource1" ViewStateMode="Enabled" Font-Bold="True" Font-Names="Tahoma" Font-Size="13pt"></asp:TextBox>
            <asp:TextBox ID="points" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 518px; top: 34px; position: absolute; width: 81px" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false"></asp:TextBox>
        <asp:TextBox ID="treasure" runat="server" AutoPostBack="False" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" Style="z-index: 1; left: 753px; top: 33px; position: absolute; width: 54px; height: 15px;" ForeColor="#FFCC00" meta:resourcekey="treasureResource1" ViewStateMode="Enabled"></asp:TextBox>
 <asp:Label ID="Label3" runat="server" ForeColor="#FFCC00" style="z-index: 1; left: 563px; top: 334px; position: absolute" Text="Loading ......." ClientIDMode="Static"></asp:Label>
>>>>>>> 6ace8276edb67373beea8a9a1a4673dd5ca3ba6a

<a href="https://plus.google.com/103286494679541419770" rel="publisher" style="z-index: 1; left: 784px; top: 17px; position: absolute; text-decoration: none; color: #FFFFFF;">Google+</a>      
<a href='https://treasurehunter.apphb.com/buygoggles.aspx' onclick="" style="z-index: 1; position:absolute;left:420px; top:169px;width:44px; text-decoration:none; color: #FFFFFF; background-color: #FF9900;  border-radius:20px; text-align: center;">Buy</a>
<a href='https://treasurehunter.apphb.com/Invite/friends' onclick="FacebookInviteFriends();" style="z-index: 1; position:absolute; left:683px; top:139px; width:109px; text-decoration:none; color: #FFFFFF; background-color: #0000FF;  border-radius:20px; text-align: center; right: 92px; height: 18px; font-family: 'Victorian LET';">Invite Friends</a>
<a href='https://treasurehunter.apphb.com/gamesettings.aspx'  style="position:absolute;left:807px; top:139px; width:57px; text-decoration:none; color: #FFFFFF; background-color: #0000FF;  border-radius:20px; text-align: left; font-family: 'Victorian LET';">My Game</a>
   <a href="https://treasurehunter.apphb.com/Home/Index1" target="_self" style="position:absolute;left:227px; top:136px; width:152px; text-decoration:none; background-color: #0000FF; color: #FFFFFF;  border-radius:20px; right: 505px; text-align: center; font-family: 'Victorian LET';z-index: 1; " > Go On a TreasureHunt </a> 
   <a href="https://treasurehunter.apphb.com/thhelp.aspx" target="_self" style="position:absolute;left:241px; top:170px; width:152px; text-decoration:none; background-color: #0000FF; color: #FFFFFF;  border-radius:20px; right: 479px; text-align: center;z-index: 1;  " > Game Instructions</a> 
        <a href="https://treasurehunter.apphb.com/prizes.html" target="_self" style="position: absolute; left: 699px; top: 114px; width: 152px; text-decoration: none; background-color: #FF00FF; color: #FFFFFF; border-radius: 20px; right: 33px; text-align: center;z-index: 1; ">Prizes</a>
    <a href="https://treasurehunter.apphb.com/buy.aspx" target="_self" style="position:absolute;left:387px; top:136px; width:144px; text-decoration:none; color: #FFFFFF; background-color: #0000FF;  border-radius:20px; text-align: center; right: 353px; font-family: 'Victorian LET';" > Buy a Treasure Spot </a> 
    <a href="https://treasurehunter.apphb.com/buy.aspx" target="_self" style="position:absolute;left:497px; top:138px; width:136px; text-decoration:none; color: #FFFFFF; background-color: #0000FF;  border-radius:20px; text-align: center; font-family: 'Victorian LET';z-index: 1; " > Buy a ToolBox Item </a>                  

<<<<<<< HEAD
        <asp:Label ID="Label1" runat="server" style="border: thick ridge #CC66FF; z-index: 1; left: 45px; top: 196px; position: absolute; border-radius:20px; width: 825px; height: 116px; bottom: 252px; color:white" Text="A Free Online Game, True 3D Game where multiple players will be playing. A fun filled treasure hunting adventure is there. Collect as many gold coins as possible, renewable lives, real sound and great visual effects. A player need to have to create a treasure spot of his or her, owned salable. A treasure bounty is there hidden in the treasure spots. Invbite as many friends as possible to make the hunt more interesting. A secret society members will be encountered, destroy them, remove or overcome other players and creatures to collect and reach the treasure. All is fair in game and war. Treasure Hunter is a never ending game. Have FUN. To start click on Go On a Treasure Hunt." BackColor="Transparent" Font-Names="calligraph421 bt, 9pt"></asp:Label>
        <asp:Label ID="Label4" runat="server" Font-Bold="True" style=" z-index: 1; left: 320px; top: 89px; position: absolute; right: 204px;" Text="Interactive Gaming with Fun Filled Places and Adventure" ForeColor="White" BorderStyle="None" Font-Names="Calligraph421 BT" Font-Size="9pt"></asp:Label>
        <asp:TextBox ID="TextBox7" runat="server" BackColor="#FFFF99" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" Style="z-index: 700; left: 4px; top: 243px; position: absolute; width: 966px; right: 9px; height: 70px; vertical-align: middle;" ForeColor="#0000CC" meta:resourcekey="livesResource1" ViewStateMode="Enabled" Font-Bold="True" Font-Names="Tahoma" Font-Size="13pt"></asp:TextBox>
   
        <img alt="" class="twoto3d" src="https://treasurehunter.apphb.com/Images/landscape.jpg" style="border: thick ridge #CC66FF; z-index: 1; left: 8px; top: 7px; border-radius:70px; position: absolute" />
=======
            <a href="https://twitter.com/share" class="twitter-share-button" data-lang="en" style="text-decoration:none; position: absolute; top: 6px; left: 6px">Tweet</a>
            
    <label style="position: absolute; top: 1px; left: 1px; height: 19px; color: #FFCC00; font-family: 'Jokerman LET'; font-size: large; font-weight: lighter;">Achievements</label>
>>>>>>> 6ace8276edb67373beea8a9a1a4673dd5ca3ba6a

<img alt="" src="https://treasurehunter.apphb.com/Images/bg.jpg" style="z-index: 0; left: 0px; top: 0px; position: absolute; width:1024px; height:800px" />                  
    
        <img alt="" src="https://treasurehunter.apphb.com/Images/3dglass.gif" style="z-index: 1; left: 474px; top: 166px; position: absolute; height: 27px; width: 56px" />
         <img alt="" src="https://treasurehunter.apphb.com/Images/amazon.png" style="z-index: 1; left: 700px; top: 44px; position: absolute; height: 62px; width: 166px" />         
        <asp:Label ID="Label5" runat="server" Font-Size="8pt" ForeColor="White" style="z-index: 1; left: 401px; top: 587px; position: absolute" Text="Treasure Hunter - 2014"></asp:Label>
       
        
   <a href="https://treasurehunter.apphb.com/tools.aspx" target="_self" style="position:absolute;left:733px; top:170px; width:152px; text-decoration:none; background-color: #0000FF; color: #FFFFFF; border-radius:20px; text-align: center; height: 22px;" > Go to My ToolsBox </a> 

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

   
                <asp:DataList ID="DataList1" runat="server" BackColor="Transparent" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataSourceID="SqlDataSource2" RepeatDirection="Horizontal" ShowFooter="False" ShowHeader="False" style="border: thick ridge #CC66FF; z-index: 1; left: 15px; top: 367px; position: absolute; height: 187px; width: 410px; right: 436px;" Font-Names="calligraph421 bt, 9pt">
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <ItemStyle BackColor="Transparent" ForeColor="White" />
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("luimg") %>' style=" thick ridge #CC66FF; z-index: 1; left: 4px; top: 1px; position: absolute; width:60px; height:60px" />
                <br />
                <br />
                <asp:Label ID="unameLabel" runat="server" Text='<%# Eval("luname") %>' Font-Size="Medium" Width="40px" />
                <br />
                <asp:Label ID="crisboosLabel" runat="server" Text='<%# Eval("lucrisboos") %>'  />
                <asp:Label ID="Label8" runat="server" Text="Gold Coins"  />
            </ItemTemplate>
            <SelectedItemStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        </asp:DataList>

        
   <a href="https://treasurehunter.apphb.com/create.aspx" target="_self" style="position:absolute;top:170px; width:160px; text-decoration:none; background-color: #0000FF; color: #FFFFFF;  border-radius:20px; left: 540px; text-align: center; height: 23px;" > Go to My TreasureSpot </a> 
   
        <asp:DataList ID="DataList2" runat="server" BackColor="Transparent" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataSourceID="SqlDataSource3" RepeatDirection="Horizontal" ShowFooter="False" ShowHeader="False" style="border: thick ridge #CC66FF; z-index: 1; left: 455px; top: 367px; position: absolute; height: 183px; width: 426px" Font-Names="calligraph421 bt, 9pt">
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <ItemStyle BackColor="Transparent" ForeColor="White" />
            <ItemTemplate>
                Name
                <asp:Label ID="unameLabel" runat="server" Text='<%# Eval("uname") %>' Width="40px" Font-Size="Medium" />
                <br />
                Amount($)
                <asp:Label ID="amountLabel" runat="server" Text='<%# Eval("amount") %>' />
                
                <br />
                <br />
            </ItemTemplate>
            <SelectedItemStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        </asp:DataList>
        <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="20pt" style="z-index: 1; left: 534px; top: 328px; position: absolute; width: 236px; height:30px;" Text="Recent Top Winners" BorderStyle="Ridge" ForeColor="#CCCCFF" Font-Names="Victorian LET"></asp:Label>
        <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="20pt" style="z-index: 1; left: 102px; top: 328px; position: absolute; right: 531px; width: 243px;  height:30px;" Text="Recent Top Players" BorderStyle="Ridge" ForeColor="#CCCCFF" Font-Names="Victorian LET" Width="200px"></asp:Label>
<div class="fb-like" data-href="https://www.facebook.com/TreasureHuntergame" data-width="100" data-layout="button" data-action="like" data-show-faces="true" data-share="true" style="z-index: 351; position: absolute; width: 128px; height: 24px; top: 3px; right: 289px; bottom: 539px; left: 562px"></div>
        
    
</form>
                  
    </body>
</html>
