<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>


<!DOCTYPE html>
<script runat="server">
System.Net.WebClient webClient = new System.Net.WebClient();
string mytoken = "";
string permanenttoken = "";
string tempstring = "";
string myid = "";
string receiptno = "";

protected void checkusername()
{
    Hiddenfield1.Value = Model.Name;
    if (Hiddenfield1.Value != null)
    {
       
    }
    else
    {
        Response.Redirect("http://apps.facebook.com/gullipilli");
    }
}

protected void Page_Load(object sender, EventArgs e)
{
    checkusername();
}

protected void Button1_Click(object sender, EventArgs e)
{




    //application token
    permanenttoken = webClient.DownloadString("https://graph.facebook.com/oauth/access_token?client_id=123405257731200&format=json&client_secret=8037ae43536685123303ddc326c3ac63&grant_type=client_credentials");
    //application token
    //Read json product receipt
    tempstring = webClient.DownloadString("https://graph.facebook.com/100000589342864/payment_transactions?request_id=abcd1002&" + permanenttoken);
    //access_token=123405257731200|_AphXktFrrV_7aQ1PKX8iKqUNwA
    Newtonsoft.Json.JsonTextReader myreader2 = new Newtonsoft.Json.JsonTextReader(new System.IO.StringReader(tempstring));

    while (myreader2.Read())
    {

        if ((string)myreader2.Value == "id")
        {
            myreader2.Read();
            TextBox1.Text = (string)myreader2.Value;
            break;
        }

    }

    Newtonsoft.Json.JsonTextReader myreader3 = new Newtonsoft.Json.JsonTextReader(new System.IO.StringReader(tempstring));

    while (myreader3.Read())
    {

        if ((string)myreader3.Value == "status")
        {
            myreader3.Read();
            
            HiddenField3.Value = (string)myreader3.Value;
            break;
        }

    }

    Newtonsoft.Json.JsonTextReader myreader4 = new Newtonsoft.Json.JsonTextReader(new System.IO.StringReader(tempstring));

    while (myreader4.Read())
    {

        if ((string)myreader4.Value == "product")
        {
            myreader4.Read();
            HiddenField2.Value = (string)myreader4.Value;
            break;
        }

    }




}


protected void Button2_Click(object sender, EventArgs e)
{
    Label2.Text = "You have to buy a treasurespot and then get receipt to go and create treasure spot!";
    if (HiddenField3.Value == "completed" & HiddenField2.Value == @"https:\/\/treasurehunter.apphb.com\/coin.html") ;
    {
        Response.Redirect("creator.aspx");
    }
}

