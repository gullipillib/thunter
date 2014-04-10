<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage"  %>
<!DOCTYPE html>
<script runat="server">            
protected void Page_Load(object sender, EventArgs e)    {                       
string documentContents;
System.Io.Stream receiveStream = Request.InputStream;
System.Io.StreamReader readStream = new System.Io.StreamReader(receiveStream,Encoding.UTF8)
documentContents = readStream.ReadToEnd();
var DecodedSignedRequest = FacebookSignedRequest.Parse(FacebookContext.Current.AppSecret, documentContents);
tsitemsfulldetails = Json.Decode(DecodedSignedRequest);
string hubmode = tsitemsfulldetails.hub.mode;
string hubchallenge = tsitemsfulldetails.hub.challenge;




        System.Web.Script.Serialization.JavaScriptSerializer jss = new System.Web.Script.Serialization.JavaScriptSerializer();                                       var content = new Dictionary<string, object>();                    content["hub.mode"] = hubmode;                    content["hub.challenge"] = hubchallenge;                    	var res = new Dictionary<string, object>();                    res["content"] = content;                    var ob = jss.Serialize(res);                    ob = ob.Replace("#$", @"\/");                   Response.ContentType = "application/json";                   Response.Write(ob);                                        Response.End();                           }</script><html><head runat="server" >    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">    <meta name="viewport" content="width=device-width" />    <title></title></head><body style="height: 170px">    <div>                      </div></body></html>