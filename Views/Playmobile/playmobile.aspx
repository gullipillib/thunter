<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>


<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>


<!DOCTYPE html>
<script runat="server">
    //public static System.Timers.Timer timer = new System.Timers.Timer(10000); // This will raise the event every one minute.
    //public static System.Timers.Timer timer1 = new System.Timers.Timer(40000); // This will raise the event every one minute.
    //border: medium dashed #FF0000; 
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


        Hiddenfield1 = Convert.ToString(Session["loggeduser"]); 
        Hiddenfield1 = Hiddenfield1.Replace(" ", "");
        if (Hiddenfield1 != null)
        {
            
            //Insert User into appuser,loggeduser,ordercounter,treasureprize;
            AccessDataSource1.SelectCommand = "SELECT uname FROM appuserdetails WHERE (uname = '" + Hiddenfield1 + "')";

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
                AccessDataSource1.InsertCommand = "INSERT INTO appuserdetails(uname, uloggedin, winner, wintimes, paid, amount, currenttspot) VALUES ('" + Hiddenfield1 + "', 'no', 'no', '0', 'no', '0', '')";
                AccessDataSource1.Insert();
                AccessDataSource1.SelectCommand = "SELECT * FROM loggedusers";
                AccessDataSource1.InsertCommand = "INSERT INTO loggedusers(luname, luid, luposition, luimg, luspriteimg, lucrisboos, luloggedin, lutspots, lulogintimes, luinvites) VALUES ('" + Hiddenfield1 + "', '" + "10020010100" + "', '{left : 0, top:0}', '" + "" + "', '" + "" + "', '100', 'yes', '0', '0', '0')";
                AccessDataSource1.Insert();
                AccessDataSource1.SelectCommand = "SELECT * FROM ordercounter";
                AccessDataSource1.InsertCommand = "INSERT INTO ordercounter(uname, ccounter) Values ('" + Hiddenfield1 + "','0')";
                AccessDataSource1.Insert();
                AccessDataSource1.SelectCommand = "SELECT * FROM winners";
                AccessDataSource1.InsertCommand = "INSERT INTO winners(uname, crisboos) Values ('" + Hiddenfield1 + "','0')";
                AccessDataSource1.Insert();
            }

        }
        else
        {

            Response.Redirect("~/Tspot/buy");
        }
    }
