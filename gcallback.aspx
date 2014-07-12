<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage"  %>


<!DOCTYPE html>
<script runat="server">            
protected void Page_Load(object sender, EventArgs e)    {                       

string hubmode = "no hub.mode"; try { hubmode = Request.QueryString["hub.mode"]; } catch { }
string hubchallenge = "no hub.challenge"; try { hubchallenge = Request.QueryString["hub.challenge"]; } catch { }



        System.Web.Script.Serialization.JavaScriptSerializer jss = new System.Web.Script.Serialization.JavaScriptSerializer();                                       var content = new Dictionary<string, object>();                    content["hub.mode"] = hubmode;                    content["hub.challenge"] = hubchallenge;                    	var res = new Dictionary<string, object>();                    res["content"] = content;                    var ob = jss.Serialize(res);                    ob = ob.Replace("#$", @"\/");                   Response.ContentType = "application/json";                   Response.Write(Request.QueryString["hub.challenge"].ToString());  SqlDataSource1.SelectCommand = "SELECT * FROM tspots where tsowner ='" + Convert.ToString(Session["loggeduser"]) + "' order by tsorder DESC";
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
<noscript><img height="1" width="1" alt="" style="display:none" src="https://www.facebook.com/tr?ev=6013464447893&amp;cd[value]=0.01&amp;cd[currency]=INR&amp;noscript=1" /></noscript>  <body>     <div>                      </div></body></html>