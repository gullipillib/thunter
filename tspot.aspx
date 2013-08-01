<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<script runat="server">

    
    protected void Button1_Click(object sender, EventArgs e)
    {
        Server.Transfer("creator.aspx");
    }
</script>


<!DOCTYPE HTML>
<html>
  <head>
    <meta http-equiv="content-type" content="application/xhtml+xml; charset=UTF-8" />
    <title>Treasure Hunter Payments</title>
      <style type="text/css">
          #pay {
              z-index: 1;
              left: 41px;
              top: 157px;
              position: absolute;
              width: 251px;
          }
      </style>
  </head>
  <body>

      <form id="form1" runat="server">

    <h2 style="width: 190px; z-index: 1; top: 20px; position: absolute; height: 26px; left: 413px">Treasure Hunter</h2>
    <div class="returndata" id="output"></div>


    <script type="text/javascript">
        window.fbAsyncInit = function () {
            FB.init({
                appId: '123405257731200',
                status: true,
                cookie: true,
                xfbml: true
            });

            function buy() {
                var obj = {
                    method: 'pay',
                    action: 'purchaseitem',
                    product: 'https://treasurehunter.apphb.com/coin.html'
                };

                FB.ui(obj, function (data) {
                    console.log(data);
                });
            }

            document.getElementById('pay').onclick = function () { buy() };
        };

        // Load the SDK Asynchronously
        (function (d) {
            var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
            if (d.getElementById(id)) { return; }
            js = d.createElement('script'); js.id = id; js.async = true;
            js.src = "//connect.facebook.net/en_US/all.js";
            ref.parentNode.insertBefore(js, ref);
        }(document));
    </script>
    
    <div style="position: absolute; border: medium solid #000000; top: 58px; left: 22px; width: 360px; height: 310px;"> 
      <h2 style="width: 207px; position: absolute; top: 13px; left: 77px;">Buy Treasure Spot</h2>
      <label style="z-index: 1; left: 12px; top: 52px; position: absolute; height: 77px; width: 307px;" >You have to own atleast one&nbsp; Treasure Hunting Spot. You can later sell it for a specific price or on a bid system.<br />
      Price : $3</label>
        <img alt="" src="Images/coin.png" style="z-index: 1; left: 11px; top: 5px; position: absolute" />
    <button id="pay">Buy A New Treasure Spot Now</button>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="z-index: 1; left: 40px; top: 227px; position: absolute" Text="Go to My Treasure Spot Now" />
      </div>
      </form>
      </body>
</html>