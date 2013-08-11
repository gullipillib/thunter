<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
using System;
using System.IO;
using System.Text;
using System.Net;
using System.Web;


<!DOCTYPE html>
<script runat="server">
    
protected void Page_Load(object sender, EventArgs e)
{
if (page.IsPostBack == false)
{
//Post back to either sandbox or live
string strSandbox = "https://www.sandbox.paypal.com/cgi-bin/webscr";
string strLive = "https://www.paypal.com/cgi-bin/webscr";
HttpWebRequest req = (HttpWebRequest)WebRequest.Create(strSandbox);

//Set values for the request back
req.Method = "POST";
req.ContentType = "application/x-www-form-urlencoded";
byte[] param = Request.BinaryRead(HttpContext.Current.Request.ContentLength);
string strRequest = Encoding.ASCII.GetString(param);
strRequest += "&cmd=_notify-validate";
req.ContentLength = strRequest.Length;

//for proxy
//WebProxy proxy = new WebProxy(new Uri("http://url:port#"));
//req.Proxy = proxy;

//Send the request to PayPal and get the response
StreamWriter streamOut = new StreamWriter(req.GetRequestStream(), System.Text.Encoding.ASCII);
streamOut.Write(strRequest);
streamOut.Close();
StreamReader streamIn = new StreamReader(req.GetResponse().GetResponseStream());
string strResponse = streamIn.ReadToEnd();
streamIn.Close();

if (strResponse == "VERIFIED")
{
//check the payment_status is Completed
//check that txn_id has not been previously processed
//check that receiver_email is your Primary PayPal email
//check that payment_amount/payment_currency are correct
//process payment
Label2.Text = strResponse;
}
else if (strResponse == "INVALID")
{
//log for manual investigation
}
else
{
//log response/ipn data for manual investigation
Label2.Text = strResponse;
}
}
}


</script>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 60px; top: 15px; position: absolute" Text="PayPal Transaction Receipt"></asp:Label>
        <asp:Button ID="Button1" runat="server" style="z-index: 1; left: 451px; top: 47px; position: absolute; width: 178px" Text="Go to My Treasure Spot" />
        <asp:Label ID="Label2" runat="server" style="z-index: 1; left: 57px; top: 57px; position: absolute; width: 297px; height: 144px" Text="Label"></asp:Label>
    
    </div>
    </form>
</body>
</html>
