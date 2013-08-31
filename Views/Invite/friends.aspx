<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>
<script runat="server">
    System.Net.WebClient webClient = new System.Net.WebClient();
    string mytoken = "";
    string permanenttoken = "";
    string tempstring = "";
    string myid = "";
    string receiptno = "";

protected void checkusername()
{
    Hiddenfield1.Value = Model.Name;
    Hiddenfield1.Value = Hiddenfield1.Value.Replace(" ", "");
    if (Hiddenfield1.Value != null)
    {
       
    }
    else
    {
        Response.Redirect("http://apps.facebook.com/gullipilli");
    }
}

protected void Page_Load(object sender, EventArgs e)
{
    checkusername();
}
</script>
<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>friends</title>
</head>
<body>
    <div>
        
    </div>
    <asp:HiddenField ID="Hiddenfield1" runat="server"></asp:HiddenField>
</body>
</html>
