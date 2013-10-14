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

            Response.Redirect("~/Tspot/buy");
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
            if (dt.Rows.Count == 0)
            {
                tsname = dt.Rows[t1].Field<string>("tsname"); //usethis to get field value
                tsitems = dt.Rows[t1].Field<string>("tsitems"); //usethis to get field value
                tsrplayers = dt.Rows[t1].Field<string>("tsrplayers"); //usethis to get field value
                tsdplayers = dt.Rows[t1].Field<string>("tsrplayers"); //usethis to get field value
                tsrplayersdetails = dt.Rows[t1].Field<string>("tsrplayersdetails"); //usethis to get field value
                tsdplayersdetails = dt.Rows[t1].Field<string>("tsdplayersdetails"); //usethis to get field value
            }
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
            if (Model.Friends.Data.Count != 0)
            {
                int r1 = one.Next(1, Model.Friends.Data.Count);
                Application["friend1"] = Model.Friends.Data.ElementAt(r1).Name;
                Application["friend1pic"] = Model.Friends.Data.ElementAt(r1).Picture.Data.Url;
                int r2 = one.Next(2, Model.Friends.Data.Count);
                Application["friend2"] = Model.Friends.Data.ElementAt(r2).Name;
                Application["friend2pic"] = Model.Friends.Data.ElementAt(r1).Picture.Data.Url;
                int r3 = one.Next(3, Model.Friends.Data.Count);
                Application["friend3"] = Model.Friends.Data.ElementAt(r3).Name;
                Application["friend3pic"] = Model.Friends.Data.ElementAt(r1).Picture.Data.Url;
                int r4 = one.Next(4, Model.Friends.Data.Count);
                Application["friend4"] = Model.Friends.Data.ElementAt(r4).Name;
                Application["friend4pic"] = Model.Friends.Data.ElementAt(r1).Picture.Data.Url;
                int r5 = one.Next(5, Model.Friends.Data.Count);
                Application["friend5"] = Model.Friends.Data.ElementAt(r5).Name;
                Application["friend5pic"] = Model.Friends.Data.ElementAt(r1).Picture.Data.Url;
            }
            
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
            if (dt.Rows.Count == 0)
            {
                logintimes = dt.Rows[0].Field<string>("lulogintimes"); //usethis to get field value
                btspots = dt.Rows[0].Field<string>("lutspots"); //usethis to get field value
            }
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


