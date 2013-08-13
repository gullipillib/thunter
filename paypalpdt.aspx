<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.IO" %>

<!DOCTYPE html>
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        // CUSTOMIZE THIS: This is the seller's Payment Data Transfer authorization token.
        // Replace this with the PDT token in "Website Payment Preferences" under your account.
        string authToken = "oMz36ZuEADLIQazHNUU0ocNye1iXgar0ToQ8TowRZNSz7AUR_gSWn0hO7PK";
        string txToken = Request.QueryString["tx"];
        string query = "cmd=_notify-synch&tx=" + txToken + "&at=" + authToken;

        //Post back to either sandbox or live
        string strSandbox = "https://www.sandbox.paypal.com/cgi-bin/webscr";
        //string strLive = "https://www.paypal.com/cgi-bin/webscr";
        HttpWebRequest req = (HttpWebRequest)WebRequest.Create(strSandbox);

        //Set values for the request back
        req.Method = "POST";
        req.ContentType = "application/x-www-form-urlencoded";
        req.ContentLength = query.Length;


        //Send the request to PayPal and get the response
        StreamWriter streamOut = new StreamWriter(req.GetRequestStream(), System.Text.Encoding.ASCII);
        streamOut.Write(query);
        streamOut.Close();
        StreamReader streamIn = new StreamReader(req.GetResponse().GetResponseStream());
        string strResponse = streamIn.ReadToEnd();
        streamIn.Close();

        Dictionary<string, string> results = new Dictionary<string, string>();
        if (strResponse != "")
        {
            StringReader reader = new StringReader(strResponse);
            string line = reader.ReadLine();

            if (line == "SUCCESS")
            {

                while ((line = reader.ReadLine()) != null)
                {
                    results.Add(line.Split('=')[0], line.Split('=')[1]);

                }
                Response.Write("<p><h3>Your order has been received.</h3></p>");
                Response.Write("<b>Details</b><br>");
                Response.Write("<li>Name: " + results["first_name"] + " " + results["last_name"] + "</li>");
                Response.Write("<li>Item: " + results["item_name"] + "</li>");
                Response.Write("<li>Amount: " + results["payment_gross"] + "</li>");
                Response.Write("<hr>");
            }
            else if (line == "FAIL")
            {
                // Log for manual investigation
                Response.Write("Unable to retrive transaction detail");
            }
        }
        else
        {
            //unknown error
            Response.Write("ERROR");
        }
    }


</script>


<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title></title>
</head>
<body>
    

	<div>
    
    	</div>
</body>
</html>
