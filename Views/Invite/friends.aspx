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
    string Hiddenfield1;
     



protected void Page_Load(object sender, EventArgs e)
{
    if (Session["reached"] == null)
    {

        if (Convert.ToString(Session["reached"]) == "no")
        {
            Response.Redirect("~/Home/Index1");
        }
    }
    else if (Session["reached"] != null)
    {
        if (Convert.ToString(Session["reached"]) == "no")
        {
            Response.Redirect("~/Home/Index1");
        }   
    }
}
</script>
<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>friends</title>
</head>
 <!-- Google Code for Remarketing Tag -->
<!--------------------------------------------------
Remarketing tags may not be associated with personally identifiable information or placed on pages related to sensitive categories. See more information and instructions on how to setup the tag on: http://google.com/ads/remarketingsetup
--------------------------------------------------->
<script type="text/javascript">
var google_tag_params = {
ecomm_prodid: '101_th',
ecomm_pagetype: 'product',
ecomm_totalvalue: '2.00',
};
</script>
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 967011017;
var google_custom_params = window.google_tag_params;
var google_remarketing_only = true;
/* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/967011017/?value=0&amp;guid=ON&amp;script=0"/>
</div>
</noscript>
<body>
    


<script src="https://connect.facebook.net/en_US/all.js">
    FB.init({
        appId: '123405257731200',
        cookie: true,
        status: true,
        xfbml: true
    });
</script>
<script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "https://connect.facebook.net/en_US/all.js#xfbml=1&appId=123405257731200";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>


<script>
    function FacebookInviteFriends() {
        FB.ui({
            method: 'apprequests',
            message: 'You are Invited to Play Treasure Hunter 3D MultiPlayer Game with me'
        });                                                                                                                                                                                                                           
    }
</script>
   
    <form id="form1" runat="server">
        <div id="fb-root">
        </div>  
        <div style="border: 20px ridge #999966; position: absolute; z-index: 300; top: 118px; left: 238px; height: 325px; width: 441px; background-color: #FFCC66;"> 
<a href='#' onclick="FacebookInviteFriends();" style="position:absolute;left:32%; top:75%; width:27%; height: 7%; text-decoration:none; color: #FFFFFF; background-color: #0000FF; border-radius:20px; text-align: center; right: 159px; z-index: 310;">Invite Friends</a>

<asp:hyperlink ID="Hyperlink4" runat="server"  Font-Underline="False" NavigateUrl="~/gamesettings.aspx" style="z-index: 310; left: 68%; top: 13%; position: absolute; height: 6%; width: 21%; cursor: pointer;" Target="_self" Font-Size="13pt">My Game</asp:hyperlink>

    <asp:hyperlink ID="Hyperlink1" runat="server"  Font-Underline="False" NavigateUrl="~/Play/play" style="z-index: 310; left: 2%; top: 13%; position: absolute; right: 276px; width: 32%; height: 8%; cursor: pointer;" Target="_self" Font-Size="13pt">Go on a Treasurehunt</asp:hyperlink>
        
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Andy" Font-Size="15pt" ForeColor="White" style="z-index: 310; left: 117px; top: 10px; position: absolute" Text="Invite Some of Your Friends "></asp:Label>
        
        </div>
 <img alt="" src="https://treasurehunter.apphb.com/Images/bg.jpg" style="z-index: 0; left: 0px; top: 0px; position: absolute; width:100%; height:100%" />        
        </form>
   
</body>
</html>
