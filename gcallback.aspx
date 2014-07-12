<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage"  %>


<!DOCTYPE html>
<script runat="server">            
    protected void Page_Load(object sender, EventArgs e)
    {

        string hubmode = "no hub.mode"; try { hubmode = Request.QueryString["hub.mode"]; }
        catch { }
        string hubchallenge = "no hub.challenge"; try { hubchallenge = Request.QueryString["hub.challenge"]; }
        catch { }



        System.Web.Script.Serialization.JavaScriptSerializer jss = new System.Web.Script.Serialization.JavaScriptSerializer(); var content = new Dictionary<string, object>(); content["hub.mode"] = hubmode; content["hub.challenge"] = hubchallenge; var res = new Dictionary<string, object>(); res["content"] = content; var ob = jss.Serialize(res); ob = ob.Replace("#$", @"\/"); Response.ContentType = "application/json"; Response.Write(Request.QueryString["hub.challenge"].ToString()); 
    }</script><html><head runat="server" >   <meta name="viewport" 

content="width=device-width" />    <title></title></head><body><form>     <div>                      </div></form> </body></html>