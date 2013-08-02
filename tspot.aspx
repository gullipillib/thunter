<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>


 public class subscription : IHttpHandler
    {
        private static readonly IList<string> InMemoryNoticiationStore = new List<string>();

        public void ProcessRequest(HttpContext context)
        {
            var fb = new FacebookClient
                         {
                             AppSecret = "8037ae43536685123303ddc326c3ac63",
                             SubscriptionVerifyToken = "testest1",
                         };

            var request = context.Request;
            var response = context.Response;


            if (request.QueryString["list"] == "true")
            {
                response.Write(string.Join(",", InMemoryNoticiationStore));
                return;
            }
            else if (request.QueryString["clear"] == "true")
            {
                InMemoryNoticiationStore.Clear();
                return;
            }

            if (request.HttpMethod.Equals("GET", StringComparison.OrdinalIgnoreCase))
            {
                try
                {
                    // VerifyGetSubscription will throw exception if verification fails.
                    fb.VerifyGetSubscription(
                        request.Params["hub.mode"],
                        request.Params["hub.verify_token"],
                        request.Params["hub.challenge"]);

                    response.Write(request.Params["hub.challenge"]);
                }
                catch (Exception ex)
                {
                    InMemoryNoticiationStore.Add(ex.StackTrace);
                }
            }
            else
            {
                try
                {
                    // VerifyPostSubscription will throw exception if verification fails.
                    dynamic result = fb.VerifyPostSubscription(
                        request.Headers["X-Hub-Signature"],
                        new StreamReader(request.InputStream).ReadToEnd());

                    // result is a json object that was sent by Facebook
                    // for now just call ToString() so it returns the json string
                    string jsonString = result.ToString();

                    // Process the result
                    // for this demo we will just add it to the list
                    InMemoryNoticiationStore.Add(jsonString);
                }
                catch (Exception ex)
                {
                    InMemoryNoticiationStore.Add(ex.StackTrace);
                }
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}


<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        

        if (Page.IsPostBack == true)
        {

            var fb = new Facebook.UserProfile();
            var user = fb.Name;
            string quantity = "no info"; try { quantity = Request.Form["quantity"]; }
            catch { }
            string order_id = "no order id"; try { order_id = Request.Form["payment_id"]; }
            catch { }
            string status = "no method"; try { status = Request.Form["status"]; }
            catch { }
            string signedrequest = "no method"; try { signedrequest = Request.Form["signed_request"]; }
            catch { }

            if (order_id != "")
            {
                SqlDataSource1.InsertCommand = "INSERT INTO tspots(tsname, tsowner, tssell, tsbid, tsbidder, tsitems, tsapproved, tsreported, tsapprover, tsproductid, tsstatus) VALUES ('', '" + user + "', 'no', 'no', 'none','', 'no', 'no', 'none', '" + order_id + "', '" + status + "')";
                SqlDataSource1.Insert();
            }
            
            
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Server.Transfer("creator.aspx");
    }
</script>



<html>
  <head>
      <title></title>
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
               
  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT tspots.* FROM tspots" InsertCommand="INSERT INTO tspots(tsname, tsowner, tssell, tsbid, tsbidder, tsitems, tsapproved, tsreported, tsapprover, tsproductid, tsstatus) VALUES ('', '', 'no', 'no', 'none','', 'no', 'no', '', '', '')" UpdateCommand="UPDATE tspots SET tsitems = 'none'" DeleteCommand="DELETE FROM tspots"></asp:SqlDataSource>
  
    </div>
      </form>
      </body>
</html>