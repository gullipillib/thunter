<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>

<script runat="server">
    public class FacebookBuyItem
    {
        public int item_id { get; set; }
        public string title { get; set; }
        public string description { get; set; }
        public string image_url { get; set; }
        public string product_url { get; set; }
        public ulong price { get; set; }
        public string data { get; set; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Page.IsCallback == true)
        {

            // 1. Make sure facebook is authenticated
            //-------------------------------------------
            //CanvasAuthorizer auth = new CanvasAuthorizer { Permissions = new[] { "user_about_me" } };
            //if (auth.Authorize()) { sigreq = Request.Params["signed_request"]; }

            // 2. Grab the relevant CREDITS info from page POST form
            //------------------------------------------------------
            string order_info = "no info"; try { order_info = Request.Form["order_info"]; }
            catch { }
            string order_id = "no order id"; try { order_id = Request.Form["order_id"]; }
            catch { }
            Session["orderid"] = order_id;
            string method = "no method"; try { method = Request.Form["method"]; }
            catch { }

            // 3. Initial Buy request - return item info
            // ------------------------------------------------------
            if (method == "payments_get_items")
            {
                // Look up the item named 'order_info' and act accordingly
                //------------------------------------------------------------
                order_info = order_info.Substring(1, (order_info.Length - 2)); // remove the quotes

                // Code to handle your order here
                ulong credscost = 30; // Price of purchase in facebook credits

                // Construct the return item
                //------------------------------------------
                var theItem = new FacebookBuyItem()
                {
                    item_id = 1,
                    description = "Buy a Treasure Spot to be owned by you!",
                    price = credscost,
                    title = "Treasure Spot Buy!",
                    product_url = "https://treasurehunter.apphb.com/coin.html",
                    image_url = "https://treasurehunter.apphb.com/images/coin.png"
                };
                // Return the initial response to FB
                //------------------------------------------
                var res = new Dictionary<string, object>();
                res["method"] = method;
                res["order_id"] = order_id;
                res["content"] = new object[] { theItem };
                System.Web.Script.Serialization.JavaScriptSerializer jss = new System.Web.Script.Serialization.JavaScriptSerializer();
                var ob = jss.Serialize(res);
                ob = ob.Replace("#$", @"\/");
                Response.ContentType = "application/json";
                Response.Write(ob);
                Response.End();

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
                    if (status == "placed")
                    {

                        // Get Order information
                        var order_details_array = Request.Form["order_details"];
                        System.Web.Script.Serialization.JavaScriptSerializer jss = new System.Web.Script.Serialization.JavaScriptSerializer();
                        Dictionary<string, object> order_details = jss.Deserialize<Dictionary<string, object>>(order_details_array);
                        string fb_id = order_details["buyer"].ToString();
                        string credsspent = order_details["amount"].ToString();

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
                        string newstatus = "settled";

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

                        Response.End();

                    } // End 'status = placed' block

                } // End 'method = payments_status_updates' block 
            }
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:fb="https://www.facebook.com/2008/fbml">
  <head>
    <title>Treasure Spot Buy</title>
      <style type="text/css">
          #Button1 {
              z-index: 1;
              left: 730px;
              top: 19px;
              position: absolute;
              height: 30px;
          }
      </style>
  </head>
  <body style="height: 359px" onload="js_callback(data)">
    <h2>Buy Treasure Spot</h2>
    <button onclick="buy()" style="z-index: 1; left: 43px; top: 140px; position: absolute">Buy Treasure Spot Now</button>
      &nbsp;<label style="z-index: 1; left: 12px; top: 52px; position: absolute; height: 77px; width: 307px;" >You have to own atleast one&nbsp; Treasure Hunting Spot. You can later sell it for a specific price or on a bid system.<br />
      Price : $3</label>
      <a href="play.aspx" target="_self" style="position:absolute;left:739px; top:37px; width:109px; height: 18px;" > Back to Game </a> 
      <a href="creator.aspx" target="_self" style="position:absolute;left:739px; top:87px; width:109px; height: 18px;" > Go to My TSpot </a> 
      <label id="fb-ui-return-data" style="z-index: 1; left: 12px; top: 192px; position: absolute; height: 77px; width: 307px;" ></label>

    <script src="http://connect.facebook.net/en_US/all.js"></script>
    <script>
        FB.init({ appId: "123405257731200", status: true, cookie: true });

        // The dialog only opens if you've implemented the
        // Credits Callback payments_get_items.
        function buy() {
            var obj = {
                method: 'pay',
                action: 'buy_item',
                // You can pass any string, but your payments_get_items must
                // be able to process and respond to this data.
                order_info: { 'item_id': 'ts1' },
                dev_purchase_params: { 'oscif': true }
            };

            FB.ui(obj, js_callback);
        }

        // This JavaScript callback handles FB.ui's return data and differs
        // from the Credits Callbacks.
        var js_callback = function (data) {
            if (data['order_id']) {
                // Facebook only returns an order_id if you've implemented
                // the Credits Callback payments_status_update and settled
                // the user's placed order.

                // Notify the user that the purchased item has been delivered
                // without a complete reload of the game.
                write_callback_data(
                          "<br><b>Transaction Completed!</b> </br></br>"
                          + "Data returned from Facebook: </br>"
                          + "Order ID: " + data['order_id'] + "</br>"
                          + "Status: " + data['status']);

            } else if (data['error_code']) {
                // Appropriately alert the user.
                write_callback_data(
                          "<br><b>Transaction Failed!</b> </br></br>"
                          + "Error message returned from Facebook:</br>"
                          + data['error_code'] + " - "
                          + data['error_message']);
            } else {
                // Appropriately alert the user.
                write_callback_data("<br><b>Transaction failed!</b>");
            }
        };

        function write_callback_data(str) {
            document.getElementById('fb-ui-return-data').innerHTML = str;
        }
    </script>
  </body>
</html>