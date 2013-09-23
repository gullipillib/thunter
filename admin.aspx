<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }

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


    protected void Button3_Click(object sender, EventArgs e)
    {
        AccessDataSource1.UpdateCommand = "UPDATE settings SET logintimes = '" + TextBox2.Text + "'";
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        AccessDataSource1.UpdateCommand = "UPDATE settings SET tspots = '" + TextBox3.Text + "'";
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        AccessDataSource1.UpdateCommand = "UPDATE settings SET invites = '" + TextBox4.Text + "'";
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        AccessDataSource1.UpdateCommand = "UPDATE settings SET loginreset = '" + TextBox5.Text + "'";
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
                <asp:AsyncPostBackTrigger ControlID="Button3" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="Button4" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="Button5" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="Button6" EventName="Click" />
        </Triggers>
            </asp:UpdatePanel>

        <asp:Panel ID="Panel1" runat="server" style="z-index: 1; left: 17px; top: 424px; position: absolute; height: 117px; width: 443px" Visible="False">
            <asp:Label ID="Label1" runat="server" Text="Password" style="z-index: 1; left: 83px; top: 28px; position: absolute"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" style="z-index: 1; left: 158px; top: 28px; position: absolute; width: 238px" TextMode="Password"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="OK" style="z-index: 1; left: 183px; top: 76px; position: absolute" OnClick="Button1_Click" />
        </asp:Panel>
        
        <asp:Panel ID="Panel2" runat="server" style="z-index: 1; left: 20px; top: 61px; position: absolute; height: 450px; width: 856px">
            <asp:Button ID="Button2" runat="server" style="z-index: 1; left: 710px; top: 15px; position: absolute" Text="Logout" OnClick="Button2_Click" />
            
        
        
            <asp:Label ID="Label2" runat="server" ForeColor="#3333FF" style="z-index: 1; left: 43px; top: 76px; position: absolute; width: 92px" Text="Login Times"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" style="z-index: 1; left: 130px; top: 76px; position: absolute; height: 18px"></asp:TextBox>
            <asp:Button ID="Button3" runat="server" style="z-index: 1; left: 277px; top: 76px; position: absolute" Text="Update" OnClick="Button3_Click" />
            
        
        
            <asp:Label ID="Label3" runat="server" style="z-index: 1; left: 43px; top: 119px; position: absolute" Text="TSpots" ForeColor="#3333FF"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" style="z-index: 1; left: 128px; top: 119px; position: absolute"></asp:TextBox>
            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" style="z-index: 1; left: 282px; top: 116px; position: absolute" Text="Update" />
            
        
        
            <asp:Label ID="Label4" runat="server" ForeColor="#3333FF" style="z-index: 1; left: 42px; top: 171px; position: absolute" Text="Invites"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server" style="z-index: 1; left: 124px; top: 171px; position: absolute"></asp:TextBox>
            <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" style="z-index: 1; left: 274px; top: 169px; position: absolute" Text="Update" />
            
        
        
            <asp:Label ID="Label5" runat="server" ForeColor="#3333FF" style="z-index: 1; left: 45px; top: 241px; position: absolute" Text="Login Reset"></asp:Label>
            <asp:TextBox ID="TextBox5" runat="server" style="z-index: 1; left: 137px; top: 241px; position: absolute"></asp:TextBox>
            <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" style="z-index: 1; left: 290px; top: 237px; position: absolute" Text="Update" />
            
        
        
        </asp:Panel>
        <asp:AccessDataSource id="AccessDataSource1" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT * FROM settings" InsertCommand="INSERT INTO settings(logintimes, tspots, invites, loginreset) VALUES ('', '', '','')" UpdateCommand="UPDATE settings SET logintimes = ''"> </asp:AccessDataSource>

    </form>
</body>
</html>
