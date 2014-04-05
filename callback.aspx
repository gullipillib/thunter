<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage"  %>




<!DOCTYPE html>
<script runat="server">
    
    

    protected void Page_Load(object sender, EventArgs e)
    {

        

        

        // 1. Make sure facebook is authenticated
        //-------------------------------------------
        //CanvasAuthorizer auth = new CanvasAuthorizer { Permissions = new[] { "user_about_me" } };
        //if (auth.Authorize()) { sigreq = Request.Params["signed_request"]; }

        // 2. Grab the relevant CREDITS info from page POST form
        //------------------------------------------------------
        string quantity = "no info"; try { quantity = Request.Form["quantity"]; }
        catch { }
        string order_id = "no order id"; try { order_id = Request.Form["payment_id"]; }
        catch { }
       	string status = "no method"; try { status = Request.Form["status"]; }
        catch { }
        string hubverify_token = "no hub.verify_token"; try { hubverify_token = Request.Form["hub.verify_token"]; }
        catch { }
        string hubmode = "no hub.mode"; try { hubmode = Request.Form["hub.mode"]; }
        catch { }
        string hubchallenge = "no hub.challenge"; try { hubchallenge = Request.Form["hub.challenge"]; }
        catch { }
	
	// Return the response
        System.Web.Script.Serialization.JavaScriptSerializer jss = new System.Web.Script.Serialization.JavaScriptSerializer();
                    
                    var content = new Dictionary<string, object>();
                    content["order_id"] = order_id;
                    content["status"] = status;
                    content["quantity"] = quantity;
                    content["hub.verify_token"] = "hubverify_token";
                    content["hub.mode"] = hubmode;
                    content["hub.challenge"] = hubchallenge;
			

                    var res = new Dictionary<string, object>();
                    res["content"] = content;
                    var ob = jss.Serialize(res);
                    ob = ob.Replace("#$", @"\/");
                    Response.ContentType = "application/json";
                    Response.Write(ob);
                    


                    Response.End();
        
        
       
    }
</script>
<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title></title>
</head>
<body style="height: 170px">
    <div>
                  
    </div>
</body>
</html>
