<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage"  %>


<!DOCTYPE html>
<script runat="server">            
protected void Page_Load(object sender, EventArgs e)    {                       

string hubmode = "no hub.mode"; try { hubmode = Request.QueryString["hub.mode"]; } catch { }
string hubchallenge = "no hub.challenge"; try { hubchallenge = Request.QueryString["hub.challenge"]; } catch { }



        System.Web.Script.Serialization.JavaScriptSerializer jss = new System.Web.Script.Serialization.JavaScriptSerializer();                                       var content = new Dictionary<string, object>();                    content["hub.mode"] = hubmode;                    content["hub.challenge"] = hubchallenge;                    	var res = new Dictionary<string, object>();                    res["content"] = content;                    var ob = jss.Serialize(res);                    ob = ob.Replace("#$", @"\/");                   Response.ContentType = "application/json";                   Response.Write(Request.QueryString["hub.challenge"].ToString());  if (results["item_name"] == "Treasure Spot Buy")
                {
                    SqlDataSource1.SelectCommand = "SELECT * FROM tspots where tsowner ='" + Convert.ToString(Session["loggeduser"]) + "' order by tsorder DESC";
                    DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

                    string tsorderno = dv[0]["tsorder"].ToString();
                    tsorderno = Convert.ToString(Convert.ToInt16(tsorderno) + 1);

                    SqlDataSource1.InsertCommand = "INSERT INTO tspots(tscompleted,tsnew,tsprice,tsselltype,tsactive,tsapproved,tsapprover1,tsapprover2,tsapprover3,tsbid,tsbidder,tsitems,tsname,tsowner,tsproductid,tsproducturl,tsreported,tsreportcomments,tsa1status,tsa2status,tsa3status,tssell,tsreportaddress,tsbiddate,tsaward,tsrplayers,tsdplayers,tsrplayersdetails,tsdplayersdetails, tspaylater, tsbidfailed, tscoowner, tsorder) Values ('no','yes','5','buy','no','no',' ',' ',' ','no',' ',' ',' ','" + Convert.ToString(Session["loggeduser"]) + "','thppbuy','paypal','no',' ',' ',' ',' ','no',' ',' ',' ',' ',' ',' ',' ', ' ', ' ', '" + Convert.ToString(Session["loggeduser"]) + "', '" + tsorderno + "'" ;
                    SqlDataSource1.Insert();
                    SqlDataSource1.SelectCommand = "SELECT lutspots,luname FROM loggedusers";
                     dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                    DataTable dt = new DataTable();
                    dt = dv.ToTable();
                    DataView uniname = dt.DefaultView;
                    string lutspots = dt.Rows[0].Field<string>("lutspots"); //usethis to get field value
                    SqlDataSource1.UpdateCommand = "UPDATE loggedusers SET luspots = '" + Convert.ToString(Convert.ToInt16(lutspots) + 1) + "' where luname='" + Convert.ToString(Session["loggeduser"]) + "'";
                    SqlDataSource1.Update();
                    Response.Redirect("~/Creator/create");
                }
                if (results["item_name"] == "Treasure Spot Bid")
                {
                    SqlDataSource1.SelectCommand = "SELECT * FROM tspots";
			
    DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
    DataTable dt = new DataTable();
    dt = dv.ToTable();
    DataView uniname = dt.DefaultView;
    if (dt.Rows.Count != 0)
    {
        string tsowner = dt.Rows[0].Field<string>("tsowner"); //usethis to get field value
        string tscoowner = dt.Rows[0].Field<string>("tscoowner"); //usethis to get field value
	if (tsowner != "TresureHunter")
{
                    SqlDataSource1.UpdateCommand = "UPDATE tspots SET tsprice = '" + results["payment_gross"] + "', tsselltype='', tsbid='no', tsbidder=' ', tsowner='" + Convert.ToString(Session["loggeduser"]) + "', tsproductid='thppbid', tsproducturl='paypal', tssell='no', tsbiddate=' ', tsaward='no', tscowner='" + Convert.ToString(Session["loggeduser"]) + "' where tspotname='" + Convert.ToString(Session["tspotname"]) + "'";
                    SqlDataSource1.Update();
                    SqlDataSource1.SelectCommand = "SELECT lutspots,luname FROM loggedusers where luname='" + Convert.ToString(Session["loggeduser"]) + "'" ;
                    dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                    dt = new DataTable();
                    dt = dv.ToTable();
                    uniname = dt.DefaultView;
                    string lutspots = dt.Rows[0].Field<string>("lutspots"); //usethis to get field value
                    SqlDataSource1.UpdateCommand = "UPDATE loggedusers SET lutspots = '" + Convert.ToString(Convert.ToInt16(lutspots) + 1) + "' where luname='" + Convert.ToString(Session["loggeduser"]) + "'";
                    SqlDataSource1.Update();
			        SqlDataSource1.SelectCommand = "SELECT lutspots,luname FROM loggedusers where luname='" + tsowner + "'" ;
                    dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                    dt = new DataTable();
                    dt = dv.ToTable();
                    uniname = dt.DefaultView;
                    lutspots = dt.Rows[0].Field<string>("lutspots"); //usethis to get field value
			        SqlDataSource1.UpdateCommand = "UPDATE loggedusers SET lutspots = '" + Convert.ToString(Convert.ToInt16(lutspots) - 1) + "' where luname='" + tsowner + "'";
                    SqlDataSource1.Update();
                    SqlDataSource1.SelectCommand = "SELECT * FROM payments";
                    SqlDataSource1.InsertCommand = "INSERT INTO payments(anount,uname) Values ('" + Convert.ToString(Convert.ToInt16(results["payment_gross"]) - 5 / 2) + "','" + Convert.ToString(Session["loggeduser"]) + "')";
                    SqlDataSource1.Insert();
                    Label1.Text = "You have purchased " + Convert.ToString(Session["tspotname"]);
                    
}
if (tsowner == "TresureHunter")
{
                    SqlDataSource1.UpdateCommand = "UPDATE tspots SET tsprice = '" + results["payment_gross"] + "', tsselltype='', tsbid='no', tsbidder=' ', tsowner='" + "treasurehunter" + "', tsproductid='thppbid', tsproducturl='paypal', tssell='no', tsbiddate=' ', tsaward='no', tscowner='" + tscoowner + ", " + Convert.ToString(Session["loggeduser"]) + "' where tspotname='" + Convert.ToString(Session["tspotname"]) + "'";
                    SqlDataSource1.Update();
                    SqlDataSource1.SelectCommand = "SELECT lutspots,luname FROM loggedusers";
                    dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                    dt = new DataTable();
                    dt = dv.ToTable();
                    uniname = dt.DefaultView;
                    string lutspots = dt.Rows[0].Field<string>("lutspots"); //usethis to get field value
                    SqlDataSource1.UpdateCommand = "UPDATE loggedusers SET lutspots = '" + Convert.ToString(Convert.ToInt16(lutspots) + 1) + "' where luname='" + Convert.ToString(Session["loggeduser"]) + "'";
                    SqlDataSource1.Update();

                    SqlDataSource1.SelectCommand = "SELECT * FROM payments";
                    SqlDataSource1.InsertCommand = "INSERT INTO payments(anount,uname) Values ('" + Convert.ToString(Convert.ToInt16(results["payment_gross"]) - 5 / 2) + "','" + Convert.ToString(Session["loggeduser"]) + "')";
                    SqlDataSource1.Insert();
                    Label1.Text = "You have purchased " + Convert.ToString(Session["tspotname"]);
                    
}

}                
}

                if (results["item_name"] == "ToolBox Item Buy")
                {
                    SqlDataSource1.SelectCommand = "SELECT * FROM toolbox  where tbowner =' " + Convert.ToString(Session["loggeduser"]) + "' order by tborder DESC";
                    DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

                    string tborderno = dv[0]["tborder"].ToString();
                    tborderno = Convert.ToString(Convert.ToInt16(tborderno) + 1);
                    SqlDataSource1.InsertCommand = "INSERT INTO toolbox(tbcompleted,tbnew,tbprice,tbselltype,tbactive,tbapproved,tbapprover1,tbapprover2,tbapprover3,tbbid,tbbidder,tbdetails,tbname,tbowner,tbinvoice,tbreported,tbreportcomments,tba1status,tba2status,tba3status,tbsell,tbreportaddress,tbbiddate,tbaward, tbimgurl, tbpaylater, tbbidfailed, tbcoowner, tborder) Values ('no','yes','5','buy','no','no',' ',' ',' ','no',' ',' ',' ','" + Convert.ToString(Session["loggeduser"]) + "','thtbbuy','no',' ',' ',' ',' ','no',' ',' ',' ',' ',' ',' ','" + Convert.ToString(Session["loggeduser"]) + "','" + tborderno + "'";
                    SqlDataSource1.Insert();
                    Response.Redirect("~/Toolbox/tools");
                }
                
                if (results["item_name"] == "ToolBox Item Bid")
                {
                    SqlDataSource1.SelectCommand = "SELECT * FROM toolbox";
                    SqlDataSource1.UpdateCommand = "UPDATE toolbox SET tbprice = '" + results["payment_gross"] + "', tbselltype='', tbbid='no', tbbidder=' ', tbowner='" + "treasurehunter" + "', tbproductid='thppbid', tbproducturl='paypal', tbsell='no', tbbiddate=' ', tbaward='no', tbcowner='" + Convert.ToString(Session["loggeduser"]) + "'  where toolboxname='" + Convert.ToString(Session["toolboxname"]) + "'";
                    SqlDataSource1.Update();
                    SqlDataSource1.SelectCommand = "SELECT * FROM payments";
                    SqlDataSource1.InsertCommand = "INSERT INTO payments(anount,uname) Values ('" + Convert.ToString(Convert.ToInt16(results["payment_gross"]) - 3 / 2) + "','" + Convert.ToString(Session["loggeduser"]) + "')";
                    SqlDataSource1.Insert();
 
                                               }</script><html><head runat="server" >   <meta name="viewport" 

content="width=device-width" />    <title></title></head><!-- Facebook Conversion Code for thbuy -->
<script>(function() {
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
window._fbq.push(['track', '6013464447893', {'value':'0.01','currency':'INR'}]);
</script>
<noscript><img height="1" width="1" alt="" style="display:none" src="https://www.facebook.com/tr?ev=6013464447893&amp;cd[value]=0.01&amp;cd[currency]=INR&amp;noscript=1" /></noscript>  <body><form>     <div>                      </div><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT * FROM tspots"></asp:SqlDataSource></form> </body></html>