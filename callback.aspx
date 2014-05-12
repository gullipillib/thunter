<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage"  %>
<!DOCTYPE html>
<script runat="server">            
protected void Page_Load(object sender, EventArgs e)    {                       


// 1. Make sure facebook is authenticated
        //-------------------------------------------
        //CanvasAuthorizer auth = new CanvasAuthorizer { Permissions = new[] { "user_about_me" } };
        //if (auth.Authorize()) { sigreq = Request.Params["signed_request"]; }

        // 2. Grab the relevant CREDITS info from page POST form
        //------------------------------------------------------

string requestid = "no request_id"; try { requestid = Request.Form["request_id"]; }
        catch { }

string quantity = "no info"; try { quantity = Request.Form["quantity"]; }
        catch { }
        
string paymentid = "no order id"; try { paymentid = Request.Form["payment_id"]; }
        catch { }
       	
string status = "no status"; try { status = Request.Form["status"]; }
        catch { }
        
string amount = "no amount"; try { amount = Request.Form["amount"]; }
        catch { }
	
	string currency = "no currency"; try { currency = Request.Form["currency"]; }
        catch { }
	
	

// Return the response
 


        System.Web.Script.Serialization.JavaScriptSerializer jss = new System.Web.Script.Serialization.JavaScriptSerializer();                                       var content = new Dictionary<string, object>();                                       content["status"] = status;                    content["quantity"] = quantity;                    content["request_id"] = requestid;                    content["payment_id"] = "paymentid";                    content["currency"] = currency; content["amount"] = amount;	var res = new Dictionary<string, object>();                    res["content"] = content;                    var ob = jss.Serialize(res);                    ob = ob.Replace("#$", @"\/");                   Response.ContentType = "application/json";                   Response.Write(ob);                                        Response.End();                           }</script><html><head runat="server" >    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">    <meta name="viewport" content="width=device-width" />    <title></title></head><body style="height: 170px">    <div>                      </div></body></html>