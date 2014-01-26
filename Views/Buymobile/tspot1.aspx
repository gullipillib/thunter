<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>Buy</title>
</head>
<body>
   <div style="position: absolute; border: medium solid #000000; top: 19px; left: 12px; width: 350px; height: 155px;">
          <h2 style="width: 264px; position: absolute; top: 6px; left: 7px;">Buy A New ToolBox Item</h2>
             <asp:Label ID="Label15" runat="server" style="z-index: 1; left: 22px; top: 86px; position: absolute" Text="Price($)"></asp:Label>
             <asp:Label ID="Label16" runat="server" style="z-index: 1; left: 116px; top: 87px; position: absolute" Text="3"></asp:Label>
             <asp:Label ID="Label17" runat="server" style="z-index: 1; left: 7px; top: 56px; position: absolute" Text="Item Name"></asp:Label>
             <asp:Label ID="Label18" runat="server" style="z-index: 1; left: 94px; top: 54px; position: absolute; width: 93px">ToolBox Item</asp:Label>
         </div>
    <form id="Form5" action="https://www.paypal.com/cgi-bin/webscr"  style="position:absolute; top: 112px; left: 180px;" method="post" target="_top">
<input type="hidden" name="cmd" value="_xclick"/>
<input type="hidden" name="business" value="servicestwts@yahoo.com"/>
<input type="hidden" name="lc" value="IN"/>
<input type="hidden" name="item_name" value="ToolBox Item Buy"/>
<input type="hidden" name="amount" value="3"/>
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
</body>
</html>
