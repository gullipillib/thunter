<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<treasurehunter.Models.MyAppUser>" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>


<!DOCTYPE html>
<script runat="server">
    
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
    

    protected void checkusername()
    {
        Hiddenfield1.Value = Model.Name;
        Hiddenfield1.Value = Hiddenfield1.Value.Replace(" ", "");
        if (Hiddenfield1.Value != null)
        {

            //Insert User into appuser,loggeduser,ordercounter,treasureprize;
            AccessDataSource1.SelectCommand = "SELECT uname FROM appuserdetails WHERE (uname = '" + Hiddenfield1.Value + "')";

            DataView dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();
            //DataTable dtr = dt;
            //DataRow[] uniname = dtr.Select("uname");
            //username = dt.Rows[0].Field<string>("uname"); usethis to get field value
            //Label3.Text = dt.Rows[0][0].ToString();
            if (dt.Rows.Count == 0)
            {
                //Insert User into appuser,loggeduser,ordercounter,winners;
                AccessDataSource1.InsertCommand = "INSERT INTO appuserdetails(uname, uloggedin, winner, wintimes, paid, amount, currenttspot) VALUES ('" + Hiddenfield1.Value + "', 'no', 'no', '0', 'no', '0', '')";
                AccessDataSource1.Insert();
                AccessDataSource1.SelectCommand = "SELECT * FROM loggedusers";
                AccessDataSource1.InsertCommand = "INSERT INTO loggedusers(luname, luid, luposition, luimg, luspriteimg, lucrisboos, luloggedin, lutspots, lulogintimes, luinvites) VALUES ('" + Hiddenfield1.Value + "', '" + Model.Id + "', '{left : 0, top:0}', '" + Model.ProfilePicture.Data.Url + "', '" + Model.ProfilePicture.Data.Url + "', '100', 'yes', '0', '0', '0')";
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

            Response.Redirect("http://apps.facebook.com/gullipilli");
        }
    }
    string tsname = "";
    string tsitems = "";
    string tsrplayers = "";
    string tsdplayers = "";
    string tsrplayersdetails = "";
    string tsdplayersdetails = "";
    //Playersdetails[] tspotsplayers;
    
    protected void gettreasurespot()
    {
        AccessDataSource1.SelectCommand = "SELECT tsname, tsitems, tsrplayers, tsdplayers, tsrplayersdetails, tsdplayersdetails, tsapproved, tsactive FROM tspots where tsapproved = 'yes' and tsactive = 'yes' and tsrplayers <> '5' and  tsrplayers <> '0' and  tsrplayers <> 'null'";
        DataView dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
        DataTable dt = new DataTable();
        dt = dv.ToTable();
        DataView uniname = dt.DefaultView;
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
            
            // done till here
        }
        if (dt.Rows.Count == 0)
        {
            AccessDataSource1.SelectCommand = "SELECT tsname, tsitems, tsrplayers, tsdplayers, tsrplayersdetails, tsdplayersdetails, tsapproved, tsactive FROM tspots where tsapproved = 'yes' and tsactive = 'yes' and tsrplayers = '0' and  tsrplayers = '0'";
            dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
            dt = new DataTable();
            dt = dv.ToTable();
            uniname = dt.DefaultView;
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
        tspotnamehf.Value = tsname;
        tsspotdetailshf.Value = tsitems;
        
        }

    protected void addfriends()
    {
        //IList myfriends = Model.Friends.Data.ToList();
        //tspotsplayers[1].tsrPlayerName = Model.Name;
        if (tsrplayers == "0")
        {
            //tspotsplayers[1].tsrPlayerName = Model.Name;
        }
        if (tsrplayers != "0")
        {
            //tspotsplayers = new System.Web.Script.Serialization.JavaScriptSerializer().DeserializeObject(tsrplayersdetails);
            
        }
        
        //tsrplayers = Convert.ToString(Convert.ToInt16(tsrplayers) + 1);
       
        //AccessDataSource1.SelectCommand = "SELECT tsname, tsitems, tsrplayers, tsdplayers, tsrplayersdetails, tsdplayersdetails FROM tspots where tsname = '" + tsname + "'";
        //AccessDataSource1.UpdateCommand = "UPDATE tspots SET tsrplayers = '" + tsrplayers + "', tsdplayers = '" + tsdplayers + "' where tsname = '" + tsname + "'";
        
        // done till here
        Random one = new Random();
        var fcount = Model.Friends.Data.Count;
        if (fcount >= 5)
        {
            int r1 = one.Next(1, Model.Friends.Data.Count);
            Application["friend1"] = Model.Friends.Data.ElementAt(r1).Name;
            int r2 = one.Next(2, Model.Friends.Data.Count);
            Application["friend2"] = Model.Friends.Data.ElementAt(r2).Name;
            int r3 = one.Next(3, Model.Friends.Data.Count);
            Application["friend3"] = Model.Friends.Data.ElementAt(r3).Name;
            int r4 = one.Next(4, Model.Friends.Data.Count);
            Application["friend4"] = Model.Friends.Data.ElementAt(r4).Name;
            int r5 = one.Next(5, Model.Friends.Data.Count);
            Application["friend5"] = Model.Friends.Data.ElementAt(r5).Name;
            
        }
        else
        {
            Application["friend1"] = "sussie carr";
            Application["friend2"] = "robert thomson";
            Application["friend3"] = "annie san";
            Application["friend4"] = "sui chang";
            Application["friend5"] = "marie jane";
        }
        
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        checkusername();
        
        
        if (Page.IsPostBack == false)
        {
            AccessDataSource1.SelectCommand = "SELECT luname, lulogintimes, luloggedin, lutspots FROM loggedusers";
            DataView dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();
            DataView uniname = dt.DefaultView;
            logintimes = dt.Rows[0].Field<string>("lulogintimes"); //usethis to get field value
            btspots = dt.Rows[0].Field<string>("lutspots"); //usethis to get field value

            if (logintimes != "0" && btspots == "0")
            {
                //Timer1.Enabled = true;
                AccessDataSource1.SelectCommand = "SELECT * FROM loggedusers";
                AccessDataSource1.UpdateCommand = "UPDATE loggedusers SET lulogintimes = '" + Convert.ToString(Convert.ToInt16(logintimes) + 1) + "', luloggedin='no' where luname='" + Hiddenfield1.Value + "'";
                AccessDataSource1.Update();
            }

            if (logintimes != "0" && btspots == "0")
            {
                Response.Redirect("~/Tspot/buy");

            }
        }
        gettreasurespot();
        addfriends();
    }


    protected void Timer1_Tick(object sender, EventArgs e)
    {
        AccessDataSource1.UpdateCommand = "UPDATE loggedusers SET lulogintimes = '" + Convert.ToString(Convert.ToInt16(logintimes) + 1) + "', luloggedin='no' where luname='" + Hiddenfield1.Value + "'";
        AccessDataSource1.Update();
        Response.Redirect("~/Tspot/buy");

    }
</script>


<html>
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width" />
    <title></title>
</head>


<body  style="height: 587px; overflow: hidden; background-color:#000000">
    <script type="text/javascript">
        
        var enemyhits = 0;
        var lifes = 0;
        
       

        document.addEventListener('DOMContentLoaded', function () {

            var myaddctrl = window.setInterval(function () { randomCtrl() }, 20000);
            function randomCtrl() {
                ctrl1.style.left = Math.floor(Math.random() * (750 - 160 + 1) + 160) + "px";
                ctrl1.style.top = Math.floor(Math.random() * (455 - 171 + 1) + 160)   + "px";
                ctrl2.style.left = Math.floor(Math.random() * (750 - 160 + 1) + 160)  + "px";
                ctrl2.style.top = Math.floor(Math.random() * (455 - 171 + 1) + 160) + "px";
                ctrl3.style.left = Math.floor(Math.random() * (750 - 160 + 1) + 160) + "px";
                ctrl3.style.top = Math.floor(Math.random() * (455 - 171 + 1) + 160) + "px";
                ctrl4.style.left = Math.floor(Math.random() * (750 - 160 + 1) + 160) + "px";
                ctrl4.style.top = Math.floor(Math.random() * (455 - 171 + 1) + 160) + "px";
                ctrl5.style.left = Math.floor(Math.random() * (750 - 160 + 1) + 160) + "px";
                ctrl5.style.top = Math.floor(Math.random() * (455 - 171 + 1) + 160) + "px";
            }

            var myaddctrl = window.setInterval(function () { hitme() }, 10000);
            function hitme() {
                var myaddctrl = window.setTimeout(function () { hitmeonce() }, 1000);
            }
            function hitmeonce() {

                explosion.style.width = "50px";
                explosion.style.height = "50px";

                explosion.style.left = crosshair.style.left;
                explosion.style.top = crosshair.style.top;
                explosion.style.right = crosshair.style.right;
                explosion.style.visibility = "visible";

                var myaddctrl = window.setTimeout(function () { removeexplosion() }, 3000);

                function removeexplosion() {
                    explosion.style.visibility = "hidden";
                    lifes = lives.getAttribute("value");
                    lifes = lifes - 1;
                    lives.setAttribute("value", lifes);
                    if (lifes == 0) {
                        lives.setAttribute("value", '10');
                    }
                }
                
                
            }
            
            function detectcollision() {
                if (parseInt(crosshair.style.left.replace("px", "")) >= parseInt(ctrl1.style.left.replace("px", "")) && parseInt(crosshair.style.right.replace("px", "")) <= parseInt(ctrl1.style.right.replace("px", "")) || parseInt(crosshair.style.top.replace("px", "")) >= parseInt(ctrl1.style.top.replace("px", "")) && parseInt(crosshair.style.bottom.replace("px", "")) <= parseInt(ctrl1.style.bottom.replace("px", ""))) {
                    enemyhits = enemyhits + 1;
                    document.getElementById('ehits').setAttribute("value", enemyhits);
                }
                if (parseInt(crosshair.style.left.replace("px", "")) >= parseInt(ctrl2.style.left.replace("px", "")) && parseInt(crosshair.style.right.replace("px", "")) <= parseInt(ctrl2.style.right.replace("px", "")) || parseInt(crosshair.style.top.replace("px", "")) >= parseInt(ctrl2.style.top.replace("px", "")) && parseInt(crosshair.style.bottom.replace("px", "")) <= parseInt(ctrl2.style.bottom.replace("px", ""))) {
                    enemyhits = enemyhits + 1;
                    document.getElementById('ehits').setAttribute("value", enemyhits);
                }
                if (parseInt(crosshair.style.left.replace("px", "")) >= parseInt(ctrl3.style.left.replace("px", "")) && parseInt(crosshair.style.right.replace("px", "")) <= parseInt(ctrl3.style.right.replace("px", "")) || parseInt(crosshair.style.top.replace("px", "")) >= parseInt(ctrl3.style.top.replace("px", "")) && parseInt(crosshair.style.bottom.replace("px", "")) <= parseInt(ctrl3.style.bottom.replace("px", ""))) {
                    enemyhits = enemyhits + 1;
                    document.getElementById('ehits').setAttribute("value", enemyhits);
                }
                if (parseInt(crosshair.style.left.replace("px", "")) >= parseInt(ctrl4.style.left.replace("px", "")) && parseInt(crosshair.style.right.replace("px", "")) <= parseInt(ctrl4.style.right.replace("px", "")) || parseInt(crosshair.style.top.replace("px", "")) >= parseInt(ctrl4.style.top.replace("px", "")) && parseInt(crosshair.style.bottom.replace("px", "")) <= parseInt(ctrl4.style.bottom.replace("px", ""))) {
                    enemyhits = enemyhits + 1;
                    document.getElementById('ehits').setAttribute("value", enemyhits);
                }
                if (parseInt(crosshair.style.left.replace("px", "")) >= parseInt(ctrl5.style.left.replace("px", "")) && parseInt(crosshair.style.right.replace("px", "")) <= parseInt(ctrl5.style.right.replace("px", "")) || parseInt(crosshair.style.top.replace("px", "")) >= parseInt(ctrl5.style.top.replace("px", "")) && parseInt(crosshair.style.bottom.replace("px", "")) <= parseInt(ctrl5.style.bottom.replace("px", ""))) {
                    enemyhits = enemyhits + 1;
                    document.getElementById('ehits').setAttribute("value", enemyhits);
                }
                }

            function explode() {
                
                    explosion.style.width = "50px";
                    explosion.style.height = "50px";

                    explosion.style.left = crosshair.style.left;
                    explosion.style.top = crosshair.style.top;
                    explosion.style.right = crosshair.style.right;
                    explosion.style.visibility = "visible";
                    
                    var myaddctrl = window.setTimeout(function () { removeexplosion() }, 3000);
                
                    function removeexplosion() {
                        explosion.style.visibility = "hidden";
                        }
                }

            var myaddctrl = window.setInterval(function () { moveCtrl() }, 2000);
            function moveCtrl() {
                if (parseInt(ctrl1.style.left.replace("px", "")) > 160 && parseInt(ctrl1.style.left.replace("px", "")) < 750) {
                    ctrl1.style.left = parseInt(ctrl1.style.left.replace("px", "")) + 5 + "px";
                }
                if (parseInt(ctrl1.style.top.replace("px", "")) > 171 && parseInt(ctrl1.style.top.replace("px", "")) < 455) {
                    ctrl1.style.top = parseInt(ctrl1.style.top.replace("px", "")) - 5 + "px";
                }
                if (parseInt(ctrl2.style.left.replace("px", "")) > 160 && parseInt(ctrl2.style.left.replace("px", "")) < 750) {
                    ctrl2.style.left = parseInt(ctrl2.style.left.replace("px", "")) + 5 + "px";
                }
                if (parseInt(ctrl2.style.top.replace("px", "")) > 171 && parseInt(ctrl2.style.top.replace("px", "")) < 455) {
                    ctrl2.style.top = parseInt(ctrl2.style.top.replace("px", "")) + 5 + "px";
                }
                if (parseInt(ctrl3.style.left.replace("px", "")) > 160 && parseInt(ctrl3.style.left.replace("px", "")) < 750) {
                    ctrl3.style.left = parseInt(ctrl3.style.left.replace("px", "")) + 5 + "px";
                }
                if (parseInt(ctrl3.style.top.replace("px", "")) > 171 && parseInt(ctrl3.style.top.replace("px", "")) < 455) {
                    ctrl3.style.top = parseInt(ctrl3.style.top.replace("px", "")) + 5 + "px";
                }
                if (parseInt(ctrl4.style.left.replace("px", "")) > 160 && parseInt(ctrl4.style.left.replace("px", "")) < 750) {
                    ctrl4.style.left = parseInt(ctrl4.style.left.replace("px", "")) + 5 + "px";
                }
                if (parseInt(ctrl4.style.top.replace("px", "")) > 171 && parseInt(ctrl4.style.top.replace("px", "")) < 455) {
                    ctrl4.style.top = parseInt(ctrl4.style.top.replace("px", "")) + 5 + "px";
                }
                if (parseInt(ctrl5.style.left.replace("px", "")) > 160 && parseInt(ctrl5.style.left.replace("px", "")) < 750) {
                    ctrl5.style.left = parseInt(ctrl5.style.left.replace("px", "")) + 5 + "px";
                }
                if (parseInt(ctrl5.style.top.replace("px", "")) > 171 && parseInt(ctrl5.style.top.replace("px", "")) < 455) {
                    ctrl5.style.top = parseInt(ctrl5.style.top.replace("px", "")) + 5 + "px";
                }
            }

            document.addEventListener("keydown", check, false);

            function check(e) {
                var code = e.keyCode;


                if (code == 37) {

                    
                    if (parseInt(crosshair.style.left.replace("px", "")) > 160) {
                        //marginl = crosshair.style.left;
                        //currentl = parseInt(marginl.replace("px", ""));
                        //crosshair.style.left = currentl - 10 + "px";
                        //marginl = crosshair.style.left;
                        crosshair.style.left = parseInt(crosshair.style.left.replace("px", "")) - 10 + "px";
                    }
                }

                if (code == 39) {

                    if (parseInt(crosshair.style.left.replace("px", "")) < 750) {
                        //currentl = parseInt(marginl.replace("px", ""));
                        //crosshair.style.left = currentl + 10 + "px";
                        //marginl = crosshair.style.left;
                        crosshair.style.left = parseInt(crosshair.style.left.replace("px", "")) + 10 + "px";
                    }
                }

                if (code == 38) {

                    
                    if (parseInt(crosshair.style.top.replace("px", "")) > 172) {
                        //marginl = crosshair.style.top;
                        //currentl = parseInt(marginl.replace("px", ""));
                        //crosshair.style.top = currentl - 10 + "px";
                        //marginl = crosshair.style.top;
                        crosshair.style.top = parseInt(crosshair.style.top.replace("px", "")) - 10 + "px";
                    }
                    
                }

                if (code == 40) {

                    if (parseInt(crosshair.style.top.replace("px", "")) < 455) {
                        //marginl = crosshair.style.top;
                        //currentl = parseInt(marginl.replace("px", ""));
                        //crosshair.style.top = currentl + 10 + "px";
                        //marginl = crosshair.style.top;
                        crosshair.style.top = parseInt(crosshair.style.top.replace("px", "")) + 10 + "px";
                    }

                }



                if (code == 83) {

                    explode();
                    detectcollision();
                   }

                }

            });

    </script>


    <style type="text/css">
        .twoto3d {
            width: 704px;
            height: 391px;
            position: relative;
            animation: mymove 0.05s infinite;
            -webkit-animation: mymove 0.25s infinite;
            top: 171px;
            left: 160px;
        }

        @keyframes mymove {
            from {
                left: 160px;
            }

            to {
                left: 162px;
            }
        }

        @-webkit-keyframes mymove /* Safari and Chrome */
        {
            from {
                left: 160px;
            }

            to {
                left: 162px;
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

        #form1 {
            z-index: 1;
            left: 10px;
            top: 34px;
            position: absolute;
            height: 29px;
            width: 852px;
        }

        #vplayer {
            z-index: 1;
            left: 14px;
            top: 166px;
            position: absolute;
            width: 661px;
        }
    </style>
    <iframe id="player" src="//www.youtube.com/embed/XAbMQx-D7rE?enablejsapi=1&wmmode=transparent&autoplay=1&start=30&end=60&loop=1&playlist=XAbMQx-D7rE&rel=0&showinfo=0&controls=0" style="z-index: 0; left: 160px; top: 171px; position: absolute; background-color: transparent" onkeydown="check(e)" class="twoto3d"></iframe>





    <form id="form1" runat="server">

        <label style="position: absolute; top: -23px; left: 14px; height: 26px; width: 869px; z-index: 200; color: #FFCC00;"></label>
        <label style="position: absolute; top: 20px; left: 15px; right: 773px; height: 19px; color: #FFCC00;">Achievements   </label>
        
        <label style="position: absolute; top: 20px; left: 169px; height: 19px; right: 645px; color: #FFCC00;">Lives   </label>
        <asp:TextBox ID="lives" runat="server" AutoPostBack="True" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" style="z-index: 1; left: 218px; top: 23px; position: absolute; width: 45px" ForeColor="#FFCC00">10</asp:TextBox>
        
        <label style="position: absolute; top: 20px; left: 276px; height: 19px; color: #FFCC00;">Gold Coins   </label>
        <asp:TextBox ID="points" runat="server" AutoPostBack="True" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" style="z-index: 1; left: 368px; top: 23px; position: absolute; width: 45px" ForeColor="#FFCC00"></asp:TextBox>
        
        <label style="position: absolute; top: 20px; left: 450px; height: 19px; color: #FFCC00;">Treasure   </label>
        <asp:TextBox ID="treasure" runat="server" AutoPostBack="True" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" style="z-index: 1; left: 528px; top: 23px; position: absolute; width: 45px" ForeColor="#FFCC00"></asp:TextBox>
        
        
        <img id="crosshair" src="../../Images/crosshair.png" style="width: 33px; height: 25px; position: absolute; top: 223px; left: 403px; z-index: 202; right: 416px;">
        <img id="explosion" src="../../Images/explosion.gif" style="width: 10px; height: 10px; position: absolute; top: 247px; left: 307px; z-index: 21; right: 532px; visibility: hidden; margin-left: 0px; margin-top: 0px;">&nbsp;
        <img id="ctrl1" src="../../Images/fplane.gif" style="width: 30px; height: 30px; position: absolute; top: 428px; left: 229px; z-index: 21; right: 593px; margin-left: 0px; margin-top: 0px;">&nbsp;
        <img id="ctrl2" src="../../Images/fplane.gif" style="width: 30px; height: 30px; position: absolute; top: 247px; left: 270px; z-index: 21; right: 532px; margin-left: 0px; margin-top: 0px;">&nbsp;
        <img id="ctrl3" src="../../Images/fplane.gif" style="width: 30px; height: 30px; position: absolute; top: 428px; left: 229px; z-index: 21; right: 593px; margin-left: 0px; margin-top: 0px;">&nbsp;
        <img id="ctrl4" src="../../Images/fplane.gif" style="width: 30px; height: 30px; position: absolute; top: 247px; left: 270px; z-index: 21; right: 532px; margin-left: 0px; margin-top: 0px;">&nbsp;
        <img id="ctrl5" src="../../Images/fplane.gif" style="width: 30px; height: 30px; position: absolute; top: 247px; left: 270px; z-index: 21; right: 532px; margin-left: 0px; margin-top: 0px;">&nbsp;
        <img id="player1" src="../../Images/fplane.gif" style="width: 30px; height: 30px; position: absolute; top: 428px; left: 229px; z-index: 21; right: 593px; margin-left: 0px; margin-top: 0px;">&nbsp;
        <img id="player2" src="../../Images/fplane.gif" style="width: 30px; height: 30px; position: absolute; top: 247px; left: 270px; z-index: 21; right: 532px; margin-left: 0px; margin-top: 0px;">&nbsp;
        <img id="player3" src="../../Images/fplane.gif" style="width: 30px; height: 30px; position: absolute; top: 428px; left: 229px; z-index: 21; right: 593px; margin-left: 0px; margin-top: 0px;">&nbsp;
        <img id="player4" src="../../Images/fplane.gif" style="width: 30px; height: 30px; position: absolute; top: 247px; left: 270px; z-index: 21; right: 532px; margin-left: 0px; margin-top: 0px;">&nbsp;
        <img id="player5" src="../../Images/fplane.gif" style="width: 30px; height: 30px; position: absolute; top: 247px; left: 270px; z-index: 21; right: 532px; margin-left: 0px; margin-top: 0px;">&nbsp;
        
        
        <asp:AccessDataSource ID="AccessDataSource1" DataFile="~/Views/Datab/th.mdb" runat="server" SelectCommand="SELECT uname FROM appuserdetails WHERE (uname = 'GullipilliBhaskar')"></asp:AccessDataSource>


        <asp:HiddenField ID="Hiddenfield1" runat="server"></asp:HiddenField>




         <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick"></asp:Timer>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
            </Triggers>
        </asp:UpdatePanel>     

        &nbsp;<asp:TextBox ID="ehits" runat="server" AutoPostBack="True" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" style="z-index: 1; left: 104px; top: 23px; position: absolute; width: 45px" ForeColor="#FFCC00"></asp:TextBox>


        <asp:HiddenField ID="tsrplayershf" runat="server" />
        <asp:HiddenField ID="tsrplayersdetailshf" runat="server" />
        <asp:HiddenField ID="tsdplayershf" runat="server" />
        <asp:HiddenField ID="tsdplayersdetailshf" runat="server" />
        <asp:HiddenField ID="gettspothf" runat="server" />
        <asp:HiddenField ID="tspotnamehf" runat="server" />
        <asp:HiddenField ID="tsspotdetailshf" runat="server" />
        <asp:HiddenField ID="gettsplayers" runat="server" />


    </form>

    <asp:hyperlink ID="Hyperlink1" runat="server"  Font-Underline="False" NavigateUrl="~/Tspot/buy" style="z-index: 1; left: 284px; top: 127px; position: absolute; right: 582px;" Target="_self" ForeColor="#FFCC00">Buy a Treasure Spot</asp:hyperlink>
    <asp:hyperlink ID="Hyperlink2" runat="server"  Font-Underline="False" NavigateUrl="~/Tspot/buy" style="z-index: 1; left: 574px; top: 127px; position: absolute; right: 294px;" Target="_self" ForeColor="#FFCC00">Buy a ToolBox Item</asp:hyperlink>
     <asp:hyperlink ID="Hyperlink3" runat="server"  Font-Underline="False" NavigateUrl="~/Invite/friends" style="z-index: 1; left: 444px; top: 127px; position: absolute" Target="_self" ForeColor="#FFCC00">Invite Friends</asp:hyperlink>   
<asp:hyperlink ID="Hyperlink4" runat="server"  Font-Underline="False" NavigateUrl="~/Cpanel/gamesettings" style="z-index: 1; left: 724px; top: 127px; position: absolute" Target="_self" ForeColor="#FFCC00">My Game</asp:hyperlink>   

</body>

</html>
