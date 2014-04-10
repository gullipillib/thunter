<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage"  %>
<!DOCTYPE html>
<script runat="server">            
protected void Page_Load(object sender, EventArgs e)    {                       
string documentContents;
System.IO.Stream receiveStream = Request.InputStream;
System.IO.StreamReader readStream = new System.IO.StreamReader(receiveStream,Encoding.UTF8);
documentContents = readStream.ReadToEnd();
var decodedJson = documentContents.Replace("=", string.Empty).Replace('-', '+').Replace('_', '/');
    var base64JsonArray = Convert.FromBase64String(decodedJson.PadRight(decodedJson.Length + (4 - decodedJson.Length % 4) % 4, '='));
System.Text.UTF8Encoding encoding = new System.Text.UTF8Encoding();
    var json = encoding.GetString(base64JsonArray);
    var o = JObject.Parse(json);


tsitemsfulldetails = Json.Decode(o);
string order_id = tsitemsfulldetails.order_id;
string status = tsitemsfulldetails.status;
string quantity = tsitemsfulldetails.quantity;
string requestid = tsitemsfulldetails.request_id;
string paymentid = tsitemsfulldetails.payment_id;
string currency = tsitemsfulldetails.currency;
string amount = tsitemsfulldetails.amount;




        System.Web.Script.Serialization.JavaScriptSerializer jss = new System.Web.Script.Serialization.JavaScriptSerializer();                                       var content = new Dictionary<string, object>();                    content["order_id"] = order_id;                    content["status"] = status;                    content["quantity"] = quantity;                    content["request_id"] = requestid;                    content["payment_id"] = "paymentid";                    content["currency"] = currency; content["amount"] = amount;	var res = new Dictionary<string, object>();                    res["content"] = content;                    var ob = jss.Serialize(res);                    ob = ob.Replace("#$", @"\/");                   Response.ContentType = "application/json";                   Response.Write(ob);                                        Response.End();                           }</script><html><head runat="server" >    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">    <meta name="viewport" content="width=device-width" />    <title></title></head><body style="height: 170px">    <div>                      </div></body></html>