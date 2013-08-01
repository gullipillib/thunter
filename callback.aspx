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
	string signedrequest = "no method"; try { signedrequest = Request.Form["signed_request"]; }
        catch { }
	
	// Return the response
        System.Web.Script.Serialization.JavaScriptSerializer jss = new System.Web.Script.Serialization.JavaScriptSerializer();
                    
                    var content = new Dictionary<string, object>();
                    content["order_id"] = order_id;
                    content["status"] = status;
                    content["quantity"] = quantity;
		            content["signed_request"] = signedrequest;
                    var res = new Dictionary<string, object>();
                    res["content"] = content;
                    var ob = jss.Serialize(res);
                    ob = ob.Replace("#$", @"\/");
                    Response.ContentType = "application/json";
                    Response.Write(ob);
                    Response.Flush();
                    
                    
                    'Response.End()
        
        
       
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
