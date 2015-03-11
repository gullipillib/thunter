<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>


<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:TextBox ID="TextBox1" runat="server" BackColor="Transparent" BorderColor="White" BorderStyle="None" ForeColor="Black" ReadOnly="True" style="z-index: 1; left: 246px; top: 142px; position: absolute; width: 547px; height: 330px" TextMode="MultiLine">You Can Buy and use 3d Glasses at Amazon or ebay or mild grey shaded sun glasses also produces the 3D effect.</asp:TextBox>
        

<asp:HyperLink ID="HyperLink5" runat="server" ForeColor="Black" NavigateUrl="~/Play/play" style="z-index: 1; left: 719px; top: 54px; position: absolute">Back to Game</asp:HyperLink>
        
        <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="http://www.amazon.com/gp/registry/wishlist/1PGNINJD506B3/ref=topnav_lists_1" style="z-index: 1; left: 66px; top: 150px; position: absolute; width: 67px; text-decoration:none; cursor:pointer" Target="_blank">Buy Now</asp:HyperLink>
        
        <asp:Image ID="Image1" runat="server" ImageUrl="http://ecx.images-amazon.com/images/I/31R6lUgaBAL._SL500_SL135_.jpg" style="z-index: 1; left: 31px; top: 59px; position: absolute" />
        
    </form>
</body>
</html>
