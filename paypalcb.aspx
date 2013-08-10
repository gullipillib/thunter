<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        string item_number = Request.Form["item_number"];
        string pay_status = Request.Form["payment_status"];
        Label2.Text = item_number + " " + pay_status;
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
    
        <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 60px; top: 15px; position: absolute" Text="PayPal Transaction Receipt"></asp:Label>
        <asp:Button ID="Button1" runat="server" style="z-index: 1; left: 451px; top: 47px; position: absolute; width: 178px" Text="Go to My Treasure Spot" />
        <asp:Label ID="Label2" runat="server" style="z-index: 1; left: 57px; top: 57px; position: absolute; width: 297px; height: 144px" Text="Label"></asp:Label>
    
    </div>
    </form>
</body>
</html>
