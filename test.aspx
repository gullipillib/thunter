<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Microsoft.AspNet.SignalR"%>
<!DOCTYPE html>
<script runat="server">
    //public static System.Timers.Timer timer = new System.Timers.Timer(10000); // This will raise the event every one minute.
    //Microsoft.AspNet.SignalR.Client.HubConnection mycon = null;
    //Microsoft.AspNet.SignalR.Client.IHubProxy myproxy = null;
    
    //protected void Page_Load(object sender, EventArgs e)
    //{
    //    if (Page.IsPostBack == false)
    //    {
    //        mycon = new Microsoft.AspNet.SignalR.Client.HubConnection("https://treasurehunter/apphb.com/SignalR/hubs");
    //        myproxy = mycon.CreateHubProxy("sysmessages");
    //        timer.Enabled = true;
    //        timer.Elapsed += new System.Timers.ElapsedEventHandler(startupdatecoins);
    //    }
    //}   
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

</head>
<script src="Scripts/jquery-1.8.2.js"></script>
    <script src="Scripts/jquery-ui-1.10.3.js"></script>
    <script src="Scripts/jquery.signalR-2.0.1.js"></script> 
       <script src="https://treasurehunter/apphb.com/SignalR/hubs"></script>
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
    <form id="form1" runat="server">
        <asp:TextBox ID="TextBox1" runat="server" Text="1"></asp:TextBox>
    </form>
</body>
</html>
