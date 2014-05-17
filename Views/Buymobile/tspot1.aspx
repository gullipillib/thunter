<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>Buy</title>
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
</noscript> <body>
 
   <div style="position: absolute; border: medium solid #000000; top: 19px; left: 12px; width: 350px; height: 221px; z-index:1;">
          <h2 style="width: 264px; position: absolute; top: 6px; left: 7px; z-index:1; color: #FFFFFF;">Buy A TreasureSpot</h2>
             <asp:Label ID="Label15" runat="server" style="z-index: 1; left: 22px; top: 86px; position: absolute; z-index:1;" Text="Price($)" ForeColor="White"></asp:Label>
             <asp:Label ID="Label16" runat="server" style="z-index: 1; left: 116px; top: 87px; position: absolute; z-index:1;" Text="2" ForeColor="White"></asp:Label>
             <asp:Label ID="Label17" runat="server" style="z-index: 1; left: 7px; top: 56px; position: absolute; z-index:1;" Text="Item Name" ForeColor="White"></asp:Label>
             <asp:Label ID="Label18" runat="server" style="z-index: 1; left: 94px; top: 54px; position: absolute; width: 93px; z-index:1;" ForeColor="White">ToolBox Item</asp:Label>
   <label style="z-index: 300; left: 35px; top: 149px; position: absolute; height: 29px; width: 161px; font-size: 10px; font-family: Arial; color: #FFFFFF; font-weight: bolder; font-style: normal;">
                Use Facebook Payment System to Purchase</label>   
    <label style="z-index: 300; left: 10px; top: 188px; position: absolute; height: 21px; width: 95px; font-size: 16px; font-family: Arial; color: #FFFFFF; font-weight: bolder; font-style: normal; right: 245px;">
                Price $2</label>      
   <asp:hyperlink ID="Hyperlink14" runat="server"  Font-Underline="False" NavigateUrl="~/fbbuy.html" style="z-index: 300; left: 143px; top: 188px; vertical-align:middle; text-align:center; position: absolute; width: 110px; height: 22px; border-radius:15px; background-color: #0000FF; font-size: 12px; color: #FFFFFF;">Buy Now</asp:hyperlink>
   </div>
    <img alt="" src="https://treasurehunter.apphb.com/Images/bg.jpg" style="z-index: 0; left: 0px; top: 0px; position: absolute; width:100%; height:100%" />  

    <form id="Form5" action="https://www.paypal.com/cgi-bin/webscr"  style="position:absolute; top: 112px; left: 180px; z-index:1;" method="post" target="_top">
<input type="hidden" name="cmd" value="_xclick"/>
<input type="hidden" name="business" value="servicestwts@yahoo.com"/>
<input type="hidden" name="lc" value="IN"/>
<input type="hidden" name="item_name" value="ToolBox Item Buy"/>
<input type="hidden" name="amount" value="2"/>
<input type="hidden" name="currency_code" value="USD"/>
<input type="hidden" name="button_subtype" value="services"/>
<input type="hidden" name="no_note" value="1"/>
<input type="hidden" name="no_shipping" value="1"/>
<input type="hidden" name="tax_rate" value="0.000"/>
<input type="hidden" name="shipping" value="0.00"/>
<input type="hidden" id="Hidden4" name="custom" value='<%=Convert.ToString(Session["loggeduser"])%>'/>
<input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHosted"/>
<input type="image" src="https://www.paypalobjects.com/en_GB/i/btn/btn_buynowCC_LG.gif"  name="submit" alt="PayPal – The safer, easier way to pay online."/>
<img alt="" border="0" src="https://www.paypalobjects.com/en_GB/i/scr/pixel.gif" width="1" height="1"/>
</form>
</body>
</html>
