<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>

<!DOCTYPE html>
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        // CUSTOMIZE THIS: This is the seller's Payment Data Transfer authorization token.
        // Replace this with the PDT token in "Website Payment Preferences" under your account.
        string authToken = "oMz36ZuEADLIQazHNUU0ocNye1iXgar0ToQ8TowRZNSz7AUR_gSWn0hO7PK";
        string txToken = Request.QueryString["tx"];
        string query = "cmd=_notify-synch&tx=" + txToken + "&at=" + authToken;

        //Post back to either sandbox or live
        string strSandbox = "https://www.sandbox.paypal.com/cgi-bin/webscr";
        //string strLive = "https://www.paypal.com/cgi-bin/webscr";
        HttpWebRequest req = (HttpWebRequest)WebRequest.Create(strSandbox);

        //Set values for the request back
        req.Method = "POST";
        req.ContentType = "application/x-www-form-urlencoded";
        req.ContentLength = query.Length;


        //Send the request to PayPal and get the response
        StreamWriter streamOut = new StreamWriter(req.GetRequestStream(), System.Text.Encoding.ASCII);
        streamOut.Write(query);
        streamOut.Close();
        StreamReader streamIn = new StreamReader(req.GetResponse().GetResponseStream());
        string strResponse = streamIn.ReadToEnd();
        streamIn.Close();

        Dictionary<string, string> results = new Dictionary<string, string>();
        if (strResponse != "")
        {
            StringReader reader = new StringReader(strResponse);
            string line = reader.ReadLine();

            if (line == "SUCCESS")
            {

                while ((line = reader.ReadLine()) != null)
                {
                    results.Add(line.Split('=')[0], line.Split('=')[1]);

                }
                Response.Write("<p><h3>Your order has been received.</h3></p>");
                Response.Write("<b>Details</b><br>");
                Response.Write("<li>Name: " + results["first_name"] + " " + results["last_name"] + "</li>");
                Response.Write("<li>Item: " + results["item_name"] + "</li>");
                Response.Write("<li>Amount: " + results["payment_gross"] + "</li>");
                Response.Write("<li>user id: " + results["custom"] + "</li>");
                Response.Write("<hr>");
                if (results["item_name"] == "Treasure Spot Buy")
                {
                    AccessDataSource1.SelectCommand = "SELECT * FROM tspots";
                    AccessDataSource1.InsertCommand = "INSERT INTO tspots(tscompleted,tsnew,tsprice,tsselltype,tsactive,tsapproved,tsapprover1,tsapprover2,tsapprover3,tsbid,tsbidder,tsitems,tsname,tsowner,tsproductid,tsproducturl,tsreported,tsreportcomments,tsa1status,tsa2status,tsa3status,tssell,tsreportaddress,tsbiddate,tsaward,tsrplayers,tsdplayers,tsrplayersdetails,tsdplayersdetails, tspaylater, tsbidfailed, tscoowner) Values ('no','yes','5','buy','no','no',' ',' ',' ','no',' ',' ',' ','" + Convert.ToString(Application["loggeduser"]) + "','thppbuy','paypal','no',' ',' ',' ',' ','no',' ',' ',' ',' ',' ',' ',' ', ' ', ' ', '" + Convert.ToString(Application["loggeduser"]) + "'" )";
                    AccessDataSource1.Insert();
                    AccessDataSource1.SelectCommand = "SELECT lutspots,luname FROM loggedusers";
                    DataView dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
                    DataTable dt = new DataTable();
                    dt = dv.ToTable();
                    DataView uniname = dt.DefaultView;
                    string lutspots = dt.Rows[0].Field<string>("lutspots"); //usethis to get field value
                    AccessDataSource1.UpdateCommand = "UPDATE loggedusers SET luspots = '" + Convert.ToString(Convert.ToInt16(lutspots) + 1) + "' where luname='" + Convert.ToString(Application["loggeduser"]) + "'";
                    AccessDataSource1.Update();
                    Response.Redirect("~/Creator/create");
                }
                if (results["item_name"] == "Treasure Spot Bid")
                {
                    AccessDataSource1.SelectCommand = "SELECT * FROM tspots";
			
    DataView dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
    DataTable dt = new DataTable();
    dt = dv.ToTable();
    DataView uniname = dt.DefaultView;
    if (dt.Rows.Count != 0)
    {
        string tsowner = dt.Rows[0].Field<string>("tsowner"); //usethis to get field value
        string tscoowner = dt.Rows[0].Field<string>("tscoowner"); //usethis to get field value
	if (tsowner != "TresureHunter")
{
                    AccessDataSource1.UpdateCommand = "UPDATE tspots SET tsprice = '" + results["payment_gross"] + "', tsselltype='', tsbid='no', tsbidder=' ', tsowner='" + Convert.ToString(Application["loggeduser"]) + "', tsproductid='thppbid', tsproducturl='paypal', tssell='no', tsbiddate=' ', tsaward='no', tscowner='" + Convert.ToString(Application["loggeduser"]) + "' where tspotname='" + Convert.ToString(Application["tspotname"]) + "'";
                    AccessDataSource1.Update();
                    AccessDataSource1.SelectCommand = "SELECT lutspots,luname FROM loggedusers where luname='" + Convert.ToString(Application["loggeduser"]) + "'" ;
                    dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
                    dt = new DataTable();
                    dt = dv.ToTable();
                    uniname = dt.DefaultView;
                    string lutspots = dt.Rows[0].Field<string>("lutspots"); //usethis to get field value
                    AccessDataSource1.UpdateCommand = "UPDATE loggedusers SET lutspots = '" + Convert.ToString(Convert.ToInt16(lutspots) + 1) + "' where luname='" + Convert.ToString(Application["loggeduser"]) + "'";
                    AccessDataSource1.Update();
			        AccessDataSource1.SelectCommand = "SELECT lutspots,luname FROM loggedusers where luname='" + tsowner + "'" ;
                    dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
                    dt = new DataTable();
                    dt = dv.ToTable();
                    uniname = dt.DefaultView;
                    lutspots = dt.Rows[0].Field<string>("lutspots"); //usethis to get field value
			        AccessDataSource1.UpdateCommand = "UPDATE loggedusers SET lutspots = '" + Convert.ToString(Convert.ToInt16(lutspots) - 1) + "' where luname='" + tsowner + "'";
                    AccessDataSource1.Update();
                    AccessDataSource1.SelectCommand = "SELECT * FROM payments";
                    AccessDataSource1.InsertCommand = "INSERT INTO payments(anount,uname) Values ('" + Convert.ToString(Convert.ToInt16(results["payment_gross"]) - 5 / 2) + "','" + Convert.ToString(Application["loggeduser"]) + "')";
                    AccessDataSource1.Insert();
                    Label1.Text = "You have purchased " + Convert.ToString(Application["tspotname"]);
                    
}
if (tsowner == "TresureHunter")
{
                    AccessDataSource1.UpdateCommand = "UPDATE tspots SET tsprice = '" + results["payment_gross"] + "', tsselltype='', tsbid='no', tsbidder=' ', tsowner='" + "TreasureHunter" + "', tsproductid='thppbid', tsproducturl='paypal', tssell='no', tsbiddate=' ', tsaward='no', tscowner='" + tscoowner + ", " + Convert.ToString(Application["loggeduser"]) + "' where tspotname='" + Convert.ToString(Application["tspotname"]) + "'";
                    AccessDataSource1.Update();
                    AccessDataSource1.SelectCommand = "SELECT lutspots,luname FROM loggedusers";
                    dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
                    dt = new DataTable();
                    dt = dv.ToTable();
                    uniname = dt.DefaultView;
                    string lutspots = dt.Rows[0].Field<string>("lutspots"); //usethis to get field value
                    AccessDataSource1.UpdateCommand = "UPDATE loggedusers SET lutspots = '" + Convert.ToString(Convert.ToInt16(lutspots) + 1) + "' where luname='" + Convert.ToString(Application["loggeduser"]) + "'";
                    AccessDataSource1.Update();

                    AccessDataSource1.SelectCommand = "SELECT * FROM payments";
                    AccessDataSource1.InsertCommand = "INSERT INTO payments(anount,uname) Values ('" + Convert.ToString(Convert.ToInt16(results["payment_gross"]) - 5 / 2) + "','" + Convert.ToString(Application["loggeduser"]) + "')";
                    AccessDataSource1.Insert();
                    Label1.Text = "You have purchased " + Convert.ToString(Application["tspotname"]);
                    
}

}                
}

                if (results["item_name"] == "ToolBox Item Buy")
                {
                    AccessDataSource1.SelectCommand = "SELECT * FROM toolbox";
                    AccessDataSource1.InsertCommand = "INSERT INTO toolbox(tbcompleted,tbnew,tbprice,tbselltype,tbactive,tbapproved,tbapprover1,tbapprover2,tbapprover3,tbbid,tbbidder,tbdetails,tbname,tbowner,tbinvoice,tbreported,tbreportcomments,tba1status,tba2status,tba3status,tbsell,tbreportaddress,tbbiddate,tbaward, tbimgurl, tbpaylater, tbbidfailed, tbcoowner) Values ('no','yes','5','buy','no','no',' ',' ',' ','no',' ',' ',' ','" + Convert.ToString(Application["loggeduser"]) + "','thtbbuy','no',' ',' ',' ',' ','no',' ',' ',' ',' ',' ',' ','" + Convert.ToString(Application["loggeduser"]) + "'")";
                    AccessDataSource1.Insert();
                    Response.Redirect("~/Toolbox/tools");
                }
                
                if (results["item_name"] == "ToolBox Item Bid")
                {
                    AccessDataSource1.SelectCommand = "SELECT * FROM toolbox";
                    AccessDataSource1.UpdateCommand = "UPDATE toolbox SET tbprice = '" + results["payment_gross"] + "', tbselltype='', tbbid='no', tbbidder=' ', tbowner='" + "TreasureHunter" + "', tbproductid='thppbid', tbproducturl='paypal', tbsell='no', tbbiddate=' ', tbaward='no', tbcowner='" + Convert.ToString(Application["loggeduser"]) + "'  where toolboxname='" + Convert.ToString(Application["toolboxname"]) + "'";
                    AccessDataSource1.Update();
                    AccessDataSource1.SelectCommand = "SELECT * FROM payments";
                    AccessDataSource1.InsertCommand = "INSERT INTO payments(anount,uname) Values ('" + Convert.ToString(Convert.ToInt16(results["payment_gross"]) - 3 / 2) + "','" + Convert.ToString(Application["loggeduser"]) + "')";
                    AccessDataSource1.Insert();
                    Label1.Text = "You have purchased " + Convert.ToString(Application["toolboxname"]);
                }
                
                }
            else if (line == "FAIL")
            {
                // Log for manual investigation
                Response.Write("Unable to retrive transaction detail");
            }
        }
        else
        {
            //unknown error
            Response.Write("ERROR");
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Home/Index1");
    }
</script>


<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
   <asp:AccessDataSource id="AccessDataSource1" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT uname FROM appuserdetails WHERE uname = ''"> </asp:AccessDataSource>


	    <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 346px; top: 21px; position: absolute; width: 453px" Text="Label"></asp:Label>


	    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="z-index: 1; left: 827px; top: 17px; position: absolute" Text="Home" />


	<div>
    
    	</div>
    </form>
</body>
</html>
