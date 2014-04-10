<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage"  %>
<!DOCTYPE html>
<script runat="server">            
protected void Page_Load(object sender, EventArgs e)    {                       
string documentContents;
dynamic tsitemsfulldetails;
System.IO.Stream receiveStream = Request.InputStream;
System.IO.StreamReader readStream = new System.IO.StreamReader(receiveStream,Encoding.UTF8);
documentContents = readStream.ReadToEnd();



tsitemsfulldetails = Json.Decode(documentContents);
string hubmode = tsitemsfulldetails.hub.mode;
string hubchallenge = tsitemsfulldetails.hub.challenge;




        System.Web.Script.Serialization.JavaScriptSerializer jss = new System.Web.Script.Serialization.JavaScriptSerializer();                                       var content = new Dictionary<string, object>();                    content["hub.mode"] = hubmode;                    content["hub.challenge"] = hubchallenge;                    	var res = new Dictionary<string, object>();                    res["content"] = content;                    var ob = jss.Serialize(res);                    ob = ob.Replace("#$", @"\/");                   Response.ContentType = "application/json";                   Response.Write(ob);                                        Response.End();                           }</script><html><head runat="server" >    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">    <meta name="viewport" content="width=device-width" />    <title></title></head><body style="height: 170px">    <div>                      </div></body></html>