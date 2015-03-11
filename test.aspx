<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Microsoft.AspNet.SignalR"%>
<!DOCTYPE html>
<script runat="server">
    //public static System.Timers.Timer timer = new System.Timers.Timer(40000); // This will raise the event every one minute.
    //Microsoft.AspNet.SignalR.Client.HubConnection mycon = null;
    //Microsoft.AspNet.SignalR.Client.HubConnection myproxy = null;
    string messages = "";
    string values = "";
    //Microsoft.AspNet.SignalR.IHubContext mycon = Microsoft.AspNet.SignalR.GlobalHost.ConnectionManager.GetHubContext("sysmessages");
            
    protected void page_load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            
            //timer.Enabled = true;
            //timer.Elapsed += new System.Timers.ElapsedEventHandler(startupdatecoins);
        }
    } 
    protected void startupdatecoins(object sender, System.Timers.ElapsedEventArgs e)
        {
            
        //mycon.Clients.All.hello(messages, values);
            //TextBox1.Text = messages + " " + values;
        }
      
    //protected void startupdatecoins(object sender, System.Timers.ElapsedEventArgs e)
    //    {

    //        string messages = null;
    //        string values = null;
        
    //        var subscription = myproxy.Subscribe("Hello");
    //        subscription.Received += arguments =>
    //        {
                
    //            if (arguments.Count > 0)
    //            {
    //                messages = arguments[0].ToObject<string>();
    //            }

    //            if (arguments.Count > 1)
    //            {
    //                values = arguments[1].ToObject<string>();
    //            }

                
    //        };
    //        mycon.Start().Wait();
    //        myproxy.Invoke("Hello").Wait();
    //        TextBox1.Text = messages + "  " + values;
              
    //    }
        
</script>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title></title>

    <style type="text/css">
        #pay
        {
            z-index: 1;
            left: 179px;
            top: 234px;
            position: absolute;
        }
        #pay0
        {
            z-index: 1;
            left: 179px;
            top: 234px;
            position: absolute;
        }
        #pay1
        {
            z-index: 1;
            left: 179px;
            top: 234px;
            position: absolute;
        }
        #pay2
        {
            z-index: 1;
            left: 179px;
            top: 234px;
            position: absolute;
        }
        #pay3
        {
            z-index: 1;
            left: 179px;
            top: 234px;
            position: absolute;
        }
        #pay3
        {
            z-index: 1;
            left: 179px;
            top: 234px;
            position: absolute;
        }
        </style>

</head>
<script src="Scripts/jquery-1.8.2.js"></script>
    <script src="Scripts/jquery-ui-1.10.3.js"></script>
    <script src="Scripts/jquery.signalR-2.0.1.js"></script> 
       <script src="https://treasurehunter.apphb.com/SignalR/hubs"></script>
<body>
    
    <script>
        $(function () {
            // Reference the auto-generated proxy for the hub.  
            var chat = $.connection.sysmessages;
            // Create a function that the hub can call back to display messages.
            chat.client.hello = function (messages, values) {
                // Add the message to the page. 
                alert(messages + " " + values);
            };
            
            // Start the connection.
            $.connection.hub.start().done(function () {

                // Call the Send method on the hub. 
                chat.server.Hello("goldcoins", "1000");

            });
            });
       
        
      
    </script>

    <script>
    function buy() {
          var obj = {
            method: 'pay',
            action: 'purchaseitem',
            product: 'https://treasurehunter.apphb.com/coin.html'
          };

          FB.ui(obj, function(data) {
              console.log(data);
            });
        }

        document.getElementById('pay0').onclick = function() {buy()};

        function buyt() {
            var obj = {
                method: 'pay',
                action: 'purchaseitem',
                product: 'https://treasurehunter.apphb.com/tool.html'
            };

            FB.ui(obj, function (data) {
                console.log(data);
            });
        }

        document.getElementById('pay3').onclick = function () { buyt() };

        function buyl() {
            var obj = {
                method: 'pay',
                action: 'purchaseitem',
                product: 'https://treasurehunter.apphb.com/life.html'
            };

            FB.ui(obj, function (data) {
                console.log(data);
            });
        }

        document.getElementById('pay').onclick = function () { buyl() };

     </script>
    <script>
        function FacebookInviteFriends() {
            FB.ui({
                method: 'apprequests',
                message: 'You are Invited to Play Treasure Hunter 3D MultiPlayer Game with me'
            });
        }
