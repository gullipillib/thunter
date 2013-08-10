<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>
<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "zxpoqwmn0912")
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        Panel2.Visible = false;
        Response.Redirect("https://treasurehunter.apphb.com");
    }
</script>


<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>


        </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click" />
        </Triggers>
            </asp:UpdatePanel>

        <asp:Panel ID="Panel1" runat="server" style="z-index: 1; left: 256px; top: 203px; position: absolute; height: 117px; width: 443px">
            <asp:Label ID="Label1" runat="server" Text="Password" style="z-index: 1; left: 83px; top: 28px; position: absolute"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" style="z-index: 1; left: 158px; top: 28px; position: absolute; width: 238px" TextMode="Password"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="OK" style="z-index: 1; left: 183px; top: 76px; position: absolute" OnClick="Button1_Click" />
        </asp:Panel>
        
        <asp:Panel ID="Panel2" runat="server" style="z-index: 1; left: 26px; top: 61px; position: absolute; height: 450px; width: 856px" Visible="False">
            <asp:Button ID="Button2" runat="server" style="z-index: 1; left: 710px; top: 15px; position: absolute" Text="Logout" OnClick="Button2_Click" />
            
        
        
        </asp:Panel>
    </form>
</body>
</html>
