<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" EnableViewState="true" AutoEventWireup="true" %>

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

string username = "";
string logintimes = "";
string tspots = "";
string invites = "";
string reset = "";
string btspots = "";

string Hiddenfield1;
string HiddenField2;
string HiddenField3;
string HiddenField4;
string HiddenField5;

protected void checkusername()
{
    Hiddenfield1 = Convert.ToString(Session["loggeduser"]);
    HiddenField4 = Convert.ToString(Session["loggeduserid"]);
    HiddenField5 = Convert.ToString(Session["loggeduserurl"]);
    Hiddenfield1 = Hiddenfield1.Replace(" ", "");
    if (Hiddenfield1 != null)
    {

        //Insert User into appuser,loggeduser,ordercounter,treasureprize;
        SqlDataSource1.SelectCommand = "SELECT uname FROM appuserdetails WHERE (uname = '" + Hiddenfield1 + "')";

        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        DataTable dt = new DataTable();
        dt = dv.ToTable();
        //DataTable dtr = dt;
        //DataRow[] uniname = dtr.Select("uname");
        //username = dt.Rows[0].Field<string>("uname"); usethis to get field value
        //Label3.Text = dt.Rows[0][0].ToString();
        if (dt.Rows.Count == 0)
        {
            //Insert User into appuser,loggeduser,ordercounter,winners;
            SqlDataSource1.InsertCommand = "INSERT INTO appuserdetails(uname, uloggedin, winner, wintimes, paid, amount, currenttspot) VALUES ('" + Hiddenfield1 + "', 'no', 'no', '0', 'no', '0', '')";
            SqlDataSource1.Insert();
            SqlDataSource1.SelectCommand = "SELECT * FROM loggedusers";
            SqlDataSource1.InsertCommand = "INSERT INTO loggedusers(luname, luid, luposition, luimg, luspriteimg, lucrisboos, luloggedin, lutspots, lulogintimes, luinvites) VALUES ('" + Hiddenfield1 + "', '" + HiddenField4 + "', '{left : 0, top:0}', '" + HiddenField5 + "', '" + HiddenField5 + "', '100', 'yes', '0', '0', '0')";
            SqlDataSource1.Insert();
            SqlDataSource1.SelectCommand = "SELECT * FROM ordercounter";
            SqlDataSource1.InsertCommand = "INSERT INTO ordercounter(uname, ccounter) Values ('" + Hiddenfield1 + "','0')";
            SqlDataSource1.Insert();
            SqlDataSource1.SelectCommand = "SELECT * FROM winners";
            SqlDataSource1.InsertCommand = "INSERT INTO winners(uname, crisboos) Values ('" + Hiddenfield1 + "','0')";
            SqlDataSource1.Insert();
        }

    }
    else
    {

        Response.Redirect("~/Home/Index1");
    }
    
}



protected void Page_Load(object sender, EventArgs e)
{
    if (Convert.ToString(Session["tspotprice"]) == "")
    {
        Session["tspotprice"] = "10000";  
    }

    if (Convert.ToString(Session["tbprice"]) == "")
    {
        Session["tbprice"] = "10000";
    }


    checkusername();
    
    Label8.Text = Convert.ToString(Session["tbprice"]);
    Label10.Text = Convert.ToString(Session["toolboxname"]);
    Label13.Text = Convert.ToString(Session["tspotname"]);
    Label14.Text = Convert.ToString(Session["tspotprice"]);
    
    SqlDataSource1.SelectCommand = "SELECT lulogintimes, luloggedin, lutspots FROM loggedusers";
    DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
    DataTable dt = new DataTable();
    dt = dv.ToTable();
    DataView uniname = dt.DefaultView;
    if (dt.Rows.Count != 0)
    {
        logintimes = dt.Rows[0].Field<string>("lulogintimes"); //usethis to get field value
        btspots = dt.Rows[0].Field<string>("lutspots"); //usethis to get field value

        if (btspots == "0")
        {
            Hyperlink1.Enabled = false;
        }

        if (btspots != "0")
        {
            Hyperlink1.Enabled = true;

        }
    }
       
    SqlDataSource1.SelectCommand = "SELECT ccounter, uname  FROM ordercounter where uname ='" + Hiddenfield1 + "'";
    dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
    dt = new DataTable();
    dt = dv.ToTable();
    uniname = dt.DefaultView;
    if (dt.Rows.Count != 0)
    {
        string ccounter = dt.Rows[0].Field<string>("ccounter"); //usethis to get field value
        orderno.Text = ccounter;
    }
}

