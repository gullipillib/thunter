<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <iframe width="585" scrolling="no" frameborder="0" style="border: 1px none white; z-index: 1; left: 28px; top: 17px; position: absolute; height: 610px; " src="https://www.trialpay.com/dispatch/c0959f54259e6c43409b3ef18b98479d?sid=7plK3xiCN5tkXO8uO6kgowfoI3U&order_info=1&tpi=CAAVVIRI&currency_url=http://www.acmesoft.com/vc/coins.php&callback_url=http://www.acmesoft.com/tastymorsels/callback.php"></iframe>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Play/play" style="z-index: 1; left: 740px; top: 21px; position: absolute">Back to Game</asp:HyperLink>
    </form>
</body>
</html>
