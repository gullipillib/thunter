﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<treasurehunter.Models.MyAppUser>" Culture="auto" AutoEventWireup="true" meta:resourcekey="PageResource1" UICulture="auto" EnableSessionState="True" Debug="true" %>

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
    string goldcoins = "";
    string Hiddenfield1;

    protected void checkusername()
    {
        Hiddenfield1 = Model.Name;
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
                AccessDataSource1.InsertCommand = "INSERT INTO loggedusers(luname, luid, luposition, luimg, luspriteimg, lucrisboos, luloggedin, lutspots, lulogintimes, luinvites) VALUES ('" + Hiddenfield1 + "', '" + Model.Id + "', '{left : 0, top:0}', '" + Model.ProfilePicture.Data.Url + "', '" + Model.ProfilePicture.Data.Url + "', '100', 'yes', '0', '0', '0')";
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
    string tsname = "";
    string tsitems = "";
    string tsrplayers = "";
    string tsdplayers = "";
    string tsrplayersdetails = "";
    string tsdplayersdetails = "";
    //Playersdetails[] tspotsplayers;
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
    string ctrl1mainname;
    string ctrl2mainurl;
    string ctrl2mainres;
    string ctrl2mainname;
    string ctrl3mainurl;
    string ctrl3mainres;
    string ctrl3mainname;
    string ctrl4mainurl;
    string ctrl4mainres;
    string ctrl4mainname;
    string ctrl5mainurl;
    string ctrl5mainres;
    string ctrl5mainname;
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
            tsname = dt.Rows[t1].Field<string>("tsname"); //usethis to get field value
            tsitems = dt.Rows[t1].Field<string>("tsitems"); //usethis to get field value
            tsrplayers = dt.Rows[t1].Field<string>("tsrplayers"); //usethis to get field value
            tsdplayers = dt.Rows[t1].Field<string>("tsrplayers"); //usethis to get field value
            tsrplayersdetails = dt.Rows[t1].Field<string>("tsrplayersdetails"); //usethis to get field value
            tsdplayersdetails = dt.Rows[t1].Field<string>("tsdplayersdetails"); //usethis to get field value
        }
        //string tsitemsfulld = tsitems.Replace("\"", "");
        //tsitemsfulld = tsitemsfulld.Replace('\\', '"');
        //ts1itemsfulldetails = tsitemsfulld;




        tsitemsfulldetails = Json.Decode(tsitems);
        tsitems1 = tsitems;
        //tsitemsfulldetails = Json.Decode(tsitemsfulldetails);
        iframeurl = tsitemsfulldetails.tsUrl;
        ctrl1mainres = tsitemsfulldetails.tsctrl1res;
        ctrl1mainname = tsitemsfulldetails.tsctrl1name;
        ctrl2mainres = tsitemsfulldetails.tsctrl2res;
        ctrl2mainname = tsitemsfulldetails.tsctrl2name;
        ctrl3mainres = tsitemsfulldetails.tsctrl3res;
        ctrl3mainname = tsitemsfulldetails.tsctrl3name;
        ctrl4mainres = tsitemsfulldetails.tsctrl4res;
        ctrl4mainname = tsitemsfulldetails.tsctrl4name;
        ctrl5mainres = tsitemsfulldetails.tsctrl5res;
        ctrl5mainname = tsitemsfulldetails.tsctrl5name;

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
        ctrl1mainsound = tb1itemsfulldetails.tbMainSound;

        //tb1full = tb1full.Replace("\"", "");
        //tb1fulldetails = tb1full.Replace('\\', '"');


        AccessDataSource1.SelectCommand = "SELECT tbname, tbdetails FROM toolbox where tbname = '" + tsitemsfulldetails.tsctrl2name + "'";
        dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        tb2fulldetails = dt.Rows[0].Field<string>("tbdetails");
        tb2itemsfulldetails = Newtonsoft.Json.JsonConvert.DeserializeObject(tb2fulldetails);
        tbitems2 = tb2fulldetails;
        //tb2itemsfulldetails = Json.Decode(tb2itemsfulldetails);
        ctrl2mainurl = tb2itemsfulldetails.tbMain;

        //tb1full = tb1full.Replace('\\', '"');
        //tb2fulldetails = tb1full.Replace(" ", "");


        AccessDataSource1.SelectCommand = "SELECT tbname, tbdetails FROM toolbox where tbname = '" + tsitemsfulldetails.tsctrl3name + "'";
        dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        tb3fulldetails = dt.Rows[0].Field<string>("tbdetails");

        tb3itemsfulldetails = Newtonsoft.Json.JsonConvert.DeserializeObject(tb3fulldetails);
        tbitems3 = tb3fulldetails;
        ctrl3mainurl = tb3itemsfulldetails.tbMain;

        //tb1full = tb1full.Replace('\\', '"');
        //tb3fulldetails = tb1full.Replace(" ", "");


        AccessDataSource1.SelectCommand = "SELECT tbname, tbdetails FROM toolbox where tbname = '" + tsitemsfulldetails.tsctrl4name + "'";
        dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        tb4fulldetails = dt.Rows[0].Field<string>("tbdetails");
        tb4itemsfulldetails = Newtonsoft.Json.JsonConvert.DeserializeObject(tb4fulldetails);

        ctrl4mainurl = tb4itemsfulldetails.tbMain;
        tbitems4 = tb4fulldetails;
        //tb1full = tb1full.Replace('\\', '"');
        //tb4fulldetails = tb1full.Replace(" ", "");


        AccessDataSource1.SelectCommand = "SELECT tbname, tbdetails FROM toolbox where tbname = '" + tsitemsfulldetails.tsctrl5name + "'";
        dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        tb5fulldetails = dt.Rows[0].Field<string>("tbdetails");

        tb5itemsfulldetails = Newtonsoft.Json.JsonConvert.DeserializeObject(tb5fulldetails);
        //tb5itemsfulldetails = Json.Decode(tb5itemsfulldetails);
        ctrl5mainurl = tb5itemsfulldetails.tbMain;
        tbitems5 = tb5fulldetails;
        //tb1full = tb1full.Replace('\\', '"');
        //tb5fulldetails = tb1full.Replace(" ", "");

        // done till here     
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
        AccessDataSource1.SelectCommand = "SELECT treasurevalue FROM treasureprize";
        DataView dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
        DataTable dt = new DataTable();
        dt = dv.ToTable();
        treasure.Text = dt.Rows[0].Field<string>("treasurevalue");
        AccessDataSource1.SelectCommand = "SELECT lucrisboos FROM loggedusers where luname='" + Hiddenfield1 + "'";
        dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        goldcoins = dt.Rows[0].Field<string>("lucrisboos");
    }

    Facebook.FacebookClient client = new Facebook.FacebookClient();
    Dictionary<string, object> postparameters = new Dictionary<string, object>();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            checkusername();
            AccessDataSource1.UpdateCommand = "UPDATE loggedusers SET luloggedin='yes' where luname='" + Hiddenfield1 + "'";
            AccessDataSource1.Update();
            gettreasurespot();
            addfriends();
            gettreasureprize();
        }
        

        //var client = new Facebook.FacebookClient();
        //dynamic result = client.Get("oauth/access_token", new
        //{
        //client_id = ConfigurationManager.AppSettings["FacebookAppId"].ToString(),
        //client_secret = ConfigurationManager.AppSettings["FacebookAppSecret"].ToString(),
        //redirect_uri = ConfigurationManager.AppSettings["FacebookRedirectUrl"].ToString(),

        //});
        //var token = result.access_token as string;
        //Session["Facebooktoken"] = token;
        //if (string.IsNullOrEmpty(token))
        //{
        //client = new Facebook.FacebookClient();
        //}
        //else
        //{
        //client = new Facebook.FacebookClient(token);
        //}  
        //postparameters["message"] = "Collected Gold Coins";
        //postparameters["name"] = "Collected Gold Coins";
        //postparameters["description"] = "Playing TreasureHunter Collected Gold Coins";



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

    protected void Button1_Click(object sender, EventArgs e)
    {
        Hyperlink1.Enabled = true;
        Hyperlink2.Enabled = true;
        Hyperlink3.Enabled = true;
        Hyperlink4.Enabled = true;
    }

    


    protected void HiddenField1_ValueChanged(object sender, EventArgs e)
    {
        AccessDataSource1.SelectCommand = "SELECT * FROM loggedusers";
        AccessDataSource1.UpdateCommand = "UPDATE loggedusers SET luloggedin='yes', lucrisboos='" + points.Text + "' where luname='" + Hiddenfield1 + "'";
        AccessDataSource1.Update();
        HiddenField1.Value = "";
    }