protected void Button1_Click(object sender, EventArgs e)
{


    try
    {

        //application token
        permanenttoken = webClient.DownloadString("https://graph.facebook.com/oauth/access_token?client_id=123405257731200&format=json&client_secret=8037ae43536685123303ddc326c3ac63&grant_type=client_credentials");
        //application token
        //Read json product receipt
        tempstring = webClient.DownloadString("https://graph.facebook.com/100000589342864/payment_transactions?request_id=" + orderno.Text + "&" + permanenttoken);
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

                HiddenField3 = (string)myreader3.Value;
                break;
            }

        }

        Newtonsoft.Json.JsonTextReader myreader4 = new Newtonsoft.Json.JsonTextReader(new System.IO.StringReader(tempstring));

        while (myreader4.Read())
        {

            if ((string)myreader4.Value == "product")
            {
                myreader4.Read();
                HiddenField2 = (string)myreader4.Value;
                break;
            }

        }

    }
    catch
    {
    }


}


protected void Button2_Click(object sender, EventArgs e)
{
    if (HiddenField3 == "completed" & HiddenField2 == "https://treasurehunter.apphb.com/coin.html") 
    {
        SqlDataSource1.SelectCommand = "SELECT * FROM tspots";
        SqlDataSource1.InsertCommand = "INSERT INTO tspots(tscompleted,tsnew,tsprice,tsselltype,tsactive,tsapproved,tsapprover1,tsapprover2,tsapprover3,tsbid,tsbidder,tsitems,tsname,tsowner,tsproductid,tsproducturl,tsreported,tsreportcomments,tsa1status,tsa2status,tsa3status,tssell,tsreportaddress,tsbiddate,tsaward,tsrplayers,tsdplayers,tsrplayersdetails,tsdplayersdetails) Values ('no','yes','5','buy','no','no',' ',' ',' ','no',' ',' ',' ','" + Hiddenfield1 + "','thbuy','" + HiddenField2 + "','no',' ',' ',' ',' ','no',' ',' ',' ',' ',' ',' ',' ')";
        SqlDataSource1.Insert();
        SqlDataSource1.SelectCommand = "SELECT * FROM ordercounter";
        SqlDataSource1.UpdateCommand = "UPDATE ordercounter SET ccounter = '" + Convert.ToString(Convert.ToInt16(orderno.Text) + 1) + "' where uname='" + Hiddenfield1 + "'";
        SqlDataSource1.Update();
        orderno.Text = Convert.ToString(Convert.ToInt16(orderno.Text) + 1);
        SqlDataSource1.SelectCommand = "SELECT lutspots,luname FROM loggedusers";
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        DataTable dt = new DataTable();
        dt = dv.ToTable();
        DataView uniname = dt.DefaultView;
        string lutspots = dt.Rows[0].Field<string>("lutspots"); //usethis to get field value
        SqlDataSource1.UpdateCommand = "UPDATE loggedusers SET luspots = '" + Convert.ToString(Convert.ToInt16(lutspots) + 1) + "' where luname='" + Hiddenfield1 + "'";
        SqlDataSource1.Update();
        Response.Redirect("~/create.aspx");
    }
}



