<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == true)
        {
            string checkpassword = "zxpoqwmn0912";
            Session["adlogin"] = "yes";
            if (TextBox1.Text == checkpassword)
            {
                
                Response.Redirect("~/Admin.aspx");
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
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

        <asp:Panel ID="Panel1" runat="server" style="z-index: 1; left: 401px; top: 132px; position: absolute; height: 117px; width: 443px">
            <asp:Label ID="Label1" runat="server" Text="Password" style="z-index: 1; left: 83px; top: 28px; position: absolute"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" style="z-index: 1; left: 158px; top: 28px; position: absolute; width: 238px" TextMode="Password"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="OK" style="z-index: 1; left: 183px; top: 76px; position: absolute" OnClick="Button1_Click" />
        </asp:Panel>
        
        </form>
</body>
</html>