</script>
    <script type="text/javascript">
        function hidediv() {
            document.getElementById('showspot').style.visibility = "hidden";
            document.getElementById('showpromo').style.visibility = "hidden";
            document.getElementById('showlife').style.visibility = "hidden";
            document.getElementById('showprof').style.visibility = "hidden";
            document.getElementById('showtweet').style.visibility = "hidden";
            document.getElementById('showtools').style.visibility = "hidden";
            document.getElementById('showfriends').style.visibility = "hidden";
        }
    </script>
    <script type="text/javascript">
        // On load, the user hasn't clicked on the payer_promotion unit
        var has_clicked = false;
        var dialog_window;

        function payer_promotion() {
            if (!has_clicked) {
                // If first click, open payer_promotion dialog
                var obj = {
                    method: 'fbpromotion',
                    display: 'popup',
                    quantity: 1,
                    product: 'https://treasurehunter.apphb.com/coin.html'
                };

                FB.ui(obj, function(){
                    // call back to your server to see if user's balance changed
                });

                // Mark unit as clicked by user
                has_clicked = true;
            } else {
                // For subsequent clicks, alert user
                alert("Payer Promotion already clicked!");
            }
        }
        </script>

    <form id="form1" runat="server">
        <asp:TextBox ID="TextBox1" runat="server" Text="1"></asp:TextBox>
        <div style="width: 438px; height: 300px; z-index: 1000; left: 587px; top: 430px; position: absolute; background-color: #669999" id="showprof">
            <img alt="" src="Images/goldcoin.gif" style="z-index: 1101; left: 43px; top: 27px; position: absolute; height: 40px;" /><asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="15pt" ForeColor="White" style="z-index: 1001; left: 94px; top: 24px; position: absolute; width: 329px;" Text="Professional Help to Complete Your TreasureSpot or Game Tools"></asp:Label>
            <asp:Label ID="Label2" runat="server" style="z-index: 1; left: 30px; top: 86px; position: absolute; vertical-align: middle; text-align:center; width: 394px; margin-top: 0px; bottom: 176px;" Text="A Professional will complete your TreasureSpot or Game Tools on behalf of you" ForeColor="White"></asp:Label>
        <asp:Label ID="Label3" runat="server" style="z-index: 1; left: 18px; top: 162px; position: absolute; vertical-align: middle; text-align:center; width: 72px; margin-top: 0px;" Text="Price   $1" ForeColor="White" Font-Bold="True"></asp:Label>
        <button id="pay" style="border-radius:10px; text-align:center; vertical-align:middle; border: medium outset #FFFF00; position:absolute; width: 79px; height: 26px; background-color: #FF00FF; color: #FFFFFF;">Buy Now</button>
        <button id="Button4" style="border-radius:10px; text-align:center; vertical-align:middle; border: medium outset #FFFF00; position:absolute; width: 96px; height: 26px; background-color: #FF00FF; color: #FFFFFF; top: 234px; left: 300px;">Back to Game</button>
        </div>
        <div style="width: 438px; height: 300px; z-index: 1000; left: 75px; top: 97px; position: absolute; background-color: #9900FF" id="showspot">
            <img alt="" src="Images/coin.png" style="z-index: 1001; left: 43px; top: 27px; position: absolute" /><asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="15pt" ForeColor="White" style="z-index: 1001; left: 128px; top: 36px; position: absolute" Text="Buy a Treasure Spot"></asp:Label>
            <asp:Label ID="Label5" runat="server" style="z-index: 1; left: 30px; top: 86px; position: absolute; vertical-align: middle; text-align:center; width: 394px; margin-top: 0px; bottom: 176px;" Text="You Have Played Now in a TreasureSpot. Create your own TreasureSpot to Earn More Rewards. " ForeColor="White"></asp:Label>
        <asp:Label ID="Label6" runat="server" style="z-index: 1; left: 18px; top: 162px; position: absolute; vertical-align: middle; text-align:center; width: 72px; margin-top: 0px;" Text="Price   $2" ForeColor="White" Font-Bold="True"></asp:Label>
        <button id="pay0" style="border-radius:10px; text-align:center; vertical-align:middle; border: medium outset #FFFF00; position:absolute; width: 79px; height: 26px; background-color: #FF00FF; color: #FFFFFF;">Buy Now</button>
        <button id="Button1" style="border-radius:10px; text-align:center; vertical-align:middle; border: medium outset #FFFF00; position:absolute; width: 96px; height: 26px; background-color: #FF00FF; color: #FFFFFF; top: 234px; left: 300px;" onclick="hidediv();">Back to Game</button>
        </div>
        <div style="width: 438px; height: 300px; z-index: 1000; left: 580px; top: 96px; position: absolute; background-color: #666633" id="showpromo">
            <img alt="" src="Images/lwinner.jpg" style="z-index: 1101; left: 5px; top: 17px; position: absolute; height: 59px; width: 87px;" /><asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="15pt" ForeColor="White" style="z-index: 1001; left: 102px; top: 28px; position: absolute; width: 327px;" Text="Wow you just won a TreasureSpot at a Concessional Price"></asp:Label>
            <asp:Label ID="Label8" runat="server" style="z-index: 1; left: 42px; top: 122px; position: absolute; vertical-align: middle; text-align:center; width: 382px; margin-top: 0px; bottom: 140px;" Text="You were the randomly selected winner of a TreasureSpot" ForeColor="White"></asp:Label>
        <button onclick="payer_promotion();" style="z-index: 1; left: 143px; top: 192px; position: absolute; background-color: #0000CC; color: #FFFF00; width: 180px;">Concessional TreasureSpots</button>
         <button id="Button2" style="border-radius:10px; text-align:center; vertical-align:middle; border: medium outset #FFFF00; position:absolute; width: 96px; height: 26px; background-color: #FF00FF; color: #FFFFFF; top: 233px; left: 179px;">Back to Game</button>
        </div>
        <div style="width: 438px; height: 300px; z-index: 1000; left: 73px; top: 419px; position: absolute; background-color: #FF6666" id="showlife">
            <img alt="" src="Images/health.gif" style="z-index: 1101; left: 12px; top: 14px; position: absolute; height: 40px;" /><asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="15pt" ForeColor="White" style="z-index: 1001; left: 76px; top: 32px; position: absolute; width: 349px;" Text="Additional Lifes During Your Game Play"></asp:Label>
            <asp:Label ID="Label10" runat="server" style="z-index: 1; left: 30px; top: 86px; position: absolute; vertical-align: middle; text-align:center; width: 394px; margin-top: 0px; bottom: 176px;" Text="Get 20 More Lifes During Game Playing" ForeColor="White"></asp:Label>
        <asp:Label ID="Label11" runat="server" style="z-index: 1; left: 18px; top: 162px; position: absolute; vertical-align: middle; text-align:center; width: 72px; margin-top: 0px;" Text="Price   $1" ForeColor="White" Font-Bold="True"></asp:Label>
        <button id="pay2" style="border-radius:10px; text-align:center; vertical-align:middle; border: medium outset #FFFF00; position:absolute; width: 79px; height: 26px; background-color: #FF00FF; color: #FFFFFF;">Buy Now</button>
        <button id="Button3" style="border-radius:10px; text-align:center; vertical-align:middle; border: medium outset #FFFF00; position:absolute; width: 96px; height: 26px; background-color: #FF00FF; color: #FFFFFF; top: 234px; left: 300px;">Back to Game</button>
        </div>
        <div style="width: 438px; height: 300px; z-index: 1000; left: 73px; top: 748px; position: absolute; background-color: #FF5050" id="showtweet">
            <img alt="" src="Images/landscape.jpg" style="z-index: 1101; left: 43px; top: 27px; position: absolute; height: 40px; right: 355px;" /><asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="15pt" ForeColor="White" style="z-index: 1001; left: 163px; top: 36px; position: absolute" Text="Tweet on Twitter"></asp:Label>
            <asp:Label ID="Label13" runat="server" style="z-index: 1; left: 30px; top: 86px; position: absolute; vertical-align: middle; text-align:center; width: 394px; margin-top: 0px; bottom: 176px;" Text="To Make TreasureHunting more interesting tweet on Twitter and Expres Yourself" ForeColor="White"></asp:Label>
              <button id="Button5" style="border-radius:10px; text-align:center; vertical-align:middle; border: medium outset #FFFF00; position:absolute; width: 96px; height: 26px; background-color: #FF00FF; color: #FFFFFF; top: 253px; left: 300px;">Back to Game</button>
        <a href="https://twitter.com/share" class="twitter-share-button" data-lang="en" style="text-decoration:none; position: absolute; top: 260px; left: 185px; width: 44px;">Tweet</a>    
        </div>
        <div style="width: 438px; height: 300px; z-index: 1000; left: 595px; top: 755px; position: absolute; background-color: #3333FF" id="showtools">
            <img alt="" src="Images/goldcoin.gif" style="z-index: 1101; left: 43px; top: 27px; position: absolute; height: 40px;" /><asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="15pt" ForeColor="White" style="z-index: 1001; left: 128px; top: 36px; position: absolute" Text="Buy a Game Tools Item"></asp:Label>
            <asp:Label ID="Label15" runat="server" style="z-index: 1; left: 30px; top: 86px; position: absolute; vertical-align: middle; text-align:center; width: 394px; margin-top: 0px; bottom: 176px;" Text="Add your own choice of Game Items to your TreasureSpot." ForeColor="White"></asp:Label>
        <asp:Label ID="Label16" runat="server" style="z-index: 1; left: 18px; top: 162px; position: absolute; vertical-align: middle; text-align:center; width: 72px; margin-top: 0px;" Text="Price   $1" ForeColor="White" Font-Bold="True"></asp:Label>
        <button id="pay3" style="border-radius:10px; text-align:center; vertical-align:middle; border: medium outset #FFFF00; position:absolute; width: 79px; height: 26px; background-color: #FF00FF; color: #FFFFFF;">Buy Now</button>
        <button id="Button6" style="border-radius:10px; text-align:center; vertical-align:middle; border: medium outset #FFFF00; position:absolute; width: 96px; height: 26px; background-color: #FF00FF; color: #FFFFFF; top: 234px; left: 300px;">Back to Game</button>
        </div>
        <div style="width: 438px; height: 300px; z-index: 1000; left: 73px; top: 1068px; position: absolute; background-color: #FF5050" id="showfriends">
            <img alt="" src="Images/landscape.jpg" style="z-index: 1101; left: 43px; top: 27px; position: absolute; height: 40px; right: 355px;" /><asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Size="15pt" ForeColor="White" style="z-index: 1001; left: 163px; top: 36px; position: absolute" Text="Invite Friends"></asp:Label>
            <asp:Label ID="Label18" runat="server" style="z-index: 1; left: 30px; top: 86px; position: absolute; vertical-align: middle; text-align:center; width: 394px; margin-top: 0px; bottom: 176px;" Text="To Make TreasureHunting more interesting invite your Friends and Like the Game" ForeColor="White"></asp:Label>
              <button id="Button7" style="border-radius:10px; text-align:center; vertical-align:middle; border: medium outset #FFFF00; position:absolute; width: 96px; height: 26px; background-color: #FF00FF; color: #FFFFFF; top: 253px; left: 300px;">Back to Game</button>
            <a href="#" onclick="FacebookInviteFriends();" style="position: absolute; left: 37%; top: 87%; width: 27%; height: 7%; text-decoration: none; color: #FFFFFF; background-color: #FF9900; border-radius: 20px; text-align: center; right: 159px; z-index: 310;">Invite Friends</a>
            <div class="fb-like" data-href="https://www.facebook.com/TreasureHuntergame" data-width="100" data-layout="button" data-action="like" data-show-faces="true" data-share="true" style="z-index: 351; position: absolute; width: 128px; height: 24px; top: 159px; right: 275px; bottom: 117px; left: 35px"></div>
        </div>
    </form>
</body>
</html>
