<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>

<!DOCTYPE html>
<script runat="server">
    
    
    
    protected void checkusername()
    {
        Hiddenfield1.Value = Model.Name;
        Hiddenfield1.Value = Hiddenfield1.Value.Replace(" ", "");
        if (Hiddenfield1.Value != null)
        {

            //Insert User into appuser,loggeduser,ordercounter,treasureprize;
            AccessDataSource1.SelectCommand = "SELECT uname FROM appuserdetails WHERE (uname = '" + Hiddenfield1.Value + "')";

            DataView dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();
            //DataTable dtr = dt;
            //DataRow[] uniname = dtr.Select("uname");
            //username = dt.Rows[0].Field<string>("uname"); usethis to get field value
            //Label3.Text = dt.Rows[0][0].ToString();
            if (dt.Rows.Count == 0)
            {
                //Insert User into appuser,loggeduser,ordercounter,winners;
                AccessDataSource1.InsertCommand = "INSERT INTO appuserdetails(uname, uloggedin, winner, wintimes, paid, amount, currenttspot) VALUES ('" + Hiddenfield1.Value + "', 'no', 'no', '0', 'no', '0', '')";
                AccessDataSource1.Insert();
                AccessDataSource1.SelectCommand = "SELECT * FROM loggedusers";
                AccessDataSource1.InsertCommand = "INSERT INTO loggedusers(luname, luid, luposition, luimg, luspriteimg, lucrisboos, luloggedin, lutspots, lulogintimes, luinvites) VALUES ('" + Hiddenfield1.Value + "', '" + Model.Id + "', '{left : 0, top:0}', '" + Model.ProfilePicture.Data.Url + "', '" + Model.ProfilePicture.Data.Url + "', '100', 'yes', '0', '0', '0')";
                AccessDataSource1.Insert();
                AccessDataSource1.SelectCommand = "SELECT * FROM ordercounter";
                AccessDataSource1.InsertCommand = "INSERT INTO ordercounter(uname, ccounter) Values ('" + Hiddenfield1.Value + "','0')";
                AccessDataSource1.Insert();
                AccessDataSource1.SelectCommand = "SELECT * FROM winners";
                AccessDataSource1.InsertCommand = "INSERT INTO winners(uname, crisboos) Values ('" + Hiddenfield1.Value + "','0')";
                AccessDataSource1.Insert();
            }

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

protected void Button1_Click(object sender, EventArgs e)
{
    Application["tspotname"] = GridView3.Rows[GridView3.SelectedIndex].Cells[0].Text;
    Application["tspotprice"] = GridView3.Rows[GridView3.SelectedIndex].Cells[2].Text;
    Response.Redirect("~/Tspot/buy");
}

protected void Button3_Click(object sender, EventArgs e)
{
    Application["toolboxname"] = GridView5.Rows[GridView5.SelectedIndex].Cells[0].Text;
    Application["tbprice"] = GridView5.Rows[GridView5.SelectedIndex].Cells[2].Text;
    Response.Redirect("~/Tspot/buy");
}

protected void Button9_Click(object sender, EventArgs e)
{
    AccessDataSource1.SelectCommand = "SELECT tsname, tsbidder, tsaward, tsowner FROM tspots";
    AccessDataSource1.UpdateCommand = "UPDATE tspots SET tsaward = 'yes' where tsowner='" + Hiddenfield1.Value + "' and tsname='" + GridView1.Rows[GridView1.SelectedIndex].Cells[3].Text + "'" ;
    AccessDataSource1.Update();
}

protected void Button10_Click(object sender, EventArgs e)
{
    AccessDataSource1.SelectCommand = "SELECT tsname, tsbidder, tsaward, tsowner FROM tspots";
    AccessDataSource1.UpdateCommand = "UPDATE tspots SET tsaward = 'no' where tsowner='" + Hiddenfield1.Value + "' and tsname='" + GridView1.Rows[GridView1.SelectedIndex].Cells[3].Text + "'";
    AccessDataSource1.Update();
}

protected void Button11_Click(object sender, EventArgs e)
{
    AccessDataSource1.SelectCommand = "SELECT tbname, tbbidder, tbaward, tbowner FROM toolbox";
    AccessDataSource1.UpdateCommand = "UPDATE tollbox SET tbaward = 'yes' where tbowner='" + Hiddenfield1.Value + "' and tbname='" + GridView2.Rows[GridView2.SelectedIndex].Cells[3].Text + "'";
    AccessDataSource1.Update();
}

protected void Button12_Click(object sender, EventArgs e)
{
    AccessDataSource1.SelectCommand = "SELECT tbname, tbbidder, tbaward, tbowner FROM toolbox";
    AccessDataSource1.UpdateCommand = "UPDATE tollbox SET tbaward = 'no' where tbowner='" + Hiddenfield1.Value + "' and tbname='" + GridView2.Rows[GridView2.SelectedIndex].Cells[3].Text + "'";
    AccessDataSource1.Update();
}
</script>
<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>gamesettings</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        <asp:Label ID="Label7" runat="server" Font-Bold="True" style="z-index: 1; left: 15px; top: 7px; position: absolute" Text="Money Earned"></asp:Label>
        <asp:Button ID="Button8" runat="server" style="z-index: 1; left: 674px; top: 4px; position: absolute" Text="Buy a New ToolBox Item" />
        <asp:Button ID="Button7" runat="server" style="z-index: 1; left: 426px; top: 3px; position: absolute" Text="Buy a New Treasure Spot" />
        <asp:Label ID="Label8" runat="server" Font-Bold="True" style="z-index: 1; left: 225px; top: 8px; position: absolute; height: 22px; width: 62px" Text="Crisboos"></asp:Label>
        
    </div>
    <asp:AccessDataSource id="AccessDataSource1" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT uname FROM appuserdetails WHERE (uname = '<%=Hiddenfield.Value%>')"> </asp:AccessDataSource>
        <asp:ListBox ID="ListBox1" runat="server" DataSourceID="AccessDataSource8" DataTextField="amount" DataValueField="amount" style="z-index: 1; left: 124px; top: 7px; position: absolute; height: 24px"></asp:ListBox>
        <asp:HiddenField ID="HiddenField2" runat="server" />
        <asp:HiddenField ID="HiddenField3" runat="server" />
        <asp:Button ID="Button1" runat="server" style="z-index: 1; left: 205px; top: 38px; position: absolute" Text="Buy" Enabled="False" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" style="z-index: 1; left: 606px; top: 35px; position: absolute" Text="Bid" Enabled="False" />
       <asp:Button ID="Button3" runat="server" style="z-index: 1; left: 186px; top: 309px; position: absolute" Text="Buy" Enabled="False" OnClick="Button3_Click" />
        <asp:Button ID="Button4" runat="server" style="z-index: 1; left: 608px; top: 305px; position: absolute" Text="Bid" Enabled="False" />
        <asp:Button ID="Button5" runat="server" style="z-index: 1; left: 168px; top: 855px; position: absolute" Text="Sell" Enabled="False" /> 
        <asp:Button ID="Button6" runat="server" style="z-index: 1; left: 176px; top: 576px; position: absolute" Text="Sell" Enabled="False" />
        <asp:AccessDataSource id="AccessDataSource2" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT tsprice, tsapproved, tsactive, tsname, tsowner, tsreported, tscompleted, tssell, tsbid, tsbidder, tsaward FROM tspots WHERE (tsowner = '<%=Hiddenfield1.Value%>')"> </asp:AccessDataSource>
        <asp:TextBox ID="TextBox2" runat="server" style="z-index: 1; left: 660px; top: 306px; position: absolute" ToolTip="Enter Price Above $3 (Note: 50% of the awarded bid amount goes to treasurehunter)"></asp:TextBox>
        <asp:AccessDataSource id="AccessDataSource3" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT tbprice, tbapproved, tbactive, tbname, tbowner, tbreported, tbcompleted, tbsell, tbbid, tbbidder, tbaward FROM toolbox WHERE (tbowner = '<%=Hiddenfield1.Value%>')"> </asp:AccessDataSource>
        <asp:AccessDataSource id="AccessDataSource4" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT tsname, tsowner, tsprice, tsbiddate FROM tspots  WHERE  (tssell = 'yes' and tsselltype='sell')"> </asp:AccessDataSource>
        <asp:AccessDataSource id="AccessDataSource5" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT tsname, tsowner, tsprice, tsbiddate FROM  tspots WHERE (tssell = 'yes' and tsselltype='bid')"> </asp:AccessDataSource>
       <asp:AccessDataSource id="AccessDataSource6" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT tbname, tbowner, tbprice, tbbiddate FROM toolbox  WHERE  (tbsell = 'yes' and tbselltype='sell')"> </asp:AccessDataSource>
        <asp:AccessDataSource id="AccessDataSource7" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT tbname, tbowner, tbprice, tbbiddate FROM toolbox  WHERE  (tbsell = 'yes' and tbselltype='bid')"> </asp:AccessDataSource>
        <asp:AccessDataSource id="AccessDataSource8" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT amount FROM payments"> </asp:AccessDataSource>
        <asp:AccessDataSource id="AccessDataSource9" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT lucrisboos FROM loggedusers"> </asp:AccessDataSource>
        <asp:AccessDataSource id="AccessDataSource10" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT tbname, tbowner, tbprice, tbbiddate FROM toolbox  WHERE  (tbsell = 'yes' and tbselltype='bid')"> </asp:AccessDataSource>
         <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="AccessDataSource2" ForeColor="#333333" GridLines="None" PageSize="5" style="z-index: 1; left: 24px; top: 608px; position: absolute; height: 204px; width: 668px" ToolTip="Treasure Spots">
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

        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="AccessDataSource3" ForeColor="#333333" GridLines="None" PageSize="5" style="z-index: 1; left: 19px; top: 885px; position: absolute; height: 204px; width: 668px" ToolTip="Treasure Spots">
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
                <asp:BoundField DataField="tbbidder" HeaderText="tbbidder" SortExpression="tbbidder" />
                <asp:BoundField DataField="tbaward" HeaderText="tbaward" SortExpression="tbaward" />
                <asp:DynamicField DataField="tbbid" HeaderText="tbbid" />
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

        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="AccessDataSource4" ForeColor="#333333" GridLines="None" PageSize="5" style="z-index: 1; left: 18px; top: 69px; position: absolute; height: 158px; width: 387px" ToolTip="Treasure Spots">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                <asp:BoundField DataField="tsname" HeaderText="tsname" SortExpression="tsname" />
                <asp:BoundField DataField="tsowner" HeaderText="tsowner" SortExpression="tsowner" />
                <asp:BoundField DataField="tsprice" HeaderText="tsprice" SortExpression="tsprice" />
                <asp:BoundField DataField="tsbiddate" HeaderText="tsbiddate" SortExpression="tsbiddate" />
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

        <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="AccessDataSource5" ForeColor="#333333" GridLines="None" PageSize="5" style="z-index: 1; left: 434px; top: 66px; position: absolute; height: 181px; width: 384px" ToolTip="Treasure Spots">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                <asp:BoundField DataField="tsname" HeaderText="tsname" SortExpression="tsname" />
                <asp:BoundField DataField="tsowner" HeaderText="tsowner" SortExpression="tsowner" />
                <asp:BoundField DataField="tsprice" HeaderText="tsprice" SortExpression="tsprice" />
                <asp:BoundField DataField="tsbiddate" HeaderText="tsbiddate" SortExpression="tsbiddate" />
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

        <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="AccessDataSource6" ForeColor="#333333" GridLines="None" PageSize="5" style="z-index: 1; left: 18px; top: 341px; position: absolute; height: 158px; width: 387px" ToolTip="Treasure Spots">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                <asp:BoundField DataField="tbname" HeaderText="tbname" SortExpression="tbname" />
                <asp:BoundField DataField="tbowner" HeaderText="tbowner" SortExpression="tbowner" />
                <asp:BoundField DataField="tbprice" HeaderText="tbprice" SortExpression="tbprice" />
                <asp:BoundField DataField="tbbiddate" HeaderText="tbbiddate" SortExpression="tbbiddate" />
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

        <asp:GridView ID="GridView6" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="AccessDataSource7" ForeColor="#333333" GridLines="None" PageSize="5" style="z-index: 1; left: 437px; top: 335px; position: absolute; height: 158px; width: 387px" ToolTip="Treasure Spots">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                <asp:BoundField DataField="tbname" HeaderText="tbname" SortExpression="tbname" />
                <asp:BoundField DataField="tbowner" HeaderText="tbowner" SortExpression="tbowner" />
                <asp:BoundField DataField="tbprice" HeaderText="tbprice" SortExpression="tbprice" />
                <asp:BoundField DataField="tbbiddate" HeaderText="tbbiddate" SortExpression="tbbiddate" />
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


    <asp:HiddenField ID="Hiddenfield1" runat="server"></asp:HiddenField>
    <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="Blue" style="z-index: 1; left: 441px; top: 313px; position: absolute; bottom: 403px; height: 19px; right: 312px;" Text="ToolBox items for Bid"></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server" style="z-index: 1; left: 233px; top: 578px; position: absolute" ToolTip="Enter Price Above $5 (Note: 50% of the awarded bid amount goes to treasurehunter)"></asp:TextBox>
        <asp:Label ID="Label5" runat="server" Font-Bold="True" ForeColor="Blue" style="z-index: 1; left: 440px; top: 41px; position: absolute; height: 18px;" Text="Treasure Spots for Bid"></asp:Label>
   <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="Blue" style="z-index: 1; left: 26px; top: 860px; position: absolute" Text="My ToolBox Items"></asp:Label>
    <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Blue" style="z-index: 1; left: 29px; top: 584px; position: absolute; height: 18px;" Text="My Treasure Spots"></asp:Label>     
    <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="Blue" style="z-index: 1; left: 21px; top: 44px; position: absolute; bottom: 532px; right: 721px;" Text="Treasure Spots for Sale"></asp:Label>
        <asp:Label ID="Label6" runat="server" Font-Bold="True" ForeColor="Blue" style="z-index: 1; left: 20px; top: 315px; position: absolute; bottom: 401px; height: 19px;" Text="ToolBox items for Sale"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" style="z-index: 1; left: 651px; top: 39px; position: absolute" ToolTip="Enter Price Above $5 (Note: 50% of the awarded bid amount goes to treasurehunter)"></asp:TextBox>
        <asp:TextBox ID="TextBox4" runat="server" style="z-index: 1; left: 231px; position: absolute; top: 854px;" ToolTip="Enter Price Above $3 (Note: 50% of the awarded bid amount goes to treasurehunter)"></asp:TextBox>
        <asp:DropDownList ID="DropDownList1" runat="server" style="z-index: 1; left: 387px; top: 578px; position: absolute" AutoPostBack="True">
            <asp:ListItem>Bid</asp:ListItem>
            <asp:ListItem>Fixed Price</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="DropDownList2" runat="server" style="z-index: 1; left: 402px; top: 855px; position: absolute" AutoPostBack="True">
            <asp:ListItem>Bid</asp:ListItem>
            <asp:ListItem>Fixed Price</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="Button9" runat="server" style="z-index: 1; left: 530px; top: 576px; position: absolute" Text="Approve Bid" OnClick="Button9_Click" />
        <asp:Button ID="Button10" runat="server" style="z-index: 1; left: 651px; top: 577px; position: absolute" Text="Revoke" OnClick="Button10_Click" />
        <asp:Button ID="Button11" runat="server" style="z-index: 1; left: 530px; top: 853px; position: absolute" Text="Approve Bid" OnClick="Button11_Click" />
        <asp:Button ID="Button12" runat="server" style="z-index: 1; left: 651px; top: 855px; position: absolute" Text="Revoke" OnClick="Button12_Click" />
        
    </form>
</body>
</html>
