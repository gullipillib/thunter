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
    string upaid = "no";
     public string goldcoins = "100";
    string Hiddenfield1;

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
            //DataRow[] uniname = dtr.Select("uname");
            //username = dt.Rows[0].Field<string>("uname"); usethis to get field value
            //Label3.Text = dt.Rows[0][0].ToString();
            if (dt.Rows.Count == 0)
            {
                //Insert User into appuser,loggeduser,ordercounter,winners;
                SqlDataSource1.InsertCommand = "INSERT INTO appuserdetails(uname, uloggedin, winner, wintimes, paid, amount, currenttspot) VALUES ('" + Hiddenfield1 + "', 'no', 'no', '0', 'no', '0', '')";
                SqlDataSource1.Insert();
                SqlDataSource1.SelectCommand = "SELECT * FROM loggedusers";
                SqlDataSource1.InsertCommand = "INSERT INTO loggedusers(luname, luid, luposition, luimg, luspriteimg, lucrisboos, luloggedin, lutspots, lulogintimes, luinvites) VALUES ('" + Hiddenfield1 + "', '" + "10020010100" + "', '{left : 0, top:0}', '" + "" + "', '" + "" + "', '100', 'yes', '0', '0', '0')";
                SqlDataSource1.Insert();
                SqlDataSource1.SelectCommand = "SELECT * FROM ordercounter";
                SqlDataSource1.InsertCommand = "INSERT INTO ordercounter(uname, ccounter) Values ('" + Hiddenfield1 + "','0')";
                SqlDataSource1.Insert();
                SqlDataSource1.SelectCommand = "SELECT * FROM winners";
                SqlDataSource1.InsertCommand = "INSERT INTO winners(uname, crisboos) Values ('" + Hiddenfield1 + "','0')";
                SqlDataSource1.Insert();
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
        
        SqlDataSource1.SelectCommand = "SELECT tsname, tsitems, tsrplayers, tsdplayers, tsrplayersdetails, tsdplayersdetails, tsapproved, tsactive FROM tspots where tsapproved = 'yes' and tsactive = 'yes'";
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
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

        SqlDataSource1.SelectCommand = "SELECT tbname, tbdetails FROM toolbox where tbname = '" + tsitemsfulldetails.tsctrl1name + "'";
        dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
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
        


        SqlDataSource1.SelectCommand = "SELECT tbname, tbdetails FROM toolbox where tbname = '" + tsitemsfulldetails.tsctrl2name + "'";
        dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        tb2fulldetails = dt.Rows[0].Field<string>("tbdetails");
        tb2itemsfulldetails = Newtonsoft.Json.JsonConvert.DeserializeObject(tb2fulldetails);
        tbitems2 = tb2fulldetails;
        //tb2itemsfulldetails = Json.Decode(tb2itemsfulldetails);
       ctrl2mainurl = tb2itemsfulldetails.tbMain;

       

        SqlDataSource1.SelectCommand = "SELECT tbname, tbdetails FROM toolbox where tbname = '" + tsitemsfulldetails.tsctrl3name + "'";
        dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        tb3fulldetails = dt.Rows[0].Field<string>("tbdetails");

        tb3itemsfulldetails = Newtonsoft.Json.JsonConvert.DeserializeObject(tb3fulldetails);
        tbitems3 = tb3fulldetails;
        ctrl3mainurl = tb3itemsfulldetails.tbMain;

        


        SqlDataSource1.SelectCommand = "SELECT tbname, tbdetails FROM toolbox where tbname = '" + tsitemsfulldetails.tsctrl4name + "'";
        dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        tb4fulldetails = dt.Rows[0].Field<string>("tbdetails");
        tb4itemsfulldetails = Newtonsoft.Json.JsonConvert.DeserializeObject(tb4fulldetails);

        ctrl4mainurl = tb4itemsfulldetails.tbMain;
        tbitems4 = tb4fulldetails;
        


        SqlDataSource1.SelectCommand = "SELECT tbname, tbdetails FROM toolbox where tbname = '" + tsitemsfulldetails.tsctrl5name + "'";
        dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
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
            SqlDataSource1.SelectCommand = "SELECT tsname, tsitems, tsrplayers, tsdplayers, tsrplayersdetails, tsdplayersdetails, tsapproved, tsactive FROM tspots where tsapproved = 'yes' and tsactive = 'yes' and tsrplayers = '0' and  tsrplayers = '0'";
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
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
        SqlDataSource1.SelectCommand = "SELECT treasurevalue FROM treasureprize";
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
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
    
    protected void Page_Load(object sender, EventArgs e)
    {
        

        if (Page.IsPostBack == false)
        {
            
            checkusername();
            SqlDataSource1.UpdateCommand = "UPDATE loggedusers SET luloggedin='yes' where luname='" + Hiddenfield1 + "'";
            SqlDataSource1.Update();
            gettreasurespot();
            gettreasureprize();
            addfriends();
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
             
    //            SqlDataSource1.SelectCommand = "SELECT lucrisboos FROM loggedusers where luname='" + Hiddenfield1 + "'";
    //            SqlDataSource1.UpdateCommand = "UPDATE loggedusers SET luloggedin='yes', lucrisboos='" + goldcoins + "' where luname='" + Hiddenfield1 + "'";

    //            SqlDataSource1.Update();
    //            gettreasurespot();

            
    //}
        
     
</script>


<html>
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>treasurehunter Mobile</title>
    
</head>
<body   onbeforeunload="getcoins" style="height: 507px; background-color: #000000; width: 967px; overflow: hidden;" onmouseover="moveprop(event)" onmousedown="explodeprop(event)" onkeydown="check(e)">
   <!-- Google Tag Manager -->
<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-TGKH9G"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<script>(function (w, d, s, l, i) {
    w[l] = w[l] || []; w[l].push({
        'gtm.start':
        new Date().getTime(), event: 'gtm.js'
    }); var f = d.getElementsByTagName(s)[0],
    j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : ''; j.async = true; j.src =
    '//www.googletagmanager.com/gtm.js?id=' + i + dl; f.parentNode.insertBefore(j, f);
})(window, document, 'script', 'dataLayer', 'GTM-TGKH9G');</script>
<!-- End Google Tag Manager -->
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
                document.getElementById('TextBox7').setAttribute("value", "Collect " + rancoins + " Gold Coins or Conqueor other " + ranhits + " Players in the Next 2 Mins");
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

            var myaddctrl1 = window.setInterval(function () { getTspot() }, 270000);
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
                function randomspots() {
                    var mytemp = Math.floor(Math.random() * (0 - 1) + 1);
                    if (mytemp == 0) {
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
          <script type="text/javascript">
              var enemyhits = sessionStorage.getItem("achievements");
              var mygoldcoins = sessionStorage.getItem("points");

              mygoldcoins = 0;
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
                      document.getElementById('TextBox7').setAttribute("value", "Collect " + rancoins + " Gold Coins or Conqueor other " + ranhits + " Players in the Next 2 Mins");
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

                  var myaddctrl1 = window.setInterval(function () { getTspot() }, 120000);
                  function getTspot() {



                      //document.getElementById('divplayer').getElementsByTagName('ctrl1').src = '<%=ctrl1mainurl%>';
                    //document.getElementById('divplayer').getElementsByTagName('ctrl2').src = '<%=ctrl1mainurl%>';
                    //document.getElementById('divplayer').getElementsByTagName('ctrl3').src = '<%=ctrl1mainurl%>';
                    //document.getElementById('divplayer').getElementsByTagName('ctrl4').src = '<%=ctrl1mainurl%>';
                    //document.getElementById('divplayer').getElementsByTagName('ctrl5').src = '<%=ctrl1mainurl%>';
                    //document.getElementById('divplayer').getElementsByTagName('Img1').src = '<%=ctrl1mainurl%>';
                    //document.getElementById('divplayer').getElementsByTagName('Img2').src = '<%=ctrl2mainurl%>';
                    //document.getElementById('divplayer').getElementsByTagName('Img3').src = '<%=ctrl3mainurl%>';
                    //document.getElementById('divplayer').getElementsByTagName('Img4').src = '<%=ctrl4mainurl%>';
                    //document.getElementById('divplayer').getElementsByTagName('Img5').src = '<%=ctrl5mainurl%>';
                    //document.getElementById('fplayer').src = '<%=iframeurl%>';
                    //document.getElementById('divplayer').getElementsByTagName('explosion').src = '<%=collisionurl%>';
                    //document.getElementById('divplayer').getElementsByTagName('crosshair').src = '<%=propurl%>';
                    var mydivs = Math.floor(Math.random() * (9 - 1) + 1);
                    if (mydivs == 9) {
                        document.getElementById('showspot').style.visibility = "visible";
                    }
                    else if (mydivs == 8) {
                        document.getElementById('showpromo').style.visibility = "visible";
                    }
                    else if (mydivs == 7) {
                        document.getElementById('showtools').style.visibility = "visible";
                    }
                    else if (mydivs == 6) {
                        document.getElementById('showprof').style.visibility = "visible";
                    }
                    else if (mydivs == 5) {
                        document.getElementById('showtweet').style.visibility = "visible";
                    }
                    else if (mydivs == 4) {
                        document.getElementById('showfriendso').style.visibility = "visible";
                    }
                    else if (mydivs == 3) {
                        window.location.href = "https://treasurehunter.apphb.com/prizes.html";
                    }
                    else if (mydivs == 2) {
                        window.location.href = "https://treasurehunter.apphb.com/gamesettings.aspx";
                    }
                    else if (mydivs == 1) {
                        document.getElementById('showspot').style.visibility = "visible";
                    }

                    actionconqueor();

                }

                function getcoins() {

                }

                var myaddctrl1 = window.setInterval(function () { getTcoins() }, 60000);
                function getTcoins() {


                    actioncollectcoins();
                    var pvalue = '<%=upaid%>';
                //if (enemyhits != null) {
                //myframe.children.namedItem("Label4").setAttribute("value", enemyhits);
                //myframe.src = "~/Play/jsresult/" + enemyhits;
                // window.location.href("jsresult/" + enemyhits);
                if (pvalue == "yes") {
                    document.getElementById("myframe").setAttribute("src", "https://treasurehunter.apphb.com/updatecoins.aspx?coins=" + document.getElementById("points").getAttribute("value"));
                }
                //}

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
                function randomspots() {
                    var mytemp = Math.floor(Math.random() * (0 - 1) + 1);
                    if (mytemp == 0) {
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
                    document.getElementById('attacked').setAttribute("value", "You are Targetted Now " + positionresult);

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
                            //lives.setAttribute("value", '10');
                            actionelifes();
                            document.getElementById('TextBox7').style.visibility = "visible";
                            document.getElementById('TextBox7').setAttribute("value", "So Sad You Lost All Your Lifes. The Gold Coins You Collected Now are Also Lost!! ");
                            var myaddctrl = window.setTimeout(function () { hidelabel() }, 4000);
                        }
                        function hidelabel() {
                            document.getElementById('TextBox7').style.visibility = "hidden";

                            var mydivs = Math.floor(Math.random() * (9 - 1) + 1);
                            if (mydivs == 9) {
                                document.getElementById('showspot').style.visibility = "visible";
                            }
                            else if (mydivs == 8) {
                                document.getElementById('showpromo').style.visibility = "visible";
                            }
                            else if (mydivs == 7) {
                                document.getElementById('showtools').style.visibility = "visible";
                            }
                            else if (mydivs == 6) {
                                document.getElementById('showprof').style.visibility = "visible";
                            }
                            else if (mydivs == 5) {
                                document.getElementById('showtweet').style.visibility = "visible";
                            }
                            else if (mydivs == 4) {
                                document.getElementById('showfriendso').style.visibility = "visible";
                            }
                            else if (mydivs == 3) {
                                window.location.href = "https://treasurehunter.apphb.com/prizes.html";
                            }
                            else if (mydivs == 2) {
                                window.location.href = "https://treasurehunter.apphb.com/gamesettings.aspx";
                            }
                            else if (mydivs == 1) {
                                document.getElementById('showspot').style.visibility = "visible";
                            }
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

                    var playername = "";
                    var playerleft = "";
                    var playertop = "";

                    var playerposition = $.connection.playerpositionmessages;
                    $(function () {
                        playerposition.client.hello = function (messages, values, values1) {
                            playername = messages;
                            playerleft = values;
                            playertop = values1;
                        };
                    });

                    $.connection.hub.start().done(function () {
                        //chat.server.Hello(pname + ":", $('#Text1').val());
                        playerposition.server.Hello(pname, crosshair.style.left, crosshair.style.top).done(function () {
                        });
                        playerposition.server.Hello(pname, crosshair.style.left, crosshair.style.top).done(function () {
                        });
                    });


                    if (playername != Session["friend1"]) {
                        if (parseInt(ctrl1.style.left.replace("px", "")) > 1 && parseInt(ctrl1.style.left.replace("px", "")) < 480) {
                            ctrl1.style.left = parseInt(ctrl1.style.left.replace("px", "")) + 45 + "px";
                        }

                        if (parseInt(ctrl1.style.top.replace("px", "")) > 1 + parseInt(myctrl1.tsctrl1res).toString().replace("px", "") && parseInt(ctrl1.style.top.replace("px", "")) < 374) {
                            ctrl1.style.top = parseInt(ctrl1.style.top.replace("px", "")) - 45 + "px";
                        }
                    }
                    else if (playername == Session["friend1"]) {
                        ctrl1.style.left = playerleft;
                        ctrl1.style.top = playertop;
                    }

                    else if (playername != Session["friend2"]) {
                        if (parseInt(ctrl2.style.left.replace("px", "")) > 1 && parseInt(ctrl2.style.left.replace("px", "")) < 480) {
                            ctrl2.style.left = parseInt(ctrl2.style.left.replace("px", "")) + 5 + "px";
                        }
                        if (parseInt(ctrl2.style.top.replace("px", "")) > 1 + parseInt(myctrl2.tsctrl2res).toString().replace("px", "") && parseInt(ctrl2.style.top.replace("px", "")) < 374) {
                            ctrl2.style.top = parseInt(ctrl2.style.top.replace("px", "")) + 45 + "px";
                        }
                    }
                    else if (playername == Session["friend2"]) {
                        ctrl2.style.left = playerleft;
                        ctrl2.style.top = playertop;
                    }
                    else if (playername != Session["friend3"]) {
                        if (parseInt(ctrl3.style.left.replace("px", "")) > 1 && parseInt(ctrl3.style.left.replace("px", "")) < 480) {
                            ctrl3.style.left = parseInt(ctrl3.style.left.replace("px", "")) + 45 + "px";
                        }
                        if (parseInt(ctrl3.style.top.replace("px", "")) > 1 + parseInt(myctrl3.tsctrl3res).toString().replace("px", "") && parseInt(ctrl3.style.top.replace("px", "")) < 374) {
                            ctrl3.style.top = parseInt(ctrl3.style.top.replace("px", "")) + 45 + "px";
                        }
                    }
                    else if (playername == Session["friend3"]) {
                        ctrl3.style.left = playerleft;
                        ctrl3.style.top = playertop;
                    }
                    else if (playername != Session["friend4"]) {
                        if (parseInt(ctrl4.style.left.replace("px", "")) > 365 && parseInt(ctrl4.style.left.replace("px", "")) < 480) {
                            ctrl4.style.left = parseInt(ctrl4.style.left.replace("px", "")) + 45 + "px";
                        }
                        if (parseInt(ctrl4.style.top.replace("px", "")) > 1 + parseInt(myctrl4.tsctrl4res).toString().replace("px", "") && parseInt(ctrl4.style.top.replace("px", "")) < 374) {
                            ctrl4.style.top = parseInt(ctrl4.style.top.replace("px", "")) + 45 + "px";
                        }
                    }
                    else if (playername == Session["friend4"]) {
                        ctrl4.style.left = playerleft;
                        ctrl4.style.top = playertop;
                    }
                    else if (playername != Session["friend5"]) {
                        if (parseInt(ctrl5.style.left.replace("px", "")) > 1 && parseInt(ctrl5.style.left.replace("px", "")) < 480) {
                            ctrl5.style.left = parseInt(ctrl5.style.left.replace("px", "")) + 45 + "px";
                        }
                        if (parseInt(ctrl5.style.top.replace("px", "")) > 1 + parseInt(myctrl5.tsctrl5res).toString().replace("px", "") && parseInt(ctrl5.style.top.replace("px", "")) < 374) {
                            ctrl5.style.top = parseInt(ctrl5.style.top.replace("px", "")) + 45 + "px";
                        }
                    }
                    else if (playername == Session["friend5"]) {
                        ctrl5.style.left = playerleft;
                        ctrl5.style.top = playertop;
                    }
                    divplayer.focus();
                }


                fplayer.addEventListener("keydown", check, false);
                fplayer.addEventListener("mousedown", explodeprop, false);
                fplayer.addEventListener("mousemove", moveprop, false);

                ctrl1.addEventListener("mouseover", showfone, false);
                ctrl2.addEventListener("mouseover", showftwo, false);
                ctrl3.addEventListener("mouseover", showfthree, false);
                ctrl4.addEventListener("mouseover", showffour, false);
                ctrl5.addEventListener("mouseover", showffive, false);

                ctrl1.addEventListener("mouseout", hidefone, false);
                ctrl2.addEventListener("mouseout", hideftwo, false);
                ctrl3.addEventListener("mouseout", hidefthree, false);
                ctrl4.addEventListener("mouseout", hideffour, false);
                ctrl5.addEventListener("mouseout", hideffive, false);

                function showfone() {
                    document.getElementById('ctrl1').setAttribute("src", '<%=Session["friend1pic"]%>');
            }

                function showftwo() {
                    document.getElementById('ctrl2').setAttribute("src", '<%=Session["friend2pic"]%>');
            }

                function showfthree() {
                    document.getElementById('ctrl3').setAttribute("src", '<%=Session["friend3pic"]%>');
            }

                function showffour() {
                    document.getElementById('ctrl4').setAttribute("src", '<%=Session["friend4pic"]%>');
            }

                function showffive() {
                    document.getElementById('ctrl5').setAttribute("src", '<%=Session["friend5pic"]%>');
            }
                function hidefone() {
                    document.getElementById('ctrl1').setAttribute("src", '<%=ctrl1mainurl%>');
                }

                function hideftwo() {
                    document.getElementById('ctrl2').setAttribute("src", '<%=ctrl2mainurl%>');
                }

                function hidefthree() {
                    document.getElementById('ctrl3').setAttribute("src", '<%=ctrl3mainurl%>');
                }

                function hideffour() {
                    document.getElementById('ctrl4').setAttribute("src", '<%=ctrl4mainurl%>');
                }

                function hideffive() {
                    document.getElementById('ctrl5').setAttribute("src", '<%=ctrl5mainurl%>');
                }

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

                    else if (Math.round(e.clientX) > 1) {
                        crosshair.style.left = Math.round(e.clientX) - 1 + "px";

                    }

                    else if (Math.round(e.clientX) < 480) {
                        crosshair.style.left = 480 + "px";

                    }



                    else if (Math.round(e.clientY) > 1) {
                        crosshair.style.top = Math.round(e.clientY) - 1 + "px";

                    }

                    else if (Math.round(e.clientY) < 374) {
                        crosshair.style.top = 374 + "px";

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
    
<script>        (function (d, s, id) {
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
        <script>
            function buy() {
                var obj = {
                    method: 'pay',
                    action: 'purchaseitem',
                    product: 'https://treasurehunter.apphb.com/coin.html',
                    request_id: 'tspot'
                };

                FB.ui(obj, function (data) {
                    actiontrspot();
                });
            }

            document.getElementById('pay0').onclick = function () { buy() };

            function buyt() {
                var obj = {
                    method: 'pay',
                    action: 'purchaseitem',
                    product: 'https://treasurehunter.apphb.com/tool.html',
                    request_id: 'tool'
                };

                FB.ui(obj, function (data) {
                    actiontbox();
                });
            }

            document.getElementById('pay3').onclick = function () { buyt() };

            function buyl() {
                var obj = {
                    method: 'pay',
                    action: 'purchaseitem',
                    product: 'https://treasurehunter.apphb.com/life.html',
                    request_id: 'life'
                };

                FB.ui(obj, function (data) {
                    actionelifes();
                });
            }

            document.getElementById('pay').onclick = function () { buyl() };

            function buyp() {
                var obj = {
                    method: 'pay',
                    action: 'purchaseitem',
                    product: 'https://treasurehunter.apphb.com/professional.html',
                    request_id: 'prof'
                };

                FB.ui(obj, function (data) {
                    actionphelp();
                });
            }

            document.getElementById('pay2').onclick = function () { buyp() };


            function actioncollectcoins() {
                FB.api(
                      'me/treasure_huntermp:collect_coins',
                      'post',
                      {
                          goldcoins: "650947641648558"
                      },
                      function (response) {
                          // handle the response
                      }
                    );
            }
            function actionconqueor() {
                FB.api(
                      'me/treasure_huntermp:conquer',
                      'post',
                      {
                          achievements: "754479501268870"
                      },
                      function (response) {
                          // handle the response
                      }
                    );
            }
            function actionelifes() {
                FB.api(
                      'me/treasure_huntermp:unlimited_lifes',
                      'post',
                      {
                          lifes: "703581699708226"
                      },
                      function (response) {
                          // handle the response
                      }
                    );
            }
            function actionifriend() {
                FB.api(
  'me/treasure_huntermp:invite',
  'post',
  {
      friendsinvite: "885368018157995"
  },
  function (response) {
      // handle the response
  }
);
            }
            function actioningame() {
                FB.api(
                     'me/treasure_huntermp:in_game_now',
                     'post',
                     {
                         online: "656704607757078"
                     },
                     function (response) {
                         // handle the response
                     }
                   );
            }
            function actionphelp() {
                FB.api(
                      'me/treasure_huntermp:professiona_help',
                      'post',
                      {
                          product: "718706568186043"
                      },
                      function (response) {
                          // handle the response
                      }
                        );
            }
            function actionrewards() {
                FB.api(
                  'me/treasure_huntermp:reward',
                  'post',
                  {
                      prizes: "728217013908150"
                  },
                  function (response) {
                      // handle the response
                  }
                );
            }
            function actiontbox() {
                FB.api(
                          'me/treasure_huntermp:toolbox',
                          'post',
                          {
                              product: "924646287561106"
                          },
                          function (response) {
                              // handle the response
                          }
                        );
            }
            function actionthgame() {
                FB.api(
                      'me/treasure_huntermp:treasurehunter',
                      'post',
                      {
                          game: "513946295401730"
                      },
                      function (response) {
                          // handle the response
                      }
                    );
            }
            function actiontrspot() {
                FB.api(
                      'me/treasure_huntermp:treasurespot',
                      'post',
                      {
                          product: "758817104141842"
                      },
                      function (response) {
                          // handle the response
                      }
                    );
            }

     </script>
    <script>
        function FacebookInviteFriends() {
            FB.ui({
                method: 'apprequests',
                message: 'You are Invited to Play Treasure Hunter 3D MultiPlayer Game with me'
            });
        }
</script>
    <script type="text/javascript">
        function hidediv() {
            document.getElementById('showspot').style.visibility = "hidden";
            document.getElementById('showpromo').style.visibility = "hidden";
            document.getElementById('showlife').style.visibility = "hidden";
            document.getElementById('showprof').style.visibility = "hidden";
            document.getElementById('showtweet').style.visibility = "hidden";
            document.getElementById('showtools').style.visibility = "hidden";
            document.getElementById('showfriends').style.visibility = "hidden";


            document.getElementById('Button1').click();


        }
    </script>
    <script type="text/javascript">
        // On load, the user hasn't clicked on the payer_promotion unit
        var has_clicked = false;
        var dialog_window;

        function payer_promotion() {
            if (!has_clicked) {
                // If first click, open payer_promotion dialog
                var obj = {
                    method: 'fbpromotion',
                    display: 'popup',
                    quantity: 1,
                    product: 'https://treasurehunter.apphb.com/coin.html'
                };

                FB.ui(obj, function () {
                    // call back to your server to see if user's balance changed
                });

                // Mark unit as clicked by user
                has_clicked = true;
            } else {
                // For subsequent clicks, alert user
                alert("Payer Promotion already clicked!");
            }
        }
        </script>        
     <form id="form1" runat="server">
<div style="width: 438px; height: 300px; z-index: 1000; left: 385px; top: 168px;     visibility:hidden; position: absolute; background-color: #669999;" id="showprof">
            <img alt="" src="Images/goldcoin.gif" style="z-index: 1101; left: 43px; top: 27px; position: absolute; height: 40px;" /><asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="15pt" ForeColor="White" style="z-index: 1001; left: 94px; top: 24px; position: absolute; width: 329px;" Text="Professional Help to Complete Your TreasureSpot or Game Tools"></asp:Label>
            <asp:Label ID="Label5" runat="server" style="z-index: 1; left: 30px; top: 86px; position: absolute; vertical-align: middle; text-align:center; width: 394px; margin-top: 0px; bottom: 176px;" Text="A Professional will complete your TreasureSpot or Game Tools on behalf of you" ForeColor="White"></asp:Label>
        <asp:Label ID="Label6" runat="server" style="z-index: 1; left: 18px; top: 162px; position: absolute; vertical-align: middle; text-align:center; width: 72px; margin-top: 0px;" Text="Price   $1" ForeColor="White" Font-Bold="True"></asp:Label>
        <button id="pay" style="border-radius:10px; text-align:center; vertical-align:middle; border: medium outset #FFFF00; position:absolute; width: 79px; height: 26px; background-color: #FF00FF; color: #FFFFFF;">Buy Now</button>
        <button id="Button4" style="border-radius:10px; text-align:center; vertical-align:middle; border: medium outset #FFFF00; position:absolute; width: 96px; height: 26px; background-color: #FF00FF; color: #FFFFFF; top: 234px; left: 300px;">Back to Game</button>
</div>
        <div style="width: 438px; height: 300px; z-index: 1000; left: 385px; top: 168px;     visibility:hidden; position: absolute; background-color: #9900FF" id="showspot">
            <img alt="" src="Images/coin.png" style="z-index: 1001; left: 43px; top: 27px; position: absolute" /><asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="15pt" ForeColor="White" style="z-index: 1001; left: 128px; top: 36px; position: absolute" Text="Buy a Treasure Spot"></asp:Label>
            <asp:Label ID="Label8" runat="server" style="z-index: 1; left: 30px; top: 86px; position: absolute; vertical-align: middle; text-align:center; width: 394px; margin-top: 0px; bottom: 176px;" Text="You Have Played Now in a TreasureSpot. Create your own TreasureSpot to Earn More Rewards. " ForeColor="White"></asp:Label>
        <asp:Label ID="Label9" runat="server" style="z-index: 1; left: 18px; top: 162px; position: absolute; vertical-align: middle; text-align:center; width: 72px; margin-top: 0px;" Text="Price   $2" ForeColor="White" Font-Bold="True"></asp:Label>
        <button id="pay0" style="border-radius:10px; text-align:center; vertical-align:middle; border: medium outset #FFFF00; position:absolute; width: 79px; height: 26px; background-color: #FF00FF; color: #FFFFFF;">Buy Now</button>
        <button id="Button5" style="border-radius:10px; text-align:center; vertical-align:middle; border: medium outset #FFFF00; position:absolute; width: 96px; height: 26px; background-color: #FF00FF; color: #FFFFFF; top: 234px; left: 300px;" onclick="hidediv();">Back to Game</button>
        </div>
        <div style="width: 438px; height: 300px; z-index: 1000; left: 385px; top: 168px;     visibility:hidden; position: absolute; background-color: #666633" id="showpromo">
            <img alt="" src="Images/lwinner.jpg" style="z-index: 1101; left: 5px; top: 17px; position: absolute; height: 59px; width: 87px;" /><asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="15pt" ForeColor="White" style="z-index: 1001; left: 102px; top: 28px; position: absolute; width: 327px;" Text="Wow you just won a TreasureSpot at a Concessional Price"></asp:Label>
            <asp:Label ID="Label11" runat="server" style="z-index: 1; left: 42px; top: 122px; position: absolute; vertical-align: middle; text-align:center; width: 382px; margin-top: 0px; bottom: 140px;" Text="You were the randomly selected winner of a TreasureSpot" ForeColor="White"></asp:Label>
        <button onclick="payer_promotion();" style="z-index: 1; left: 143px; top: 192px; position: absolute; background-color: #0000CC; color: #FFFF00; width: 180px;">Concessional TreasureSpots</button>
         <button id="Button6" style="border-radius:10px; text-align:center; vertical-align:middle; border: medium outset #FFFF00; position:absolute; width: 96px; height: 26px; background-color: #FF00FF; color: #FFFFFF; top: 233px; left: 179px;">Back to Game</button>
        </div>
        <div style="width: 438px; height: 300px; z-index: 1000; left: 385px; top: 168px;     visibility:hidden; position: absolute; background-color: #FF6666" id="showlife">
            <img alt="" src="Images/health.gif" style="z-index: 1101; left: 12px; top: 14px; position: absolute; height: 40px;" /><asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="15pt" ForeColor="White" style="z-index: 1001; left: 76px; top: 32px; position: absolute; width: 349px;" Text="Additional Lifes During Your Game Play"></asp:Label>
            <asp:Label ID="Label13" runat="server" style="z-index: 1; left: 30px; top: 86px; position: absolute; vertical-align: middle; text-align:center; width: 394px; margin-top: 0px; bottom: 176px;" Text="Get 20 More Lifes During Game Playing" ForeColor="White"></asp:Label>
        <asp:Label ID="Label14" runat="server" style="z-index: 1; left: 18px; top: 162px; position: absolute; vertical-align: middle; text-align:center; width: 72px; margin-top: 0px;" Text="Price   $1" ForeColor="White" Font-Bold="True"></asp:Label>
        <button id="pay2" style="border-radius:10px; text-align:center; vertical-align:middle; border: medium outset #FFFF00; position:absolute; width: 79px; height: 26px; background-color: #FF00FF; color: #FFFFFF;">Buy Now</button>
        <button id="Button7" style="border-radius:10px; text-align:center; vertical-align:middle; border: medium outset #FFFF00; position:absolute; width: 96px; height: 26px; background-color: #FF00FF; color: #FFFFFF; top: 234px; left: 300px;" onclick="actionthgame();">Back to Game</button>
        </div>
        <div style="width: 438px; height: 300px; z-index: 1000; left: 385px; top: 168px;    visibility:hidden; position: absolute; background-color: #FF5050" id="showtweet">
            <img alt="" src="Images/landscape.jpg" style="z-index: 1101; left: 43px; top: 27px; position: absolute; height: 40px; right: 355px;" /><asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Size="15pt" ForeColor="White" style="z-index: 1001; left: 163px; top: 36px; position: absolute" Text="Tweet on Twitter"></asp:Label>
            <asp:Label ID="Label16" runat="server" style="z-index: 1; left: 30px; top: 86px; position: absolute; vertical-align: middle; text-align:center; width: 394px; margin-top: 0px; bottom: 176px;" Text="To Make TreasureHunting more interesting tweet on Twitter and Expres Yourself" ForeColor="White"></asp:Label>
              <button id="Button8" style="border-radius:10px; text-align:center; vertical-align:middle; border: medium outset #FFFF00; position:absolute; width: 96px; height: 26px; background-color: #FF00FF; color: #FFFFFF; top: 253px; left: 300px;" onclick="actionrewards();">Back to Game</button>
        <a href="https://twitter.com/share" class="twitter-share-button" data-lang="en" style="text-decoration:none; position: absolute; top: 260px; left: 185px; width: 44px;">Tweet</a>    
        </div>
        <div style="width: 438px; height: 300px; z-index: 1000; left: 385px; top: 168px;   visibility:hidden; position: absolute; background-color: #3333FF" id="showtools">
            <img alt="" src="Images/goldcoin.gif" style="z-index: 1101; left: 43px; top: 27px; position: absolute; height: 40px;" /><asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Size="15pt" ForeColor="White" style="z-index: 1001; left: 128px; top: 36px; position: absolute" Text="Buy a Game Tools Item"></asp:Label>
            <asp:Label ID="Label18" runat="server" style="z-index: 1; left: 30px; top: 86px; position: absolute; vertical-align: middle; text-align:center; width: 394px; margin-top: 0px; bottom: 176px;" Text="Add your own choice of Game Items to your TreasureSpot." ForeColor="White"></asp:Label>
        <asp:Label ID="Label19" runat="server" style="z-index: 1; left: 18px; top: 162px; position: absolute; vertical-align: middle; text-align:center; width: 72px; margin-top: 0px;" Text="Price   $1" ForeColor="White" Font-Bold="True"></asp:Label>
        <button id="pay3" style="border-radius:10px; text-align:center; vertical-align:middle; border: medium outset #FFFF00; position:absolute; width: 79px; height: 26px; background-color: #FF00FF; color: #FFFFFF;">Buy Now</button>
        <button id="Button9" style="border-radius:10px; text-align:center; vertical-align:middle; border: medium outset #FFFF00; position:absolute; width: 96px; height: 26px; background-color: #FF00FF; color: #FFFFFF; top: 234px; left: 300px;">Back to Game</button>
        </div>
        <div style="width: 438px; height: 300px; z-index: 1000; left: 385px; top: 168px;  visibility:hidden; position: absolute; background-color: #FF5050" id="showfriends">
            <img alt="" src="Images/landscape.jpg" style="z-index: 1101; left: 43px; top: 27px; position: absolute; height: 40px; right: 355px;" /><asp:Label ID="Label20" runat="server" Font-Bold="True" Font-Size="15pt" ForeColor="White" style="z-index: 1001; left: 163px; top: 36px; position: absolute" Text="Invite Friends"></asp:Label>
            <asp:Label ID="Label21" runat="server" style="z-index: 1; left: 30px; top: 86px; position: absolute; vertical-align: middle; text-align:center; width: 394px; margin-top: 0px; bottom: 176px;" Text="To Make TreasureHunting more interesting invite your Friends and Like the Game" ForeColor="White"></asp:Label>
              <button id="Button10" style="border-radius:10px; text-align:center; vertical-align:middle; border: medium outset #FFFF00; position:absolute; width: 96px; height: 26px; background-color: #FF00FF; color: #FFFFFF; top: 253px; left: 300px;" onclick="ifriends();">Back to Game</button>
            <a href="#" onclick="FacebookInviteFriends();" style="position: absolute; left: 37%; top: 87%; width: 27%; height: 7%; text-decoration: none; color: #FFFFFF; background-color: #FF9900; border-radius: 20px; text-align: center; right: 159px; z-index: 310;">Invite Friends</a>
            <div class="fb-like" data-href="https://www.facebook.com/TreasureHuntergame" data-width="100" data-layout="button" data-action="like" data-show-faces="true" data-share="true" style="z-index: 351; position: absolute; width: 128px; height: 24px; top: 159px; right: 275px; bottom: 117px; left: 35px"></div>
        </div>          
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT uname FROM appuserdetails WHERE (uname = '<%=Hiddenfield1%>')"></asp:SqlDataSource>

        <asp:Button ID="Button1" runat="server" ClientIDMode="Static" PostBackUrl="~/Play/play" Style="z-index: 1; left: 754px; top: 8px; position: absolute; display: none" Text="Button" CausesValidation="False" />



        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#9999FF" Style="z-index: 1; left: 337px; top: 12px; position: absolute; width: 181px; height: 18px" Text="Label" meta:resourcekey="Label1Resource1"></asp:Label>
        <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Size="Small" ForeColor="#9999FF" Style="z-index: 1; left: 376px; top: 74px; position: absolute; width: 348px; height: 19px" Text="Use Mouse or arrow keys for movement, click or 's' for functions" meta:resourcekey="Label2Resource1"></asp:Label>

        <asp:HyperLink ID="Hyperlink2" runat="server" Font-Underline="False" NavigateUrl="https://treasurehunter.apphb.com/Buymobile/tspot1" Style="z-index: 1; border-radius:15px; background-color: #0000FF; top: 80px; position: absolute; right: 760px; width: 38px" Target="_self" ForeColor="#FFCC00" meta:resourcekey="Hyperlink2Resource1" ViewStateMode="Enabled" Font-Size="Medium">Buy</asp:HyperLink>



        <asp:TextBox ID="ehits" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" Style="z-index: 1; left: 131px; top: 54px; position: absolute; width: 45px; right: 692px;" ForeColor="#FFCC00" meta:resourcekey="ehitsResource1" ViewStateMode="Enabled" Font-Size="Small"></asp:TextBox>
        <asp:TextBox ID="lives" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" Style="z-index: 1; left: 440px; top: 52px; position: absolute; width: 18px; height: 18px;" ForeColor="#FFCC00" meta:resourcekey="livesResource1" ViewStateMode="Enabled" Font-Size="Small">10</asp:TextBox>
        <asp:TextBox ID="points" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 792px; top: 52px; position: absolute; width: 53px" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false" Font-Size="Small"></asp:TextBox>
        <asp:TextBox ID="treasure" runat="server" AutoPostBack="False" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" Style="z-index: 1; left: 764px; top: 17px; position: absolute; width: 45px; height: 14px;" ForeColor="#FFCC00" meta:resourcekey="treasureResource1" ViewStateMode="Enabled" Font-Size="Medium"></asp:TextBox>
        <asp:Label ID="Label3" runat="server" ForeColor="#FFCC00" Style="z-index: 1; left: 545px; top: 297px; position: absolute" Text="Loading ......." ClientIDMode="Static"></asp:Label>
         <asp:TextBox ID="TextBox7" runat="server" BackColor="#FFFF99" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" Style="z-index: 700; left: 4px; top: 243px; position: absolute; width: 843px; right: 33px; height: 70px; vertical-align: middle;" ForeColor="#0000CC" meta:resourcekey="livesResource1" ViewStateMode="Enabled" Font-Bold="True" Font-Names="Tahoma" Font-Size="13pt"></asp:TextBox>
        <audio id="sound1" src='<%=ctrl1mainsound%>' autoplay="autoplay">
        </audio>
         <a href="https://twitter.com/share" class="twitter-share-button" data-lang="en" style="text-decoration: none; position: absolute; top: 11px; left: 12px">Tweet</a>
         
        <label style="position: absolute; top: 56px; left: 23px; height: 19px; color: #FFCC00; font-size: small; width: 83px;">Achievements</label>

        <label style="position: absolute; top: 51px; left: 375px; height: 19px; right: 453px; color: #FFCC00; font-size: medium; width: 44px; bottom: 496px;">Lives</label>

        <label style="position: absolute; top: 49px; left: 707px; height: 19px; color: #FFCC00; height: 20px; position: absolute; font-size: small;">Gold Coins</label>

        <label style="position: absolute; top: 16px; left: 661px; height: 16px; color: #FFCC00; font-size: medium; width: 88px;">Treasure($)</label>
        <label style="position: absolute; top: 238px; left: 13px; height: 19px; color: #FFCC00; width: 88px; font-size: x-small;">Achievements</label>
        <div id="divplayer" style="z-index: 203; background-color: transparent; overflow: hidden; width: 486px; height: 381px; position: absolute; top: 127px; left: 362px; right: 24px; bottom: 58px; display: inline;">
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
        <input id="friendname" style="visibility: visible; text-decoration: none; height: 18px; background-color: transparent; color: #FFCC00; z-index: 1; left: 18px; top: 314px; position: absolute; width: 91px; cursor: none; font-size: x-small;" type="text" readonly="true" />
        <img alt="" src="https://treasurehunter.apphb.com/Images/landscape.jpg" style="width: 33px; height: 28px; visibility: visible; z-index: 1; left: 19px; top: 270px; position: absolute; bottom: 268px;" id="friendimage" />
        <img alt="" src='<%=iframeurl%>' style="z-index: 0; left: 365px; top: 130px; position: absolute; background-color: transparent; width: 480px; height: 374px;" class="twoto3d" id="fplayer" />
        <label style="position: absolute; top: 356px; left: 14px; height: 19px; color: #FFFFFF; font-size: small;">Talk to Players</label>
        <input id="Button2" style="background-color: #6699FF; color: #FFFFFF; z-index: 1; left: 302px; top: 383px; position: absolute; font-size: x-small;" type="button" value="Send" onclick="send2server();" />
        <div style="position: absolute; z-index: 210; width: 321px; height: 136px; top: 411px; bottom: 19px; left: 15px; overflow: hidden; cursor: crosshair;">
            <textarea id="Text2" class="TextArea1" style="border-style: none; border-color: #000000; position: absolute; left: 0px; top: 0px; background-color: Transparent; color: #FFCC00; width: 349px; height: 138px; font-size: medium; overflow: visible;" readonly="readonly"></textarea>
        </div>
        <input id="Text1" type="text" style="position: absolute; left: 15px; top: 384px; width: 228px; height: 9px; font-size: medium;" onkeydown="checkEnter(event);" />
        <iframe id="myframe" src="https://treasurehunter.apphb.com/updatecoins.aspx"  style="border-style: none; position: absolute; top: 245px; left: 200px; height: 27px; width: 73px;"></iframe>
            <asp:TextBox ID="attacked" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 378px; top: 97px; position: absolute; width: 335px" ForeColor="White" ReadOnly="true" Font-Size="Medium"></asp:TextBox>
        <asp:TextBox ID="TextBox1" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 19px; top: 188px; position: absolute; width: 83px; right: 766px;" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false" Font-Size="X-Small">Time Remaining</asp:TextBox>
        <asp:TextBox ID="TextBox2" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 120px; top: 189px; position: absolute; width: 33px" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false" Font-Size="Medium">120</asp:TextBox>
        <asp:TextBox ID="TextBox3" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 20px; top: 118px; position: absolute; width: 44px; right: 804px; bottom: 433px;" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false" Font-Size="Small">Collect</asp:TextBox>
        <asp:TextBox ID="TextBox4" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 88px; top: 121px; position: absolute; width: 47px; height: 9px; right: 733px;" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false" Font-Size="Small"></asp:TextBox>
        <asp:TextBox ID="TextBox5" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 16px; top: 153px; position: absolute; width: 78px; right: 774px;" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false" Font-Size="Small">Conquer Players</asp:TextBox>
        <asp:TextBox ID="TextBox6" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 133px; top: 154px; position: absolute; width: 47px" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false" Font-Size="Small"></asp:TextBox>
        <img id="Img7" src="https://treasurehunter.apphb.com/Images/goldcoin.gif" style="border: thin solid Transparent; width: 15px; height: 15px; position: absolute; top: 119px; left: 176px; z-index: 21; visibility: visible; right: 677px; bottom: 428px;"/>
        
        <img id="Img8" src='<%=ctrl1mainurl%>' style="border: thin solid Transparent; width: 15px; height: 15px; position: absolute; top: 148px; left: 220px; z-index: 21; visibility: visible; right: 633px; bottom: 399px;"/>
         <div id="aimg" style="position: absolute; left: 121px; top: 123px; width: 236px; height: 200px;">
             <img alt="" src="https://treasurehunter.apphb.com/Images/achievements.gif" style="width: 232px; height: 199px; visibility: visible; z-index: 300; left: 0px; top: 0px; position: absolute; bottom: 1px; background-color: Transparent;" id="Img6" />
             <img id="Image1" style="z-index: 300; left: 82px; top: 101px; position: absolute; width: 36px; height: 39px;" src='<%=one1%>' />
             <img id="Image2" style="z-index: 300; left: 112px; top: 60px; position: absolute; width: 32px; height: 30px;" src='<%=one2%>' />
             <img id="Image3" style="z-index: 300; left: 159px; top: 30px; position: absolute; width: 34px; height: 32px;" src='<%=one3%>' />
             <img id="Image4" style="z-index: 300; left: 35px; top: 149px; position: absolute; width: 39px; height: 35px;" src='<%=one4%>' />
             <img id="Image5" style="z-index: 300; left: 203px; top: 10px; position: absolute; width: 26px; height: 33px;" src='<%=one5%>' />

             <img id="Image6" style="z-index: 301; left: 82px; top: 155px; position: absolute; width: 18px; height: 18px;" src="https://treasurehunter.apphb.com/Images/tick.png" />
             <img id="Image7" style="z-index: 301; left: 124px; top: 103px; position: absolute; width: 16px; height: 17px;" src="https://treasurehunter.apphb.com/Images/tick.png" />
             <img id="Image8" style="z-index: 301; left: 151px; top: 73px; position: absolute; width: 16px; height: 10px;" src="https://treasurehunter.apphb.com/Images/tick.png" />
             <img id="Image9" style="z-index: 301; left: 200px; top: 47px; position: absolute; width: 10px; height: 12px;" src="https://treasurehunter.apphb.com/Images/tick.png" />
             <img id="Image10" style="z-index: 301; left: 181px; top: 4px; position: absolute; width: 11px; height: 17px;" src="https://treasurehunter.apphb.com/Images/tick.png" />

         </div>
    </form>

   
</body>
</html>