protected void Button3_Click(object sender, EventArgs e)
{
    SqlDataSource1.SelectCommand = "SELECT * FROM tspots where tsowner ='" + Hiddenfield1 + "' order by tsorder DESC";
    SqlDataSource1.UpdateCommand = "UPDATE loggedusers SET lutspots = '" + "1" + ", lubuylater='yes'" + "' where luname='" + Hiddenfield1 + "'";
    SqlDataSource1.Update();
}
</script>
<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>buy</title>
    <style type="text/css">
        #Button3 {
            z-index: 1;
            left: 193px;
            top: 176px;
            position: absolute;
            height: 28px;
        }
        #orderno1 {
            z-index: 1;
            left: 43px;
            top: -788px;
            position: absolute;
            width: 24px;
        }
    </style>
</head>
    <script type="text/javascript">
        adroll_adv_id = "ULS24Y37NRAJDFZWJ4UKE7";
        adroll_pix_id = "3FTYTXZLMBBWPDIH7TF7TB";
        (function () {
            var oldonload = window.onload;
            window.onload = function () {
                __adroll_loaded = true;
                var scr = document.createElement("script");
                var host = (("https:" == document.location.protocol) ? "https://s.adroll.com" : "http://a.adroll.com");
                scr.setAttribute('async', 'true');
                scr.type = "text/javascript";
                scr.src = host + "/j/roundtrip.js";
                ((document.getElementsByTagName('head') || [null])[0] ||
                 document.getElementsByTagName('script')[0].parentNode).appendChild(scr);
                if (oldonload) { oldonload() }
            };
        }());
</script>
<body style="z-index: 1; left: 0px; top: 0px; position: absolute; height: 761px; width: 880px; background-color:blueviolet" >
  
 
<script type="text/javascript" src="https://connect.facebook.net/en_US/all.js">
            var itemno = '<%=orderno.Text%>';
            FB.init({ appId: "123405257731200", status: true, cookie: true });

            // The dialog only opens if you've implemented the
            // Credits Callback payments_get_items.
            function buy() {
showbuy();
                FB.api(
  'me/treasure_huntermp:treasurespot',
  'post',
  {
    product: "https://treasurehunter.apphb.com/tspot.html"
  },
  function(response) {
    // handle the response
  }
);
            }

            function buybid() {

                
var obj = {
            method: 'pay',
            action: 'purchaseitem',
            product: 'https://treasurehunter.apphb.com/coin.html,
		dev_purchase_params: {'oscif': true}
          };

          FB.ui(obj, function(data) {
              console.log(data);
            });

           }
function payer_promotion() {
            var obj = {
  method: 'fbpromotion',
  display: 'popup',
  quantity: 1,
  product: 'https://treasurehunter.apphb.com/coin.html'
};

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
                //if (itemno == "ts1") {
                //    document.getElementById('fb-ui-return-data').innerText = str;

                //}

                //if (itemno == "ts2") {
                //    document.getElementById('fb-ui-return-data2').innerText = str;
                //}

            }

	function  showbuy(){
	
		FB.api(
  'me/objects/treasure_huntermp:buy',
  'post',
  {
    app_id: 123405257731200,
    type: "treasure_huntermp:buy",
    url: "https://treasurehunter.apphb.com/purchase.html",
    title: "Bought a Treasure Spot or Game Item - Congratulations",
    image: "https://treasurehunter.apphb.com/images/coin.png",
    description: "Buy a Treasure Spot"
  },
  function(response) {
    // handle the response
  }
);	

	}


        </script>

