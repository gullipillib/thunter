<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<!DOCTYPE html>
<script runat="server">
    

</script>
<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title></title>
</head>
<!-- Google Code for Remarketing Tag -->
<!--------------------------------------------------
Remarketing tags may not be associated with personally identifiable information or placed on pages related to sensitive categories. See more information and instructions on how to setup the tag on: http://google.com/ads/remarketingsetup
--------------------------------------------------->
<script type="text/javascript">
    var google_tag_params = {
        ecomm_prodid: 'REPLACE_WITH_VALUE',
        ecomm_pagetype: 'REPLACE_WITH_VALUE',
        ecomm_totalvalue: 'REPLACE_WITH_VALUE',
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
    <form runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT tsapprovercomments FROM tspots WHERE (tsowner = '<%=Hiddenfield1%>')"></asp:SqlDataSource>
        
    <img alt="" src="https://treasurehunter.apphb.com/Images/bg.jpg" style="z-index: -1; left: -75px; top: -103px; position: absolute; width:100%; height:100%" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" GridLines="None" Height="460px" ShowHeader="False" style="z-index: 1; left: 27px; top: 65px; position: absolute; height: 460px; width: 821px" Width="821px">
            <Columns>
                <asp:BoundField DataField="tsapprovercomments" HeaderText="tsapprovercomments" SortExpression="tsapprovercomments" />
            </Columns>
        </asp:GridView>
        
    </form>
   <a href="Views/Home/Play/play" target="_self" style="position:absolute;left:271px; top:23px; width:152px; text-decoration:none; background-color: #0000FF; color: #FFFFFF; webkit-border-radius:20px; moz-border-radius:20px; border-radius:20px; right: 491px; text-align: center;" > Go On a TreasureHunt </a> 
   
        
   <a href="create.aspx" target="_self" style="position:absolute;left:564px; top:17px; width:160px; text-decoration:none; background-color: #0000FF; color: #FFFFFF; webkit-border-radius:20px; moz-border-radius:20px; border-radius:20px; right: 190px; text-align: center; height: 23px;" > Go to My TreasureSpot </a> 
   
        </body>
</html>
