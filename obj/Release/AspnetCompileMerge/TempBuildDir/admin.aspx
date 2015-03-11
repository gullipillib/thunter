<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="System.Data" %>

<!DOCTYPE html>
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            if (Convert.ToString(Session["adlogin"]) == "yes")
            {

                Panel2.Enabled = true;
            }
            else
            {
                //Response.Redirect("~/login.aspx");
            }
            
        }
    }

    

    protected void Button2_Click(object sender, EventArgs e)
    {
        
        Panel2.Enabled = false;
        Response.Redirect("https://treasurehunter.apphb.com");
    }


    protected void Button3_Click(object sender, EventArgs e)
    {
        SqlDataSource1.UpdateCommand = "UPDATE settings SET logintimes = '" + TextBox2.Text + "'";
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        SqlDataSource1.UpdateCommand = "UPDATE settings SET tspots = '" + TextBox3.Text + "'";
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        SqlDataSource1.UpdateCommand = "UPDATE settings SET invites = '" + TextBox4.Text + "'";
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        SqlDataSource1.UpdateCommand = "UPDATE settings SET loginreset = '" + TextBox5.Text + "'";
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        string lutspots = "";
        SqlDataSource1.SelectCommand = "SELECT * FROM tspots where tsowner ='treasurehunter' order by tsorder DESC";
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

        string tsorderno = dv[0]["tsorder"].ToString();
        tsorderno = Convert.ToString(Convert.ToInt16(tsorderno) + 1);
        SqlDataSource1.InsertCommand = "INSERT INTO tspots(tscompleted,tsnew,tsprice,tsselltype,tsactive,tsapproved,tsapprover1,tsapprover2,tsapprover3,tsbid,tsbidder,tsitems,tsname,tsowner,tsproductid,tsproducturl,tsreported,tsreportcomments,tsa1status,tsa2status,tsa3status,tssell,tsreportaddress,tsbiddate,tsaward,tsrplayers,tsdplayers,tsrplayersdetails,tsdplayersdetails,tsorder) Values ('yes','yes','5','buy','yes','yes','treasurehunter','treasurehunter','treasurehunter','no',' ',' ',' ','" + "treasurehunter" + "','thppbuy','paypal','no','yes','yes','yes',' ','no',' ',' ',' ',' ',' ',' ',' ','" + tsorderno + "')";
        SqlDataSource1.Insert();
        SqlDataSource1.SelectCommand = "SELECT lutspots,luname FROM loggedusers";
        dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        DataTable dt = new DataTable();
        dt = dv.ToTable();
        DataView uniname = dt.DefaultView;
        if (dt.Rows.Count != 0)
        {
            lutspots = dt.Rows[0].Field<string>("lutspots"); //usethis to get field value
        }
        if (dt.Rows.Count == 0)
        {
            lutspots = "0";
        }
        SqlDataSource1.UpdateCommand = "UPDATE loggedusers SET lutspots = '" + Convert.ToString(Convert.ToInt16(lutspots) + 1) + "' where luname='" + "Treasure Hunter" + "'";
        SqlDataSource1.Update();
        Response.Redirect("~/create.aspx");
    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = "SELECT * FROM toolbox  where tbowner ='treasurehunter' order by tborder DESC";
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

        string tborderno = dv[0]["tborder"].ToString();
        tborderno = Convert.ToString(Convert.ToInt16(tborderno) + 1);
        SqlDataSource1.InsertCommand = "INSERT INTO toolbox(tbcompleted,tbnew,tbprice,tbselltype,tbactive,tbapproved,tbapprover1,tbapprover2,tbapprover3,tbbid,tbbidder,tbdetails,tbname,tbowner,tbinvoice,tbreported,tbreportcomments,tba1status,tba2status,tba3status,tbsell,tbreportaddress,tbbiddate,tbaward,tborder) Values ('no','yes','5','buy','yes','yes','treasurehunter','treasurehunter','treasurehunter','no',' ',' ',' ','" + "treasurehunter" + "','thtbbuy','no',' ','yes','yes','yes','no',' ',' ',' ', '" + tborderno + "')";
        SqlDataSource1.Insert();
        Response.Redirect("~/tools.aspx");
    }

    protected void Button9_Click(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = "SELECT tsname, tsbidder, tsaward, tsowner FROM tspots";
        SqlDataSource1.UpdateCommand = "UPDATE tspots SET tsaward = 'yes' where tsowner='" + "Treasure Hunter" + "' and tsname='" + GridView1.Rows[GridView1.SelectedIndex].Cells[3].Text + "'";
        SqlDataSource1.Update();
    }

    protected void Button10_Click(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = "SELECT tsname, tsbidder, tsaward, tsowner FROM tspots";
        SqlDataSource1.UpdateCommand = "UPDATE tspots SET tsaward = 'no' where tsowner='" + "Treasure Hunter" + "' and tsname='" + GridView1.Rows[GridView1.SelectedIndex].Cells[3].Text + "'";
        SqlDataSource1.Update();
    }

    protected void Button11_Click(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = "SELECT tbname, tbbidder, tbaward, tbowner FROM toolbox";
        SqlDataSource1.UpdateCommand = "UPDATE toolbox SET tbaward = 'yes' where tbowner='" + "Treasure Hunter" + "' and tbname='" + GridView2.Rows[GridView2.SelectedIndex].Cells[3].Text + "'";
        SqlDataSource1.Update();
    }

    protected void Button12_Click(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = "SELECT tbname, tbbidder, tbaward, tbowner FROM toolbox";
        SqlDataSource1.UpdateCommand = "UPDATE toolbox SET tbaward = 'no' where tbowner='" + "Treasure Hunter" + "' and tbname='" + GridView2.Rows[GridView2.SelectedIndex].Cells[3].Text + "'";
        SqlDataSource1.Update();
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
                
                <asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="Button3" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="Button4" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="Button5" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="Button6" EventName="Click" />
        </Triggers>
            </asp:UpdatePanel>

        <asp:Panel ID="Panel2" runat="server" style="z-index: 1; left: 20px; top: 301px; position: absolute; height: 1256px; width: 974px" Enabled="False">
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
            
            <asp:Button ID="Button7" runat="server"  style="z-index: 1; left: 251px; top: 302px; position: absolute" Text="add" OnClick="Button7_Click" />
        <asp:Button ID="Button8" runat="server"  style="z-index: 1; left: 251px; top: 353px; position: absolute" Text="add" OnClick="Button8_Click"  />
        
        
        
             <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" PageSize="5" style="z-index: 1; left: 24px; top: 428px; position: absolute; height: 204px; width: 668px" ToolTip="Treasure Spots">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                    <asp:BoundField DataField="tsprice" HeaderText="tsprice" SortExpression="tsprice" />
                    <asp:BoundField DataField="tsapproved" HeaderText="tsapproved" SortExpression="tsapproved" />
                    <asp:BoundField DataField="tsactive" HeaderText="tsactive" SortExpression="tsactive" />
                    <asp:BoundField DataField="tsname" HeaderText="tsname" SortExpression="tsname" />
                    <asp:BoundField DataField="tsowner" HeaderText="tsowner" SortExpression="tsowner" />
                    <asp:BoundField DataField="tsreported" HeaderText="tsreported" SortExpression="tsreported" />
                    <asp:BoundField DataField="tscompleted" HeaderText="tscompleted" SortExpression="tscompleted" />
                    <asp:BoundField DataField="tssell" HeaderText="tssell" SortExpression="tssell" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:Button ID="Button11" runat="server" Enabled="False" style="z-index: 1; left: 187px; top: 381px; position: absolute" Text="Sell" />
            <asp:TextBox ID="TextBox6" runat="server" style="z-index: 1; left: 233px; top: 382px; position: absolute" ToolTip="Enter Price Above $5 (Note: 50% of the awarded bid amount goes to Treasure Hunter)"></asp:TextBox>
            <asp:Label ID="Label8" runat="server" Font-Bold="True" ForeColor="Blue" style="z-index: 1; left: 35px; top: 382px; position: absolute; height: 18px;" Text="My Treasure Spots"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" style="z-index: 1; left: 383px; top: 383px; position: absolute">
                <asp:ListItem>Bid</asp:ListItem>
                <asp:ListItem>Fixed Price</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="Button9" runat="server" OnClick="Button9_Click" style="z-index: 1; left: 494px; top: 381px; position: absolute" Text="Approve Bid" />
            
        
        
            <asp:Label ID="Label6" runat="server" style="z-index: 1; left: 50px; top: 302px; position: absolute; width: 151px;" Text="Add New TreasureSpot"></asp:Label>
            <asp:Label ID="Label7" runat="server" style="z-index: 1; left: 51px; top: 353px; position: absolute; width: 151px;" Text="Add New ToolBox item"></asp:Label>
            
        
        
            <asp:Button ID="Button10" runat="server" OnClick="Button10_Click" style="z-index: 1; left: 696px; top: 381px; position: absolute" Text="Revoke" />
            <asp:Button ID="Button12" runat="server" Enabled="False" style="z-index: 1; left: 168px; top: 675px; position: absolute" Text="Sell" />
            <asp:Label ID="Label9" runat="server" Font-Bold="True" ForeColor="Blue" style="z-index: 1; left: 26px; top: 680px; position: absolute" Text="My ToolBox Items"></asp:Label>
            <asp:TextBox ID="TextBox7" runat="server" style="z-index: 1; left: 231px; position: absolute; top: 675px;" ToolTip="Enter Price Above $3 (Note: 50% of the awarded bid amount goes to Treasure Hunter)"></asp:TextBox>
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" style="z-index: 1; left: 402px; top: 675px; position: absolute">
                <asp:ListItem>Bid</asp:ListItem>
                <asp:ListItem>Fixed Price</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="Button13" runat="server" OnClick="Button11_Click" style="z-index: 1; left: 530px; top: 673px; position: absolute" Text="Approve Bid" />
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" PageSize="5" style="z-index: 1; left: 19px; top: 715px; position: absolute; height: 204px; width: 668px" ToolTip="Treasure Spots">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="tbprice" HeaderText="tbprice" SortExpression="tbprice" />
                    <asp:BoundField DataField="tbapproved" HeaderText="tbapproved" SortExpression="tbapproved" />
                    <asp:BoundField DataField="tbactive" HeaderText="tbactive" SortExpression="tbactive" />
                    <asp:BoundField DataField="tbname" HeaderText="tbname" SortExpression="tbname" />
                    <asp:BoundField DataField="tbowner" HeaderText="tbowner" SortExpression="tbowner" />
                    <asp:BoundField DataField="tbreported" HeaderText="tbreported" SortExpression="tbreported" />
                    <asp:BoundField DataField="tbcompleted" HeaderText="tbcompleted" SortExpression="tbcompleted" />
                    <asp:BoundField DataField="tbsell" HeaderText="tbsell" SortExpression="tbsell" />
                    <asp:BoundField DataField="tbbid" HeaderText="tbbid" SortExpression="tbbid" />
                    <asp:BoundField DataField="tbbidder" HeaderText="tbbidder" SortExpression="tbbidder" />
                    <asp:BoundField DataField="tbaward" HeaderText="tbaward" SortExpression="tbaward" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            
        
        
        </asp:Panel>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT * FROM settings" InsertCommand="INSERT INTO settings(logintimes, tspots, invites, loginreset) VALUES ('', '', '','')" UpdateCommand="UPDATE settings SET logintimes = ''"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT tsprice, tsapproved, tsactive, tsname, tsowner, tsreported, tscompleted, tssell, tsbid, tsbidder, tsaward FROM tspots WHERE tsowner = 'Treasure Hunter'"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT tbprice, tbapproved, tbactive, tbname, tbowner, tbreported, tbcompleted, tbsell, tbbid, tbbidder, tbaward FROM toolbox WHERE (tbowner = 'Treasure Hunter')"></asp:SqlDataSource>

        
    </form>
</body>
</html>