<form id="Form4" action="https://www.paypal.com/cgi-bin/webscr"  style="position:absolute; top: 187px; left: 589px; width: 105px; height: 41px; z-index: 300;" method="post" target="_top">
<input type="hidden" name="cmd" value="_xclick"/>
<input type="hidden" name="business" value="servicestwts@yahoo.com"/>
<input type="hidden" name="lc" value="IN"/>
<input type="hidden" name="item_name" value="Treasure Spot Buy"/>
<input type="hidden" name="amount" value="2"/>
<input type="hidden" name="currency_code" value="USD"/>
<input type="hidden" name="button_subtype" value="services"/>
<input type="hidden" name="no_note" value="1"/>
<input type="hidden" name="no_shipping" value="1"/>
<input type="hidden" name="tax_rate" value="0.000"/>
<input type="hidden" name="shipping" value="0.00"/>
<input type="hidden" id="Hidden3" name="custom" value='<%=Hiddenfield1%>'/>
<input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHosted"/>
<input type="image" src="https://www.paypalobjects.com/en_GB/i/btn/btn_buynowCC_LG.gif"  name="submit" alt="PayPal – The safer, easier way to pay online."/>
<img alt="" border="0" src="https://www.paypalobjects.com/en_GB/i/scr/pixel.gif" width="1" height="1"/>
</form>
    
 
      
    <form id="form1" runat="server">
        
        <asp:Label ID="Label6" runat="server" style="z-index: 1;  left: 64px; top: 19px; position: absolute; width: 236px; height: 14px;" Text="Buy at mygame premade treasurespots" Font-Size="10pt" ForeColor="White"></asp:Label>
       
        <h1 style="width: 231px; position: absolute; top: -9px; left: 355px; font-weight: bold; font-size: 30px; color: #FFCCFF; right: 294px;">Treasure Hunter</h1>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT uname FROM appuserdetails WHERE (uname = '<%=Hiddenfield1%>')" InsertCommand="INSERT INTO appuserdetails(uname, uloggedin, winner, wintimes, paid, amount, currenttspot) VALUES ('', 'no', 'no', '0', 'no', '0', '')"></asp:SqlDataSource>
        


        <div id="mainwindow" style="background-color: #FFCCCC; border: 40px ridge #FFFFCC; height: 637px; z-index: 1; left: 23px; top: 38px; position: absolute; width: 706px;">
            <div style="position: absolute; z-index: 300; border: medium inset #FF99FF; top: 546px; left: 13px; width: 670px; height: 68px; background-color: #FF99FF;">
                <label style="z-index: 300; left: 15px; top: 17px; position: absolute; height: 35px; width: 241px; font-size: 20px; font-family: 'Victorian LET'; color: #FFFFFF; font-weight: bolder; font-style: normal; letter-spacing: 2pt;">
                Earn Free Currency</label>
                <label style="z-index: 300; left: 300px; top: 28px; position: absolute; height: 20px; width: 46px; font-size: 10px; font-family: Arial; color: #3366CC; font-weight: bolder; font-style: normal;">
                TrialPay</label>&nbsp;
                </div>
            <div style="position: absolute; z-index: 300; border: medium inset #FF99FF; top: 12px; left: 16px; width: 670px; height: 68px; background-color: #FF99FF;">
                <label style="z-index: 300; left: 13px; top: 18px; position: absolute; height: 35px; width: 168px; font-size: 20px; font-family: 'Victorian LET'; color: #FFFFFF; font-weight: bold; font-style: normal; letter-spacing: 2pt; right: 489px;">
                Treasure Spot</label>
                <label style="z-index: 300; left: 294px; top: 8px; position: absolute; height: 20px; width: 134px; font-size: 10px; font-family: Arial; color: #3366CC; font-weight: bolder; font-style: normal;">
                Facebook Payment System</label>
                <label style="z-index: 300; left: 464px; top: 6px; position: absolute; height: 21px; width: 22px; font-size: 16px; font-family: Arial; color: #FFFFFF; font-weight: bolder; font-style: normal; right: 184px;">
                $2</label>
                <img alt="" src="Images/achievements.gif" style="z-index: 300; left: 236px; top: 11px; position: absolute; height: 48px; width: 47px" />
                <button onclick="buybid();" style="z-index: 300; left: 517px; top: 2px; position: absolute; width: 64px; height: 22px; border-radius:15px; background-color: #0000FF; font-size: 12px; color: #FFFFFF;">Buy</button>    
            </div>

            <div style="position: absolute; z-index: 300; border: medium inset #FF99FF; top: 99px; left: 16px; width: 670px; height: 68px; background-color: #FF99FF;">
                <label style="z-index: 300; left: 13px; top: 18px; position: absolute; height: 35px; width: 168px; font-size: 20px; font-family: 'Victorian LET'; color: #FFFFFF; font-weight: bold; font-style: normal; letter-spacing: 2pt; right: 489px;">
                Treasure Spot</label>
                <label style="z-index: 300; left: 294px; top: 30px; position: absolute; height: 20px; width: 53px; font-size: 10px; font-family: Arial; color: #3366CC; font-weight: bolder; font-style: normal;">
                PayPal</label>
                <label style="z-index: 300; left: 464px; top: 24px; position: absolute; height: 20px; width: 22px; font-size: 16px; font-family: Arial; color: #FFFFFF; font-weight: bolder; font-style: normal;">
                $2</label>
                <img alt="" src="Images/achievements.gif" style="z-index: 300; left: 236px; top: 11px; position: absolute; height: 48px; width: 47px" />
                </div>

            <div style="position: absolute; z-index: 300; border: medium inset #FF99FF; top: 184px; left: 15px; width: 670px; height: 68px; background-color: #FF99FF;">
                <label style="z-index: 300; left: 13px; top: 18px; position: absolute; height: 35px; width: 168px; font-size: 20px; font-family: 'Victorian LET'; color: #FFFFFF; font-weight: bold; font-style: normal; letter-spacing: 2pt; right: 489px;">
                Game Tools</label>
                <label style="z-index: 300; left: 294px; top: 25px; position: absolute; height: 20px; width: 53px; font-size: 10px; font-family: Arial; color: #3366CC; font-weight: bolder; font-style: normal;">
                PayPal</label>
                <label style="z-index: 300; left: 464px; top: 24px; position: absolute; height: 20px; width: 22px; font-size: 16px; font-family: Arial; color: #FFFFFF; font-weight: bolder; font-style: normal;">
                $1</label>
                <img alt="" src="Images/achievements.gif" style="z-index: 300; left: 236px; top: 11px; position: absolute; height: 48px; width: 47px" />
                </div>

            <div style="position: absolute; z-index: 300; border: medium inset #FF99FF; top: 267px; left: 14px; width: 670px; height: 68px; background-color: #FF99FF;">
                <label style="z-index: 300; left: 13px; top: 8px; position: absolute; height: 24px; width: 168px; font-size: 20px; font-family: 'Victorian LET'; color: #FFFFFF; font-weight: bold; font-style: normal; letter-spacing: 2pt; right: 489px;">
                Treasure Spot</label>
                <label style="z-index: 300; left: 294px; top: 25px; position: absolute; height: 20px; width: 53px; font-size: 10px; font-family: Arial; color: #3366CC; font-weight: bolder; font-style: normal;">
                PayPal</label>
                <label style="z-index: 300; left: 446px; top: 8px; position: absolute; height: 14px; width: 31px; font-size: 10px; font-family: Arial; color: #3366CC; font-weight: bolder; font-style: normal;">
                Bid</label>&nbsp;
                <img alt="" src="Images/achievements.gif" style="z-index: 300; left: 236px; top: 11px; position: absolute; height: 48px; width: 47px" />
                </div>

            <div style="position: absolute; z-index: 300; border: medium inset #FF99FF; top: 350px; left: 14px; width: 670px; height: 68px; background-color: #FF99FF;">
                <label style="z-index: 300; left: 13px; top: 8px; position: absolute; height: 22px; width: 168px; font-size: 20px; font-family: 'Victorian LET'; color: #FFFFFF; font-weight: bold; font-style: normal; letter-spacing: 2pt; right: 489px;">
                Game Tools</label>
                <label style="z-index: 300; left: 294px; top: 25px; position: absolute; height: 20px; width: 53px; font-size: 10px; font-family: Arial; color: #3366CC; font-weight: bolder; font-style: normal;">
                PayPal</label>
                <label style="z-index: 300; left: 446px; top: 7px; position: absolute; height: 14px; width: 31px; font-size: 10px; font-family: Arial; color: #3366CC; font-weight: bolder; font-style: normal;">
                Bid</label>&nbsp;
                <img alt="" src="Images/achievements.gif" style="z-index: 300; left: 236px; top: 11px; position: absolute; height: 48px; width: 47px" />
                </div>
