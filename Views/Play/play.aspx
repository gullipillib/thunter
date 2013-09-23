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


<body>
    <script type="text/javascript">
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
                var ctrl = document.createElement('img');
                ctrl.setAttribute("id", "ctrl1");
                ctrl.setAttribute("src", "../../Images/fplane.gif");
                ctrl.setAttribute("style", "width:80px; height:60px; position:relative; top: 307px; left: 247px; z-index: 2; right: 532px; visibility: visible: margin-left: 0px; margin-top: 0px");
                form1.appendChild(ctrl);
                var friend1 = document.createElement('img');
                ctrl.setAttribute("id", "friend1");
                ctrl.setAttribute("src", "../../Images/fplane.gif");
                ctrl.setAttribute("style", "width:80px; height:60px; position:relative; top: 7px; left: 27px; z-index: 2; right: 532px; visibility: visible: margin-left: 0px; margin-top: 0px");
                form1.appendChild(friend1);
                var friend2 = document.createElement('img');
                ctrl.setAttribute("id", "friend2");
                ctrl.setAttribute("src", "../../Images/fplane.gif");
                ctrl.setAttribute("style", "width:20px; height:20px; position:relative; top: 57px; left: 327px; z-index: 2; right: 532px; visibility: visible: margin-left: 0px; margin-top: 0px");
                form1.appendChild(friend2);
                var friend3 = document.createElement('img');
                ctrl.setAttribute("id", "friend3");
                ctrl.setAttribute("src", "../../Images/fplane.gif");
                ctrl.setAttribute("style", "width:80px; height:60px; position:relative; top: 107px; left: 227px; z-index: 2; right: 532px; visibility: visible: margin-left: 0px; margin-top: 0px");
                form1.appendChild(friend3);
                var friend4 = document.createElement('img');
                ctrl.setAttribute("id", "friend4");
                ctrl.setAttribute("src", "../../Images/fplane.gif");
                ctrl.setAttribute("style", "width:30px; height:30px; position:relative; top: 108px; left: 527px; z-index: 2; right: 532px; visibility: visible: margin-left: 0px; margin-top: 0px");
                form1.appendChild(friend4);
                var friend5 = document.createElement('img');
                ctrl.setAttribute("id", "friend5");
                ctrl.setAttribute("src", "../../Images/fplane.gif");
                ctrl.setAttribute("style", "width:80px; height:60px; position:relative; top: 347px; left: 109px; z-index: 2; right: 532px; visibility: visible: margin-left: 0px; margin-top: 0px");
                form1.appendChild(friend5);
                started = 1
            }
        }

        document.addEventListener('DOMContentLoaded', function () {

            document.addEventListener("keydown", check, false);

            function check(e) {
                var code = e.keyCode;


                if (code == 37) {

                    
                    
                    marginl = crosshair.style.left;
                    currentl = parseInt(marginl.replace("px", ""));
                    crosshair.style.left = currentl - 10 + "px";
                    marginl = crosshair.style.left;
                    
                }

                if (code == 39) {

                    
                    marginl = crosshair.style.left;
                    currentl = parseInt(marginl.replace("px", ""));
                    crosshair.style.left = currentl + 10 + "px";
                    marginl = crosshair.style.left;
                    
                }

                if (code == 38) {

                    

                    marginl = crosshair.style.top;
                    currentl = parseInt(marginl.replace("px", ""));
                    crosshair.style.top = currentl - 10 + "px";
                    marginl = crosshair.style.top;
                    

                }

                if (code == 40) {

                    
                    marginl = crosshair.style.top;
                    currentl = parseInt(marginl.replace("px", ""));
                    crosshair.style.top = currentl + 10 + "px";
                    marginl = crosshair.style.top;
                    

                }

                if (code == 83) {

                    //$('#viewer').addClass("twoto3d sidepan");
                    if (fired == 1) {
                        explosion.style.width = "30";
                        explosion.style.height = "30";
                        
                        explosion.style.left = crosshair.style.left;
                        explosion.style.top = crosshair.style.top;
                        explosion.style.right = crosshair.style.right;
                        explosion.style.visibility = "visible";

                        fired = 0;
                    }

                    var myaddctrl = window.setTimeout(function () { removeexplosion() }, 3000);
                    if (fired == 0) {
                        function removeexplosion() {
                            explosion.style.visibility = "hidden";
                            fired = 1;
                            checked = 1;
                        }
                    }

                    if (checked == 1) {
                        fired = 0;
                        checked = 0;
                        marginl = crosshair.style.left;

                        currentl = parseInt(marginl.replace("px", ""));
                        currentt = crosshair.style.left;

                        currentt = parseInt(currentt.replace("px", ""));


                        margint = document.getElementById('ctrl1').style.top;
                        margint = parseInt(margint.replace("px", ""));
                        marginl = document.getElementById('ctrl1').style.left;
                        marginl = parseInt(marginl.replace("px", ""));


                        if (currentl >= marginl && currentl <= (marginl + 30) || currentt >= margint && (currentt <= margint + 30)) {
                            explosion.style.width = "30px";
                            explosion.style.height = "30px";
                            form1.removeChild(ctrl1);
                            enemyhits = enemyhits + 1;
                            document.getElementById('ehits').setAttribute("value", enemyhits);
                            
                            started = 0;
                            fired = 0;

                        }

                        var myaddctrl = window.setTimeout(function () { addCtrl() }, 1000);
                        if (started == 0) {
                            function addCtrl() {
                                if (started == 0) {
                                    explosion.style.visibility = "hidden";
                                    var ctrl = document.createElement('img');
                                    ctrl.setAttribute("id", "ctrl1");
                                    ctrl.setAttribute("src", "../../Images/fplane.gif");
                                    ctrl.setAttribute("style", "width:80px; height:60px; position:relative; top: 307px; left: 215px; z-index: 2; right: 532px; visibility: visible: margin-left: 0px; margin-top: 0px");
                                    form1.appendChild(ctrl);
                                    started = 1

                                }
                            }
                        }


                    }

                }


            }



        });

    </script>


    <style type="text/css">
        .twoto3d {
            width: 667px;
            height: 359px;
            position: relative;
            animation: mymove 0.05s infinite;
            -webkit-animation: mymove 0.25s infinite;
            top: 92px;
            left: 0px;
        }

        @keyframes mymove {
            from {
                left: 0px;
            }

            to {
                left: 2px;
            }
        }

        @-webkit-keyframes mymove /* Safari and Chrome */
        {
            from {
                left: 0px;
            }

            to {
                left: 2px;
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
    <iframe id="player" height="390" src="//www.youtube.com/embed/XAbMQx-D7rE?enablejsapi=1&wmmode=transparent&autoplay=1&start=30&end=60&loop=1&playlist=XAbMQx-D7rE&rel=0" style="z-index: 0; left: 69px; top: 171px; position: absolute; background-color: transparent" onkeydown="check(e)" class="twoto3d"></iframe>





    <form id="form1" runat="server">

        <label style="position: absolute; top: -30px; left: -9px; height: 26px; width: 869px; z-index: 200"></label>
        <label style="position: absolute; top: 20px; left: 15px; right: 773px; height: 19px;">Achievements   </label>
        <label style="position: absolute; top: 20px; left: 169px; height: 19px; right: 671px;">Lives   </label>

        <label id="lives" style="position: absolute; top: 20px; width: 39px; left: 211px; height: 19px;"></label>
        <label style="position: absolute; top: 20px; left: 276px; height: 19px;">Crisboos   </label>
        <label id="points" style="position: absolute; top: 20px; width: 81px; left: 341px; height: 19px;"></label>
        <label style="position: absolute; top: 20px; left: 450px; height: 19px;">Treasure   </label>
        <label id="treasure" style="position: absolute; top: 20px; width: 118px; left: 521px; height: 19px;"></label>

        <img id="crosshair" src="../../Images/crosshair.png" style="width: 33px; height: 25px; position: absolute; top: 223px; left: 403px; z-index: 202; right: 416px;">
        <img id="explosion" src="../../Images/explosion.gif" style="width: 10px; height: 10px; position: absolute; top: 247px; left: 307px; z-index: 21; right: 532px; visibility: hidden; margin-left: 0px; margin-top: 0px;">






        <a href='Invite/friends' onclick="FacebookInviteFriends();" style="position: absolute; top: 60px; width: 113px; right: 68px;">Invite Friends</a>

        <a href="Tspot/buy" target="_self" style="position: absolute; left: 505px; top: 57px; width: 139px">Buy a TreasureSpot </a>

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

        <a href="../Home/Cpanel/gamesettings" style="position: absolute; left: 793px; top: 96px; width: 91px; text-decoration: none; color: #FFFFFF; background-color: #0000FF; webkit-border-radius: 20px; moz-border-radius: 20px; border-radius: 20px; text-align: center">My Game</a>
        <asp:TextBox ID="ehits" runat="server" AutoPostBack="True" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" style="z-index: 1; left: 107px; top: 20px; position: absolute; width: 45px"></asp:TextBox>


        <asp:HiddenField ID="tsrplayershf" runat="server" />
        <asp:HiddenField ID="tsrplayersdetailshf" runat="server" />
        <asp:HiddenField ID="tsdplayershf" runat="server" />
        <asp:HiddenField ID="tsdplayersdetailshf" runat="server" />
        <asp:HiddenField ID="gettspothf" runat="server" />
        <asp:HiddenField ID="tspotnamehf" runat="server" />
        <asp:HiddenField ID="tsspotdetailshf" runat="server" />
        <asp:HiddenField ID="gettsplayers" runat="server" />


    </form>

</body>
</html>
