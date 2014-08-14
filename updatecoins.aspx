<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>

<!DOCTYPE html>
<script runat="server">
    public static System.Timers.Timer timer = new System.Timers.Timer(20000); // This will raise the event every one minute.
    
    string Hiddenfield1;
    string HiddenField2;
    string HiddenField3;
    string HiddenField4;
    string HiddenField5;
    protected void checkusername()
    {
        Hiddenfield1 = Convert.ToString(Session["loggeduser"]);
        HiddenField4 = Convert.ToString(Session["loggeduserid"]);
        HiddenField5 = Convert.ToString(Session["loggeduserurl"]);
        Hiddenfield1 = Hiddenfield1.Replace(" ", "");
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
                SqlDataSource1.InsertCommand = "INSERT INTO loggedusers(luname, luid, luposition, luimg, luspriteimg, lucrisboos, luloggedin, lutspots, lulogintimes, luinvites) VALUES ('" + Hiddenfield1 + "', '" + HiddenField4 + "', '{left : 0, top:0}', '" + HiddenField5 + "', '" + HiddenField5 + "', '100', 'yes', '0', '0', '0')";
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

            Response.Redirect("https://treasurehunter.apphb.com/Home/Index1");
        }

    }

    public void startupdatecoins(object sender, System.Timers.ElapsedEventArgs e)
    {
        Response.Redirect("https://treasurehunter.apphb.com/Home/Index1");    
    }
    
    string paidname = "";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Page.IsPostBack == false)
        {
            timer.Enabled = true;
            timer.Elapsed += new System.Timers.ElapsedEventHandler(startupdatecoins);
            checkusername();
            
            SqlDataSource2.SelectCommand = "SELECT * FROM appuserdetails WHERE (uname = '" + Hiddenfield1 + "')";
            DataView dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
		dt = dv.ToTable();
            paidname = dt.Rows[0].Field<string>("paid"); //usethis to get field value
            if (Request.QueryString["coins"] != null)
            {

                if (paidname == "yes")
                {

                    string goldcoins = Request.QueryString["coins"].ToString();
                    string levels = Request.QueryString["levels"].ToString();
                    string tscollected = Request.QueryString["tscollected"].ToString();
                    SqlDataSource1.SelectCommand = "SELECT lucrisboos FROM loggedusers where luname='" + Hiddenfield1 + "'";
                    SqlDataSource1.UpdateCommand = "UPDATE loggedusers SET luloggedin='yes', lucrisboos='" + goldcoins + "' where luname='" + Hiddenfield1 + "'";

                    SqlDataSource1.Update();
                    SqlDataSource2.SelectCommand = "SELECT * FROM appuserdetails where uname='" + Hiddenfield1 + "'";
                    SqlDataSource2.UpdateCommand = "UPDATE appuserdetails SET levels='" + levels + "'," + "tspotscollected='" + tscollected + "'" + "'," + "logindate='" + System.DateTime.Now.Date + "'," + "logintime='" + System.DateTime.Now.TimeOfDay + "'" + " where uname='" + Hiddenfield1 + "'";

                    Response.Redirect("https://treasurehunter.apphb.com/Home/Index1");
                }
                else if (paidname != "yes")
                {
                    string goldcoins = Request.QueryString["coins"].ToString();
                    string levels = Request.QueryString["levels"].ToString();
                    string tscollected = Request.QueryString["tscollected"].ToString();
                    SqlDataSource2.SelectCommand = "SELECT * FROM appuserdetails where uname='" + Hiddenfield1 + "'";
                    SqlDataSource2.UpdateCommand = "UPDATE appuserdetails SET tempgoldcoins='" + goldcoins + "'," + "levels='" + levels + "'," + "tspotscollected='" + tscollected + "'," + "logindate='" + System.DateTime.Now.Date + "'," + "logintime='" + System.DateTime.Now.TimeOfDay + "'" + " where uname='" + Hiddenfield1 + "'";

                    SqlDataSource2.Update();
                    Response.Redirect("https://treasurehunter.apphb.com/Home/Index1");
                }
            }
        }
    }
</script>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title></title>
</head>

<body style="background-color:black;">
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT * FROM loggedusers" UpdateCommand="UPDATE loggedusers SET luloggedin='yes', lucrisboos='0'"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT * FROM appuserdetails" UpdateCommand="UPDATE appuserdetails SET tempgoldcoins=''" ></asp:SqlDataSource>
    <div style="width: 438px; height: 300px; z-index: 1000; left: 359px; top: 147px; position: absolute; background-color: #669999;" id="showwinner">
            <img id="Img9" src="https://treasurehunter.apphb.com/Images/goldshower.gif" style="border: thin solid Transparent; width: 422px; height: 200px; top: 5px; left: 6px; z-index: 1011; right: 6px; bottom: 91px; position: absolute;" />
            <button id="Button11" style="z-index: 1001; border-radius: 10px; text-align: center; vertical-align: middle; border: medium outset #FFFF00; position: absolute; width: 110px; height: 37px; background-color: #FF00FF; color: #FFFFFF; top: 234px; left: 305px;">Back to Game</button>
            <asp:Label ID="Label22" runat="server" Style="z-index: 1001; left: 19px; top: 217px; position: absolute; vertical-align: middle; text-align: center; width: 229px; margin-top: 0px;" Text="Congratulations You Have conquered this TreasureSpot. Keep Playing." ForeColor="White" Font-Bold="True" Font-Names="Broadway BT"></asp:Label>
        </div>    
    </form>
    
</body>
</html>