<div style="position: absolute; z-index: 300; border: medium inset #FF99FF; top: 450px; left: 14px; width: 670px; height: 68px; background-color: #FF99FF;">
                <label style="z-index: 300; left: 13px; top: 10px; position: absolute; height: 51px; width: 208px; font-size: 20px; font-family: 'Victorian LET'; color: #FFFFFF; font-weight: bold; font-style: normal; letter-spacing: 2pt; right: 449px;">
                Treasure Spot<br />
                Free Promotion</label>
                <label style="z-index: 300; left: 294px; top: 25px; position: absolute; height: 20px; width: 137px; font-size: 10px; font-family: Arial; color: #3366CC; font-weight: bolder; font-style: normal;">
                Facebook Payment System</label>
                <label style="z-index: 300; left: 464px; top: 27px; position: absolute; height: 14px; width: 31px; font-size: 10px; font-family: Arial; color: #3366CC; font-weight: bolder; font-style: normal;">
                Free</label>&nbsp;
                <img alt="" src="Images/achievements.gif" style="z-index: 300; left: 236px; top: 11px; position: absolute; height: 48px; width: 47px" />
                </div>
            <button onclick="payer_promotion();" style="z-index: 300; left: 556px; top: 474px; position: absolute; width: 95px; height: 22px; border-radius:15px; background-color: #0000FF; font-size: 12px; color: #FFFFFF;">Payer Promotion</button>
            </div>

        

