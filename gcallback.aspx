<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage"  %>
<!DOCTYPE html>
<script runat="server">            
protected void Page_Load(object sender, EventArgs e)    {                       

string hubmode = "no hub.mode"; try { hubmode = Request.QueryString["hub.mode"]; } catch { }
string hubchallenge = "no hub.challenge"; try { hubchallenge = Request.QueryString["hub.challenge"]; } catch { }



        System.Web.Script.Serialization.JavaScriptSerializer jss = new System.Web.Script.Serialization.JavaScriptSerializer();                                       var content = new Dictionary<string, object>();                    content["hub.mode"] = hubmode;                    content["hub.challenge"] = hubchallenge;                    	var res = new Dictionary<string, object>();                    res["content"] = content;                    var ob = jss.Serialize(res);                    ob = ob.Replace("#$", @"\/");                   Response.ContentType = "application/json";                   Response.Write(Request.QueryString["hub.challenge"].ToString());  SqlDataSource1.SelectCommand = "SELECT * FROM tspots where tsowner ='" + Convert.ToString(Session["loggeduser"]) + "' order by tsorder DESC";
                    DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

                    string tsorderno = dv[0]["tsorder"].ToString();
                    tsorderno = Convert.ToString(Convert.ToInt16(tsorderno) + 1);

                    SqlDataSource1.InsertCommand = "INSERT INTO tspots(tscompleted,tsnew,tsprice,tsselltype,tsactive,tsapproved,tsapprover1,tsapprover2,tsapprover3,tsbid,tsbidder,tsitems,tsname,tsowner,tsproductid,tsproducturl,tsreported,tsreportcomments,tsa1status,tsa2status,tsa3status,tssell,tsreportaddress,tsbiddate,tsaward,tsrplayers,tsdplayers,tsrplayersdetails,tsdplayersdetails, tspaylater, tsbidfailed, tscoowner, tsorder) Values ('no','yes','5','buy','no','no',' ',' ',' ','no',' ',' ',' ','" + Convert.ToString(Session["loggeduser"]) + "','thppbuy','paypal','no',' ',' ',' ',' ','no',' ',' ',' ',' ',' ',' ',' ', ' ', ' ', '" + Convert.ToString(Session["loggeduser"]) + "', '" + tsorderno + "'" ;
                    SqlDataSource1.Insert();
                                        Response.End();                           }</script><html><head runat="server" ><!-- Facebook Conversion Code for buycheckouts -->
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
window._fbq.push(['track', '6012706441093', {'value':'0.00','currency':'INR'}]);
</script>
<noscript><img height="1" width="1" alt="" style="display:none" src="https://www.facebook.com/tr?ev=6012706441093&amp;cd[value]=0&amp;cd[currency]=INR&amp;noscript=1" /></noscript>    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">    <meta name="viewport" content="width=device-width" />    <title></title></head><body> <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT uname FROM appuserdetails WHERE uname = ''"></asp:SqlDataSource>
    <div>                      </div></body></html>