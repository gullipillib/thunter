<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage"  %>
<!DOCTYPE html>
<script runat="server">            
protected void Page_Load(object sender, EventArgs e)    {                       

string hubmode = "no hub.mode"; try { hubmode = Request.Form["hub.mode"]; } catch { }
string hubchallenge = "no hub.challenge"; try { hubchallenge = Request.Form["hub.challenge"]; } catch { }



        System.Web.Script.Serialization.JavaScriptSerializer jss = new System.Web.Script.Serialization.JavaScriptSerializer();                                       var content = new Dictionary<string, object>();                    content["hub.mode"] = hubmode;                    content["hub.challenge"] = hubchallenge;                    	var res = new Dictionary<string, object>();                    res["content"] = content;                    var ob = jss.Serialize(res);                    ob = ob.Replace("#$", @"\/");                   Response.ContentType = "application/json";                   Response.Write(ob);                                        Response.End();                           }</script><html><head runat="server" >    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">    <meta name="viewport" content="width=device-width" />    <title></title></head><body>    <div>                      </div></body></html>