<asp:hyperlink ID="Hyperlink3" runat="server"  Font-Underline="False" NavigateUrl="~/trialpay.aspx" style="z-index: 1; left: 606px; top: 638px; position: absolute; bottom: 72px; border-radius:15px; background-color: #FF9900;  width: 122px; cursor:pointer; text-decoration:none;" Target="_blank" ForeColor="White" BackColor="#FF9900" ImageUrl="~/Images/trialpay.jpg"></asp:hyperlink>   

        
<asp:Button ID="Button3" runat="server" Text="Buy Later" style="width: 100px; position: absolute; left:751px; top:-3px; border-radius:15px;"  UseSubmitBehavior="False" CausesValidation="False" BackColor="Red" ForeColor="White" OnClick="Button3_Click" ToolTip="Use this to Play further on, Create one Treasure Spot but you cannot Sell or Bid or Approve to Earn Real Cash" />
            
<asp:hyperlink ID="Hyperlink4" runat="server"  Font-Underline="False" NavigateUrl="~/gamesettings.aspx" style="z-index: 1; left: 101px; top: -4px; position: absolute; bottom: 746px; border-radius:15px; background-color: #FF9900;  width: 66px;" Target="_self" ForeColor="White" BackColor="#FF9900">My Game</asp:hyperlink>   
<asp:hyperlink ID="Hyperlink2" runat="server"  Font-Underline="False" NavigateUrl="~/Home/Index1" style="z-index: 1; border-radius:15px; background-color: #FF9900;  left: 18px; top: -6px; position: absolute; height: 23px; width: 43px;" Target="_self" ForeColor="White">Home</asp:hyperlink>


        

    <asp:hyperlink ID="Hyperlink1" runat="server"  Font-Underline="False" NavigateUrl="~/Play/play" style="z-index: 1; left: 598px; top: 2px; position: absolute; right: 140px; border-radius:15px; background-color: #FF9900; " Target="_self" Enabled="False" ForeColor="White">Go on a Treasurehunt</asp:hyperlink>
        
        