</script>


<html>
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width" />
    <title></title>
</head>


<body style="height: 507px; background-color: #000000; width: 967px; overflow: hidden;" onmouseover="moveprop(event)" onmousedown="explodeprop(event)" onkeydown="check(e)">
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

            var myaddctrl1 = window.setInterval(function () { getTspot() }, 120000);
            function getTspot() {
                 
                
                
                document.getElementById('HiddenField1').setAttribute("value", "yes");
                

                
                    ctrl1.src = '<%=ctrl1mainurl%>';
                    ctrl2.src = '<%=ctrl1mainurl%>';
                    ctrl3.src = '<%=ctrl1mainurl%>';
                    ctrl4.src = '<%=ctrl1mainurl%>';
                    ctrl5.src = '<%=ctrl1mainurl%>';
                    Img1.src = '<%=ctrl1mainurl%>';
                    Img2.src = '<%=ctrl2mainurl%>';
                    Img3.src = '<%=ctrl3mainurl%>';
                    Img4.src = '<%=ctrl4mainurl%>';
                    Img5.src = '<%=ctrl5mainurl%>';
                    fplayer.src = '<%=iframeurl%>';
                    explosion.src = '<%=collisionurl%>';
                crosshair.src = '<%=propurl%>';
                document.getElementById('Button1').click();
               
            }





            var myaddctrl1 = window.setInterval(function () { randomCtrlhide() }, 5000);
            function randomCtrlhide() {



                ctrl1.style.visibility = "hidden";
                ctrl2.style.visibility = "hidden";
                ctrl3.style.visibility = "hidden";
                ctrl4.style.visibility = "hidden";
                ctrl5.style.visibility = "hidden";
                Img1.style.visibility = "hidden";
                Img2.style.visibility = "hidden";
                Img3.style.visibility = "hidden";
                Img4.style.visibility = "hidden";
                Img5.style.visibility = "hidden";

            }

            var myaddctrl1 = window.setInterval(function () { randomCtrl1() }, 10000);
            function randomCtrl1() {


                var temp = '<%=ctrl1mainres%>';
                temp = temp.replace("px", "");
                temp = parseInt(temp, 10);
                var randno1 = Math.floor(Math.random() * 5 - 1 + 1) + 1;
                var randno2 = Math.floor(Math.random() * 6 - 10 + 1) + 6;
                var randno3 = Math.floor(Math.random() * 10 - 1 + 1) + 1;

                if (randno1 == 1 || randno2 == 1 || randno3 == 1) {
                    ctrl1.style.visibility = "visible";
                    ctrl1.style.left = Math.floor(Math.random() * 845 - 365 + 1) + 365 + "px";
                    ctrl1.style.top = Math.floor(Math.random() * (372 - parseInt(temp, 10)) + 1) + parseInt(temp, 10) + "px";
                }
                if (randno1 == 2 || randno2 == 2 || randno3 == 2) {
                    ctrl2.style.visibility = "visible";
                    ctrl2.style.left = Math.floor(Math.random() * 845 - 365 + 1) + 365 + "px";
                    ctrl2.style.top = Math.floor(Math.random() * (372 - parseInt(temp, 10)) + 1) + parseInt(temp, 10) + "px";
                }
                if (randno1 == 3 || randno2 == 3 || randno3 == 3) {
                    ctrl3.style.visibility = "visible";
                    ctrl3.style.left = Math.floor(Math.random() * 845 - 365 + 1) + 365 + "px";
                    ctrl3.style.top = Math.floor(Math.random() * (372 - parseInt(temp, 10)) + 1) + parseInt(temp, 10) + "px";
                }
                if (randno1 == 4 || randno2 == 4 || randno3 == 4) {
                    ctrl4.style.visibility = "visible";
                    ctrl4.style.left = Math.floor(Math.random() * 845 - 365 + 1) + 365 + "px";
                    ctrl4.style.top = Math.floor(Math.random() * (372 - parseInt(temp, 10)) + 1) + parseInt(temp, 10) + "px";
                }
                if (randno1 == 5 || randno2 == 5 || randno3 == 5) {
                    ctrl5.style.visibility = "visible";
                    ctrl5.style.left = Math.floor(Math.random() * 845 - 365 + 1) + 365 + "px";
                    ctrl5.style.top = Math.floor(Math.random() * (372 - parseInt(temp, 10)) + 1) + parseInt(temp, 10) + "px";
                }
                if (randno1 == 6 || randno2 == 6 || randno3 == 6) {
                    Img1.style.visibility = "visible";
                    if ('<%=ctrl1mainname%>' == "goldcoins" || '<%=ctrl1mainname%>' == "health") {
                        Img1.style.width = "20px";
                        Img1.style.height = "20px";
                    }
                    Img1.style.left = Math.floor(Math.random() * 845 - 365 + 1) + 365 + "px";
                    Img1.style.top = Math.floor(Math.random() * (372 - parseInt(temp, 10)) + 1) + parseInt(temp, 10) + "px";
                }
                if (randno1 == 7 || randno2 == 7 || randno3 == 7) {
                    Img2.style.visibility = "visible";
                    if ('<%=ctrl2mainname%>' == "goldcoins" || '<%=ctrl2mainname%>' == "health") {
                        Img2.style.width = "20px";
                        Img2.style.height = "20px";
                    }
                    Img2.style.left = Math.floor(Math.random() * 845 - 365 + 1) + 365 + "px";
                    Img2.style.top = Math.floor(Math.random() * (372 - parseInt(temp, 10)) + 1) + parseInt(temp, 10) + "px";
                }
                if (randno1 == 8 || randno2 == 8 || randno3 == 8) {
                    Img3.style.visibility = "visible";
                    if ('<%=ctrl3mainname%>' == "goldcoins" || '<%=ctrl3mainname%>' == "health") {
                        Img3.style.width = "20px";
                        Img3.style.height = "20px";
                    }
                    Img3.style.left = Math.floor(Math.random() * 845 - 365 + 1) + 365 + "px";
                    Img3.style.top = Math.floor(Math.random() * (372 - parseInt(temp, 10)) + 1) + parseInt(temp, 10) + "px";
                }
                if (randno1 == 9 || randno2 == 9 || randno3 == 9) {
                    Img4.style.visibility = "visible";
                    if ('<%=ctrl4mainname%>' == "goldcoins" || '<%=ctrl4mainname%>' == "health") {
                        Img4.style.width = "20px";
                        Img4.style.height = "20px";
                    }
                    Img4.style.left = Math.floor(Math.random() * 845 - 365 + 1) + 365 + "px";
                    Img4.style.top = Math.floor(Math.random() * (372 - parseInt(temp, 10)) + 1) + parseInt(temp, 10) + "px";
                }
                if (randno1 == 10 || randno2 == 10 || randno3 == 10) {
                    Img5.style.visibility = "visible";
                    if ('<%=ctrl5mainname%>' == "goldcoins" || '<%=ctrl5mainname%>' == "health") {
                        Img5.style.width = "20px";
                        Img5.style.height = "20px";
                    }
                    Img5.style.left = Math.floor(Math.random() * 845 - 365 + 1) + 365 + "px";
                    Img5.style.top = Math.floor(Math.random() * (372 - parseInt(temp, 10)) + 1) + parseInt(temp, 10) + "px";
                }

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
                if (enemyhits == null) {
                    enemyhits = 0;
                }
                if (mygoldcoins == null) {
                    mygoldcoins = 0;
                }
                enemyhits = parseInt(enemyhits, 10);
                mygoldcoins = parseInt(mygoldcoins, 10);

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
                        if ('<%=ctrl3mainname%>' == "goldcoins" || '<%=ctrl3mainname%>' == "health") {
                            Img3.style.visibility = "hidden";
                        }
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
                        if ('<%=ctrl4mainname%>' == "goldcoins" || '<%=ctrl4mainname%>' == "health") {
                            Img4.style.visibility = "hidden";
                        }
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
                        if ('<%=ctrl5mainname%>' == "goldcoins" || '<%=ctrl5mainname%>' == "health") {
                            Img5.style.visibility = "hidden";
                        }
                    }
                }
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
                if (parseInt(ctrl1.style.left.replace("px", ""), 10) > 175 && parseInt(ctrl1.style.left.replace("px", ""), 10) < 879) {
                    ctrl1.style.left = parseInt(ctrl1.style.left.replace("px", ""), 10) + 45 + "px";
                }
                if (parseInt(ctrl2.style.left.replace("px", ""), 10) > 175 && parseInt(ctrl2.style.left.replace("px", ""), 10) < 879) {
                    ctrl2.style.left = parseInt(ctrl2.style.left.replace("px", ""), 10) + 5 + "px";
                }
                if (parseInt(ctrl3.style.left.replace("px", ""), 10) > 175 && parseInt(ctrl3.style.left.replace("px", ""), 10) < 879) {
                    ctrl3.style.left = parseInt(ctrl3.style.left.replace("px", ""), 10) + 45 + "px";
                }
                if (parseInt(ctrl4.style.left.replace("px", ""), 10) > 175 && parseInt(ctrl4.style.left.replace("px", ""), 10) < 879) {
                    ctrl4.style.left = parseInt(ctrl4.style.left.replace("px", ""), 10) + 45 + "px";
                }
                if (parseInt(ctrl5.style.left.replace("px", ""), 10) > 175 && parseInt(ctrl5.style.left.replace("px", ""), 10) < 879) {
                    ctrl5.style.left = parseInt(ctrl5.style.left.replace("px", ""), 10) + 45 + "px";
                }
                if (parseInt(Img1.style.left.replace("px", ""), 10) > 175 && parseInt(Img1.style.left.replace("px", ""), 10) < 879) {
                    Img1.style.left = parseInt(Img1.style.left.replace("px", ""), 10) + 45 + "px";
                }
                if (parseInt(Img2.style.left.replace("px", ""), 10) > 175 && parseInt(Img2.style.left.replace("px", ""), 10) < 879) {
                    Img1.style.left = parseInt(Img2.style.left.replace("px", ""), 10) + 45 + "px";
                }
                if (parseInt(Img3.style.left.replace("px", ""), 10) > 175 && parseInt(Img3.style.left.replace("px", ""), 10) < 879) {
                    Img1.style.left = parseInt(Img3.style.left.replace("px", ""), 10) + 45 + "px";
                }
                if (parseInt(Img4.style.left.replace("px", ""), 10) > 175 && parseInt(Img4.style.left.replace("px", ""), 10) < 879) {
                    Img1.style.left = parseInt(Img4.style.left.replace("px", ""), 10) + 45 + "px";
                }
                if (parseInt(Img5.style.left.replace("px", ""), 10) > 175 && parseInt(Img5.style.left.replace("px", ""), 10) < 879) {
                    Img1.style.left = parseInt(Img5.style.left.replace("px", ""), 10) + 45 + "px";
                }



                if (parseInt(ctrl1.style.top.replace("px", ""), 10) > parseInt(ctrl1mainres.replace("px", ""), 10) && parseInt(ctrl1.style.top.replace("px", ""), 10) < 378) {
                    ctrl1.style.top = parseInt(ctrl1.style.top.replace("px", ""), 10) - 45 + "px";
                }
                if (parseInt(ctrl2.style.top.replace("px", ""), 10) > parseInt(ctrl1mainres.replace("px", ""), 10) && parseInt(ctrl2.style.top.replace("px", ""), 10) < 378) {
                    ctrl2.style.top = parseInt(ctrl2.style.top.replace("px", ""), 10) + 45 + "px";
                }
                if (parseInt(ctrl3.style.top.replace("px", ""), 10) > parseInt(ctrl1mainres.replace("px", ""), 10) && parseInt(ctrl3.style.top.replace("px", ""), 10) < 378) {
                    ctrl3.style.top = parseInt(ctrl3.style.top.replace("px", ""), 10) + 45 + "px";
                }
                if (parseInt(ctrl4.style.top.replace("px", ""), 10) > parseInt(ctrl1mainres.replace("px", ""), 10) && parseInt(ctrl4.style.top.replace("px", ""), 10) < 378) {
                    ctrl4.style.top = parseInt(ctrl4.style.top.replace("px", ""), 10) + 45 + "px";
                }
                if (parseInt(ctrl5.style.top.replace("px", ""), 10) > parseInt(ctrl1mainres.replace("px", ""), 10) && parseInt(ctrl5.style.top.replace("px", ""), 10) < 378) {
                    ctrl5.style.top = parseInt(ctrl5.style.top.replace("px", ""), 10) + 45 + "px";
                }
                if (parseInt(Img1.style.top.replace("px", ""), 10) > parseInt(ctrl1mainres.replace("px", ""), 10) && parseInt(Img1.style.top.replace("px", ""), 10) < 378) {
                    Img1.style.top = parseInt(Img1.style.top.replace("px", ""), 10) + 45 + "px";
                }
                if (parseInt(Img2.style.top.replace("px", ""), 10) > parseInt(ctrl1mainres.replace("px", ""), 10) && parseInt(Img2.style.top.replace("px", ""), 10) < 378) {
                    Img1.style.top = parseInt(Img2.style.top.replace("px", ""), 10) + 45 + "px";
                }
                if (parseInt(Img3.style.top.replace("px", ""), 10) > parseInt(ctrl1mainres.replace("px", ""), 10) && parseInt(Img3.style.top.replace("px", ""), 10) < 378) {
                    Img1.style.top = parseInt(Img3.style.top.replace("px", ""), 10) + 45 + "px";
                }
                if (parseInt(Img4.style.top.replace("px", ""), 10) > parseInt(ctrl1mainres.replace("px", ""), 10) && parseInt(Img4.style.top.replace("px", ""), 10) < 378) {
                    Img1.style.top = parseInt(Img4.style.top.replace("px", ""), 10) + 45 + "px";
                }
                if (parseInt(Img5.style.top.replace("px", ""), 10) > parseInt(ctrl1mainres.replace("px", ""), 10) && parseInt(Img5.style.top.replace("px", ""), 10) < 378) {
                    Img1.style.top = parseInt(Img5.style.top.replace("px", ""), 10) + 45 + "px";
                }

                divplayer.focus();
            }


            document.addEventListener("keydown", check, false);
            document.addEventListener("mousedown", explodeprop, false);
            document.addEventListener("mousemove", moveprop, false);

            function moveprop(e) {

                if (e.clientX > 1 && e.clientX < 470 && e.clientY > parseInt('<%=ctrl1mainres%>', 10) - 75 && e.clientY < 370) {
                    document.body.style.cursor = "none";
                    crosshair.style.left = Math.round(e.clientX) + "px";
                    crosshair.style.top = Math.round(e.clientY) + "px";

                }
            }

            function explodeprop(e) {
                detectcollision();
                explode();


            }

            function check(e) {
                var code = e.keyCode;



                if (code == 37) {


                    if (parseInt(crosshair.style.left.replace("px", ""), 10) > 1) {
                        //marginl = crosshair.style.left;
                        //currentl = parseInt(marginl.replace("px", ""),10);
                        //crosshair.style.left = currentl - 10 + "px";
                        //marginl = crosshair.style.left;
                        crosshair.style.left = parseInt(crosshair.style.left.replace("px", ""), 10) - 10 + "px";
                    }
                }

                if (code == 39) {

                    if (parseInt(crosshair.style.left.replace("px", ""), 10) < 470) {
                        //currentl = parseInt(marginl.replace("px", ""),10);
                        //crosshair.style.left = currentl + 10 + "px";
                        //marginl = crosshair.style.left;
                        crosshair.style.left = parseInt(crosshair.style.left.replace("px", ""), 10) + 10 + "px";
                    }
                }

                if (code == 38) {


                    if (parseInt(crosshair.style.top.replace("px", ""), 10) > parseInt('<%=ctrl1mainres%>') - 75) {
                        //marginl = crosshair.style.top;
                        //currentl = parseInt(marginl.replace("px", ""),10);
                        //crosshair.style.top = currentl - 10 + "px";
                        //marginl = crosshair.style.top;
                        crosshair.style.top = parseInt(crosshair.style.top.replace("px", ""), 10) - 10 + "px";
                    }

                }

                if (code == 40) {

                    if (parseInt(crosshair.style.top.replace("px", ""), 10) < 378) {
                        //marginl = crosshair.style.top;
                        //currentl = parseInt(marginl.replace("px", ""),10);
                        //crosshair.style.top = currentl + 10 + "px";
                        //marginl = crosshair.style.top;
                        crosshair.style.top = parseInt(crosshair.style.top.replace("px", ""), 10) + 10 + "px";
                    }

                }



                if (code == 83) {
                    detectcollision();
                    explode();

                }

            }

        });

    </script>


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

        #form1 {
            z-index: 1;
            left: 10px;
            top: 15px;
            position: absolute;
            height: 513px;
            width: 948px;
        }

        #vplayer {
            z-index: 1;
            left: 14px;
            top: 166px;
            position: absolute;
            width: 661px;
        }

        #divplayer {
            z-index: 1;
            left: 363px;
            top: 131px;
            position: absolute;
            height: 401px;
            width: 484px;
        }

        #sound1 {
            z-index: 1;
            left: 10px;
            top: 30px;
            position: absolute;
        }
    </style>





    <form id="form1" runat="server">
        <asp:AccessDataSource ID="AccessDataSource1" DataFile="~/Views/Datab/th.mdb" runat="server" SelectCommand="SELECT uname FROM appuserdetails WHERE (uname = '<%=Hiddenfield1%>')"></asp:AccessDataSource>

        <asp:HiddenField ID="HiddenField1" runat="server" OnValueChanged="HiddenField1_ValueChanged" />

        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="14pt" ForeColor="#9999FF" Style="z-index: 1; left: 347px; top: 0px; position: absolute; width: 293px; height: 26px" Text="Label" meta:resourcekey="Label1Resource1"></asp:Label>
        <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Size="14pt" ForeColor="#9999FF" Style="z-index: 1; left: 341px; top: 84px; position: absolute; width: 505px; height: 26px" Text="Use Mouse or arrow keys for movement, click or 's' for functions" meta:resourcekey="Label2Resource1"></asp:Label>

        <asp:HyperLink ID="Hyperlink1" runat="server" Font-Underline="False" NavigateUrl="~/Tspot/buy" Style="z-index: 1; left: 224px; top: 57px; position: absolute; height: 29px; width: 141px" Target="_self" ForeColor="#FFCC00" meta:resourcekey="Hyperlink1Resource1" ViewStateMode="Enabled" ValidateRequestMode="Disabled">Buy a Treasure Spot</asp:HyperLink>
        <asp:HyperLink ID="Hyperlink2" runat="server" Font-Underline="False" NavigateUrl="~/Tspot/buy" Style="z-index: 1; left: 501px; top: 57px; position: absolute; right: 306px; width: 141px" Target="_self" ForeColor="#FFCC00" meta:resourcekey="Hyperlink2Resource1" ValidateRequestMode="Disabled" ViewStateMode="Enabled">Buy a ToolBox Item</asp:HyperLink>
        <asp:HyperLink ID="Hyperlink3" runat="server" Font-Underline="False" NavigateUrl="~/Invite/friends" Style="z-index: 1; left: 384px; top: 57px; position: absolute" Target="_self" ForeColor="#FFCC00" meta:resourcekey="Hyperlink3Resource1" ValidateRequestMode="Disabled" ViewStateMode="Enabled">Invite Friends</asp:HyperLink>
        <asp:HyperLink ID="Hyperlink4" runat="server" Font-Underline="False" NavigateUrl="~/Cpanel/gamesettings" Style="z-index: 1; left: 655px; top: 57px; position: absolute; width: 84px;" Target="_self" ForeColor="#FFCC00" meta:resourcekey="Hyperlink4Resource1" ViewStateMode="Enabled" ValidateRequestMode="Disabled">My Game</asp:HyperLink>



        <asp:TextBox ID="ehits" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" Style="z-index: 1; left: 129px; top: 34px; position: absolute; width: 45px" ForeColor="#FFCC00" meta:resourcekey="ehitsResource1" ValidateRequestMode="Disabled" ViewStateMode="Enabled"></asp:TextBox>
        <asp:TextBox ID="lives" runat="server" AutoPostBack="True" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" Style="z-index: 1; left: 308px; top: 33px; position: absolute; width: 45px" ForeColor="#FFCC00" meta:resourcekey="livesResource1" ViewStateMode="Enabled" ValidateRequestMode="Disabled">10</asp:TextBox>
        <asp:TextBox ID="points" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" Style="z-index: 1; left: 488px; top: 34px; position: absolute; width: 107px" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ViewStateMode="Enabled" ValidateRequestMode="Disabled"></asp:TextBox>
        <asp:TextBox ID="treasure" runat="server" AutoPostBack="False" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" Style="z-index: 1; left: 747px; top: 33px; position: absolute; width: 73px" ForeColor="#FFCC00" meta:resourcekey="treasureResource1" ValidateRequestMode="Disabled" ViewStateMode="Enabled"></asp:TextBox>
        <asp:Panel ID="panel1" runat="server" ValidateRequestMode="Disabled" ViewStateMode="Enabled">
            <asp:Button ID="Button1" runat="server" Style="z-index: 1; left: 756px; top: 53px; position: absolute" Text="Stop Playing" OnClick="Button1_Click" ClientIDMode="Static" UseSubmitBehavior="False" CausesValidation="False" />
        </asp:Panel>

    </form>
    <label style="position: absolute; top: 48px; left: 15px; right: 846px; height: 19px; color: #FFCC00;">Achievements</label>

    <label style="position: absolute; top: 47px; left: 241px; height: 19px; right: 663px; color: #FFCC00;">Lives</label>

    <label style="position: absolute; top: 47px; left: 406px; height: 19px; color: #FFCC00;">Gold Coins</label>

    <label style="position: absolute; top: 47px; left: 660px; height: 19px; color: #FFCC00;">Treasure($)</label>
    <label style="position: absolute; top: 100px; left: 18px; height: 19px; color: #FFCC00; width: 185px;">You Made Achievement over</label>
    <audio id="sound1" src='<%=ctrl1mainsound%>' autoplay="autoplay">
    </audio>

    <div id="divplayer" style="z-index: 203; background-color: transparent; overflow: hidden;">
        <img id="crosshair" src='<%=propurl%>' style="width: 33px; height: 25px; position: absolute; top: '<%=ctrl1mainres%>'; left: 119px; z-index: 202; right: 332px;">
        <img id="explosion" src='<%=collisionurl%>' style="width: 10px; height: 10px; position: absolute; top: '<%=ctrl1mainres%>'; left: 199px; z-index: 21; right: 275px; visibility: hidden; margin-left: 0px; margin-top: 0px;">
        <img id="ctrl1" src='<%=ctrl1mainurl%>' style="width: 50px; height: 50px; position: absolute; top: '<%=ctrl1mainres%>'; left: 61px; z-index: 21; right: 373px; margin-left: 0px; margin-top: 0px; visibility: hidden">
        <img id="ctrl2" src='<%=ctrl1mainurl%>' style="width: 50px; height: 50px; position: absolute; top: '<%=ctrl1mainres%>'; left: 162px; z-index: 21; right: 272px; margin-left: 0px; margin-top: 0px; visibility: visible">
        <img id="ctrl3" src='<%=ctrl1mainurl%>' style="width: 50px; height: 50px; position: absolute; top: '<%=ctrl1mainres%>'; left: 177px; z-index: 21; right: 257px; margin-left: 0px; margin-top: 0px; visibility: hidden">
        <img id="ctrl4" src='<%=ctrl1mainurl%>' style="width: 50px; height: 50px; position: absolute; top: '<%=ctrl1mainres%>'; left: 347px; z-index: 21; right: 87px; margin-left: 0px; margin-top: 0px; visibility: visible">
        <img id="ctrl5" src='<%=ctrl1mainurl%>' style="width: 50px; height: 50px; position: absolute; top: '<%=ctrl1mainres%>'; left: 184px; z-index: 21; right: 250px; margin-left: 0px; margin-top: 0px; visibility: hidden">
        <%--<img id="player1" src="" style="width: 30px; height: 30px; position: absolute; top: 278px; left: 229px; z-index: 21; right: 460px; margin-left: 0px; margin-top: 0px;">
        <img id="player2" src="" style="width: 30px; height: 30px; position: absolute; top: 296px; left: 260px; z-index: 21; right: 562px; margin-left: 0px; margin-top: 0px;">
        <img id="player3" src="" style="width: 30px; height: 30px; position: absolute; top: 78px; left: 229px; z-index: 21; right: 460px; margin-left: 0px; margin-top: 0px;">
        <img id="player4" src="" style="width: 30px; height: 30px; position: absolute; top: 302px; left: 245px; z-index: 21; right: 577px; margin-left: 0px; margin-top: 0px;">
        <img id="player5" src="" style="width: 30px; height: 30px; position: absolute; top: 251px; left: 390px; z-index: 21; right: 299px; margin-left: 0px; margin-top: 0px;">
        --%>
        <img id="Img1" src='<%=ctrl1mainurl%>' style="width: 50px; height: 50px; position: absolute; top: '<%=ctrl1mainres%>'; left: 365px; z-index: 21; right: 69px; margin-left: 0px; margin-top: 0px; visibility: hidden">
        <img id="Img2" src='<%=ctrl2mainurl%>' style="width: 50px; height: 50px; position: absolute; top: '<%=ctrl1mainres%>'; left: 275px; z-index: 21; right: 159px; margin-left: 0px; margin-top: 0px; visibility: hidden">
        <img id="Img3" src='<%=ctrl3mainurl%>' style="width: 50px; height: 50px; position: absolute; top: '<%=ctrl1mainres%>'; left: 57px; z-index: 21; right: 377px; margin-left: 0px; margin-top: 0px; visibility: visible">
        <img id="Img4" src='<%=ctrl4mainurl%>' style="width: 50px; height: 50px; position: absolute; top: '<%=ctrl1mainres%>'; left: 58px; z-index: 21; right: 376px; margin-left: 0px; margin-top: 0px; visibility: hidden">
        <img id="Img5" src='<%=ctrl5mainurl%>' style="width: 50px; height: 50px; position: absolute; top: '<%=ctrl1mainres%>'; left: 379px; z-index: 21; right: 55px; margin-left: 0px; margin-top: 0px; visibility: visible">
    </div>
    <input id="friendname" style="visibility: visible; text-decoration: none; height: 77px; background-color: transparent; color: #FFCC00; z-index: 1; left: 40px; top: 237px; position: absolute; width: 91px;" type="text" readonly="true" />


    <img alt="" src="~/Images/landscape.jpg" style="width: 80px; height: 80px; visibility: visible; z-index: 1; left: 50px; top: 132px; position: absolute; bottom: 357px;" id="friendimage" />
    <img alt="" src='<%=iframeurl%>' style="z-index: 0; left: 365px; top: 130px; position: absolute; background-color: transparent; width: 480px; height: 397px;" class="twoto3d" id="fplayer" />

</body>

</html>
