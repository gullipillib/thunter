<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

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
    
      <form id="form1" runat="server">
    
    <div id="buyspot" style="position: absolute; border: medium solid #000000; top: 60px; left: 10px; width: 360px; height: 310px;"> 
      <h2 style="width: 255px; position: absolute; top: 13px; left: 60px;">Buy New Treasure Spot</h2>
        <button onclick="buy()" style="z-index: 1; left: 43px; top: 170px; position: absolute">Buy a New Treasure Spot Now</button>
      <label style="z-index: 1; left: 12px; top: 63px; position: absolute; height: 77px; width: 307px;" >You have to own atleast one&nbsp; Treasure Hunting Spot. You can later sell it for a specific price or on a bid system.<br />
      Price : $3</label>
        <img alt="" src="Images/coin.png" style="z-index: 1; left: 11px; top: 5px; position: absolute" /></div>

      <a href="index.cshtml" target="_self" style="position:absolute;left:739px; top:37px; width:109px; height: 18px;" > Back to Game </a> 
      <a href="creator.aspx" target="_self" style="position:absolute;left:739px; top:87px; width:109px; height: 18px; visibility: hidden;" id="creator" > Go to My TSpot </a> 
      <label id="fb-ui-return-data" style="z-index: 1; left: 32px; top: 282px; position: absolute; height: 77px; width: 307px;" ></label>

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
            document.getElementById('fb_item_id').innerText = 'ts1';
            FB.ui(obj, js_callback);
        }

        function buybid() {
            var obj = {
                method: 'pay',
                action: 'buy_item',
                // You can pass any string, but your payments_get_items must
                // be able to process and respond to this data.
                order_info: { 'item_id': 'ts2' },
                dev_purchase_params: { 'oscif': true }
            };
            document.getElementById('fb_item_id').innerText = 'ts2';
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
                if (document.getElementById('fb-ui-return-data').innerText != "Transaction failed!") {
                    document.getElementById('creator').href.concat("?orderid=").concat(data['order_id']);
                    document.getElementById('creator').style.visibility = "visible";
                }

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
          <asp:Label ID="fb_item_id" runat="server" ClientIDMode="Static" style="z-index: 1; left: 419px; top: 24px; position: absolute; width: 164px" Text="Label"></asp:Label>
          <asp:Panel ID="Panel1" runat="server" style="z-index: 1; left: 390px; top: 65px; position: absolute; height: 299px; width: 325px">
              <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 65px; top: 13px; position: absolute; width: 238px;" Text="Buy Bid/Sale Treasure Spot" Font-Bold="True" Font-Size="15pt"></asp:Label>
              <asp:Image ID="Image1" runat="server" ImageUrl="Images/bid.png" style="z-index: 1; left: 6px; top: 4px; position: absolute" />
              <button onclick="buybid()" style="z-index: 1; left: 37px; top: 170px; position: absolute">
                  Buy Now Treasure Spot
              </button>
          </asp:Panel>
      </form>
  </body>
</html>