<asp:Label ID="Label8" runat="server" style="z-index: 1; left: 517px; top: 373px; position: absolute" Text=""></asp:Label>
<asp:Label ID="Label10" runat="server" style="z-index: 1; left: 94px; top: 391px; position: absolute; width: 195px"></asp:Label>
<asp:Label ID="Label13" runat="server" style="z-index: 1; left: 97px; top: 475px; position: absolute; width: 181px;"></asp:Label>
<asp:Label ID="Label14" runat="server" style="z-index: 1; left: 512px; top: 461px; position: absolute; width: 63px;"></asp:Label>
               
<asp:TextBox ID="TextBox1" runat="server" Style="z-index: 1; left: 501px; top: 131px; position: absolute; width: 225px; height: 20px; text-decoration:none; background-color:transparent" BorderStyle="None"></asp:TextBox> 
<asp:TextBox ID="TextBox3" runat="server" Style="z-index: 1; left: -84px; top: -970px; position: absolute; width: 162px; height: 15px; text-decoration:none" ForeColor="White" BackColor="Transparent" BorderStyle="None"></asp:TextBox>
        
<asp:TextBox ID="orderno" runat="server" ClientIDMode="Static" Style="z-index: 1; left: 687px; top: 102px; position: absolute; width: 53px;" BackColor="Transparent" BorderStyle="None"></asp:TextBox>

<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Style="z-index: 1; left: 380px; top: 132px; position: absolute; border-radius:15px; background-color: #0000FF; width: 110px;" Text="Get Your Receipt" Font-Size="9pt" ForeColor="White" />
 
   <a href="https://treasurehunter.apphb.com/create.aspx" target="_self" style="position:absolute;top:-5px; width:152px; text-decoration:none; background-color: #FF9900; color: #FFFFFF; border-radius:20px; right: 543px; text-align: center; height: 22px;" > Go to My TreasureSpot </a> 
   
    
</form>

    <%--<form action="https://www.paypal.com/cgi-bin/webscr"  style="position:absolute; top: 529px; left: 532px;" method="post" target="_top">
<input type="hidden" name="cmd" value="_s-xclick">
<input type="hidden" name="item_name" value="thbuyuserid">
<input type="hidden" name="hosted_button_id" value="UH68K68FR2L48">
<input type="image" src="https://www.paypalobjects.com/en_GB/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal – The safer, easier way to pay online.">
<img alt="" border="0" src="https://www.paypalobjects.com/en_GB/i/scr/pixel.gif" width="1" height="1">
</form>--%>

            <form id="Form2" action="https://www.paypal.com/cgi-bin/webscr"  style="position:absolute; top: 360px; left: 584px; height: 51px; width: 117px; z-index: 300;" method="post" target="_top">
<input type="hidden" name="cmd" value="_xclick"/>
<input type="hidden" name="business" value="servicestwts@yahoo.com"/>
<input type="hidden" name="lc" value="IN"/>
<input type="hidden" name="item_name" value="Treasure Spot Bid"/>
<input type="hidden" name="amount" value='<%=Session["tspotprice"]%>'/>
<input type="hidden" name="currency_code" value="USD"/>
<input type="hidden" name="button_subtype" value="services"/>
<input type="hidden" name="no_note" value="1"/>
<input type="hidden" name="no_shipping" value="1"/>
<input type="hidden" name="tax_rate" value="0.000"/>
<input type="hidden" name="shipping" value="0.00"/>
<input type="hidden" id="Hidden1" name="custom" value='<%=Hiddenfield1%>'/>
<input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHosted"/>
<input type="image" src="https://www.paypalobjects.com/en_GB/i/btn/btn_buynowCC_LG.gif"  name="submit" alt="PayPal – The safer, easier way to pay online."/>
<img alt="" border="0" src="https://www.paypalobjects.com/en_GB/i/scr/pixel.gif" width="1" height="1"/>
</form>



