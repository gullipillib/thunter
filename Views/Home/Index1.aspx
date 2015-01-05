<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<treasurehunter.Models.MyAppUser>" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" EnableSessionState="True" Debug="true" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>


<!DOCTYPE html>
<script runat="server">
    //public static System.Timers.Timer timer = new System.Timers.Timer(10000); // This will raise the event every one minute.
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
    System.Random one;
    int t1;
    string levels="";
    string lifepack = "";
    string wait = "";
    string tempgoldcoins = "";
    string tspotsowned = "";
    string tspotscollected = "";
    string pgoldcoins = "";
    
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
    string upaid = "";
    public string goldcoins = "100";
    string Hiddenfield1;
    public string lulogintimes = "";
    public int times = 0;
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
                //SqlDataSource1.SelectCommand = "SELECT * FROM appuserdetails";
                //SqlDataSource1.InsertParameters["uname"].DefaultValue = Hiddenfield1;
                //SqlDataSource1.InsertParameters["uloggedin"].DefaultValue = "no";
                //SqlDataSource1.InsertParameters["winner"].DefaultValue = "no";
                //SqlDataSource1.InsertParameters["wintimes"].DefaultValue = "0";
                //SqlDataSource1.InsertParameters["paid"].DefaultValue = "no";
                //SqlDataSource1.InsertParameters["amount"].DefaultValue = "0";
                //SqlDataSource1.InsertParameters["currenttspot"].DefaultValue = "";

                SqlDataSource1.InsertCommand = "INSERT INTO appuserdetails(uname, uloggedin, winner, wintimes, paid, amount, currenttspot, device, logindate, logintime, levels) VALUES ('" + Hiddenfield1 + "', 'no', 'no', '0', 'no', '0', '', 'web'," + "'" + System.DateTime.Now.Date + "'," + "'" + System.DateTime.Now.TimeOfDay + "'," + "'1'" + ")";
                SqlDataSource1.Insert();

                SqlDataSource4.SelectCommand = "SELECT * FROM loggedusers";
                //SqlDataSource4.InsertParameters["luname"].DefaultValue = Hiddenfield1;
                //SqlDataSource4.InsertParameters["luid"].DefaultValue = Model.Id;
                //SqlDataSource4.InsertParameters["luposition"].DefaultValue = "{left : 0, top:0}";
                //SqlDataSource4.InsertParameters["luimg"].DefaultValue = Model.ProfilePicture.Data.Url;
                //SqlDataSource4.InsertParameters["luspriteimg"].DefaultValue = Model.ProfilePicture.Data.Url;
                //SqlDataSource4.InsertParameters["lucrisboos"].DefaultValue = "0";
                //SqlDataSource4.InsertParameters["luloggedin"].DefaultValue = "no";
                //SqlDataSource4.InsertParameters["lutspots"].DefaultValue = "0";
                //SqlDataSource4.InsertParameters["lulogintimes"].DefaultValue = "0";
                //SqlDataSource4.InsertParameters["luinvites"].DefaultValue = "0";

                SqlDataSource4.SelectCommand = "SELECT * FROM loggedusers WHERE (luname = '" + Hiddenfield1 + "')";

                dv = (DataView)SqlDataSource4.Select(DataSourceSelectArguments.Empty);
                dt = new DataTable();
                dt = dv.ToTable();

                if (dt.Rows.Count == 0)
                {
                    SqlDataSource4.InsertCommand = "INSERT INTO loggedusers(luname, luid, luposition, luimg, luspriteimg, lucrisboos, luloggedin, lutspots, lulogintimes, luinvites) VALUES ('" + Hiddenfield1 + "', '" + Model.Id + "', '{left : 0, top:0}', '" + Model.ProfilePicture.Data.Url + "', '" + Model.ProfilePicture.Data.Url + "', '100', 'no', '0', '0', '0')";
                    SqlDataSource4.Insert();
                }
                SqlDataSource5.SelectCommand = "SELECT * FROM ordercounter where uname='" + Hiddenfield1+ "'";
                dv = (DataView)SqlDataSource5.Select(DataSourceSelectArguments.Empty);
                dt = new DataTable();
                dt = dv.ToTable();

                if (dt.Rows.Count == 0)
                {


                    //SqlDataSource5.InsertParameters["uname"].DefaultValue = Hiddenfield1;
                    //SqlDataSource5.InsertParameters["ccounter"].DefaultValue = "0";

                    SqlDataSource5.InsertCommand = "INSERT INTO ordercounter(uname, ccounter) Values ('" + Hiddenfield1 + "','0')";
                    SqlDataSource5.Insert();
                }

                SqlDataSource6.SelectCommand = "SELECT * FROM winners where uname='" + Hiddenfield1 + "'";
                //SqlDataSource6.InsertParameters["uname"].DefaultValue = Hiddenfield1;
                //SqlDataSource6.InsertParameters["crisboos"].DefaultValue = "0";
                dv = (DataView)SqlDataSource5.Select(DataSourceSelectArguments.Empty);
                dt = new DataTable();
                dt = dv.ToTable();

                if (dt.Rows.Count == 0)
                {
                    SqlDataSource6.InsertCommand = "INSERT INTO winners(uname, crisboos) Values ('" + Hiddenfield1 + "','0')";
                    SqlDataSource6.Insert();
                }
                Session["loggeduser"] = Model.Name;
                Hiddenfield1 = Hiddenfield1.Replace(" ", "");
                Session["reached"] = "yes";

                SqlDataSource6.SelectCommand = "select paid from appuserdetails where uname = '" + Model.Name + "'";
                dv = (DataView)SqlDataSource6.Select(DataSourceSelectArguments.Empty);
                dt = new DataTable();
                dt = dv.ToTable();
                if (dt.Rows.Count != 0)
                {
                    upaid = dt.Rows[0].Field<string>("paid"); //usethis to get field value
                }
                else
                {
                    upaid = "no";
                }
            }
         SqlDataSource4.SelectCommand = "SELECT lulogintimes FROM loggedusers WHERE (luname = '" + Hiddenfield1 + "')";

                dv = (DataView)SqlDataSource4.Select(DataSourceSelectArguments.Empty);
                dt = new DataTable();
                dt = dv.ToTable();

                if (dt.Rows.Count != 0)
                {
                    lulogintimes = dt.Rows[0].Field<string>("lulogintimes"); //usethis to get field value
                    times = Convert.ToInt16(lulogintimes) + 1;
                    if (times >= 1000)
                    {
                        times = 11;
                    }
                    lulogintimes = Convert.ToString(times);
                    SqlDataSource4.UpdateCommand = "UPDATE loggedusers SET lulogintimes='" + lulogintimes + "' where luname='" + Hiddenfield1 + "'";
                    SqlDataSource4.Update();   
                }
        }
        else
        {

            Response.Redirect("https://treasurehunter.apphb.com/buy.aspx");
        }
        
    }
  
    public string one1 = "";
    public string one2 = "";
    public string one3 = "";
    public string one4 = "";
    public string one5 = "";

    protected void gettreasurespot()
    {
        one = new Random();
        t1 = one.Next(0, 1);
        if (t1 == 0)
        {
            SqlDataSource8.SelectCommand = "SELECT tsname,  tsitems, tsrplayers, tsdplayers, tsrplayersdetails, tsdplayersdetails, tsapproved, tsactive, tsurl FROM tspots where tsapproved = 'yes' and tsactive = 'yes' order by tsorder asc";
        }
        else if (t1 == 1)
        {
            SqlDataSource8.SelectCommand = "SELECT tsname,  tsitems, tsrplayers, tsdplayers, tsrplayersdetails, tsdplayersdetails, tsapproved, tsactive, tsurl FROM tspots where tsapproved = 'yes' and tsactive = 'yes' order by tsorder desc";
        }
        DataView dv = (DataView)SqlDataSource8.Select(DataSourceSelectArguments.Empty);
        DataTable dt = new DataTable();
        dt = dv.ToTable();
        if (dt.Rows.Count != 0)
        {

            one = new Random();
            t1 = one.Next(0, dt.Rows.Count);
            TextBox9.Text = "10"; //usethis to get field value
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
        else
        {
            gettreasurespot();
        }
        if (dt.Rows.Count != 0)
        {

            one = new Random();
            t1 = one.Next(0, dt.Rows.Count);
            tsname = dt.Rows[t1].Field<string>("tsname"); //usethis to get field value
            tsitems = dt.Rows[t1].Field<string>("tsitems"); //usethis to get field value
            tsrplayers = dt.Rows[t1].Field<string>("tsrplayers"); //usethis to get field value
            tsdplayers = dt.Rows[t1].Field<string>("tsrplayers"); //usethis to get field value
            tsrplayersdetails = dt.Rows[t1].Field<string>("tsrplayersdetails"); //usethis to get field value
            tsdplayersdetails = dt.Rows[t1].Field<string>("tsdplayersdetails"); //usethis to get field value
        }
        else
        {
            gettreasurespot();
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
        if (dt.Rows.Count != 0)
        {
            try
            {
                tb1fulldetails = dt.Rows[0].Field<string>("tbdetails");
                tb1itemsfulldetails = Newtonsoft.Json.JsonConvert.DeserializeObject(tb1fulldetails);
                tbitems1 = tb1fulldetails;
                ctrl1mainurl = tb1itemsfulldetails.tbMain;
            
                propurl = tb1itemsfulldetails.tbProp;
                collisionurl = tb1itemsfulldetails.tbCollionResult;
                ctrl1mainsound = tb1itemsfulldetails.tbMainSound;
            }
            catch (Exception e) 
            {
                Response.Redirect("https://treasurehunter.apphb.com/Home/Index1");
                
            }
        }
        else
        {
            gettreasurespot();
        }
        SqlDataSource9.SelectCommand = "SELECT tbname, tbdetails FROM toolbox where tbname = '" + tsitemsfulldetails.tsctrl2name + "'";
        dv = (DataView)SqlDataSource9.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        if (dt.Rows.Count != 0)
        {
            tb2fulldetails = dt.Rows[0].Field<string>("tbdetails");
            tb2itemsfulldetails = Newtonsoft.Json.JsonConvert.DeserializeObject(tb2fulldetails);
            tbitems2 = tb2fulldetails;
            //tb2itemsfulldetails = Json.Decode(tb2itemsfulldetails);
            ctrl2mainurl = tb2itemsfulldetails.tbMain;
        }
        else
        {
            gettreasurespot();
        }
        SqlDataSource9.SelectCommand = "SELECT tbname, tbdetails FROM toolbox where tbname = '" + tsitemsfulldetails.tsctrl3name + "'";
        dv = (DataView)SqlDataSource9.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        if (dt.Rows.Count != 0)
        {
            tb3fulldetails = dt.Rows[0].Field<string>("tbdetails");

            tb3itemsfulldetails = Newtonsoft.Json.JsonConvert.DeserializeObject(tb3fulldetails);
            tbitems3 = tb3fulldetails;
            ctrl3mainurl = tb3itemsfulldetails.tbMain;
        }
        else
        {
            gettreasurespot();
        }
        SqlDataSource9.SelectCommand = "SELECT tbname, tbdetails FROM toolbox where tbname = '" + tsitemsfulldetails.tsctrl4name + "'";
        dv = (DataView)SqlDataSource9.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        if (dt.Rows.Count != 0)
        {
            tb4fulldetails = dt.Rows[0].Field<string>("tbdetails");
            tb4itemsfulldetails = Newtonsoft.Json.JsonConvert.DeserializeObject(tb4fulldetails);

            ctrl4mainurl = tb4itemsfulldetails.tbMain;
            tbitems4 = tb4fulldetails;
        }
        else
        {
            gettreasurespot();
        }
        SqlDataSource9.SelectCommand = "SELECT tbname, tbdetails FROM toolbox where tbname = '" + tsitemsfulldetails.tsctrl5name + "'";
        dv = (DataView)SqlDataSource9.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        if (dt.Rows.Count != 0)
        {
            tb5fulldetails = dt.Rows[0].Field<string>("tbdetails");

            tb5itemsfulldetails = Newtonsoft.Json.JsonConvert.DeserializeObject(tb5fulldetails);

            ctrl5mainurl = tb5itemsfulldetails.tbMain;
            tbitems5 = tb5fulldetails;
        }
        else
        {
            gettreasurespot();
        }
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
                one = new Random();
                t1 = one.Next(1, dt.Rows.Count);
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

        one = new Random();
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

    protected void getuserdetails()
    {
        SqlDataSource1.SelectCommand = "SELECT * FROM appuserdetails where uname='" + Hiddenfield1 + "'";
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        DataTable dt = new DataTable();
        dt = dv.ToTable();
        if (dt.Rows.Count != 0)
        {
            wait = dt.Rows[0].Field<string>("wait");
            levels = dt.Rows[0].Field<string>("levels");
if (levels == null)
{
levels = "0";
}
            TextBox12.Text = levels;
            tspotscollected =  dt.Rows[0].Field<string>("tspotscollected");
if (tspotscollected == null)
{
tspotscollected = "0";
}
            TextBox13.Text = tspotscollected;
            tempgoldcoins = dt.Rows[0].Field<string>("tempgoldcoins");
if (tempgoldcoins == null)
{
tempgoldcoins = "0";
}
            if (upaid == "no" || upaid == null || wait == "yes" )
            {
                TextBox17.Text = tempgoldcoins;
            }
                
            lifepack = dt.Rows[0].Field<string>("lifepack");
        }
        SqlDataSource1.SelectCommand = "SELECT * FROM loggedusers where luname='" + Hiddenfield1 + "'";
        dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        dt = new DataTable();
        dt = dv.ToTable();
        if (dt.Rows.Count != 0)
        {
            tspotsowned = dt.Rows[0].Field<string>("lutspots");
            
            
            pgoldcoins = dt.Rows[0].Field<string>("lucrisboos");
            if (upaid == "yes" && wait == "no" || upaid == "yes" && wait == null)
            {
                TextBox17.Text = pgoldcoins;
            }
        }
        if (lifepack == "yes")
        {
            lives.Text = Convert.ToString(Convert.ToUInt16(lives.Text,10) + 10);
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
                    Response.Redirect("https://treasurehunter.apphb.com/Home/Index1");
                }
            }
            else if (Session["reached"] != null)
            {
                if (Convert.ToString(Session["reached"]) == "no")
                {
                    Response.Redirect("https://treasurehunter.apphb.com/Home/Index1");
                }
            }
            checkusername();
            SqlDataSource1.UpdateCommand = "UPDATE loggedusers SET luloggedin='yes' where luname='" + Hiddenfield1 + "'";
            SqlDataSource1.Update();
            gettreasurespot();
            addfriends();
            gettreasureprize();
            getuserdetails();
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
                Response.Redirect("https://treasurehunter.apphb.com/Tspot/buy");

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
	//Response.Redirect("www.dailymotion.com/video/x2mrn_bon-jovi-its-my-life_music");

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

    string tsratings;

    protected void Button3_Click(object sender, EventArgs e)
    {
        SqlDataSource8.SelectCommand = "SELECT * FROM tspots where tsname = '" + tsname + "'";
        DataView dv = (DataView)SqlDataSource8.Select(DataSourceSelectArguments.Empty);
        DataTable dt = new DataTable();
        dt = dv.ToTable();
        DataView uniname = dt.DefaultView;
        if (dt.Rows.Count != 0)
        {
            tsratings = "10"; //usethis to get field value
        }
        SqlDataSource8.UpdateCommand = "UPDATE tspots SET tsratings='" + Convert.ToString(Convert.ToInt32(tsratings) + 1) + "'" + " where tsname='" + tsname + "'";

    }
</script>

<html>
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width" />
    <meta name="description" content="Free Online Game TreasureHunter Facebook">
    <meta name="keywords" content="free online games, Treasure Hunter, FaceBook Game, Addicting Games, Earn Real Money in Game, Multi Player, 3D, Real Sound, Viral Game, Fun, Invite Your Friends, Play Now, New Facebook Game " />
    <title>The Treasurehunter, A Free Online Game, Have Fun</title>
    <meta name="og:title"
        content="The Treasurehunter, A Free Online Game, Have Fun" />
    <meta name="og:type"
        content="website" />
    <meta name="og:url"
        content="https://treasurehunter.apphb.com/ " />
    <meta name="og:description" content="Play with other Players in 3D. Fun filled Treasure HUnting in Different Places of world. Collect Gold COins. 1000 Levels to achieve." />
    <meta name="fb:app_id" content="123405257731200" />
    <meta name="og:locale" content="en_US" />
    <meta name="article:author" content="https://www.facebook.com/gullipilli vijay bhaskar" />
    <meta name="article:publisher" content="https://www.facebook.com/gullipilli vijay bhaskar" />
 <script type='text/javascript'>
var googletag = googletag || {};
googletag.cmd = googletag.cmd || [];
(function() {
var gads = document.createElement('script');
gads.async = true;
gads.type = 'text/javascript';
var useSSL = 'https:' == document.location.protocol;
gads.src = (useSSL ? 'https:' : 'http:') + 
'//www.googletagservices.com/tag/js/gpt.js';
var node = document.getElementsByTagName('script')[0];
node.parentNode.insertBefore(gads, node);
})();
</script>

<script type='text/javascript'>
googletag.cmd.push(function() {
googletag.defineSlot('/114316130/thfbtag', [468, 60], 'div-gpt-ad-1420438542191-0').addService(googletag.pubads());
googletag.enableServices();
});
</script>   
</head>






<!-- Facebook Conversion Code for buycheckouts -->

<script>(function () {

    var _fbq = window._fbq || (window._fbq = []);

    if (!_fbq.loaded) {

        var fbds = document.createElement('script');

        fbds.async = true;

        fbds.src = '//connect.facebook.net/en_US/fbds.js';

        var s = document.getElementsByTagName('script')[0];

        s.parentNode.insertBefore(fbds, s);

        _fbq.loaded = true;

    }

})();

    window._fbq = window._fbq || [];

    window._fbq.push(['track', '6012706441093', { 'value': '0.00', 'currency': 'INR' }]);
</script>

<noscript>
    <img height="1" width="1" alt="" style="display: none" src="https://www.facebook.com/tr?ev=6012706441093&amp;cd[value]=0.00&amp;cd[currency]=INR&amp;noscript=1" />
</noscript>
<body onbeforeunload="getcoins" style="height: 556px; background-color: #000000; width: 83%; overflow: hidden;">

    <!-- Google Tag Manager -->
    <noscript>
        <iframe src="//www.googletagmanager.com/ns.html?id=GTM-TGKH9G"
            height="0" width="0" style="display: none; visibility: hidden"></iframe>
    </noscript>
    <script>(function (w, d, s, l, i) {
    w[l] = w[l] || []; w[l].push({
        'gtm.start':
        new Date().getTime(), event: 'gtm.js'
    }); var f = d.getElementsByTagName(s)[0],
    j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : ''; j.async = true; j.src =
    '//www.googletagmanager.com/gtm.js?id=' + i + dl; f.parentNode.insertBefore(j, f);
})(window, document, 'script', 'dataLayer', 'GTM-TGKH9G');</script>
    <!-- End Google Tag Manager -->

    <style type="text/css">
        .twoto3d
        {
            width: 100%;
            height: 100%;
            position: relative;
            animation: mymove 0.05s infinite;
            -webkit-animation: mymove 0.25s infinite;
            top: 0%;
            left: 0%;
        }

        @keyframes mymove
        {
            from
            {
                left: 1px;
            }

            to
            {
                left: 2px;
            }
        }

        @-webkit-keyframes mymove /* Safari and Chrome */
        {
            from
            {
                left: 1px;
            }

            to
            {
                left: 2px;
            }
        }

        .zoom
        {
            zoom: 1;
        }

        .perspective3d
        {
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

        #portrait
        {
            z-index: 1;
            left: 7px;
            top: 530px;
            position: absolute;
        }
    </style>

    
    <img height="1" width="1" alt="" style="display: none" src="https://www.facebook.com/tr?id=713630278701106&amp;ev=NoScript" />

<script type="text/javascript">
var infolinks_pid = 2179116;
var infolinks_wsid = 0;
</script>
<script type="text/javascript" src="http://resources.infolinks.com/js/infolinks_main.js"></script>

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
            var updateonce = 0;
            var showendresult = 0;
            var showfailure = 0;

            var noofhits = 0;
            var noofcoins = 0;
            var ranhits = Math.floor(Math.random() * 40 - 20 + 1) + 20;
            var rancoins = Math.floor(Math.random() * 30 - 10 + 1) + 20;

            document.getElementById('TextBox13').setAttribute("value", '<%=tspotsowned%>');
            document.getElementById('TextBox12').setAttribute("value", '<%=levels%>');
            document.getElementById('TextBox16').setAttribute("value", '<%=tspotscollected%>');
            document.getElementById('TextBox17').setAttribute("value", '<%=tempgoldcoins%>');

            document.getElementById('TextBox4').setAttribute("value", rancoins - noofcoins);
            document.getElementById('TextBox6').setAttribute("value", ranhits - noofhits);

            var myaddctrl = window.setTimeout(function () { filllabel() }, 1000);
            function filllabel() {
                document.getElementById('TextBox7').setAttribute("value", "Vastro Games  Collect " + rancoins + " Gold Coins or Conqueor other " + ranhits + " Players in the Next 2 Mins. Put on Your 3D Glasses or Mild Dark Color Sunglasses For 3D  ");
                var myaddctrl = window.setTimeout(function () { hidelabel() }, 4000);
            }
            function hidelabel() {
                document.getElementById('TextBox7').style.visibility = "hidden";

            }

            var showshower = 0;

            var myaddctrl1 = window.setInterval(function () { tcounter() }, 1000);
            function tcounter() {
                
                var mycounter = document.getElementById('TextBox2').getAttribute("value");
                mycounter = parseInt(mycounter, 10) - 1;
                if (mycounter < 0) {
                    mycounter = 0;
                }
                document.getElementById('TextBox2').setAttribute("value", mycounter);

               

                if (parseInt(document.getElementById('lives').getAttribute("value"), 10) <= 0) {
                    document.getElementById('lives').setAttribute("value", "0");
                    var mydivs = Math.floor(Math.random() * (9 - 1) + 1);
                
                    
                    if (showfailure == 0)
                    {

                        if (mydivs == 9) {
                            document.getElementById('showspot').style.visibility = "visible";
                            showfailure == 1;
                            showendresult == 1;
                        }
                        else if (mydivs == 8) {
                            document.getElementById('showpromo').style.visibility = "visible";
                            showfailure == 1;
                            showendresult == 1;
                        }
                        else if (mydivs == 7) {
                            document.getElementById('showtools').style.visibility = "visible";
                            showfailure == 1;
                            showendresult == 1;
                        }
                        else if (mydivs == 6) {
                            document.getElementById('showprof').style.visibility = "visible";
                            showfailure == 1;
                            showendresult == 1;
                        }
                        else if (mydivs == 5) {
                            document.getElementById('showtweet').style.visibility = "visible";
                            showfailure == 1;
                            showendresult == 1;
                        }
                        else if (mydivs == 4) {
                            document.getElementById('showfriendso').style.visibility = "visible";
                            showfailure == 1;
                            showendresult == 1;
                        }
                        else if (mydivs == 3) {
                            window.location.href = "https://treasurehunter.apphb.com/fbbuy.html";
                            showfailure == 1;
                            showendresult == 1;
                        }
                        else if (mydivs == 2) {
                            window.location.href = "https://treasurehunter.apphb.com/gamesettings.aspx";
                            showfailure == 1;
                            showendresult == 1;
                        }
                        else if (mydivs == 1) {
                            document.getElementById('showspot').style.visibility = "visible";
                            showfailure == 1;
                            showendresult == 1;
                        }
                    }
                    
                }

                if (parseInt(document.getElementById('TextBox4').getAttribute("value"), 10) <= 0) {
                    won = 1;
                    noofcoins = -150;
                    noofhits = -150;
                    showshower = 1;
                    updateonce = 0;
                    document.getElementById('TextBox4').setAttribute("value", 150);
                    document.getElementById('TextBox6').setAttribute("value", 150);

                    
                }
                else if (parseInt(document.getElementById('TextBox6').getAttribute("value"), 10) <= 0) {
                    won = 1;
                    noofhits = -150;
                    noofcoins = -150;
                    showshower = 1;
                    updateonce = 0;
                    document.getElementById('TextBox4').setAttribute("value", 150);
                    document.getElementById('TextBox6').setAttribute("value", 150);
                }

                

                if (showendresult == 0)
                {
                    if (showshower == 1) {
                    
                        if (won == 1) {
                            noofcoins = 150;
                            noofhits = 150;
                            document.getElementById('attacked').setAttribute("value", "You Have Completed this Treasure Spot Keep Playing");
                            document.getElementById('TextBox16').setAttribute("value", parseInt(document.getElementById('TextBox16').getAttribute("value"),10) + 1)
                            
                            document.getElementById('showwinner').style.visibility = "visible";
                        

                            document.getElementById('TextBox2').setAttribute("value", "0");

                            var levels1 = parseInt(document.getElementById('TextBox12').getAttribute("value"),10);
                            document.getElementById("TextBox16").setAttribute("value", parseInt(document.getElementById('TextBox16').getAttribute("value"),10) + 1);
                            
                            if (parseInt(levels1,10) <= 30 && won == 1)
                            {
                                
                                if (parseInt(document.getElementById('TextBox16').getAttribute("value"),10) >= 3)
                                {
                                    levels1 = parseInt(levels1,10) + 1;
                                    document.getElementById('TextBox16').setAttribute("value", "0");
                                }
                                
                                document.getElementById('TextBox12').setAttribute("value", levels1);
                                
                                document.getElementById("TextBox17").setAttribute("value", parseInt(document.getElementById('TextBox17').getAttribute("value"),10) + parseInt(document.getElementById('points').getAttribute("value"),10));
                                won = 0;
                            }
                            else if (parseInt(levels1,10) >= 30 && parseInt(levels1,10) < 75 && won == 1)
                            {
                                document.getElementById("TextBox17").setAttribute("value", document.getElementById('TextBox17').getAttribute("value"));
                                if (parseInt(document.getElementById('TextBox13').getAttribute("value"),10) > 1)
                                {
                                    if (parseInt(document.getElementById('TextBox16').getAttribute("value"),10) >= 5 && parseInt(document.getElementById('TextBox13').getAttribute("value"),10) >= 1)
                                    {
                                        levels1 = parseInt(levels1,10) + 1;
                                        document.getElementById('TextBox16').setAttribute("value", "0");
                                    }
                                    document.getElementById('TextBox12').setAttribute("value", levels1);
                                    
                                    document.getElementById("TextBox17").setAttribute("value", parseInt(document.getElementById('TextBox17').getAttribute("value"),10) + parseInt(document.getElementById('points').getAttribute("value"),10));
                                    won = 0;
                                }
                            }
                            else if (parseInt(levels1,10) >= 75 && parseInt(levels1,10) < 130 && won == 1)
                            {
                                document.getElementById("TextBox17").setAttribute("value", document.getElementById('TextBox17').getAttribute("value"));
                                if (parseInt(document.getElementById('TextBox13').getAttribute("value"),10) > 10)
                                {
                                    if (parseInt(document.getElementById('TextBox16').getAttribute("value"),10) >= 5 && parseInt(document.getElementById('TextBox13').getAttribute("value"),10) >= 10)
                                    {
                                        levels1 = parseInt(levels1,10) + 1;
                                        document.getElementById('TextBox16').setAttribute("value", "0");
                                    
                                    }
                                    document.getElementById('TextBox12').setAttribute("value", levels1);
                                    document.getElementById("TextBox17").setAttribute("value", parseInt(document.getElementById('TextBox17').getAttribute("value"),10) + parseInt(document.getElementById('points').getAttribute("value"),10));
                                    won = 0;
                                }
                            }
                            else if (parseInt(levels1,10) >= 130 && parseInt(levels1,10) < 200 && won == 1)
                            {
                                document.getElementById("TextBox17").setAttribute("value", document.getElementById('TextBox17').getAttribute("value"));
                                if (parseInt(document.getElementById('TextBox13').getAttribute("value"),10) > 50)
                                {
                                    if (parseInt(document.getElementById('TextBox16').getAttribute("value"),10) >= 6 && parseInt(document.getElementById('TextBox13').getAttribute("value"),10) >= 50)
                                    {
                                        levels1 = parseInt(levels1,10) + 1;
                                        document.getElementById('TextBox16').setAttribute("value", "0");
                                    
                                    }
                                    document.getElementById('TextBox12').setAttribute("value", levels1);
                                    document.getElementById("TextBox17").setAttribute("value", parseInt(document.getElementById('TextBox17').getAttribute("value"),10) + parseInt(document.getElementById('points').getAttribute("value"),10));
                                    won = 0;
                                }
                            }
                            else if (parseInt(levels1,10) >= 200 && parseInt(levels1,10) < 400 && won == 1)
                            {
                                document.getElementById("TextBox17").setAttribute("value", document.getElementById('TextBox17').getAttribute("value"));
                                if (parseInt(document.getElementById('TextBox13').getAttribute("value"),10) > 70)
                                {
                                    if (parseInt(document.getElementById('TextBox16').getAttribute("value"),10) >= 7 && parseInt(document.getElementById('TextBox13').getAttribute("value"),10) >= 70)
                                    {
                                        levels1 = parseInt(levels1,10) + 1;
                                        document.getElementById('TextBox16').setAttribute("value", "0");
                                    
                                    }
                                    document.getElementById('TextBox12').setAttribute("value", levels1);
                                    document.getElementById("TextBox17").setAttribute("value", parseInt(document.getElementById('TextBox17').getAttribute("value"),10) + parseInt(document.getElementById('points').getAttribute("value"),10));
                                    won = 0;
                                }
                            }
                            else if (parseInt(levels1,10) >= 400 && parseInt(levels1,10) < 1000 && won == 1)
                            {
                                document.getElementById("TextBox17").setAttribute("value", document.getElementById('TextBox17').getAttribute("value"));
                                if (parseInt(document.getElementById('TextBox13').getAttribute("value"),10) > 100)
                                {
                                    if (parseInt(document.getElementById('TextBox16').getAttribute("value"),10) >= 8 && parseInt(document.getElementById('TextBox13').getAttribute("value"),10) >= 100)
                                    {
                                        levels1 = parseInt(levels1,10) + 1;
                                        document.getElementById('TextBox16').setAttribute("value", "0");
                                    
                                    }
                                    document.getElementById('TextBox12').setAttribute("value", levels1);
                                    document.getElementById("TextBox17").setAttribute("value", parseInt(document.getElementById('TextBox17').getAttribute("value"),10) + parseInt(document.getElementById('points').getAttribute("value"),10));
                                    won = 0;
                                }
                            }
                            else if (parseInt(levels1,10) >= 1000)
                            {
                                document.getElementById("TextBox17").setAttribute("value", document.getElementById('TextBox17').getAttribute("value"));
                                document.getElementById('TextBox12').setAttribute("value", "1");
                                document.getElementById('TextBox16').setAttribute("value", "0");
                                    
                                won = 0;
                            }


                            //if (parseInt(levels1,10) <= 30 && wait != "yes" && upaid != "yes" && parseInt(document.getElementById('TextBox14').getAttribute("value"),10) == 3 && parseInt('<%=tspotsowned%>',10) == 0 || parseInt(levels1,10) > 75 && wait != "yes" && upaid != "yes" || parseInt(levels1,10) > 200 && wait != "yes" && upaid != "yes" || parseInt(levels1,10) > 400 && wait != "yes" && upaid != "yes") {
                                //levels1 = parseInt(levels1,10) + 1;
                                //document.getElementById('TextBox12').setAttribute("value", levels1);
                            //}

                            
                            
                        }


                    document.getElementById('TextBox4').setAttribute("value", rancoins - noofcoins);
                    document.getElementById('TextBox6').setAttribute("value", ranhits - noofhits);
                    
                        updateonce = 1;
                        showendresult = 1;
                        won = 0;
                        window.location.href = "/updatecoins.aspx?coins=" + document.getElementById("points").getAttribute("value") + "&levels=" + levels1 + "&tscollected=" + document.getElementById("TextBox16").getAttribute("value");
                    
                    actionconqueor();
                    actioncollectcoins();
                    var pvalue = '<%=upaid%>';
                    //if (enemyhits != null) {
                    //myframe.children.namedItem("Label4").setAttribute("value", enemyhits);
                    //myframe.src = "https://treasurehunter.apphb.com/Play/jsresult/" + enemyhits;
                    // window.location.href("jsresult/" + enemyhits);
                    //if (pvalue == "yes") {
                    //document.getElementById("myframe").setAttribute("src", "updatecoins.aspx?coins=" + document.getElementById("points").getAttribute("value") + "&levels=" + document.getElementById("TextBox12").getAttribute("value") + "&tscollected=" + document.getElementById("TextBox12").getAttribute("value"));
                    
                    //}
                    //}
                    //document.getElementById('Button1').click();
                    showshower = 0;
                        
                }
                }

                

                
                
            }

            var myaddctrl1 = window.setInterval(function () { getTspot() }, 120000);
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
                var mydivs = Math.floor(Math.random() * (9 - 1) + 1);
                


                
                    if(showshower != 1)
                    {

                        if (mydivs == 9) {
                            document.getElementById('showspot').style.visibility = "visible";
                            showshower == 1;
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

            function getcoins() {

            }

            //var myaddctrl1 = window.setInterval(function () { getTcoins() }, 60000);
            //function getTcoins() {

                

            //}

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
                                document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));
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
                                        document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

                                    }
                                    if (myctrl1.tbResult == "takeonecrisboo") {
                                        mygoldcoins = String(parseInt(mygoldcoins, 10) - 1);
                                        document.getElementById('points').setAttribute("value", mygoldcoins);
                                        noofcoins = noofcoins + 1;
                                        document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

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
                                noofcoins = noofcoins + 1;
                                document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

                            }
                            if (myctrl1.tbResult == "takeonecrisboo") {
                                mygoldcoins = String(parseInt(mygoldcoins, 10) - 1);
                                document.getElementById('points').setAttribute("value", mygoldcoins);
                                noofcoins = noofcoins + 1;
                                document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

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
                            //document.getElementById('TextBox4').setAttribute("value", rancoins - noofcoins);
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
                                document.getElementById('TextBox4').setAttribute("value", rancoins - noofcoins);
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
                                    noofcoins = noofcoins + 1;
                                    document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

                                }
                                if (myctrl2.tbResult == "takeonecrisboo") {
                                    mygoldcoins = String(parseInt(mygoldcoins, 10) - 1);
                                    document.getElementById('points').setAttribute("value", mygoldcoins);
                                    noofcoins = noofcoins + 1;
                                    document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

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
                                    noofcoins = noofcoins + 1;
                                    document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

                                }
                                if (myctrl2.tbResult == "takeonecrisboo") {
                                    mygoldcoins = String(parseInt(mygoldcoins, 10) - 1);
                                    document.getElementById('points').setAttribute("value", mygoldcoins);
                                    noofcoins = noofcoins + 1;
                                    document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

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
                                    document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

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
                                    noofcoins = noofcoins + 1;
                                    document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

                                }
                                if (myctrl3.tbResult == "takeonecrisboo") {
                                    mygoldcoins = String(parseInt(mygoldcoins, 10) - 1);
                                    document.getElementById('points').setAttribute("value", mygoldcoins);
                                    noofcoins = noofcoins + 1;
                                    document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));
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
                                noofcoins = noofcoins + 1;
                                document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

                            }
                            if (myctrl3.tbResult == "takeonecrisboo") {
                                mygoldcoins = String(parseInt(mygoldcoins, 10) - 1);
                                document.getElementById('points').setAttribute("value", mygoldcoins);
                                noofcoins = noofcoins + 1;
                                document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

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
                                document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));


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
                                    noofcoins = noofcoins + 1;
                                    document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

                                }
                                if (myctrl4.tbResult == "takeonecrisboo") {
                                    mygoldcoins = String(parseInt(mygoldcoins, 10) - 1);
                                    document.getElementById('points').setAttribute("value", mygoldcoins);
                                    noofcoins = noofcoins + 1;
                                    document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

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
                                noofcoins = noofcoins + 1;
                                document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

                            }
                            if (myctrl4.tbResult == "takeonecrisboo") {
                                mygoldcoins = String(parseInt(mygoldcoins, 10) - 1);
                                document.getElementById('points').setAttribute("value", mygoldcoins);
                                noofcoins = noofcoins + 1;
                                document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

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
                                document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

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
                                noofcoins = noofcoins + 1;
                                document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

                            }
                            if (myctrl5.tbResult == "takeonecrisboo") {
                                mygoldcoins = String(parseInt(mygoldcoins, 10) - 1);
                                document.getElementById('points').setAttribute("value", mygoldcoins);
                                noofcoins = noofcoins + 1;
                                document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

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
                                noofcoins = noofcoins + 1;
                                document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

                            }
                            if (myctrl5.tbResult == "takeonecrisboo") {
                                mygoldcoins = String(parseInt(mygoldcoins, 10) - 1);
                                document.getElementById('points').setAttribute("value", mygoldcoins);
                                noofcoins = noofcoins + 1;
                                document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

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
                                document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));


                            }
                            document.getElementById('ehits').setAttribute("value", enemyhits);
                            sessionStorage.setItem("points", mygoldcoins);
                            sessionStorage.setItem("achievements", enemyhits);
                            sound1.src = myctrl1.tbCollionSound;
                            if ('<%=ctrl1mainname%>' == "goldcoins") {
                            mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                            noofcoins = noofcoins + 1;
                            document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

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
                            noofcoins = noofcoins + 1;
                            document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

                        }
                        document.getElementById('ehits').setAttribute("value", enemyhits);
                        sessionStorage.setItem("points", mygoldcoins);
                        sessionStorage.setItem("achievements", enemyhits);
                        sound1.src = myctrl2.tbCollionSound;
                        if ('<%=ctrl2mainname%>' == "goldcoins") {
                            mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                            noofcoins = noofcoins + 1;
                            document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

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
                            document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

                        }
                        document.getElementById('ehits').setAttribute("value", enemyhits);
                        sessionStorage.setItem("points", mygoldcoins);
                        sessionStorage.setItem("achievements", enemyhits);
                        sound1.src = myctrl3.tbCollionSound;
                        if ('<%=ctrl3mainname%>' == "goldcoins") {
                            mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                            noofcoins = noofcoins + 1;
                            document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

                            

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
                            noofcoins = noofcoins + 1;
                            document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

                        }
                        document.getElementById('ehits').setAttribute("value", enemyhits);
                        sessionStorage.setItem("points", mygoldcoins);
                        sessionStorage.setItem("achievements", enemyhits);
                        sound1.src = myctrl4.tbCollionSound;
                        if ('<%=ctrl4mainname%>' == "goldcoins") {
                            mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                            noofcoins = noofcoins + 1;
                            document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

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
                            document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

                        }
                        document.getElementById('ehits').setAttribute("value", enemyhits);
                        sessionStorage.setItem("points", mygoldcoins);
                        sessionStorage.setItem("achievements", enemyhits);
                        sound1.src = myctrl5.tbCollionSound;
                        if ('<%=ctrl5mainname%>' == "goldcoins") {
                            mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                            noofcoins = noofcoins + 1;
                            document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

                            

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
                            noofcoins = noofcoins + 1;
                            document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

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
                            noofcoins = noofcoins + 1;
                            document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

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
                            noofcoins = noofcoins + 1;
                            document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

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
                            noofcoins = noofcoins + 1;
                            document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

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
                            noofcoins = noofcoins + 1;
                            document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

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
                            noofcoins = noofcoins + 1;
                            document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

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
                            noofcoins = noofcoins + 1;
                            document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));


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
                            noofcoins = noofcoins + 1;
                            document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

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
                            noofcoins = noofcoins + 1;
                            document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

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
                                noofcoins = noofcoins + 1;
                                document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

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
                            noofcoins = noofcoins + 1;
                            document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));


                        }
                        document.getElementById('ehits').setAttribute("value", enemyhits);
                        sessionStorage.setItem("points", mygoldcoins);
                        sessionStorage.setItem("achievements", enemyhits);
                        sound1.src = myctrl1.tbCollionSound;
                        if ('<%=ctrl1mainname%>' == "goldcoins") {
                                mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                                document.getElementById('points').setAttribute("value", mygoldcoins);
                                noofcoins = noofcoins + 1;
                                document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

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
                                noofcoins = noofcoins + 1;
                                document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

                            }
                            document.getElementById('ehits').setAttribute("value", enemyhits);
                            sessionStorage.setItem("points", mygoldcoins);
                            sessionStorage.setItem("achievements", enemyhits);
                            sound1.src = myctrl2.tbCollionSound;
                            if ('<%=ctrl2mainname%>' == "goldcoins") {
                            mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                            noofcoins = noofcoins + 1;
                            document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

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
                            noofcoins = noofcoins + 1;
                            document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

                        }
                        document.getElementById('ehits').setAttribute("value", enemyhits);
                        sessionStorage.setItem("points", mygoldcoins);
                        sessionStorage.setItem("achievements", enemyhits);
                        sound1.src = myctrl3.tbCollionSound;
                        if ('<%=ctrl3mainname%>' == "goldcoins") {
                            mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                            noofcoins = noofcoins + 1;
                            document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

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
                            noofcoins = noofcoins + 1;
                            document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

                        }
                        document.getElementById('ehits').setAttribute("value", enemyhits);
                        sessionStorage.setItem("points", mygoldcoins);
                        sessionStorage.setItem("achievements", enemyhits);
                        sound1.src = myctrl4.tbCollionSound;
                        if ('<%=ctrl4mainname%>' == "goldcoins") {
                            mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                            document.getElementById('points').setAttribute("value", mygoldcoins);
                            noofcoins = noofcoins + 1;
                            document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

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
                            noofcoins = noofcoins + 1;
                            document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

                        }
                        document.getElementById('ehits').setAttribute("value", enemyhits);
                        sessionStorage.setItem("points", mygoldcoins);
                        sessionStorage.setItem("achievements", enemyhits);
                        sound1.src = myctrl5.tbCollionSound;
                        if ('<%=ctrl5mainname%>' == "goldcoins") {
                        mygoldcoins = String(parseInt(mygoldcoins, 10) + 1);
                        document.getElementById('points').setAttribute("value", mygoldcoins);
                        noofcoins = noofcoins + 1;
                        document.getElementById('TextBox4').setAttribute("value", rancoins - document.getElementById('points').getAttribute("value"));

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
                    if (parseInt(ctrl1.style.left.replace("px", "")) > 365 && parseInt(ctrl1.style.left.replace("px", "")) < 850) {
                        ctrl1.style.left = parseInt(ctrl1.style.left.replace("px", "")) + 45 + "px";
                    }

                    if (parseInt(ctrl1.style.top.replace("px", "")) > 130 + parseInt(myctrl1.tsctrl1res).toString().replace("px", "") && parseInt(ctrl1.style.top.replace("px", "")) < 515) {
                        ctrl1.style.top = parseInt(ctrl1.style.top.replace("px", "")) - 45 + "px";
                    }
                }
                else if (playername == Session["friend1"]) {
                    ctrl1.style.left = playerleft;
                    ctrl1.style.top = playertop;
                }

                else if (playername != Session["friend2"]) {
                    if (parseInt(ctrl2.style.left.replace("px", "")) > 365 && parseInt(ctrl2.style.left.replace("px", "")) < 850) {
                        ctrl2.style.left = parseInt(ctrl2.style.left.replace("px", "")) + 5 + "px";
                    }
                    if (parseInt(ctrl2.style.top.replace("px", "")) > 130 + parseInt(myctrl2.tsctrl2res).toString().replace("px", "") && parseInt(ctrl2.style.top.replace("px", "")) < 515) {
                        ctrl2.style.top = parseInt(ctrl2.style.top.replace("px", "")) + 45 + "px";
                    }
                }
                else if (playername == Session["friend2"]) {
                    ctrl2.style.left = playerleft;
                    ctrl2.style.top = playertop;
                }
                else if (playername != Session["friend3"]) {
                    if (parseInt(ctrl3.style.left.replace("px", "")) > 365 && parseInt(ctrl3.style.left.replace("px", "")) < 850) {
                        ctrl3.style.left = parseInt(ctrl3.style.left.replace("px", "")) + 45 + "px";
                    }
                    if (parseInt(ctrl3.style.top.replace("px", "")) > 130 + parseInt(myctrl3.tsctrl3res).toString().replace("px", "") && parseInt(ctrl3.style.top.replace("px", "")) < 515) {
                        ctrl3.style.top = parseInt(ctrl3.style.top.replace("px", "")) + 45 + "px";
                    }
                }
                else if (playername == Session["friend3"]) {
                    ctrl3.style.left = playerleft;
                    ctrl3.style.top = playertop;
                }
                else if (playername != Session["friend4"]) {
                    if (parseInt(ctrl4.style.left.replace("px", "")) > 365 && parseInt(ctrl4.style.left.replace("px", "")) < 850) {
                        ctrl4.style.left = parseInt(ctrl4.style.left.replace("px", "")) + 45 + "px";
                    }
                    if (parseInt(ctrl4.style.top.replace("px", "")) > 130 + parseInt(myctrl4.tsctrl4res).toString().replace("px", "") && parseInt(ctrl4.style.top.replace("px", "")) < 515) {
                        ctrl4.style.top = parseInt(ctrl4.style.top.replace("px", "")) + 45 + "px";
                    }
                }
                else if (playername == Session["friend4"]) {
                    ctrl4.style.left = playerleft;
                    ctrl4.style.top = playertop;
                }
                else if (playername != Session["friend5"]) {
                    if (parseInt(ctrl5.style.left.replace("px", "")) > 365 && parseInt(ctrl5.style.left.replace("px", "")) < 850) {
                        ctrl5.style.left = parseInt(ctrl5.style.left.replace("px", "")) + 45 + "px";
                    }
                    if (parseInt(ctrl5.style.top.replace("px", "")) > 130 + parseInt(myctrl5.tsctrl5res).toString().replace("px", "") && parseInt(ctrl5.style.top.replace("px", "")) < 515) {
                        ctrl5.style.top = parseInt(ctrl5.style.top.replace("px", "")) + 45 + "px";
                    }
                }
                else if (playername == Session["friend5"]) {
                    ctrl5.style.left = playerleft;
                    ctrl5.style.top = playertop;
                }
                divplayer.focus();
            }

            document.addEventListener("keydown", check, false);
            document.addEventListener("mousedown", explodeprop, false);
            document.addEventListener("mousemove", moveprop, false);

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

                //document.body.style.cursor = "none";
                crosshair.style.visibility = "visible";

                crosshair.style.left = Math.round(e.clientX) + "px";
                crosshair.style.top = Math.round(e.clientY) + "px";

                //if (Math.round(e.clientY) < temp, 10) {
                //    //crosshair.style.top = temp + "px";
                //    document.body.style.cursor = "none";
                //}

                //else if (Math.round(e.clientX) > 365) {
                //    //crosshair.style.left = Math.round(e.clientX) + "px";
                //    document.body.style.cursor = "none";
                //}

                //else if (Math.round(e.clientX) < 365) {
                //    crosshair.style.left = 365 + "px";

                //}

                if (Math.round(e.clientX) > 365 && Math.round(e.clientY) > 130 && Math.round(e.clientX) < 375 && Math.round(e.clientY) < 875) {
                    document.body.style.cursor = "none";
                }

                else if (Math.round(e.clientX) > 0 && Math.round(e.clientY) > 0 && Math.round(e.clientX) < 365 && Math.round(e.clientY) < 130) {
                    document.body.style.cursor = "none";
                }

                //else if (Math.round(e.clientX) > 879) {
                //    //crosshair.style.left = 879 + "px";
                //    document.body.style.cursor = "default";
                //}

                //else if (Math.round(e.clientY) > 130) {
                //    crosshair.style.top = Math.round(e.clientY) + "px";
                //    document.body.style.cursor = "none";
                //}

                //else if (Math.round(e.clientY) < 130) {
                //    crosshair.style.top = 130 + "px";

                //}

                //else if (Math.round(e.clientY) > 504) {
                //    crosshair.style.top = 504 + "px";

                //}

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
                    crosshair.style.top = "350px";
                    crosshair.style.height = "90px";
                    crosshair.style.width = "90px";
                    explosion.style.height = "40px";
                    explosion.style.width = "40px";
                    explosion.style.visibility = "visible";
                    explosion.style.left = Math.round(e.clientX)   + "px";
                    explosion.style.top = Math.round(e.clientY)   + "px";
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

        function showbuy() {

            FB.api(
              'me/treasure_huntermp:treasurespot',
              'post',
              {
                  product: "https://treasurehunter.apphb.com/treasurespot.html"
              },
              function (response) {
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

    <script type="text/javascript">
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
    </script>

    <script>
        function buy() {
            //var obj = {
            //    method: 'pay',
            //    action: 'purchaseitem',
            //    product: 'https://treasurehunter.apphb.com/coin.html',
            //    request_id: 'tspot'
            //};

            //FB.ui(obj, function (data) {
            //    actiontrspot();
            //});
            actiontrspot();
            window.location.href = "https://treasurehunter.apphb.com/fbbuy.html";
        }

        document.getElementById('pay0').onclick = function () { buy() };

        function buyt() {
            //var obj = {
            //    method: 'pay',
            //    action: 'purchaseitem',
            //    product: 'https://treasurehunter.apphb.com/tool.html',
            //    request_id: 'tool'
            //};

            //FB.ui(obj, function (data) {
            //    actiontbox();
            //});
            window.location.href = "https://treasurehunter.apphb.com/fbbuy.html";
        }

        document.getElementById('pay3').onclick = function () { buyt() };

        function buyl() {
            //var obj = {
            //    method: 'pay',
            //    action: 'purchaseitem',
            //    product: 'https://treasurehunter.apphb.com/life.html',
            //    request_id: 'life'
            //};

            //FB.ui(obj, function (data) {
            //    actionelifes();
            //});
            actionelifes();
            window.location.href = "https://treasurehunter.apphb.com/fbbuy.html";
        }

        document.getElementById('pay').onclick = function () { buyl() };

        function buyp() {
            //var obj = {
            //    method: 'pay',
            //    action: 'purchaseitem',
            //    product: 'https://treasurehunter.apphb.com/professional.html',
            //    request_id: 'prof'
            //};

            //FB.ui(obj, function (data) {
            //    actionphelp();
            //});
            actionphelp();
            window.location.href = "https://treasurehunter.apphb.com/fbbuy.html";
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
                      //
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
            //FB.ui({
            //    method: 'apprequests',
            //    message: 'You are Invited to Play Treasure Hunter 3D MultiPlayer Game with me'
            //});
            window.location.href = "https://treasurehunter.apphb.com/Invite/friends";
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
            document.getElementById('showwinner').style.visibility = "hidden";
            document.getElementById('Button1').click();

        }
    </script>
    <script type="text/javascript">
        // On load, the user hasn't clicked on the payer_promotion unit
        var has_clicked = false;
        var dialog_window;

        function payer_promotion() {
            //if (!has_clicked) {
            //    // If first click, open payer_promotion dialog
            //    var obj = {
            //        method: 'fbpromotion',
            //        display: 'popup',
            //        quantity: 1,
            //        product: 'https://treasurehunter.apphb.com/coin.html'
            //    };

            //    FB.ui(obj, function () {
            //        // call back to your server to see if user's balance changed
            //    });

            //    // Mark unit as clicked by user
            //    has_clicked = true;
            //} else {
            //    // For subsequent clicks, alert user
            //    alert("Payer Promotion already clicked!");
            //}
            window.location.href = "https://treasurehunter.apphb.com/fbpromo.html";
        }
    </script>
    
    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
            m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-52168843-1', 'auto');
        ga('send', 'pageview');
    </script>

    <form id="form1" runat="server">

<div id='div-gpt-ad-1420438542191-0' style='width:468px; height:60px; z-index: 1000; left: 0%; top: 64%;  position: absolute;'  >
<script type='text/javascript'>
googletag.cmd.push(function() { googletag.display('div-gpt-ad-1420438542191-0'); });
</script>
</div>

        <div style="width: 50%; height: 64%; z-index: 1000; left: 38%; top: 24%; visibility: hidden; position: absolute; background-color: #669999;" id="showwinner">
            <img id="Img9" src="https://treasurehunter.apphb.com/Images/goldshower.gif" style="border: thin solid Transparent; width: 96%; height: 43%; top: 2%; left: 1%; z-index: 1001; position: absolute;" />
            <asp:Label ID="Label22" runat="server" Style="z-index: 1001; left: 3%; top: 70%; position: absolute; vertical-align: middle; text-align: center; width: 62%; height: 7%" ForeColor="White" Font-Bold="True" Font-Size="100%" Font-Names="Haettenschweiler">Congratulations You Have Conquered this Treasure Spot. Keep Playing. </asp:Label>
        </div>
        <div style="width: 49%; height: 66%; z-index: 1000; left: 38%; top: 23%; visibility: hidden; position: absolute; background-color: #FFFF66; overflow: hidden;" id="showlevels">
            <button id="Button12" style="z-index: 1001; border-radius: 2%; text-align: center; vertical-align: middle; border: medium outset #FFFF00; position: absolute; width: 22%; height: 7%; background-color: #FF00FF; color: #FFFFFF; top: 89%; left: 69%;">Back to Game</button>
            <asp:TextBox ID="TextBox18" runat="server" BackColor="Transparent" BorderStyle="Solid" ClientIDMode="Static" Style="z-index: 1001; left: 2%; top: 3%; position: absolute; width: 101%; height: 43%;" ForeColor="#660066" meta:resourcekey="pointsResource1" ReadOnly="true" Font-Size="80%" TextMode="MultiLine">Level           Conqueor    Own TreasureSpots (min)
1-30                   3                       0
31-75                  5                       1
76-130                 5                       10
131-200                6                       50
200-400                7                       70
400-1000               8                       100</asp:TextBox>

        </div>
        <div style="width: 49%; height: 67%; z-index: 1000; left: 38%; top: 22%; visibility: hidden; position: absolute; background-color: #669999;" id="showprof">
            <img alt="" src="Images/goldcoin.gif" style="z-index: 1101; left: 80%; top: 32%; position: absolute; height: 9%; width: 8%;" />
            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="100%" ForeColor="White" Style="z-index: 1001; left: 3%; top: 5%; position: absolute; width: 96%; height: 15%;" Text="Professional Help to Complete Your TreasureSpot or Game Tools"></asp:Label>
            <asp:Label ID="Label5" runat="server" Style="z-index: 1001; left: 15%; top: 15%; position: absolute; vertical-align: middle; text-align: center; width: 77%; height: 12%;" Text="A Professional will complete your TreasureSpot or Game Tools on behalf of you" ForeColor="White" Font-Size="100%"></asp:Label>
            <asp:Label ID="Label6" runat="server" Style="z-index: 1001; left: 4%; top: 40%; position: absolute; vertical-align: middle; text-align: center; width: 15%; height: 6%;" Text="Price   $1" ForeColor="White" Font-Bold="True" Font-Size="100%"></asp:Label>
            <asp:HyperLink ID="Hyperlink8" runat="server" Font-Underline="False" NavigateUrl="https://treasurehunter.apphb.com/fbbuy.html" Style="z-index: 1001; border-radius: 2%; background-color: #0000FF; top: 40%; position: absolute; height: 6%; width: 34%; left: 23%; text-align: center; vertical-align: middle;" Target="_self" ForeColor="#FFCC00" meta:resourcekey="Hyperlink1Resource1" ViewStateMode="Enabled" Font-Size="100%">Buy Professional Help</asp:HyperLink>
            <button id="Button4" style="z-index: 1001; border-radius: 2%; text-align: center; vertical-align: middle; border: medium outset #FFFF00; position: absolute; width: 24%; height: 8%; background-color: #FF00FF; color: #FFFFFF; top: 80%; left: 60%; font-size: 100%;">Back to Game</button>
        </div>
        <div style="width: 49%; height: 66%; z-index: 1000; left: 38%; top: 24%; visibility: hidden; position: absolute; background-color: #9900FF" id="showspot">
            <img alt="" src="Images/coin.png" style="z-index: 1001; left: 5%; top: 5%; position: absolute; width: 9%; height: 12%;" />
            <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="100%" ForeColor="White" Style="z-index: 1001; left: 19%; top: 8%; width: 47%; height: 7%; position: absolute" Text="Buy a Treasure Spot"></asp:Label>
            <asp:Label ID="Label8" runat="server" Style="z-index: 1001; left: 18%; top: 18%; position: absolute; vertical-align: middle; text-align: center; width: 73%; height: 15%;" Text="You Have Played Now in a TreasureSpot. Create your own TreasureSpot to Earn More Rewards. " ForeColor="White" Font-Size="100%"></asp:Label>
            <asp:Label ID="Label9" runat="server" Style="z-index: 1001; left: 4%; top: 37%; position: absolute; vertical-align: middle; text-align: center; width: 18%; height: 10%;" Text="Price   $2" ForeColor="White" Font-Bold="True" Font-Size="100%"></asp:Label>
            <asp:HyperLink ID="Hyperlink7" runat="server" Font-Underline="False" NavigateUrl="https://treasurehunter.apphb.com/fbbuy.html" Style="z-index: 1001; border-radius: 2%; background-color: #0000FF; top: 37%; position: absolute; height: 7%; width: 64%; left: 23%; text-align: center; vertical-align: middle;" Target="_self" ForeColor="#FFCC00" meta:resourcekey="Hyperlink1Resource1" ViewStateMode="Enabled" Font-Size="100%">Buy a Treasure Spot(Offer Claims Enabled)</asp:HyperLink>
            <button id="Button5" style="z-index: 1001; border-radius: 2%; text-align: center; vertical-align: middle; border: medium outset #FFFF00; position: absolute; width: 23%; height: 7%; background-color: #FF00FF; color: #FFFFFF; top: 88%; left: 64%; font-size: 100%;" onclick="hidediv();">Back to Game</button>
            <asp:HyperLink ID="Hyperlink12" runat="server" Font-Underline="False" NavigateUrl="https://treasurehunter.apphb.com/trialpay.aspx" Style="z-index: 1; left: 23%; top: 49%; position: absolute; border-radius: 2%; background-color: #FF9900; width: 26%; height: 14%; cursor: pointer; text-decoration: none;" Target="_blank" ForeColor="White" BackColor="#FF9900" ImageUrl="https://treasurehunter.apphb.com/Images/trialpay.jpg"></asp:HyperLink>
            <asp:Label ID="Label23" runat="server" Style="z-index: 1001; left: 52%; top: 50%; position: absolute; vertical-align: middle; text-align: center; width: 39%; height: 13%;" Text="(Offer Claims Enabled. Earn Free Credits to Buy)" ForeColor="White" Font-Bold="True" Font-Size="100%"></asp:Label>
            <asp:HyperLink ID="Hyperlink13" runat="server" Font-Underline="False" NavigateUrl="https://treasurehunter.apphb.com/buy.aspx" Style="z-index: 1; left: 18%; top: 68%; position: absolute; border-radius: 2%; background-color: #FF9900; width: 36%; height: 14%; cursor: pointer; text-decoration: none;" Target="_blank" ForeColor="White" BackColor="#FF9900" ImageUrl="https://www.paypalobjects.com/en_GB/i/btn/btn_buynowCC_LG.gif"></asp:HyperLink>
            <asp:Label ID="Label24" runat="server" Style="z-index: 1001; left: 58%; top: 68%; position: absolute; vertical-align: middle; text-align: center; width: 39%; height: 13%;" Text="(PayPal Offer Claims Not Enabled)" ForeColor="White" Font-Bold="True" Font-Size="100%"></asp:Label>

        </div>
        <div style="width: 50%; height: 66%; z-index: 1000; left: 38%; top: 24%; visibility: hidden; position: absolute; background-color: #666633" id="showpromo">
            <img alt="" src="Images/lwinner.jpg" style="z-index: 1101; left: 3%; top: 6%; position: absolute; height: 15%; width: 15%;" />
            <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="100%" ForeColor="White" Style="z-index: 1001; left: 22%; top: 7%; position: absolute; width: 55%; height: 15%;" Text="Wow you just won a TreasureSpot at a Concessional Price"></asp:Label>
            <asp:Label ID="Label11" runat="server" Style="z-index: 1001; left: 16%; top: 30%; position: absolute; vertical-align: middle; text-align: center; width: 78%; height: 15%;" Text="You were the randomly selected winner of a TreasureSpot" ForeColor="White" Font-Size="100%"></asp:Label>
            <asp:HyperLink ID="Hyperlink9" runat="server" Font-Underline="False" NavigateUrl="https://treasurehunter.apphb.com/fbpromo.html" Style="z-index: 1001; border-radius: 2%; background-color: #0000FF; top: 69%; position: absolute; height: 8%; width: 37%; left: 4%; text-align: center; vertical-align: middle;" Target="_self" ForeColor="#FFCC00" meta:resourcekey="Hyperlink1Resource1" ViewStateMode="Enabled" Font-Size="100%">Claim My Treasurespot</asp:HyperLink>
            <button id="Button6" style="z-index: 1001; border-radius: 2%; text-align: center; vertical-align: middle; border: medium outset #FFFF00; position: absolute; width: 22%; height: 7%; background-color: #FF00FF; color: #FFFFFF; top: 68%; left: 63%; font-size: 100%;">Back to Game</button>
        </div>
        <div style="width: 50%; height: 67%; z-index: 1000; left: 38%; top: 23%; visibility: hidden; position: absolute; background-color: #FF6666" id="showlife">
            <img alt="" src="Images/health.gif" style="z-index: 1101; left: 2%; top: 5%; position: absolute; height: 13%; width: 12%;" />
            <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="15pt" ForeColor="White" Style="z-index: 1001; left: 76px; top: 32px; position: absolute; width: 349px;" Text="Additional Lifes During Your Game Play"></asp:Label>
            <asp:Label ID="Label13" runat="server" Style="z-index: 1001; left: 30px; top: 86px; position: absolute; vertical-align: middle; text-align: center; width: 394px; margin-top: 0px; bottom: 176px;" Text="Get 20 More Lifes During Game Playing. Buy to Clear the Level." ForeColor="White"></asp:Label>
            <asp:Label ID="Label14" runat="server" Style="z-index: 1001; left: 18px; top: 162px; position: absolute; vertical-align: middle; text-align: center; width: 72px; margin-top: 0px;" Text="Price   $1" ForeColor="White" Font-Bold="True"></asp:Label>
            <asp:HyperLink ID="Hyperlink10" runat="server" Font-Underline="False" NavigateUrl="https://treasurehunter.apphb.com/fbbuy.html" Style="z-index: 1001; border-radius: 15px; background-color: #0000FF; top: 254px; position: absolute; height: 22px; width: 170px; left: 21px; text-align: center; vertical-align: middle;" Target="_self" ForeColor="#FFCC00" meta:resourcekey="Hyperlink1Resource1" ViewStateMode="Enabled">Buy Additional Lifes</asp:HyperLink>
            <button id="Button7" style="z-index: 1001; border-radius: 10px; text-align: center; vertical-align: middle; border: medium outset #FFFF00; position: absolute; width: 162px; height: 39px; background-color: #FF00FF; color: #FFFFFF; top: 234px; left: 234px;" onclick="actionthgame();">Back to Game</button>
        </div>
        <div style="width: 49%; height: 67%; z-index: 1000; left: 38%; top: 23%; visibility: hidden; position: absolute; background-color: #FF5050" id="showtweet">
            <img alt="" src="Images/landscape.jpg" style="z-index: 1101; left: 3%; top: 4%; position: absolute; height: 20%; width: 22%" />
            <asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Size="100%" ForeColor="White" Style="z-index: 1001; left: 37%; top: 8%; position: absolute; width: 41%; height: 7%;" Text="Tweet on Twitter"></asp:Label>
            <asp:Label ID="Label16" runat="server" Style="z-index: 1001; left: 35%; top: 20%; position: absolute; vertical-align: middle; text-align: center; width: 59%; height: 15%;" Text="To Make TreasureHunting more interesting tweet on Twitter and Expres Yourself" ForeColor="White" Font-Size="100%"></asp:Label>
            <button id="Button8" style="z-index: 1001; border-radius: 2%; text-align: center; vertical-align: middle; border: medium outset #FFFF00; position: absolute; width: 23%; height: 8%; background-color: #FF00FF; color: #FFFFFF; top: 84%; left: 68%; font-size: 100%;" onclick="actionrewards();">Back to Game</button>
            <a href="https://twitter.com/share" class="twitter-share-button" data-lang="en" style="z-index: 1001; text-decoration: none; position: absolute; top: 84%; left: 5%; width: 41%; height: 10%;">Tweet</a>
        </div>
        <div style="width: 50%; height: 67%; z-index: 1000; left: 38%; top: 22%; visibility: hidden; position: absolute; background-color: #3333FF" id="showtools">
            <img alt="" src="Images/goldcoin.gif" style="z-index: 1101; left: 7%; top: 6%; position: absolute; height: 15%; width: 15%;" />
            <asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Size="100%" ForeColor="White" Style="z-index: 1001; left: 25%; top: 11%; position: absolute; height: 6%; width: 46%;" Text="Buy a Game Tools Item"></asp:Label>
            <asp:Label ID="Label18" runat="server" Font-Size="100%" Style="z-index: 1001; left: 23%; top: 22%; position: absolute; vertical-align: middle; text-align: center; width: 62%; height: 15%;" Text="Add your own choice of Game Items to your TreasureSpot." ForeColor="White"></asp:Label>
            <asp:Label ID="Label19" runat="server" Font-Size="100%" Style="z-index: 1001; left: 17%; top: 42%; position: absolute; vertical-align: middle; text-align: center; width: 17%; height: 8%;" Text="Price   $1" ForeColor="White" Font-Bold="True"></asp:Label>
            <asp:HyperLink ID="Hyperlink11" runat="server" Font-Size="100%" Font-Underline="False" NavigateUrl="https://treasurehunter.apphb.com/fbbuy.html" Style="z-index: 1001; border-radius: 2%; background-color: #0000FF; top: 54%; position: absolute; height: 8%; width: 45%; left: 4%; text-align: center; vertical-align: middle;" Target="_self" ForeColor="#FFCC00" meta:resourcekey="Hyperlink1Resource1" ViewStateMode="Enabled">Buy Game Items for TreasureSpot</asp:HyperLink>
            <button id="Button9" style="z-index: 1001; border-radius: 2%; text-align: center; vertical-align: middle; border: medium outset #FFFF00; position: absolute; width: 26%; height: 10%; background-color: #FF00FF; color: #FFFFFF; top: 55%; left: 57%; font-size: 100%;">Back to Game</button>
        </div>
        <div style="width: 50%; height: 67%; z-index: 1000; left: 38%; top: 23%; visibility: hidden; position: absolute; background-color: #FF5050" id="showfriends">
            <img alt="" src="Images/landscape.jpg" style="z-index: 1101; left: 7%; top: 6%; position: absolute; height: 15%; width: 15%" />
            <asp:Label ID="Label20" runat="server" Font-Bold="True" Font-Size="100%" ForeColor="White" Style="z-index: 1001; left: 37%; top: 9%; height: 9%; width: 26%; position: absolute" Text="Invite Friends"></asp:Label>
            <asp:Label ID="Label21" runat="server" Style="z-index: 1001; left: 24%; top: 18%; position: absolute; vertical-align: middle; text-align: center; width: 65%; height: 15%;" Text="To Make TreasureHunting more interesting invite your Friends and Like the Game" ForeColor="White" Font-Size="100%"></asp:Label>
            <button id="Button10" style="z-index: 1001; border-radius: 2%; text-align: center; vertical-align: middle; border: medium outset #FFFF00; position: absolute; width: 24%; height: 8%; background-color: #FF00FF; color: #FFFFFF; top: 66%; left: 61%; font-size: 100%;" onclick="ifriends();">Back to Game</button>
            <a href="#" onclick="FacebookInviteFriends();" style="position: absolute; left: 8%; top: 86%; width: 29%; height: 7%; text-decoration: none; color: #FFFFFF; background-color: #FF9900; border-radius: 2%; text-align: center; z-index: 1001; font-size: 100%;">Invite Friends</a>
        </div>
        <asp:Button ID="Button3" runat="server" BackColor="Transparent" BorderColor="#CCCCFF" BorderStyle="Solid" Font-Size="60%" ForeColor="White" Style="z-index: 1; left: 88%; top: 74%; cursor: pointer; position: absolute; width: 10%; height: 5%;" Text="Rate Good to this TreasureSpot" OnClick="Button3_Click" CausesValidation="False" UseSubmitBehavior="False" />

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=9cd6799a-6dac-4d58-947e-a0ba00796278.sqlserver.sequelizer.com;Initial Catalog=db9cd6799a6dac4d58947ea0ba00796278;Persist Security Info=True;User ID=tddputngypufyqqp;Password=EkBRetznpcHA57dLkka8JPnfM84wFhkpLctYThhwe6CpjHUMyMN4dDrX7veeycNh" SelectCommand="SELECT * FROM appuserdetails" InsertCommand="INSERT INTO loggedusers(luname, luid, luposition, luimg, luspriteimg, lucrisboos, luloggedin, lutspots, lulogintimes, luinvites) Values (@luname, @luid, @luposition, @luimg, @luspriteimg, @lucrisboos, @luloggedin, @lutspots, @lulogintimes, @luinvites)" UpdateCommand="UPDATE appuserdetails SET @uloggedin='yes'">
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
        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="Data Source=9cd6799a-6dac-4d58-947e-a0ba00796278.sqlserver.sequelizer.com;Initial Catalog=db9cd6799a6dac4d58947ea0ba00796278;Persist Security Info=True;User ID=tddputngypufyqqp;Password=EkBRetznpcHA57dLkka8JPnfM84wFhkpLctYThhwe6CpjHUMyMN4dDrX7veeycNh" SelectCommand="SELECT * FROM [tspots]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="Data Source=9cd6799a-6dac-4d58-947e-a0ba00796278.sqlserver.sequelizer.com;Initial Catalog=db9cd6799a6dac4d58947ea0ba00796278;Persist Security Info=True;User ID=tddputngypufyqqp;Password=EkBRetznpcHA57dLkka8JPnfM84wFhkpLctYThhwe6CpjHUMyMN4dDrX7veeycNh" SelectCommand="SELECT * FROM [toolbox]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="Data Source=9cd6799a-6dac-4d58-947e-a0ba00796278.sqlserver.sequelizer.com;Initial Catalog=db9cd6799a6dac4d58947ea0ba00796278;Persist Security Info=True;User ID=tddputngypufyqqp;Password=EkBRetznpcHA57dLkka8JPnfM84wFhkpLctYThhwe6CpjHUMyMN4dDrX7veeycNh" SelectCommand="SELECT [treasurevalue] FROM [treasureprize]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="Data Source=9cd6799a-6dac-4d58-947e-a0ba00796278.sqlserver.sequelizer.com;Initial Catalog=db9cd6799a6dac4d58947ea0ba00796278;Persist Security Info=True;User ID=tddputngypufyqqp;Password=EkBRetznpcHA57dLkka8JPnfM84wFhkpLctYThhwe6CpjHUMyMN4dDrX7veeycNh" SelectCommand="SELECT * FROM loggedusers" InsertCommand="INSERT INTO loggedusers(luname, luid, luposition, luimg, luspriteimg, lucrisboos, luloggedin, lutspots, lulogintimes, luinvites) Values (@luname, @luid, @luposition, @luimg, @luspriteimg, @lucrisboos, @luloggedin, @lutspots, @lulogintimes, @luinvites)" UpdateCommand="UPDATE appuserdetails SET @uloggedin='yes'">
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
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="Data Source=9cd6799a-6dac-4d58-947e-a0ba00796278.sqlserver.sequelizer.com;Initial Catalog=db9cd6799a6dac4d58947ea0ba00796278;Persist Security Info=True;User ID=tddputngypufyqqp;Password=EkBRetznpcHA57dLkka8JPnfM84wFhkpLctYThhwe6CpjHUMyMN4dDrX7veeycNh" SelectCommand="SELECT * FROM ordercounter" InsertCommand="INSERT INTO ordercounter(uname, ccounter) Values (@uname, @ccounter)" UpdateCommand="UPDATE ordercounter SET @uname=''">
            <InsertParameters>
                <asp:Parameter Name="uname" />
                <asp:Parameter Name="ccounter" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="uname" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="Data Source=9cd6799a-6dac-4d58-947e-a0ba00796278.sqlserver.sequelizer.com;Initial Catalog=db9cd6799a6dac4d58947ea0ba00796278;Persist Security Info=True;User ID=tddputngypufyqqp;Password=EkBRetznpcHA57dLkka8JPnfM84wFhkpLctYThhwe6CpjHUMyMN4dDrX7veeycNh" SelectCommand="SELECT * FROM winners" InsertCommand="INSERT INTO winners(uname, crisboos) Values (@uname, @crisboos)" UpdateCommand="UPDATE winners SET @uname=''">
            <InsertParameters>
                <asp:Parameter Name="uname" />
                <asp:Parameter Name="crisboos" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="uname" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <div class="fb-like-box" data-href="https://www.facebook.com/Treasurehuntergame" data-colorscheme="light" data-show-faces="false" data-header="false" data-stream="false" data-show-border="false" style="z-index: 351; position: absolute; width: 180px; height: 6%; top: 3%; left: 61%;"></div>

        <asp:Button ID="Button1" runat="server" ClientIDMode="Static" PostBackUrl="https://treasurehunter.apphb.com/Index1.aspx" Style="z-index: 1; left: 15%; top: 15%; position: absolute; display: none" Text="Button" CausesValidation="False" />

        <img alt="" src="https://treasurehunter.apphb.com/Images/amazon.png" style="z-index: 100; left: 83%; top: 6%; position: absolute; height: 10%; width: 17%" />
        <a href="https://treasurehunter.apphb.com/prizes.html" target="_self" style="position: absolute; left: 70%; top: 95%; width: 10%; height: 4%; text-decoration: none; background-color: #FF00FF; color: #FFFFFF; border-radius: 20%; text-align: center; z-index: 1; font-size: 100%;">Rewards</a>
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="100%" ForeColor="#9999FF" Style="z-index: 1; left: 16%; top: 1%; position: absolute; width: 43%; height: 4%;" Text="Label" meta:resourcekey="Label1Resource1"></asp:Label>
        <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Size="90%" ForeColor="#9999FF" Style="z-index: 1; left: 40%; top: 14%; position: absolute; width: 36%; height: 3%;" Text="Use Mouse or arrow keys for movement, click or 's' for functions" meta:resourcekey="Label2Resource1"></asp:Label>

        <asp:HyperLink ID="Hyperlink1" runat="server" Font-Underline="False" NavigateUrl="https://treasurehunter.apphb.com/buy.aspx" Style="text-align:center; vertical-align:middle; z-index: 1; border-radius: 15px; background-color: #0000FF; top: 6%; position: absolute; height: 4%; width: 13%; left: 2%;" Target="_self" Font-Size="100%" ForeColor="#FFCC00"  ViewStateMode="Enabled">Buy a Treasure Spot</asp:HyperLink>
        <asp:HyperLink ID="Hyperlink2" runat="server" Font-Underline="False" NavigateUrl="https://treasurehunter.apphb.com/buy.aspx" Style="text-align:center; vertical-align:middle; z-index: 1; border-radius: 15px; background-color: #0000FF; top: 11%; position: absolute; width: 13%; height: 4%; left: 27%; right: 813px;" Target="_self" Font-Size="100%" ForeColor="#FFCC00"  ViewStateMode="Enabled">Buy a ToolBox Item</asp:HyperLink>
        <asp:HyperLink ID="Hyperlink3" runat="server" Font-Underline="False" NavigateUrl="https://treasurehunter.apphb.com/Invite/friends" Style="text-align:center; vertical-align:middle; z-index: 1; border-radius: 15px; background-color: #0000FF; left: 16%; top: 11%;  width: 9%; height: 4%;  position: absolute" Target="_self" ForeColor="#FFCC00"  ViewStateMode="Enabled" Font-Size="100%">Invite Friends</asp:HyperLink>
        <asp:HyperLink ID="Hyperlink4" runat="server" Font-Underline="False" NavigateUrl="https://treasurehunter.apphb.com/gamesettings.aspx" Style="text-align:center; vertical-align:middle; z-index: 1; border-radius: 15px; background-color: #0000FF; top: 11%; position: absolute; width: 7%; left: 42%;" Target="_self" ForeColor="#FFCC00"  ViewStateMode="Enabled" Font-Size="100%">My Game</asp:HyperLink>
        <asp:HyperLink ID="Hyperlink5" runat="server" Font-Underline="False" NavigateUrl="https://treasurehunter.apphb.com/Play/play" Font-Size="100%" Style="text-align:center; vertical-align:middle;  z-index: 1; border-radius: 15px; background-color: #FF9900; left: 81%; top: 95%; position: absolute; height: 4%; width: 7%;" Target="_self" ForeColor="White">Winners</asp:HyperLink>
        <asp:HyperLink ID="Hyperlink6" runat="server" Font-Underline="False" NavigateUrl="http://www.amazon.com/gp/product/B00I2DV2UO" Style="z-index: 1; border-radius: 2%; background-color: #FF9900; left: 81%; top: 4%; position: absolute; height: 12%; width: 20%; cursor: pointer;" Target="_self" ForeColor="Transparent"></asp:HyperLink>
        <a id="A1" href="https://treasurehunter.apphb.com/app-release.apk" style="border: 2px solid #FF00FF; border-radius: 25px; font-family: Pericles; font-size: 75%; font-weight: bold; font-style: italic; color: #FFFFFF; background-color: #FF00FF; cursor: pointer; position: absolute; text-align: center; top: 94%; left: 29%; width: 39%; height: 4%; vertical-align: middle; z-index: 1000; text-decoration: none; visibility: visible;">Download Now and Play on Mobiles and Devices</a>

        <asp:TextBox ID="ehits" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" Style="z-index: 1; left: 12%; top: 1%; position: absolute; width: 6%; height : 3%;" ForeColor="#FFCC00" ViewStateMode="Enabled" Font-Size="100%">0</asp:TextBox>
        <asp:TextBox ID="lives" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" Style="z-index: 1; left: 31%; top: 6%; position: absolute; width: 6%; height : 4%;" ForeColor="#FFCC00"  ViewStateMode="Enabled">15</asp:TextBox>
        <div id="divplayer"  onmouseover="moveprop(event)" onmousedown="explodeprop(event)" onkeydown="check(e)" style="border-style: outset; border-width: thin; z-index: 203; background-color: transparent; width: 49%; height: 66%; position:  absolute; top: 25%; left: 37%;">
            <img id="crosshair" src='<%=propurl%>' style="width: 40px; height: 40px; position: absolute; top: 195px; left: 119px; z-index: 202; right: 321px; bottom: 140px;" />
            <img id="explosion" src='<%=collisionurl%>' style="width: 40px; height: 40px; position: absolute; top: '<%=ctrl1mainres%>'; left: 199px; z-index: 21; visibility: hidden; right: 159px; bottom: 140px;" />
            <img id="ctrl1" src='<%=ctrl1mainurl%>' style="border: thin solid Transparent; width: '<%=ctrl1mainwidth%>'; height: '<%=ctrl1mainheight%>'; position: absolute; top: '<%=ctrl1maintop%>'; left: '<%=ctrl1mainleft%>'; z-index: 21; visibility: hidden; right: 159px; bottom: 140px;" />
            <img id="ctrl2" src='<%=ctrl2mainurl%>' style="border: thin solid Transparent; width: '<%=ctrl2mainwidth%>'; height: '<%=ctrl2mainheight%>'; position: absolute; top: '<%=ctrl2maintop%>'; left: '<%=ctrl2mainleft%>'; z-index: 21; visibility: hidden; right: 159px; bottom: 140px;" />
            <img id="ctrl3" src='<%=ctrl3mainurl%>' style="border: thin solid Transparent; width: '<%=ctrl3mainwidth%>'; height: '<%=ctrl3mainheight%>'; position: absolute; top: '<%=ctrl3maintop%>'; left: '<%=ctrl3mainleft%>'; z-index: 21; visibility: hidden; right: 159px; bottom: 140px;" />
            <img id="ctrl4" src='<%=ctrl4mainurl%>' style="border: thin solid Transparent; width: '<%=ctrl4mainwidth%>'; height: '<%=ctrl4mainheight%>'; position: absolute; top: '<%=ctrl4maintop%>'; left: '<%=ctrl4mainleft%>'; z-index: 21; visibility: hidden; right: 159px; bottom: 140px;" />
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
            <img id="Img5" src='<%=ctrl5mainurl%>' style="border: thin solid Transparent; width: '<%=ctrl5mainwidth%>'; height: '<%=ctrl5mainheight%>'; top: '<%=ctrl5maintop%>'; left: '<%=ctrl5mainleft%>'; z-index: 21; visibility: hidden; right: 159px; bottom: 140px;" />
         <img alt="" src='<%=iframeurl%>' style="z-index: 0; left: 0%; top: 0%; position: absolute; background-color: transparent; width: 100%; height: 100%;" class="twoto3d" id="fplayer" />
        
        </div>
        <asp:TextBox ID="TextBox7" runat="server" BackColor="#FFFF99" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" Style="z-index: 700; left: 1%; top: 51%; position: absolute; width: 96%; height: 15%; vertical-align: middle; border: 15px ridge #99FF99;" ForeColor="#0000CC" meta:resourcekey="livesResource1" ViewStateMode="Enabled" Font-Bold="True" Font-Names="Kootenay" Font-Size="70%"></asp:TextBox>
        <asp:TextBox ID="points" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 49%; top: 6%; position: absolute; width: 10%;  height: 4%; " ForeColor="#FFCC00"  ReadOnly="false" Font-Size="100%">0</asp:TextBox>
        <asp:TextBox ID="treasure" runat="server" AutoPostBack="False" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" ReadOnly="True" Style="z-index: 1; left: 89%; top: 69%; position: absolute; width: 9%; height:4%; text-align:center; vertical-align:middle;" ForeColor="#FFCC00" meta:resourcekey="treasureResource1" ViewStateMode="Enabled" Font-Size="90%"></asp:TextBox>
        <asp:Label ID="Label3" runat="server" ForeColor="#FFCC00" Font-Size="100%" Style="z-index: 1; left: 56%; top: 43%; position: absolute; width: 11%; height:4%; text-align:center; vertical-align:middle;" Text="Loading ......." ClientIDMode="Static"></asp:Label>

        <audio id="sound1" src='<%=ctrl1mainsound%>' autoplay="autoplay">
        </audio>

        <a href="https://twitter.com/share" class="twitter-share-button" data-lang="en" style="text-decoration: none; position: absolute; top: 95%; left: 13%; width: 15%; height: 3%;">Tweet</a>

        <label style="position: absolute; top: 1%; left: 1%; height: 4%; color: #FFCC00; font-family: 'Jokerman LET'; font-size: 100%; font-weight: lighter;">Achievements</label>

        <label style="position: absolute; top: 33px; left: 22%; height: 4%; color: #FFCC00; font-family: 'Jokerman LET'; font-size: 100%; width: 53px;">Lives</label>

        <label style="position: absolute; top: 33px; left: 39%; height: 4%; color: #FFCC00; position: absolute; font-family: 'Jokerman LET'; font-size: 100%; width: 9%;">Gold Coins</label>

        <label style=" left: 91%; top: 62%; position: absolute; width: 6%; height:4%; text-align:center; vertical-align:middle; color: #FFCC00; font-family: 'Jokerman LET'; font-size: 70%;">Treasure( $)</label>
        <label style="position: absolute; top: 17%; left: 1%; height: 4%; color: #FFCC00; width: 10%; font-family: 'Victorian LET'; font-size: 100%;">Players</label>
         
        
        <input id="friendname" style="visibility: visible; text-decoration: none; height: 77px; background-color: transparent; color: #FFCC00; z-index: 1;position: absolute; left: 1%; top: 36%; width: 9%; height: 13%; cursor: none;" type="text" readonly="true" />
        <img alt="" src="https://treasurehunter.apphb.com/Images/landscape.jpg" style="width: 9%; height: 10%; visibility: visible; z-index: 1; left: 1%; top: 24%; position: absolute;" id="friendimage" />
        <label style="position: absolute; top: 64%; left: 1%; height: 3%; color: #FFFFFF; font-family: Script; font-size: 70%; width: 12%;">Talk to other Players</label>

        <input id="Button2" style="border: medium outset #FF00FF; background-color: #6699FF; color: #FFFFFF; z-index: 1; position: absolute; left: 30%; top: 90%; width: 5%; height: 4%; border-radius: 20%;" type="button" value="Send" onclick="send2server();" />
        <div style="z-index:1; border: 15px ridge #99FF99; position: absolute; left: 83%; top: 69%; background-color: Transparent; color: #FFCC00; width: 15%; height: 12%;"> </div>
        <div style="position: absolute; z-index: 210;position: absolute; left: 1%; top: 67%; width: 35%; height: 20%; overflow: hidden; cursor: crosshair;">
            <textarea id="Text2" class="TextArea1" style="border: 15px ridge #99FF99; position: absolute; left: 0%; top: 0%; background-color: Transparent; color: #FFCC00; width: 103%; height: 82%;" readonly="readonly"></textarea>
        </div>
        <input id="Text1" type="text" style="border: medium ridge #00CC00; position: absolute; left: 1%; top: 90%; width: 25%; height: 4%; background-color: #FFFFCC; color: #000000; right: 939px;" onkeydown="checkEnter(event);" />
        <div id="aimg" style="position: absolute; left: 11%; top: 18%; width: 25%; height: 34%;">
            <img alt="" src="https://treasurehunter.apphb.com/Images/achievements.gif" style="width: 236px; height: 188px; visibility: visible; z-index: 300; left: 0px; top: 0px; position: absolute; bottom: 10px; background-color: Transparent;" id="Img6" />
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
            <input type="text" id="playername" style="position: absolute; text-decoration: none; background-color: transparent; top: 11px; left: 20px; width: 60px; height: 47px;" />
            <img id="playerpic" style="position: absolute; background-color: transparent; top: 75px; left: 7px; height: 18px; width: 90px; font-size: 8px;" src='<%=Session["friend1pic"]%>' />
        </div>
        <label style="z-index:1000; position: absolute; top:20%; left:12%; height:5%; color: #FFCC00; position: absolute; font-size: 100%; width: 12%; font-family: 'John Handy LET';">Treasure Map</label>
        <asp:TextBox ID="attacked" runat="server" Font-Size="90%" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 41%; top: 21%; position: absolute; width: 37%; height: 5%" ForeColor="White" ReadOnly="true">  </asp:TextBox>
        <asp:TextBox ID="TextBox1" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 90%; top: 93%; position: absolute; width: 11%; height:4%; text-align:center; vertical-align:middle;" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false" Font-Names="OldDreadfulNo7 BT" Font-Size="90%">Time Remaining</asp:TextBox>
        <asp:TextBox ID="TextBox2" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 91%; top: 97%; position: absolute; width: 7%; height:4%; text-align:center; vertical-align:middle;" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false">120</asp:TextBox>
        <asp:TextBox ID="TextBox3" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 1%; top: 55%; position: absolute; width: 11%; height:4%; text-align:center; vertical-align:middle;" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false" Font-Names="Victorian LET" Font-Size="70%">Collect Coins</asp:TextBox>
        <asp:TextBox ID="TextBox4" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 14%; top: 55%; position: absolute; width: 13%; height:4%; text-align:center; vertical-align:middle;" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false" Font-Size="70%"></asp:TextBox>
        <asp:TextBox ID="TextBox5" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 1%; top: 60%; position: absolute; width: 10%; height:4%; text-align:center; vertical-align:middle;" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false" Font-Names="Victorian LET" Font-Size="70%">Conquer Players</asp:TextBox>
        <asp:TextBox ID="TextBox6" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 12%; top: 59%; position: absolute; width: 12%; height:4%; text-align:center; vertical-align:middle;" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false" Font-Size="70%"></asp:TextBox>
        <asp:TextBox ID="TextBox8" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 87%; top: 89%; position: absolute; width: 6%; height:3%; text-align:center; vertical-align:middle;" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false" Font-Names="News Gothic" Font-Size="70%">Rating</asp:TextBox>
        <asp:TextBox ID="TextBox9" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 94%; top: 89%; position: absolute; width: 6%; height:4%; text-align:center; vertical-align:middle;" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false" Font-Names="OldDreadfulNo7 BT" Font-Size="80%"></asp:TextBox>
        <asp:TextBox ID="TextBox10" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 87%; top: 17%; position: absolute; width: 13%; height:3%; text-align:center; vertical-align:middle;" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false" Font-Names="News Gothic" Font-Size="80%">Treasure Spots Owned</asp:TextBox>
        <asp:TextBox ID="TextBox11" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 91%; top: 32%; position: absolute; width: 6%; height:3%; text-align:center; vertical-align:middle;" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false" Font-Names="News Gothic" Font-Size="80%">Level</asp:TextBox>
        <asp:TextBox ID="TextBox12" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 91%; top: 37%; position: absolute; width: 6%; height:4%; text-align:center; vertical-align:middle;" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false" Text='<%=levels%>' Font-Size="80%"></asp:TextBox>
        <asp:TextBox ID="TextBox13" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 91%; top: 25%; position: absolute; width: 6%; height:4%; text-align:center; vertical-align:middle;" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false" Font-Size="80%" Text="0"></asp:TextBox>
        <asp:TextBox ID="TextBox14" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 88%; top: 44%; position: absolute; width: 13%; height:3%; text-align:center; vertical-align:middle;" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false" Font-Names="News Gothic" Font-Size="80%">Treasure Spots Collected</asp:TextBox>
        <asp:TextBox ID="TextBox15" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 90%; top: 53%; position: absolute; width: 9%; height:3%; text-align:center; vertical-align:middle;" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false" Font-Names="News Gothic" Font-Size="80%">Coins Collected</asp:TextBox>
        <asp:TextBox ID="TextBox16" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 91%; top: 47%; position: absolute; width: 6%; height:4%; text-align:center; vertical-align:middle;" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false" Font-Size="80%" Text='<%=tspotscollected%>'></asp:TextBox>
        <asp:TextBox ID="TextBox17" runat="server" BackColor="Transparent" BorderStyle="None" ClientIDMode="Static" Style="z-index: 1; left: 89%; top: 56%; position: absolute; width: 11%; height:4%; text-align:center; vertical-align:middle;" ForeColor="#FFCC00" meta:resourcekey="pointsResource1" ReadOnly="false" Font-Size="80%" Text="0" ToolTip="If in Red Color not Eligible for Prizes and Collected coins in every TreasureSpot will be lost. Buy a TreasureSpot"></asp:TextBox>

        <img id="Img7" src="https://treasurehunter.apphb.com/Images/goldcoin.gif" style="border: thin solid Transparent; left: 32%; top: 54%; position: absolute; width: 2%; height:3%; z-index: 21; visibility: visible;">
        <img id="Img8" src='<%=ctrl1mainurl%>' style="border: thin solid Transparent; left: 33%; top: 63%; position: absolute; width: 2%; height:3%; z-index: 21; visibility: visible;">
    </form>
</body>
</html>