public string one1 = "";
public string one2 = "";
public string one3 = "";
public string one4 = "";
public string one5 = "";
    protected void gettreasurespot()
    {
        
        AccessDataSource1.SelectCommand = "SELECT tsname, tsitems, tsrplayers, tsdplayers, tsrplayersdetails, tsdplayersdetails, tsapproved, tsactive FROM tspots where tsapproved = 'yes' and tsactive = 'yes'";
        DataView dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
        DataTable dt = new DataTable();
        dt = dv.ToTable();

        if (dt.Rows.Count != 0)
        {

            Random one = new Random();
            int t1 = one.Next(0, dt.Rows.Count);
            tsitems = dt.Rows[t1].Field<string>("tsitems"); //usethis to get field value
            tsitemsfulldetails = Json.Decode(tsitems);
            one1 = tsitemsfulldetails.tsUrl;

            one = new Random();
            t1 = one.Next(0, dt.Rows.Count);
            tsitems = dt.Rows[t1].Field<string>("tsitems"); //usethis to get field value
            tsitemsfulldetails = Json.Decode(tsitems);
            one2 = tsitemsfulldetails.tsUrl;

            one = new Random();
            t1 = one.Next(0, dt.Rows.Count);
            tsitems = dt.Rows[t1].Field<string>("tsitems"); //usethis to get field value
            tsitemsfulldetails = Json.Decode(tsitems);
            one3 = tsitemsfulldetails.tsUrl;

            one = new Random();
            t1 = one.Next(0, dt.Rows.Count);
            tsitems = dt.Rows[t1].Field<string>("tsitems"); //usethis to get field value
            tsitemsfulldetails = Json.Decode(tsitems);
            one4 = tsitemsfulldetails.tsUrl;

            one = new Random();
            t1 = one.Next(0, dt.Rows.Count);
            tsitems = dt.Rows[t1].Field<string>("tsitems"); //usethis to get field value
            tsitemsfulldetails = Json.Decode(tsitems);
            one5 = tsitemsfulldetails.tsUrl;

        }   
        
        if (dt.Rows.Count != 0)
        {
           //dt.Rows.Count
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

        AccessDataSource1.SelectCommand = "SELECT tbname, tbdetails FROM toolbox where tbname = '" + tsitemsfulldetails.tsctrl1name + "'";
        dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        tb1fulldetails = dt.Rows[0].Field<string>("tbdetails");
        tb1itemsfulldetails = Newtonsoft.Json.JsonConvert.DeserializeObject(tb1fulldetails);
        tbitems1 = tb1fulldetails;
        ctrl1mainurl = tb1itemsfulldetails.tbMain;

        propurl = tb1itemsfulldetails.tbProp;
        collisionurl = tb1itemsfulldetails.tbCollionResult;
        //propurl = "http://localhost:44301/Images/crosshair.png";
        //collisionurl = "http://localhost:44301/Images/orderedList0.png";
        ctrl1mainsound = tb1itemsfulldetails.tbMainSound;
        //ctrl1mainsound = "http://localhost:44301/Images/ding.wav";
        


        AccessDataSource1.SelectCommand = "SELECT tbname, tbdetails FROM toolbox where tbname = '" + tsitemsfulldetails.tsctrl2name + "'";
        dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        tb2fulldetails = dt.Rows[0].Field<string>("tbdetails");
        tb2itemsfulldetails = Newtonsoft.Json.JsonConvert.DeserializeObject(tb2fulldetails);
        tbitems2 = tb2fulldetails;
        //tb2itemsfulldetails = Json.Decode(tb2itemsfulldetails);
       ctrl2mainurl = tb2itemsfulldetails.tbMain;

       

        AccessDataSource1.SelectCommand = "SELECT tbname, tbdetails FROM toolbox where tbname = '" + tsitemsfulldetails.tsctrl3name + "'";
        dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        tb3fulldetails = dt.Rows[0].Field<string>("tbdetails");

        tb3itemsfulldetails = Newtonsoft.Json.JsonConvert.DeserializeObject(tb3fulldetails);
        tbitems3 = tb3fulldetails;
        ctrl3mainurl = tb3itemsfulldetails.tbMain;

        


        AccessDataSource1.SelectCommand = "SELECT tbname, tbdetails FROM toolbox where tbname = '" + tsitemsfulldetails.tsctrl4name + "'";
        dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        tb4fulldetails = dt.Rows[0].Field<string>("tbdetails");
        tb4itemsfulldetails = Newtonsoft.Json.JsonConvert.DeserializeObject(tb4fulldetails);

        ctrl4mainurl = tb4itemsfulldetails.tbMain;
        tbitems4 = tb4fulldetails;
        


        AccessDataSource1.SelectCommand = "SELECT tbname, tbdetails FROM toolbox where tbname = '" + tsitemsfulldetails.tsctrl5name + "'";
        dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
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
            AccessDataSource1.SelectCommand = "SELECT tsname, tsitems, tsrplayers, tsdplayers, tsrplayersdetails, tsdplayersdetails, tsapproved, tsactive FROM tspots where tsapproved = 'yes' and tsactive = 'yes' and tsrplayers = '0' and  tsrplayers = '0'";
            DataView dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
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

   

    protected void gettreasureprize()
    {
        AccessDataSource1.SelectCommand = "SELECT treasurevalue FROM treasureprize";
        DataView dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
        DataTable dt = new DataTable();
        dt = dv.ToTable();
        treasure.Text = dt.Rows[0].Field<string>("treasurevalue");
        AccessDataSource1.SelectCommand = "SELECT lucrisboos FROM loggedusers where luname='" + Hiddenfield1 + "'";
        dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
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
            
            checkusername();
            AccessDataSource1.UpdateCommand = "UPDATE loggedusers SET luloggedin='yes' where luname='" + Hiddenfield1 + "'";
            AccessDataSource1.Update();
            gettreasurespot();
            gettreasureprize();
            //timer.Enabled = true;
            //timer.Elapsed += new System.Timers.ElapsedEventHandler(startupdatecoins);
            
        }


        if (Page.IsPostBack == false)
        {
            AccessDataSource1.SelectCommand = "SELECT luname, lulogintimes, luloggedin, lutspots FROM loggedusers";
            DataView dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
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
                AccessDataSource1.SelectCommand = "SELECT * FROM loggedusers";
                AccessDataSource1.UpdateCommand = "UPDATE loggedusers SET lulogintimes = '" + Convert.ToString(Convert.ToInt16(logintimes) + 1) + "', luloggedin='yes' where luname='" + Hiddenfield1 + "'";
                AccessDataSource1.Update();
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
    //    AccessDataSource1.SelectCommand = "SELECT lucrisboos FROM loggedusers where luname='" + Hiddenfield1 + "'";
    //    AccessDataSource1.UpdateCommand = "UPDATE loggedusers SET luloggedin='yes', lucrisboos='" + goldcoins + "' where luname='" + Hiddenfield1 + "'";

    //    AccessDataSource1.Update();
    //    gettreasurespot();
    //    return 1;
    //}
    
    //protected void startupdatecoins(object sender, System.Timers.ElapsedEventArgs e)
    //{

    //    timer1.Enabled = true;
    //    timer1.Elapsed += new System.Timers.ElapsedEventHandler(updatecoins);

    //}


    //public static string mycoins = "";

    //public void updatecoins(object sender, System.Timers.ElapsedEventArgs e)
    //{

    //    if (Session["mycoins"] != null)

    //        goldcoins = Session["mycoins"].ToString();
             
    //            AccessDataSource1.SelectCommand = "SELECT lucrisboos FROM loggedusers where luname='" + Hiddenfield1 + "'";
    //            AccessDataSource1.UpdateCommand = "UPDATE loggedusers SET luloggedin='yes', lucrisboos='" + goldcoins + "' where luname='" + Hiddenfield1 + "'";

    //            AccessDataSource1.Update();
    //            gettreasurespot();

            
    //}
        
     
</script>


<html>
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>treasurehunter Mobile</title>
    
</head>
<body   onbeforeunload="getcoins" style="height: 507px; background-color: #000000; width: 967px; overflow: hidden;" onmouseover="moveprop(event)" onmousedown="explodeprop(event)" onkeydown="check(e)">




    <style type="text/css">
        .twoto3d {
            width: 480px; 
            height: 378px;
            position: relative;
            animation: mymove 0.05s infinite;
            -webkit-animation: mymove 0.25s infinite;
            top: 216px;
            left: 1px;
        }

        @keyframes mymove {
            from {
                left: 1px;
            }

            to {
                left: 3px;
            }
        }

        @-webkit-keyframes mymove /* Safari and Chrome */
        {
            from {
                left: 1px;
            }

            to {
                left: 3px;
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
            left: 114px;
            top: 194px;
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
         var chat = $.connection.sysmessages;
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


                var myaddctrl1 = window.setInterval(function () { tcounter() }, 1000);
                function tcounter() {
                    var mycounter = document.getElementById('TextBox2').getAttribute("value");
                    mycounter = parseInt(mycounter, 10) - 1;
                    if (mycounter < 0) {
                        mycounter = 0;
                    }
                    document.getElementById('TextBox2').setAttribute("value", mycounter);

                    if (noofhits = ranhits) {
                        noofhits = -100;
                    }
                    if (noofcoins = rancoins) {
                        noofcoins = -150;
                    }
                    if (mycounter != 0) {
                        if (noofhits >= ranhits || noofcoins >= rancoins) {
                            document.getElementById('attacked').setAttribute("value", "You Have Completed this Treasure Spot Keep Playing");
                            Img9.style.visibility = "visibile";
                            feed();
                            document.getElementById('TextBox2').setAttribute("value", "0");

                        }
                        document.getElementById('TextBox4').setAttribute("value", rancoins - noofcoins);
                        document.getElementById('TextBox6').setAttribute("value", ranhits - noofhits);

                    }
                }

                var myaddctrl1 = window.setInterval(function () { getTspot() }, 300000);
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
                    ctrl1.style.width = "100px";
                    ctrl1.style.height = "100px";
                    ctrl1.style.left = Math.floor(Math.random() * 845 - 365 + 1) + 365 + "px";
                    var mytemp = Math.floor(Math.random() * (temp - 1) + 1);
                    mytemp = mytemp + temp + "px";
                    ctrl1.style.top = mytemp;
                    visible1 = "yes";
                }
                if (randno1 == 2 || randno2 == 2 || randno3 == 2) {
                    ctrl2.style.visibility = "visible";
                    ctrl2.style.width = "100px";
                    ctrl2.style.height = "100px";
                    ctrl2.style.left = Math.floor(Math.random() * 845 - 365 + 1) + 365 + "px";
                    var mytemp = Math.floor(Math.random() * (temp - 1) + 1);
                    mytemp = mytemp + temp + "px";
                    ctrl2.style.top = mytemp;
                    visible2 = "yes";
                }
                if (randno1 == 3 || randno2 == 3 || randno3 == 3) {
                    ctrl3.style.visibility = "visible";
                    ctrl3.style.width = "100px";
                    ctrl3.style.height = "100px";
                    ctrl3.style.left = Math.floor(Math.random() * 845 - 365 + 1) + 365 + "px";
                    var mytemp = Math.floor(Math.random() * (temp - 1) + 1);
                    mytemp = mytemp + temp + "px";
                    ctrl3.style.top = mytemp;
                    visible3 = "yes";
                }
                if (randno1 == 4 || randno2 == 4 || randno3 == 4) {
                    ctrl4.style.visibility = "visible";
                    ctrl4.style.width = "100px";
                    ctrl4.style.height = "100px";
                    ctrl4.style.left = Math.floor(Math.random() * 845 - 365 + 1) + 365 + "px";
                    var mytemp = Math.floor(Math.random() * (temp - 1) + 1);
                    mytemp = mytemp + temp + "px";
                    ctrl4.style.top = mytemp;
                    visible4 = "yes";
                }
                if (randno1 == 5 || randno2 == 5 || randno3 == 5) {
                    ctrl5.style.visibility = "visible";
                    ctrl5.style.width = "100px";
                    ctrl5.style.height = "100px";
                    ctrl5.style.left = Math.floor(Math.random() * 845 - 365 + 1) + 365 + "px";
                    var mytemp = Math.floor(Math.random() * (temp - 1) + 1);
                    mytemp = mytemp + temp + "px";
                    ctrl5.style.top = mytemp;
                    visible5 = "yes";
                }
                if (randno1 == 6 || randno2 == 6 || randno3 == 6) {
                    Img1.style.visibility = "visible";
                    Img1.style.width = "80px";
                    Img1.style.height = "80px";
                    if ('<%=ctrl1mainname%>' == "goldcoins" || '<%=ctrl1mainname%>' == "health") {
                        Img1.style.width = "30px";
                        Img1.style.height = "30px";
                    }
                    Img1.style.left = Math.floor(Math.random() * 845 - 365 + 1) + 365 + "px";
                    var mytemp = Math.floor(Math.random() * (temp - 1) + 1);
                    mytemp = mytemp + temp + "px";
                    Img1.style.top = mytemp;
                }
                if (randno1 == 7 || randno2 == 7 || randno3 == 7) {
                    Img2.style.visibility = "visible";
                    Img2.style.width = "80px";
                    Img2.style.height = "80px";
                    if ('<%=ctrl2mainname%>' == "goldcoins" || '<%=ctrl2mainname%>' == "health") {
                        Img2.style.width = "30px";
                        Img2.style.height = "30px";
                    }
                    Img2.style.left = Math.floor(Math.random() * 845 - 365 + 1) + 365 + "px";
                    var mytemp = Math.floor(Math.random() * (temp - 1) + 1);
                    mytemp = mytemp + temp + "px";
                    Img2.style.top = mytemp;
                }
                if (randno1 == 8 || randno2 == 8 || randno3 == 8) {
                    Img3.style.visibility = "visible";
                    Img3.style.width = "80px";
                    Img3.style.height = "80px";
                    if ('<%=ctrl3mainname%>' == "goldcoins" || '<%=ctrl3mainname%>' == "health") {
                        Img3.style.width = "30px";
                        Img3.style.height = "30px";
                    }
                    Img3.style.left = Math.floor(Math.random() * 845 - 365 + 1) + 365 + "px";
                    var mytemp = Math.floor(Math.random() * (temp - 1) + 1);
                    mytemp = mytemp + temp + "px";
                    Img3.style.top = mytemp;
                }
                if (randno1 == 9 || randno2 == 9 || randno3 == 9) {
                    Img4.style.visibility = "visible";
                    Img4.style.width = "80px";
                    Img4.style.height = "80px";
                    if ('<%=ctrl4mainname%>' == "goldcoins" || '<%=ctrl4mainname%>' == "health") {
                        Img4.style.width = "30px";
                        Img4.style.height = "30px";
                    }
                    Img4.style.left = Math.floor(Math.random() * 845 - 365 + 1) + 365 + "px";
                    var mytemp = Math.floor(Math.random() * (temp - 1) + 1);
                    mytemp = mytemp + temp + "px";
                    Img4.style.top = mytemp;
                }
                if (randno1 == 10 || randno2 == 10 || randno3 == 10) {
                    Img5.style.visibility = "visible";
                    Img5.style.width = "80px";
                    Img5.style.height = "80px";
                    if ('<%=ctrl5mainname%>' == "goldcoins" || '<%=ctrl5mainname%>' == "health") {
                        Img5.style.width = "30px";
                        Img5.style.height = "30px";
                    }
                    Img5.style.left = Math.floor(Math.random() * 845 - 365 + 1) + 365 + "px";
                    var mytemp = Math.floor(Math.random() * (temp - 1) + 1);
                    mytemp = mytemp + temp + "px";
                    Img5.style.top = mytemp;
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
                    if (parseInt(ctrl1.style.left.replace("px", ""), 10) > 365 && parseInt(ctrl1.style.left.replace("px", ""), 10) < 879) {
                        ctrl1.style.left = parseInt(ctrl1.style.left.replace("px", ""), 10) + 45 + "px";
                    }
                    if (parseInt(ctrl2.style.left.replace("px", ""), 10) > 365 && parseInt(ctrl2.style.left.replace("px", ""), 10) < 879) {
                        ctrl2.style.left = parseInt(ctrl2.style.left.replace("px", ""), 10) + 45 + "px";
                    }
                    if (parseInt(ctrl3.style.left.replace("px", ""), 10) > 365 && parseInt(ctrl3.style.left.replace("px", ""), 10) < 879) {
                        ctrl3.style.left = parseInt(ctrl3.style.left.replace("px", ""), 10) + 45 + "px";
                    }
                    if (parseInt(ctrl4.style.left.replace("px", ""), 10) > 365 && parseInt(ctrl4.style.left.replace("px", ""), 10) < 879) {
                        ctrl4.style.left = parseInt(ctrl4.style.left.replace("px", ""), 10) + 45 + "px";
                    }
                    if (parseInt(ctrl5.style.left.replace("px", ""), 10) > 365 && parseInt(ctrl5.style.left.replace("px", ""), 10) < 879) {
                        ctrl5.style.left = parseInt(ctrl5.style.left.replace("px", ""), 10) + 45 + "px";
                    }
                    if (parseInt(Img1.style.left.replace("px", ""), 10) > 365 && parseInt(Img1.style.left.replace("px", ""), 10) < 879) {
                        Img1.style.left = parseInt(Img1.style.left.replace("px", ""), 10) + 45 + "px";
                    }
                    if (parseInt(Img2.style.left.replace("px", ""), 10) > 365 && parseInt(Img2.style.left.replace("px", ""), 10) < 879) {
                        Img2.style.left = parseInt(Img2.style.left.replace("px", ""), 10) + 45 + "px";
                    }
                    if (parseInt(Img3.style.left.replace("px", ""), 10) > 365 && parseInt(Img3.style.left.replace("px", ""), 10) < 879) {
                        Img3.style.left = parseInt(Img3.style.left.replace("px", ""), 10) + 45 + "px";
                    }
                    if (parseInt(Img4.style.left.replace("px", ""), 10) > 365 && parseInt(Img4.style.left.replace("px", ""), 10) < 879) {
                        Img4.style.left = parseInt(Img4.style.left.replace("px", ""), 10) + 45 + "px";
                    }
                    if (parseInt(Img5.style.left.replace("px", ""), 10) > 365 && parseInt(Img5.style.left.replace("px", ""), 10) < 879) {
                        Img5.style.left = parseInt(Img5.style.left.replace("px", ""), 10) + 45 + "px";
                    }



                    if (parseInt(ctrl1.style.top.replace("px", ""), 10) > temp && parseInt(ctrl1.style.top.replace("px", ""), 10) < 275) {
                        ctrl1.style.top = parseInt(ctrl1.style.top.replace("px", ""), 10) - 45 + "px";
                    }
                    if (parseInt(ctrl2.style.top.replace("px", ""), 10) > temp && parseInt(ctrl2.style.top.replace("px", ""), 10) < 275) {
                        ctrl2.style.top = parseInt(ctrl2.style.top.replace("px", ""), 10) - 45 + "px";
                    }
                    if (parseInt(ctrl3.style.top.replace("px", ""), 10) > temp && parseInt(ctrl3.style.top.replace("px", ""), 10) < 275) {
                        ctrl3.style.top = parseInt(ctrl3.style.top.replace("px", ""), 10) - 45 + "px";
                    }
                    if (parseInt(ctrl4.style.top.replace("px", ""), 10) > temp && parseInt(ctrl4.style.top.replace("px", ""), 10) < 275) {
                        ctrl4.style.top = parseInt(ctrl4.style.top.replace("px", ""), 10) - 45 + "px";
                    }
                    if (parseInt(ctrl5.style.top.replace("px", ""), 10) > temp && parseInt(ctrl5.style.top.replace("px", ""), 10) < 275) {
                        ctrl5.style.top = parseInt(ctrl5.style.top.replace("px", ""), 10) - 45 + "px";
                    }
                    if (parseInt(Img1.style.top.replace("px", ""), 10) > temp && parseInt(Img1.style.top.replace("px", ""), 10) < 275) {
                        Img1.style.top = parseInt(Img1.style.top.replace("px", ""), 10) - 45 + "px";
                    }
                    if (parseInt(Img2.style.top.replace("px", ""), 10) > temp && parseInt(Img2.style.top.replace("px", ""), 10) < 275) {
                        Img2.style.top = parseInt(Img2.style.top.replace("px", ""), 10) - 45 + "px";
                    }
                    if (parseInt(Img3.style.top.replace("px", ""), 10) > temp && parseInt(Img3.style.top.replace("px", ""), 10) < 275) {
                        Img3.style.top = parseInt(Img3.style.top.replace("px", ""), 10) - 45 + "px";
                    }
                    if (parseInt(Img4.style.top.replace("px", ""), 10) > temp && parseInt(Img4.style.top.replace("px", ""), 10) < 275) {
                        Img4.style.top = parseInt(Img4.style.top.replace("px", ""), 10) - 45 + "px";
                    }
                    if (parseInt(Img5.style.top.replace("px", ""), 10) > temp && parseInt(Img5.style.top.replace("px", ""), 10) < 275) {
                        Img5.style.top = parseInt(Img5.style.top.replace("px", ""), 10) - 45 + "px";
                    }

                    //divplayer.focus();
                }


                document.addEventListener("keydown", check, false);
                document.addEventListener("mousedown", explodeprop, false);
                document.addEventListener("mousemove", moveprop, false);
                var currentlposition = "moveleft";
                var currenttposition = "moveleft";
                var positionresult = "moveleft";

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
}(document, 'script', 'facebook-jssdk'));</script>
  
    <script type="text/javascript" >
        FB.init({ appId: "123405257731200", status: true, cookie: true });

        // The dialog only opens if you've implemented the
        // Credits Callback payments_get_items.
        function feed() {
            FB.ui({
                method: 'feed',
                redirect_uri: 'https://apps.facebook.com/treasure_huntermp',
                link: 'https://treasurehunter.apphb.com/',
                caption: 'Treasure Hunter 3D Multiplayer Game - Completed TreasureSpot ' + '<%=Label1.Text%>' + 'and Collected ' + '<%=points.Text%>',
            }, function (response) { });
        }
  </script>        
     <form id="form1" runat="server">

        <asp:AccessDataSource ID="AccessDataSource1" DataFile="~/Views/Datab/th.mdb" runat="server" SelectCommand="SELECT uname FROM appuserdetails WHERE (uname = '<%=Hiddenfield1%>')"></asp:AccessDataSource>







        <asp:Button ID="Button1" runat="server" ClientIDMode="Static" PostBackUrl="~/Play/play" Style="z-index: 1; left: 754px; top: 8px; position: absolute; display: none" Text="Button" CausesValidation="False" />



        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#9999FF" Style="z-index: 1; left: 3px; top: 0px; position: absolute; width: 208px; height: 18px" Text="Label" meta:resourcekey="Label1Resource1"></asp:Label>
        <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Size="X-Small" ForeColor="#9999FF" Style="z-index: 1; left: 10px; top: 180px; position: absolute; width: 294px; height: 19px" Text="Use Mouse or arrow keys for movement, click or 's' for functions" meta:resourcekey="Label2Resource1"></asp:Label>

        <asp:HyperLink ID="Hyperlink1" runat="server" Font-Underline="False" NavigateUrl="https://treasurehunter.apphb.com/Buymobile/tspot1" Style="z-index: 1; left: 66px; top: 48px; position: absolute; height: 10px; width: 70px; right: 736px;" Target="_self" ForeColor="#FFCC00" meta:resourcekey="Hyperlink1Resource1" ViewStateMode="Enabled" Font-Size="X-Small">Buy a Treasure Spot</asp:HyperLink>
        


        <asp:TextBox ID="ehits" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" Style="z-index: 1; left: 100px; top: 26px; position: absolute; width: 45px; right: 748px;" ForeColor="#FFCC00" meta:resourcekey="ehitsResource1" ViewStateMode="Enabled" Font-Size="Small"></asp:TextBox>
        <asp:TextBox ID="lives" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" Style="z-index: 1; left: 202px; top: 25px; position: absolute; width: 18px; height: 18px;" ForeColor="#FFCC00" meta:resourcekey="livesResource1" ViewStateMode="Enabled" Font-Size="Small">10</asp:TextBox>
        <asp:TextBox ID="points" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 303px; top: 25px; position: absolute; width: 53px" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false" Font-Size="Small"></asp:TextBox>
        <asp:TextBox ID="treasure" runat="server" AutoPostBack="False" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" Style="z-index: 1; left: 275px; top: 7px; position: absolute; width: 45px; height: 12px;" ForeColor="#FFCC00" meta:resourcekey="treasureResource1" ViewStateMode="Enabled" Font-Size="Small"></asp:TextBox>
        <asp:Label ID="Label3" runat="server" ForeColor="#FFCC00" Style="z-index: 1; left: 76px; top: 344px; position: absolute" Text="Loading ......." ClientIDMode="Static"></asp:Label>

        <audio id="sound1" src='<%=ctrl1mainsound%>' autoplay="autoplay">
        </audio>

        <label style="position: absolute; top: 26px; left: 7px; height: 19px; color: #FFCC00; font-size: small; width: 83px;">Achievements</label>

        <label style="position: absolute; top: 25px; left: 161px; height: 19px; right: 702px; color: #FFCC00; font-size: small; width: 34px; bottom: 522px;">Lives</label>

        <label style="position: absolute; top: 25px; left: 235px; height: 19px; color: #FFCC00; height: 20px; position: absolute; font-size: small;">Gold Coins</label>

        <label style="position: absolute; top: 3px; left: 202px; height: 19px; color: #FFCC00; font-size: small;">Treasure($)</label>
        <label style="position: absolute; top: 90px; left: 7px; height: 19px; color: #FFCC00; width: 88px; font-size: x-small;">Achievements</label>
        <div id="divplayer" style="z-index: 203; background-color: transparent; overflow: hidden; width: 480px; height: 378px; position: absolute; top: 216px; left: 5px; right: 542px; bottom: 51px; display: inline;">
            <img id="crosshair" src='<%=propurl%>' style="width: 40px; height: 40px; position: absolute; top: '<%=ctrl1mainres%>'; left: 119px; z-index: 202; right: 159px; bottom: 140px;"/>
            <img id="explosion" src='<%=collisionurl%>' style="width: 40px; height: 40px; position: absolute; top: '<%=ctrl1mainres%>'; left: 199px; z-index: 21; visibility: hidden; right: 159px; bottom: 140px;"/>
            <img id="ctrl1" src='<%=ctrl1mainurl%>' style="border: thin solid Transparent; width: '<%=ctrl1mainwidth%>'; height: '<%=ctrl1mainheight%>'; position: absolute; top: '<%=ctrl1mainres%>'; left: '<%=ctrl1mainleft%>'; z-index: 21; visibility: hidden; right: 159px; bottom: 140px;"/>
            <img id="ctrl2" src='<%=ctrl1mainurl%>' style="border: thin solid Transparent; width: '<%=ctrl1mainwidth%>'; height: '<%=ctrl1mainheight%>'; position: absolute; top: '<%=ctrl1mainres%>'; left: '<%=ctrl1mainleft%>'; z-index: 21; visibility: hidden; right: 159px; bottom: 140px;"/>
            <img id="ctrl3" src='<%=ctrl1mainurl%>' style="border: thin solid Transparent; width: '<%=ctrl1mainwidth%>'; height: '<%=ctrl1mainheight%>'; position: absolute; top: '<%=ctrl1mainres%>'; left: '<%=ctrl1mainleft%>'; z-index: 21; visibility: hidden; right: 159px; bottom: 140px;"/>
            <img id="ctrl4" src='<%=ctrl1mainurl%>' style="border: thin solid Transparent; width: '<%=ctrl1mainwidth%>'; height: '<%=ctrl1mainheight%>'; position: absolute; top: '<%=ctrl1mainres%>'; left: '<%=ctrl1mainleft%>'; z-index: 21; visibility: hidden; right: 159px; bottom: 140px;"/>
            <img id="ctrl5" src='<%=ctrl1mainurl%>' style="border: thin solid Transparent; width: '<%=ctrl1mainwidth%>'; height: '<%=ctrl1mainheight%>'; position: absolute; top: '<%=ctrl1mainres%>'; left: '<%=ctrl1mainleft%>'; z-index: 21; visibility: hidden; right: 159px; bottom: 140px;"/>
            <%--<img id="player1" src="" style="width: 30px; height: 30px; position: absolute; top: 278px; left: 229px; z-index: 21; right: 460px; margin-left: 0px; margin-top: 0px;">
        <img id="player2" src="" style="width: 30px; height: 30px; position: absolute; top: 296px; left: 260px; z-index: 21; right: 562px; margin-left: 0px; margin-top: 0px;">
        <img id="player3" src="" style="width: 30px; height: 30px; position: absolute; top: 78px; left: 229px; z-index: 21; right: 460px; margin-left: 0px; margin-top: 0px;">
        <img id="player4" src="" style="width: 30px; height: 30px; position: absolute; top: 302px; left: 245px; z-index: 21; right: 577px; margin-left: 0px; margin-top: 0px;">
        <img id="player5" src="" style="width: 30px; height: 30px; position: absolute; top: 251px; left: 390px; z-index: 21; right: 299px; margin-left: 0px; margin-top: 0px;">
            --%>
            <img id="Img1" src='<%=ctrl1mainurl%>' style="border: thin solid Transparent; width: '<%=ctrl1mainwidth%>'; height: '<%=ctrl1mainheight%>'; top: '<%=ctrl1mainres%>'; left: '<%=ctrl1mainleft%>'; z-index: 21; visibility: hidden; right: 159px; bottom: 140px;"/>
            <img id="Img2" src='<%=ctrl2mainurl%>' style="border: thin solid Transparent; width: '<%=ctrl1mainwidth%>'; height: '<%=ctrl1mainheight%>'; top: '<%=ctrl1mainres%>'; left: '<%=ctrl1mainleft%>'; z-index: 21; visibility: hidden; right: 159px; bottom: 140px;"/>
            <img id="Img3" src='<%=ctrl3mainurl%>' style="border: thin solid Transparent; width: '<%=ctrl1mainwidth%>'; height: '<%=ctrl1mainheight%>'; top: '<%=ctrl1mainres%>'; left: '<%=ctrl1mainleft%>'; z-index: 21; visibility: hidden; right: 159px; bottom: 140px;"/>
            <img id="Img4" src='<%=ctrl4mainurl%>' style="border: thin solid Transparent; width: '<%=ctrl1mainwidth%>'; height: '<%=ctrl1mainheight%>'; top: '<%=ctrl1mainres%>'; left: '<%=ctrl1mainleft%>'; z-index: 21; visibility: hidden; right: 159px; bottom: 140px;"/>
            <img id="Img5" src='<%=ctrl5mainurl%>' style="border: thin solid Transparent; width: '<%=ctrl1mainwidth%>'; height: '<%=ctrl1mainheight%>'; top: '<%=ctrl1mainres%>'; left: '<%=ctrl1mainleft%>'; z-index: 21; visibility: hidden; right: 159px; bottom: 140px;"/>
        <img id="Img9" src="https://treasurehunter.apphb.com/Images/goldshower.gif" style="border: thin solid Transparent; width: 300px; height: 200px; top: 41px; left: 22px; z-index: 1; visibility: hidden; right: 34px; bottom: 54px; position: absolute;" />
    
        </div>
        <input id="friendname" style="visibility: visible; text-decoration: none; height: 18px; background-color: transparent; color: #FFCC00; z-index: 1; left: 3px; top: 140px; position: absolute; width: 91px; cursor: none; font-size: x-small;" type="text" readonly="true" />
        <img alt="" src="https://treasurehunter.apphb.com/Images/landscape.jpg" style="width: 33px; height: 28px; visibility: visible; z-index: 1; left: 11px; top: 107px; position: absolute; bottom: 431px;" id="friendimage" />
        <img alt="" src='<%=iframeurl%>' style="z-index: 0; left: 1px; top: 216px; position: absolute; background-color: transparent; width: 365px; height: 297px;" class="twoto3d" id="fplayer" />
        <label style="position: absolute; top: 149px; left: 113px; height: 19px; color: #FFFFFF; font-size: x-small;">Talk to Players</label>
        <input id="Button2" style="background-color: #6699FF; color: #FFFFFF; z-index: 1; left: 358px; top: 108px; position: absolute; font-size: x-small;" type="button" value="Send" onclick="send2server();" />
        <div style="position: absolute; z-index: 210; width: 175px; height: 42px; top: 134px; right: 539px; bottom: 390px; left: 183px; overflow: hidden; cursor: crosshair;">
            <textarea id="Text2" class="TextArea1" style="border-style: none; border-color: #000000; position: absolute; left: 0px; top: 0px; background-color: Transparent; color: #FFCC00; width: 193px; height: 35px; font-size: small;" readonly="readonly"></textarea>
        </div>
        <input id="Text1" type="text" style="position: absolute; left: 187px; top: 113px; width: 144px; height: 9px;" onkeydown="checkEnter(event);" />
        <iframe id="myframe" src="https://treasurehunter.apphb.com/updatecoins.aspx" runat="server" style="position: absolute; top: 4px; left: 791px; height: 48px; width: 151px; display: none"></iframe>
        <div style="position: absolute; z-index: 210; width: 65px; height: 44px; top: 97px; right: 689px; bottom: 425px; left: 118px; overflow: hidden; cursor: crosshair;">
            <div id="aimg" style="position: absolute; left: 0px; top: 0px; width: 326px; height: 200px; overflow: scroll; scrollbar-3dlight-color: transparent; scrollbar-arrow-color: transparent; scrollbar-base-color: transparent; scrollbar-darkshadow-color: transparent; scrollbar-face-color: transparent; scrollbar-highlight-color: transparent; scrollbar-shadow-color: transparent; scrollbar-track-color: transparent;">
                <img alt="" src="https://treasurehunter.apphb.com/Images/achievements.gif" style="width: 70px; height: 45px; visibility: visible; z-index: 10; left: 0px; top: 0px; position: absolute; bottom: 155px; background-color: Transparent;" id="Img6" />
                <asp:Image ID="Image1" runat="server" Style="z-index: 1; left: 55px; top: 130px; position: absolute; width: 60px; height: 40px;" ImageUrl='<%=one1%>' />
                <asp:Image ID="Image2" runat="server" Style="z-index: 1; left: 93px; top: 68px; position: absolute; width: 60px; height: 40px;" ImageUrl='<%=one2%>' />
                <asp:Image ID="Image3" runat="server" Style="z-index: 1; left: 133px; top: 40px; position: absolute; width: 60px; height: 40px;" ImageUrl='<%=one3%>' />
                <asp:Image ID="Image4" runat="server" Style="z-index: 1; left: 20px; top: 180px; position: absolute; width: 60px; height: 41px;" ImageUrl='<%=one4%>' />
                <asp:Image ID="Image5" runat="server" Style="z-index: 1; left: 185px; top: 7px; position: absolute; width: 50px; height: 40px;" ImageUrl='<%=one5%>' />

                <asp:Image ID="Image6" runat="server" Style="z-index: 301; left: 115px; top: 132px; position: absolute; width: 18px; height: 18px;" ImageUrl="https://treasurehunter.apphb.com/Images/tick.png" />
                <asp:Image ID="Image7" runat="server" Style="z-index: 301; left: 147px; top: 78px; position: absolute; width: 16px; height: 17px;" ImageUrl="https://treasurehunter.apphb.com/Images/tick.png" />
                <asp:Image ID="Image8" runat="server" Style="z-index: 301; left: 150px; top: 32px; position: absolute; width: 20px; height: 21px;" ImageUrl="https://treasurehunter.apphb.com/Images/tick.png" />
                <asp:Image ID="Image9" runat="server" Style="z-index: 301; left: 20px; top: 180px; position: absolute; width: 18px; height: 18px;" ImageUrl="https://treasurehunter.apphb.com/Images/tick.png" />
                <asp:Image ID="Image10" runat="server" Style="z-index: 301; left: 170px; top: 7px; position: absolute; width: 18px; height: 18px;" ImageUrl="https://treasurehunter.apphb.com/Images/tick.png" />

            </div>
        </div>
        <label style="position: absolute; top: 73px; left: 120px; height: 19px; color: #FFCC00; height: 16px; position: absolute; font-size: 10px; width: 63px; right: 714px;">Treasure Map</label>
        <asp:TextBox ID="attacked" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 9px; top: 196px; position: absolute; width: 180px" ForeColor="White" ReadOnly="true" Font-Size="X-Small"></asp:TextBox>
        <asp:TextBox ID="TextBox1" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 190px; top: 97px; position: absolute; width: 83px; right: 595px;" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false" Font-Size="X-Small">Time Remaining</asp:TextBox>
        <asp:TextBox ID="TextBox2" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 285px; top: 92px; position: absolute; width: 33px" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false" Font-Size="Medium">250</asp:TextBox>
        <asp:TextBox ID="TextBox3" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 190px; top: 62px; position: absolute; width: 44px; right: 634px; bottom: 489px;" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false" Font-Size="X-Small">Collect</asp:TextBox>
        <asp:TextBox ID="TextBox4" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 239px; top: 66px; position: absolute; width: 47px; height: 9px; right: 582px;" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false" Font-Size="X-Small"></asp:TextBox>
        <asp:TextBox ID="TextBox5" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 190px; top: 75px; position: absolute; width: 78px; right: 600px;" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false" Font-Size="X-Small">Conquer Players</asp:TextBox>
        <asp:TextBox ID="TextBox6" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 285px; top: 76px; position: absolute; width: 47px" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false" Font-Size="X-Small"></asp:TextBox>
        <img id="Img7" src="https://treasurehunter.apphb.com/Images/goldcoin.gif" style="border: thin solid Transparent; width: 15px; height: 15px; position: absolute; top: 56px; left: 303px; z-index: 21; visibility: visible; right: 550px; bottom: 491px;"/>
        
        <img id="Img8" src='<%=ctrl1mainurl%>' style="border: thin solid Transparent; width: 15px; height: 15px; position: absolute; top: 71px; left: 310px; z-index: 21; visibility: visible; right: 568px; bottom: 476px;"/>
        
    </form>

   
</body>
</html>