<form id="Form3" action="https://www.paypal.com/cgi-bin/webscr"  style="position:absolute; top: 449px; left: 586px; width: 109px; height: 43px; z-index: 300;" method="post" target="_top">
<input type="hidden" name="cmd" value="_xclick"/>
<input type="hidden" name="business" value="servicestwts@yahoo.com"/>
<input type="hidden" name="lc" value="IN"/>
<input type="hidden" name="item_name" value="ToolBox Item Bid"/>
<input type="hidden" name="amount" value='<%=Session["tbprice"]%>'/>
<input type="hidden" name="currency_code" value="USD"/>
<input type="hidden" name="button_subtype" value="services"/>
<input type="hidden" name="no_note" value="1"/>
<input type="hidden" name="no_shipping" value="1"/>
<input type="hidden" name="tax_rate" value="0.000"/>
<input type="hidden" name="shipping" value="0.00"/>
<input type="hidden" id="Hidden2" name="custom" value='<%=Hiddenfield1%>'/>
<input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHosted"/>
<input type="image" src="https://www.paypalobjects.com/en_GB/i/btn/btn_buynowCC_LG.gif"  name="submit" alt="PayPal – The safer, easier way to pay online."/>
<img alt="" border="0" src="https://www.paypalobjects.com/en_GB/i/scr/pixel.gif" width="1" height="1"/>
</form>

    <form id="Form5" action="https://www.paypal.com/cgi-bin/webscr"  style="position:absolute; top: 276px; left: 595px; width: 116px; height: 35px; z-index: 300;" method="post" target="_top">
<input type="hidden" name="cmd" value="_xclick"/>
<input type="hidden" name="business" value="servicestwts@yahoo.com"/>
<input type="hidden" name="lc" value="IN"/>
<input type="hidden" name="item_name" value="ToolBox Item Buy"/>
<input type="hidden" name="amount" value="1"/>
<input type="hidden" name="currency_code" value="USD"/>
<input type="hidden" name="button_subtype" value="services"/>
<input type="hidden" name="no_note" value="1"/>
<input type="hidden" name="no_shipping" value="1"/>
<input type="hidden" name="tax_rate" value="0.000"/>
<input type="hidden" name="shipping" value="0.00"/>
<input type="hidden" id="Hidden4" name="custom" value='<%=Hiddenfield1%>'/>
<input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHosted"/>
<input type="image" src="https://www.paypalobjects.com/en_GB/i/btn/btn_buynowCC_LG.gif"  name="submit" alt="PayPal – The safer, easier way to pay online."/>
<img alt="" border="0" src="https://www.paypalobjects.com/en_GB/i/scr/pixel.gif" width="1" height="1"/>
</form>

<%--<form id="paypalbutton" action="https://www.sandbox.paypal.com/cgi-bin/webscr"  style="position:absolute; top: 529px; left: 2px;" method="post" target="_top">
<input type="hidden" name="cmd" value="_xclick">
<input type="hidden" name="business" value="BWZKHE4VDJPHU">
<input type="hidden" name="lc" value="IN">
<input type="hidden" name="item_name" value="Treasure Spot Buy">
<input type="hidden" name="amount" value="5.00">
<input type="hidden" name="currency_code" value="USD">
<input type="hidden" name="button_subtype" value="services">
<input type="hidden" name="no_note" value="1">
<input type="hidden" name="no_shipping" value="1">
<input type="hidden" name="tax_rate" value="0.000">
<input type="hidden" name="shipping" value="0.00">
<input type="hidden" id="customvalue" name="custom" value=<%=Hiddenfield1%>>
<input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHosted">
<input type="image" src="https://www.sandbox.paypal.com/en_GB/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal – The safer, easier way to pay online.">
<img alt="" border="0" src="https://www.sandbox.paypal.com/en_GB/i/scr/pixel.gif" width="1" height="1">
</form>--%>
        
        


   
        
</body>
</html>