<body  style="height: 796px; background-color:#000000; width: 967px" onmouseover="moveprop(event)" onmousedown="explodeprop(event)" onkeydown="check(e)" >
    <script type="text/javascript">
        
        var enemyhits = 0;
        var lifes = 0;
        
       

        document.addEventListener('DOMContentLoaded', function () {
            Text1.focus();
            

            var myaddctrl = window.setInterval(function () { randomCtrl() }, 20000);
            function randomCtrl() {
                ctrl1.style.left = Math.floor(Math.random() * (882 - 175 + 1) + 175) + "px";
                ctrl1.style.top = Math.floor(Math.random() * (570 - 204 + 1) + 183)   + "px";
                ctrl2.style.left = Math.floor(Math.random() * (882 - 175 + 1) + 175) + "px";
                ctrl2.style.top = Math.floor(Math.random() * (570 - 204 + 1) + 183) + "px";
                ctrl3.style.left = Math.floor(Math.random() * (882 - 175 + 1) + 175) + "px";
                ctrl3.style.top = Math.floor(Math.random() * (570 - 204 + 1) + 183) + "px";
                ctrl4.style.left = Math.floor(Math.random() * (882 - 175 + 1) + 175) + "px";
                ctrl4.style.top = Math.floor(Math.random() * (570 - 204 + 1) + 183) + "px";
                ctrl5.style.left = Math.floor(Math.random() * (882 - 175 + 1) + 175) + "px";
                ctrl5.style.top = Math.floor(Math.random() * (570 - 204 + 1) + 183) + "px";
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
                    friendimage.style.visibility = "visible";
                    friendname.style.visibility = "visible";
                    friendimage.src = '<%=Convert.ToString(Application["friend1pic"])%>';
                    friendname.value = '<%=Application["friend1"]%>'; 
                }
                if (parseInt(crosshair.style.left.replace("px", "")) >= parseInt(ctrl2.style.left.replace("px", "")) && parseInt(crosshair.style.right.replace("px", "")) <= parseInt(ctrl2.style.right.replace("px", "")) || parseInt(crosshair.style.top.replace("px", "")) >= parseInt(ctrl2.style.top.replace("px", "")) && parseInt(crosshair.style.bottom.replace("px", "")) <= parseInt(ctrl2.style.bottom.replace("px", ""))) {
                    enemyhits = enemyhits + 1;
                    document.getElementById('ehits').setAttribute("value", enemyhits);
                    friendimage.style.visibility = "visible";
                    friendname.style.visibility = "visible";
                    friendimage.src = '<%=Convert.ToString(Application["friend2pic"])%>';
                    friendname.value = '<%=Application["friend2"]%>'; 
                }
                if (parseInt(crosshair.style.left.replace("px", "")) >= parseInt(ctrl3.style.left.replace("px", "")) && parseInt(crosshair.style.right.replace("px", "")) <= parseInt(ctrl3.style.right.replace("px", "")) || parseInt(crosshair.style.top.replace("px", "")) >= parseInt(ctrl3.style.top.replace("px", "")) && parseInt(crosshair.style.bottom.replace("px", "")) <= parseInt(ctrl3.style.bottom.replace("px", ""))) {
                    enemyhits = enemyhits + 1;
                    document.getElementById('ehits').setAttribute("value", enemyhits);
                    friendimage.style.visibility = "visible";
                    friendname.style.visibility = "visible";
                    friendimage.src = '<%=Convert.ToString(Application["friend3pic"])%>';
                    friendname.value = '<%=Application["friend3"]%>'; 
                }
                if (parseInt(crosshair.style.left.replace("px", "")) >= parseInt(ctrl4.style.left.replace("px", "")) && parseInt(crosshair.style.right.replace("px", "")) <= parseInt(ctrl4.style.right.replace("px", "")) || parseInt(crosshair.style.top.replace("px", "")) >= parseInt(ctrl4.style.top.replace("px", "")) && parseInt(crosshair.style.bottom.replace("px", "")) <= parseInt(ctrl4.style.bottom.replace("px", ""))) {
                    enemyhits = enemyhits + 1;
                    document.getElementById('ehits').setAttribute("value", enemyhits);
                    friendimage.style.visibility = "visible";
                    friendname.style.visibility = "visible";
                    friendimage.src = '<%=Convert.ToString(Application["friend4pic"])%>';
                    friendname.value = '<%=Application["friend4"]%>'; 
                }
                if (parseInt(crosshair.style.left.replace("px", "")) >= parseInt(ctrl5.style.left.replace("px", "")) && parseInt(crosshair.style.right.replace("px", "")) <= parseInt(ctrl5.style.right.replace("px", "")) || parseInt(crosshair.style.top.replace("px", "")) >= parseInt(ctrl5.style.top.replace("px", "")) && parseInt(crosshair.style.bottom.replace("px", "")) <= parseInt(ctrl5.style.bottom.replace("px", ""))) {
                    enemyhits = enemyhits + 1;
                    document.getElementById('ehits').setAttribute("value", enemyhits);
                    friendimage.style.visibility = "visible";
                    friendname.style.visibility = "visible";
                    friendimage.src = '<%=Convert.ToString(Application["friend5pic"])%>';
                    friendname.value = '<%=Application["friend5"]%>'; 
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
                if (parseInt(ctrl1.style.left.replace("px", "")) > 175 && parseInt(ctrl1.style.left.replace("px", "")) < 704) {
                    ctrl1.style.left = parseInt(ctrl1.style.left.replace("px", "")) + 5 + "px";
                }
                if (parseInt(ctrl1.style.top.replace("px", "")) > 205 && parseInt(ctrl1.style.top.replace("px", "")) < 570) {
                    ctrl1.style.top = parseInt(ctrl1.style.top.replace("px", "")) - 5 + "px";
                }
                if (parseInt(ctrl2.style.left.replace("px", "")) > 175 && parseInt(ctrl2.style.left.replace("px", "")) < 704) {
                    ctrl2.style.left = parseInt(ctrl2.style.left.replace("px", "")) + 5 + "px";
                }
                if (parseInt(ctrl2.style.top.replace("px", "")) > 205 && parseInt(ctrl2.style.top.replace("px", "")) < 570) {
                    ctrl2.style.top = parseInt(ctrl2.style.top.replace("px", "")) + 5 + "px";
                }
                if (parseInt(ctrl3.style.left.replace("px", "")) > 175 && parseInt(ctrl3.style.left.replace("px", "")) < 704) {
                    ctrl3.style.left = parseInt(ctrl3.style.left.replace("px", "")) + 5 + "px";
                }
                if (parseInt(ctrl3.style.top.replace("px", "")) > 205 && parseInt(ctrl3.style.top.replace("px", "")) < 570) {
                    ctrl3.style.top = parseInt(ctrl3.style.top.replace("px", "")) + 5 + "px";
                }
                if (parseInt(ctrl4.style.left.replace("px", "")) > 175 && parseInt(ctrl4.style.left.replace("px", "")) < 704) {
                    ctrl4.style.left = parseInt(ctrl4.style.left.replace("px", "")) + 5 + "px";
                }
                if (parseInt(ctrl4.style.top.replace("px", "")) > 205 && parseInt(ctrl4.style.top.replace("px", "")) < 570) {
                    ctrl4.style.top = parseInt(ctrl4.style.top.replace("px", "")) + 5 + "px";
                }
                if (parseInt(ctrl5.style.left.replace("px", "")) > 175 && parseInt(ctrl5.style.left.replace("px", "")) < 704) {
                    ctrl5.style.left = parseInt(ctrl5.style.left.replace("px", "")) + 5 + "px";
                }
                if (parseInt(ctrl5.style.top.replace("px", "")) > 205 && parseInt(ctrl5.style.top.replace("px", "")) < 570) {
                    ctrl5.style.top = parseInt(ctrl5.style.top.replace("px", "")) + 5 + "px";
                }
                divplayer.focus();
            }

            document.addEventListener("keydown", check, false);
            document.addEventListener("mousedown", explodeprop, false);
            document.addEventListener("mousemove", moveprop, false);

            function moveprop(e) {
                
                crosshair.style.left = Math.round(e.clientX) + "px";
                crosshair.style.top = Math.round(e.clientY) + "px";
            }

            function explodeprop(e) {
                explode();
            }

            function check(e) {
                var code = e.keyCode;

                

                if (code == 37) {

                    
                    if (parseInt(crosshair.style.left.replace("px", "")) > 175) {
                        //marginl = crosshair.style.left;
                        //currentl = parseInt(marginl.replace("px", ""));
                        //crosshair.style.left = currentl - 10 + "px";
                        //marginl = crosshair.style.left;
                        crosshair.style.left = parseInt(crosshair.style.left.replace("px", "")) - 10 + "px";
                    }
                }

                if (code == 39) {

                    if (parseInt(crosshair.style.left.replace("px", "")) < 704) {
                        //currentl = parseInt(marginl.replace("px", ""));
                        //crosshair.style.left = currentl + 10 + "px";
                        //marginl = crosshair.style.left;
                        crosshair.style.left = parseInt(crosshair.style.left.replace("px", "")) + 10 + "px";
                    }
                }

                if (code == 38) {

                    
                    if (parseInt(crosshair.style.top.replace("px", "")) > 183) {
                        //marginl = crosshair.style.top;
                        //currentl = parseInt(marginl.replace("px", ""));
                        //crosshair.style.top = currentl - 10 + "px";
                        //marginl = crosshair.style.top;
                        crosshair.style.top = parseInt(crosshair.style.top.replace("px", "")) - 10 + "px";
                    }
                    
                }

                if (code == 40) {

                    if (parseInt(crosshair.style.top.replace("px", "")) < 704) {
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
            top: 204px;
            left: 35px;
        }

        @keyframes mymove {
            from {
                left: 178px;
            }

            to {
                left: 180px;
            }
        }

        @-webkit-keyframes mymove /* Safari and Chrome */
        {
            from {
                left: 178px;
            }

            to {
                left: 180px;
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
            top: 15px;
            position: absolute;
            height: 581px;
            width: 948px;
        }

        #vplayer {
            z-index: 1;
            left: 14px;
            top: 166px;
            position: absolute;
            width: 661px;
        }
        #Text1 {
            z-index: 1;
            left: 605px;
            top: -115px;
            position: absolute;
            right: -14px;
        }
        #divplayer {
            z-index: 1;
            left: 166px;
            top: 181px;
            position: absolute;
            height: 401px;
            width: 719px;
        }
    </style>
    




    <form id="form1"  runat="server" >
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

       <asp:TextBox ID="ehits" runat="server" AutoPostBack="True" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" style="z-index: 1; left: 121px; top: 52px; position: absolute; width: 45px" ForeColor="#FFCC00"></asp:TextBox>

        <asp:hyperlink ID="Hyperlink1" runat="server"  Font-Underline="False" NavigateUrl="~/Tspot/buy" style="z-index: 1; left: 224px; top: 127px; position: absolute; height: 29px; width:141px" Target="_self" ForeColor="#FFCC00">Buy a Treasure Spot</asp:hyperlink>
    <asp:hyperlink ID="Hyperlink2" runat="server"  Font-Underline="False" NavigateUrl="~/Tspot/buy" style="z-index: 1; left: 501px; top: 127px; position: absolute; right: 349px; width:141px" Target="_self" ForeColor="#FFCC00">Buy a ToolBox Item</asp:hyperlink>
     <asp:hyperlink ID="Hyperlink3" runat="server"  Font-Underline="False" NavigateUrl="~/Invite/friends" style="z-index: 1; left: 384px; top: 127px; position: absolute" Target="_self" ForeColor="#FFCC00">Invite Friends</asp:hyperlink>   
<asp:hyperlink ID="Hyperlink4" runat="server"  Font-Underline="False" NavigateUrl="~/Cpanel/gamesettings" style="z-index: 1; left: 655px; top: 127px; position: absolute; width: 84px;" Target="_self" ForeColor="#FFCC00">My Game</asp:hyperlink>   

        <asp:HiddenField ID="tsrplayershf" runat="server" />
        <asp:HiddenField ID="tsrplayersdetailshf" runat="server" />
        <asp:HiddenField ID="tsdplayershf" runat="server" />
        <asp:HiddenField ID="tsdplayersdetailshf" runat="server" />
        <asp:HiddenField ID="gettspothf" runat="server" />
        <asp:HiddenField ID="tspotnamehf" runat="server" />
        <asp:HiddenField ID="tsspotdetailshf" runat="server" />
        <asp:HiddenField ID="gettsplayers" runat="server" />

        <label style="position: absolute; top: 4px; left: 116px; height: 23px; width: 733px; z-index: 200; color: #FFCC00;"></label>
        <label style="position: absolute; top: 48px; left: 15px; right: 846px; height: 19px; color: #FFCC00;">Achievements   </label>
        
        <label style="position: absolute; top: 47px; left: 241px; height: 19px; right: 663px; color: #FFCC00;">Lives   </label>
        <asp:TextBox ID="lives" runat="server" AutoPostBack="True" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" style="z-index: 1; left: 308px; top: 50px; position: absolute; width: 45px" ForeColor="#FFCC00">10</asp:TextBox>
        
        <label style="position: absolute; top: 47px; left: 406px; height: 19px; color: #FFCC00;">Gold Coins   </label>
        <asp:TextBox ID="points" runat="server" AutoPostBack="True" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" style="z-index: 1; left: 508px; top: 49px; position: absolute; width: 107px" ForeColor="#FFCC00"></asp:TextBox>
        
        <label style="position: absolute; top: 47px; left: 660px; height: 19px; color: #FFCC00;">Treasure   </label>
        <asp:TextBox ID="treasure" runat="server" AutoPostBack="True" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" style="z-index: 1; left: 748px; top: 47px; position: absolute; width: 45px" ForeColor="#FFCC00"></asp:TextBox>
        
        
        
    </form>
    <div id="divplayer" style="z-index: 203; background-color: transparent;" >
        <img id="crosshair"  src="../../Images/crosshair.png" style="width: 33px; height: 25px; position: absolute; top: 328px; left: 385px; z-index: 202; right: 434px;">
        <img id="explosion" src="../../Images/explosion.gif" style="width: 10px; height: 10px; position: absolute; top: 247px; left: 307px; z-index: 21; right: 532px; visibility: hidden; margin-left: 0px; margin-top: 0px;">&nbsp;
        <img id="ctrl1"  src="../../Images/fplane.gif" style="width: 50px; height: 50px; position: absolute; top: 428px; left: 229px; z-index: 21; right: 593px; margin-left: 0px; margin-top: 0px;">&nbsp;
        <img id="ctrl2"  src="../../Images/fplane.gif" style="width: 30px; height: 30px; position: absolute; top: 413px; left: 270px; z-index: 21; right: 552px; margin-left: 0px; margin-top: 0px;">&nbsp;
        <img id="ctrl3"  src="../../Images/fplane.gif" style="width: 30px; height: 30px; position: absolute; top: 428px; left: 229px; z-index: 21; right: 593px; margin-left: 0px; margin-top: 0px;">&nbsp;
        <img id="ctrl4"  src="../../Images/fplane.gif" style="width: 30px; height: 30px; position: absolute; top: 283px; left: 270px; z-index: 21; right: 552px; margin-left: 0px; margin-top: 0px;">&nbsp;
        <img id="ctrl5"  src="../../Images/fplane.gif" style="width: 30px; height: 30px; position: absolute; top: 328px; left: 339px; z-index: 21; right: 483px; margin-left: 0px; margin-top: 0px;">&nbsp;
        <img id="player1" src="../../Images/fplane.gif" style="width: 30px; height: 30px; position: absolute; top: 428px; left: 229px; z-index: 21; right: 593px; margin-left: 0px; margin-top: 0px;">&nbsp;
        <img id="player2" src="../../Images/fplane.gif" style="width: 30px; height: 30px; position: absolute; top: 296px; left: 260px; z-index: 21; right: 562px; margin-left: 0px; margin-top: 0px;">&nbsp;
        <img id="player3" src="../../Images/fplane.gif" style="width: 30px; height: 30px; position: absolute; top: 428px; left: 229px; z-index: 21; right: 593px; margin-left: 0px; margin-top: 0px;">&nbsp;
        <img id="player4" src="../../Images/fplane.gif" style="width: 30px; height: 30px; position: absolute; top: 302px; left: 245px; z-index: 21; right: 577px; margin-left: 0px; margin-top: 0px;">&nbsp;
        <img id="player5" src="../../Images/fplane.gif" style="width: 30px; height: 30px; position: absolute; top: 401px; left: 270px; z-index: 21; right: 552px; margin-left: 0px; margin-top: 0px;">&nbsp;
  
         <input id="Text1" style="background-color: transparent; text-decoration:none" type="text" />
  
 <input id="friendname" style="visibility: visible; text-decoration: none; height: 77px; background-color: transparent; color: #FFCC00; z-index: 1; left: 38px; top: 338px; position: absolute; width: 91px;" type="text" />   

    
    <img alt="" src="../../Images/landscape.jpg" style="width: 80px; height: 80px; visibility: visible; z-index: 1; left: 53px; top: 235px; position: absolute;" id="friendimage" />
   
    </div>
    <iframe id="player"   src="//www.youtube.com/embed/XAbMQx-D7rE?enablejsapi=1&wmmode=transparent&autoplay=1&start=30&end=60&loop=1&playlist=XAbMQx-D7rE&rel=0&showinfo=0&controls=0&disablekb=1" style="z-index: 0; left: 178px; top: 183px; position: absolute; background-color: transparent"   class="twoto3d"></iframe>
        
</body>

</html>