</script>
<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>buy</title>

    <script type="text/javascript" src="http://code.jquery.com/jquery-2.0.0.min.js">
    </script>
    <script>
        $(document).ready(function () {
            $('#orderno').val('1');
            $('#orderno').change();
            $('#orderno').focus();

        })
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <div style="position: absolute; border: medium solid #000000; top: 128px; left: 10px; width: 360px; height: 310px;">
            <h2 style="width: 207px; position: absolute; top: 13px; left: 77px;">Buy Treasure Spot</h2>
            <button onclick="buy()" style="z-index: 1; left: 42px; top: 156px; position: absolute">By Payment System </button>
            <button onclick="earn_currency()" style="z-index: 1; left: 64px; top: 223px; position: absolute">By Promotions </button>

            <label style="z-index: 1; left: 12px; top: 47px; position: absolute; height: 77px; width: 307px;">
                You have to own atleast one&nbsp; Treasure Hunting Spot. You can later sell it for a specific price or on a bid system.<br />
                Price : $3
            </label>
            <img alt="" src="../../Images/coin.png" style="z-index: 1; left: 11px; top: 5px; position: absolute" />
            <label id="fb-ui-return-data" style="position: absolute; top: 269px; width: 306px; left: 9px; height: 31px;"></label>
            <asp:Label ID="Label3" runat="server" Style="z-index: 1; left: 28px; top: 131px; position: absolute; width: 218px" Text="Buy a New Treasure Spot Now " Font-Bold="True"></asp:Label>
            <asp:Label ID="Label4" runat="server" Style="z-index: 1; left: 122px; top: 199px; position: absolute; height: 16px; width: 20px" Text="or"></asp:Label>
        </div>
        <button onclick="buybid()" style="z-index: 1; left: 518px; top: 248px; position: absolute; width: 62px;">Buy Now</button>
        <div style="position: absolute; border: medium solid #000000; top: 128px; left: 381px; width: 396px; height: 310px;">
            <h2 style="width: 319px; position: absolute; top: 12px; left: 55px;">Buy A Bid/Sale Treasure Spot</h2>
            <img alt="" src="../../Images/bid.png" style="z-index: 1; left: 4px; top: 12px; position: absolute; right: 308px;" />
            <label style="z-index: 1; left: 20px; top: 83px; position: absolute; height: 18px; width: 289px; bottom: 200px;">Your Bid or Sale has been approved buy now</label>
            <label id="fb-ui-return-data2" style="position: absolute; top: 192px; width: 306px; left: 20px; height: 95px;"></label>

        </div>
        <a href="intro.aspx" target="_self" style="position: absolute; left: 45px; top: 67px; width: 109px; height: 18px;">Back to Game </a>

        <script src="https://connect.facebook.net/en_US/all.js"></script>
        <script>
            var itemno = "";
            FB.init({ appId: "123405257731200", status: true, cookie: true });

            // The dialog only opens if you've implemented the
            // Credits Callback payments_get_items.
            function buy() {
                var obj = {
                    method: 'pay',
                    action: 'purchaseitem',
                    product: 'https://treasurehunter.apphb.com/coin.html',
                    request_id: 'abcd1002'
                };
                itemno = "ts1";
                FB.ui(obj, js_callback);
            }

            function buybid() {

                var obj = {
                    method: 'pay',
                    action: 'purchaseitem',
                    product: 'https://treasurehunter.apphb.com/coin.html',
                    request_id: 'abcd1002'
                };
                itemno = "ts2";
                FB.ui(obj, js_callback);
            }

            function earn_currency() {
                var obj = {
                    method: 'pay',
                    action: 'earn_currency',
                    product: 'https://treasurehunter.apphb.com/coin.html',
                    request_id: 'abcd1002'
                };

                itemno = "ts2";
                FB.ui(obj, js_callback);
            }

            //https://www.facebook.com/dialog/pay?app_id=YOUR_APP_ID&redirect_uri=YOUR_REDIRECT_URI&action=buy_item&order_info=SOME_DEV_JSON_ORDER_INFO&dev_purchase_params={"oscif":true}    
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
                }

                else {
                    // Appropriately alert the user.
                    write_callback_data("<br><b>Transaction failed!</b>");
                }
            }

            function write_callback_data(str) {
                if (itemno == "ts1") {
                    document.getElementById('fb-ui-return-data').innerText = str;

                }

                if (itemno == "ts2") {
                    document.getElementById('fb-ui-return-data2').innerText = str;
                }

            }
        </script>

        <h1 style="width: 259px; position: absolute; top: 19px; left: 357px; font-weight: bold; font-size: 30px; color: #0000FF;">&nbsp;Treasure Hunter</h1>

        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Style="z-index: 1; left: 172px; top: 65px; position: absolute" Text="Get Your Receipt" />



        <asp:TextBox ID="orderno" runat="server" ClientIDMode="Static" Style="z-index: 1; left: 695px; top: 33px; position: absolute" ReadOnly="True"></asp:TextBox>



        <asp:TextBox ID="TextBox1" runat="server" Style="z-index: 1; left: 447px; top: 70px; position: absolute; width: 165px; height: 20px"></asp:TextBox>



        <asp:TextBox ID="TextBox2" runat="server" Style="z-index: 1; left: 24px; top: 30px; position: absolute; width: 268px" ReadOnly="True"></asp:TextBox>



        <asp:Label ID="Label1" runat="server" Style="z-index: 1; left: 333px; top: 70px; position: absolute" Text="Your Receipt No"></asp:Label>



        <asp:HiddenField ID="HiddenField2" runat="server" />



        <asp:HiddenField ID="HiddenField3" runat="server" />
        <asp:Label ID="Label2" runat="server" Style="z-index: 1; left: 25px; top: 99px; position: absolute; width: 371px"></asp:Label>
        <asp:Button ID="Button2" runat="server" Style="z-index: 1; left: 643px; top: 65px; position: absolute; width: 174px" Text="Go to my Treasure Spot" OnClick="Button2_Click" />



        <asp:TextBox ID="TextBox3" runat="server" Style="z-index: 1; left: 21px; top: 498px; position: absolute; width: 734px"></asp:TextBox>

      
            <asp:HiddenField ID="Hiddenfield1" runat="server"></asp:HiddenField>
        

    </form>

</body>
</html>
