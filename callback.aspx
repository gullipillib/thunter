﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage"  %>
<%@ Import Namespace="System.Data" %>  
<%@ Import Namespace="System.Data.SqlClient" %>  
<%@ Import Namespace="System.Configuration" %>  



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
        //string order_info = "no info"; try { order_info = Request.Form["order_info"]; }
        //catch { }
        string order_id = "no order id"; try { order_id = Request.Form["payment_id"]; }
        catch { }
        //Session["orderid"] = order_id;
        string method = "no method"; try { method = Request.Form["method"]; }
        catch { }

        // 3. Initial Buy request - return item info
        // ------------------------------------------------------
        if (method == "payments_get_items")
        {
            // Look up the item named 'order_info' and act accordingly
            //------------------------------------------------------------
            //order_info = order_info.Substring(1, (order_info.Length - 2)); // remove the quotes
            
            // Code to handle your order here
            //ulong credscost =  30; // Price of purchase in facebook credits

            // Construct the return item
            //------------------------------------------
            
         Response.Redirect("https://graph.facebook.com/payment_id?access_token=APP_ACCESS_TOKEN");       
            
        }

        // 4. Secondary confirmation dialog reply - handle all internal work and then return a canceled or settled status
        // ------------------------------------------------------

        else
        {
            if (method == "payments_status_update")
            {

                string status = Request.Form["status"];

                // 4a. If order is PLACED then confirm and respond with settled so FB completes transaction
                //----------------------------------------------------------------------------------------
                if (status == "completed")
                {

                    // Get Order information
                    var order_details_array = Request.Form["actions"];
                    System.Web.Script.Serialization.JavaScriptSerializer jss = new System.Web.Script.Serialization.JavaScriptSerializer();
                    Dictionary<string, object> order_details = jss.Deserialize<Dictionary<string, object>>(order_details_array);
                    string fb_id = order_details["buyer"].ToString();
                    string credsspent = order_details["amount"].ToString();

                    //Get User Information
                    var user_details_array = Request.Form["actions"];
                    Dictionary<string, object> user_details = jss.Deserialize<Dictionary<string, object>>(user_details_array);
                    string current_id = user_details["id"].ToString();
                    string currentname = user_details["name"].ToString();
                    
                    
                    // Parse Item information
                    ArrayList arrlist = (ArrayList)order_details["items"];
                    Dictionary<string, object> item_details = (Dictionary<string, object>)arrlist[0];
                    string itemid = item_details["item_id"].ToString();

                    // Create PENDING entry in your logs
                    //createLogEntry(fb_id, orderid, itemid, status); }

                    // 16-FEB-12 - CODE BELOW WAS MOVED FROM SETTLED CALLBACK DUE TO FACEBOOK UPDATES.
                    // Handle app-side functions of awarding the item
                    //bool wasAwarded = AwardTheItem(fb_id, itemid);
                    //if (wasAwarded == true) { updateLogEntry(fb_id, orderid, status); } // update PENDING entry to to SETTLED / COMPLETED
                    //else { updateLogEntry(fb_id, orderid, "Error, Item not awarded properly!"); } // Else Create ERROR log entry	

                    // mark new status as settled
                    string newstatus = "completed";

                    // Return the response
                    var content = new Dictionary<string, object>();
                    content["order_id"] = order_id;
                    content["status"] = newstatus;
                    var res = new Dictionary<string, object>();
                    res["method"] = method;
                    res["content"] = content;
                    var ob = jss.Serialize(res);
                    ob = ob.Replace("#$", @"\/");
                    Response.ContentType = "application/json";
                    Response.Write(ob);
                    
                    //update database
                    SqlDataSource1.InsertCommand = "INSERT INTO tspots(tsname, tsowner, tssell, tsbid, tsbidder, tsitems, tsapproved, tsreported, tsapprover, tsproductid, tsstatus) VALUES ('', '" + currentname + "', 'no', 'no', 'none','', 'no', 'no', '', '" + order_id + "', '" + newstatus +  "')";
                    SqlDataSource1.Insert();
                    
                    Response.End();
                     
                } // End 'status = placed' block

            } // End 'method = payments_status_updates' block 
        }
    }
</script>
<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title></title>
</head>
<body style="height: 170px">
    <div>
 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT tspots.* FROM tspots" InsertCommand="INSERT INTO tspots(tsname, tsowner, tssell, tsbid, tsbidder, tsitems, tsapproved, tsreported, tsapprover, tsproductid, tsstatus) VALUES ('', '', 'no', 'no', 'none','', 'no', 'no', '', '', '')" UpdateCommand="UPDATE tspots SET tsitems = 'none'"></asp:SqlDataSource>
               
               
    </div>
</body>
</html>
