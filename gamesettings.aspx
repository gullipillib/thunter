<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" EnableViewState="true" AutoEventWireup="true" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>

<!DOCTYPE html>
<script runat="server">
    string Hiddenfield1;
    string HiddenField4;
    string HiddenField5;
    
    
    protected void checkusername()
    {
        Hiddenfield1 = Convert.ToString(Session["loggeduser"]);
        HiddenField4 = Convert.ToString(Session["loggeduserid"]);
        HiddenField5 = Convert.ToString(Session["loggeduserurl"]);
        Hiddenfield1 = Hiddenfield1.Replace(" ", "");
        AccessDataSource2.SelectCommand = "SELECT tsprice, tsapproved, tsactive, tsname, tsowner, tsreported, tscompleted, tssell, tsbid, tsbidder, tsaward FROM tspots WHERE tscoowner like '%" + Hiddenfield1  + "%'";
        AccessDataSource3.SelectCommand = "SELECT tbprice, tbapproved, tbactive, tbname, tbowner, tbreported, tbcompleted, tbsell, tbbid, tbbidder, tbaward FROM toolbox WHERE tbcoowner like '%" + Hiddenfield1 + "%'";
        if (Hiddenfield1 != null)
        {
            
            //Insert User into appuser,loggeduser,ordercounter,treasureprize;
            AccessDataSource1.SelectCommand = "SELECT uname FROM appuserdetails WHERE (uname = '" + Hiddenfield1 + "')";
    
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
                AccessDataSource1.InsertCommand = "INSERT INTO appuserdetails(uname, uloggedin, winner, wintimes, paid, amount, currenttspot) VALUES ('" + Hiddenfield1 + "', 'no', 'no', '0', 'no', '0', '')";
                AccessDataSource1.Insert();
                AccessDataSource1.SelectCommand = "SELECT * FROM loggedusers";
                AccessDataSource1.InsertCommand = "INSERT INTO loggedusers(luname, luid, luposition, luimg, luspriteimg, lucrisboos, luloggedin, lutspots, lulogintimes, luinvites) VALUES ('" + Hiddenfield1 + "', '" + HiddenField4 + "', '{left : 0, top:0}', '" + HiddenField5 + "', '" + HiddenField5 + "', '100', 'yes', '0', '0', '0')";
                AccessDataSource1.Insert();
                AccessDataSource1.SelectCommand = "SELECT * FROM ordercounter";
                AccessDataSource1.InsertCommand = "INSERT INTO ordercounter(uname, ccounter) Values ('" + Hiddenfield1 + "','0')";
                AccessDataSource1.Insert();
                AccessDataSource1.SelectCommand = "SELECT * FROM winners";
                AccessDataSource1.InsertCommand = "INSERT INTO winners(uname, crisboos) Values ('" + Hiddenfield1 + "','0')";
                AccessDataSource1.Insert();
            }

        }
        else
        {
    
            Response.Redirect("~/buy.aspx");
        }
    }

protected void Page_Load(object sender, EventArgs e)
{
    checkusername();
    AccessDataSource8.SelectCommand = "SELECT amount FROM appuserdetails where uname='" + Hiddenfield1 + "'";
    AccessDataSource9.SelectCommand = "SELECT lucrisboos FROM loggedusers where luname='" + Hiddenfield1 + "'";
}

protected void Button1_Click(object sender, EventArgs e)
{
    Session["tspotname"] = GridView3.Rows[GridView3.SelectedIndex].Cells[0].Text;
    Session["tspotprice"] = GridView3.Rows[GridView3.SelectedIndex].Cells[2].Text;
    Response.Redirect("~/buy.aspx");
}

protected void Button3_Click(object sender, EventArgs e)
{
    Session["toolboxname"] = GridView5.Rows[GridView5.SelectedIndex].Cells[0].Text;
    Session["tbprice"] = GridView5.Rows[GridView5.SelectedIndex].Cells[2].Text;
    Response.Redirect("~/buy.aspx");
}

protected void Button9_Click(object sender, EventArgs e)
{
    AccessDataSource1.SelectCommand = "SELECT tsname, tsbidder, tsaward, tsowner FROM tspots";
    AccessDataSource1.UpdateCommand = "UPDATE tspots SET tsaward = 'yes' where tsowner = '" + Hiddenfield1 + "' and tsname='" + GridView1.Rows[GridView1.SelectedIndex].Cells[3].Text + "'" ;
    AccessDataSource1.Update();
}

protected void Button10_Click(object sender, EventArgs e)
{
    AccessDataSource1.SelectCommand = "SELECT tsname, tsbidder, tsaward, tsowner FROM tspots";
    AccessDataSource1.UpdateCommand = "UPDATE tspots SET tsaward = 'no' where tsowner = '" + Hiddenfield1 + "' and tsname='" + GridView1.Rows[GridView1.SelectedIndex].Cells[3].Text + "'";
    AccessDataSource1.Update();
}

protected void Button11_Click(object sender, EventArgs e)
{
    AccessDataSource1.SelectCommand = "SELECT tbname, tbbidder, tbaward, tbowner FROM toolbox";
    AccessDataSource1.UpdateCommand = "UPDATE toolbox SET tbaward = 'yes' where tbowner='" + Hiddenfield1 + "' and tbname='" + GridView2.Rows[GridView2.SelectedIndex].Cells[3].Text + "'";
    AccessDataSource1.Update();
}

protected void Button12_Click(object sender, EventArgs e)
{
    AccessDataSource1.SelectCommand = "SELECT tbname, tbbidder, tbaward, tbowner FROM toolbox";
    AccessDataSource1.UpdateCommand = "UPDATE toolbox SET tbaward = 'no' where tbowner='" + Hiddenfield1 + "' and tbname='" + GridView2.Rows[GridView2.SelectedIndex].Cells[3].Text + "'";
    AccessDataSource1.Update();
}

protected void Button6_Click(object sender, EventArgs e)
{
    if (GridView1.Rows[GridView1.SelectedIndex].Cells[4].Text == Hiddenfield1)
    {
        if (DropDownList1.SelectedValue == "Bid")
        {
            AccessDataSource1.UpdateCommand = "update tspots set tsbid = 'yes', tsbidamount = '" + TextBox3.Text + "'" + "where tsname = '" + GridView1.Rows[GridView1.SelectedIndex].Cells[3].Text + "'";
            AccessDataSource1.Update();
        }
        if (DropDownList1.SelectedValue == "Sell")
        {
            AccessDataSource1.UpdateCommand = "update tspots set tssell = 'yes', tssellamount = '" + TextBox3.Text + "'" + "where tsname = '" + GridView1.Rows[GridView1.SelectedIndex].Cells[3].Text + "'";
            AccessDataSource1.Update();
        }
    }
}

protected void Button5_Click(object sender, EventArgs e)
{
    if (GridView2.Rows[GridView2.SelectedIndex].Cells[4].Text == Hiddenfield1)
    {
        if (DropDownList2.SelectedValue == "Bid")
        {
            AccessDataSource2.UpdateCommand = "update toolbox set tbbid = 'yes', tbbidamount = '" + TextBox4.Text + "'" + "where tbname = '" + GridView2.Rows[GridView2.SelectedIndex].Cells[3].Text + "'";
            AccessDataSource2.Update();
        }
        if (DropDownList2.SelectedValue == "Sell")
        {
            AccessDataSource2.UpdateCommand = "update toolbox set tbsell = 'yes', tbsellamount = '" + TextBox4.Text + "'" + "where tbname = '" + GridView2.Rows[GridView2.SelectedIndex].Cells[3].Text + "'";
            AccessDataSource2.Update();
        }
    }
}


</script>
<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>gamesettings</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Panel ID="Panel1" runat="server" style="z-index: 1; left: 16px; top: 5px; position: absolute; height: 1098px; width: 894px">
        
        
        <asp:Label ID="Label7" runat="server" Font-Bold="True" style="z-index: 1; left: 8px; top: 7px; position: absolute" Text="Money Earned"></asp:Label>
        <asp:Label ID="Label8" runat="server" Font-Bold="True" style="z-index: 1; left: 204px; top: 8px; position: absolute; height: 22px; width: 77px" Text="Gold Coins"></asp:Label>
        
    <asp:AccessDataSource id="AccessDataSource11" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT uname FROM appuserdetails WHERE (uname = '<%=Hiddenfield1%>')"> </asp:AccessDataSource>
    
    <asp:AccessDataSource id="AccessDataSource1" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT uname FROM appuserdetails WHERE (uname = '<%=Hiddenfield1%>')"> </asp:AccessDataSource>
        <asp:ListBox ID="ListBox1" runat="server" DataSourceID="AccessDataSource8" DataTextField="amount" DataValueField="amount" Enabled="False" style="z-index: 1; left: 122px; top: 7px; position: absolute; height: 23px; width: 72px;"></asp:ListBox>
        <asp:ListBox ID="ListBox2" runat="server" DataSourceID="AccessDataSource9" DataTextField="lucrisboos" DataValueField="lucrisboos" Enabled="False" style="z-index: 1; left: 289px; top: 7px; position: absolute; height: 25px; width: 75px;"></asp:ListBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="z-index: 1; left: 224px; top: 38px; position: absolute; " Text="Buy" UseSubmitBehavior="False" />
        
        <asp:Button ID="Button2" runat="server" style="z-index: 1; left: 696px; top: 35px; position: absolute" Text="Bid" UseSubmitBehavior="False" />
        <asp:Button ID="Button3" runat="server" style="z-index: 1; left: 186px; top: 309px; position: absolute" Text="Buy" OnClick="Button3_Click" UseSubmitBehavior="False" />
       <asp:Button ID="Button4" runat="server" style="z-index: 1; left: 608px; top: 305px; position: absolute" Text="Bid" UseSubmitBehavior="False" />
        <asp:Button ID="Button5" runat="server" style="z-index: 1; left: 168px; top: 855px; position: absolute" Text="Sell" OnClick="Button5_Click" UseSubmitBehavior="False" />
        <asp:Button ID="Button6" runat="server" style="z-index: 1; left: 176px; top: 576px; position: absolute" Text="Sell" OnClick="Button6_Click" UseSubmitBehavior="False" /> 
        <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/Views/Datab/th.mdb" SelectCommand="SELECT tsprice, tsapproved, tsactive, tsname, tsowner, tsreported, tscompleted, tssell, tsbid, tsbidder, tsaward FROM tspots WHERE tscoowner = ''" UpdateCommand="update tspots set tsprice = ''"></asp:AccessDataSource>
        <asp:TextBox ID="TextBox2" runat="server" style="z-index: 1; left: 681px; top: 306px; position: absolute" ToolTip="Enter Price Above $3 (Note: 50% of the awarded bid amount goes to treasurehunter)" CausesValidation="True"></asp:TextBox>
        <asp:AccessDataSource ID="AccessDataSource3" runat="server" DataFile="~/Views/Datab/th.mdb" SelectCommand="SELECT tbprice, tbapproved, tbactive, tbname, tbowner, tbreported, tbcompleted, tbsell, tbbid, tbbidder, tbaward FROM toolbox WHERE tbcoowner = ''"></asp:AccessDataSource>
        <asp:HyperLink ID="Hyperlink2" runat="server" Font-Underline="False" NavigateUrl="~/buy.aspx" style="z-index: 1; left: 744px; top: 11px; position: absolute; right: 12px;" Target="_self">Buy a ToolBox Item</asp:HyperLink>
        <asp:AccessDataSource ID="AccessDataSource4" runat="server" DataFile="~/Views/Datab/th.mdb" SelectCommand="SELECT tsname, tsowner, tsprice FROM tspots  WHERE  (tssell = 'yes')"></asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDataSource5" runat="server" DataFile="~/Views/Datab/th.mdb" SelectCommand="SELECT tsname, tsowner, tsprice, tsbiddate, tsbidder FROM  tspots WHERE (tssell = 'yes')"></asp:AccessDataSource>
        <asp:HyperLink ID="Hyperlink1" runat="server" Font-Underline="false" NavigateUrl="~/buy.aspx" style="z-index: 1; left: 601px; top: 10px; position: absolute" Target="_self">Buy a Treasure Spot</asp:HyperLink>
        <asp:HyperLink ID="Hyperlink3" runat="server" Font-Underline="false" NavigateUrl="~/approver.aspx" style="z-index: 1; left: 383px; top: 11px; position: absolute" Target="_self">Treasure Spot Approving($0.25)</asp:HyperLink>
        <asp:HyperLink ID="Hyperlink4" runat="server" Font-Underline="False" NavigateUrl="~/approver1.aspx" style="z-index: 1; left: 273px; top: 41px; position: absolute" Target="_self">Game Items Approving($0.10)</asp:HyperLink>
        <asp:AccessDataSource ID="AccessDataSource6" runat="server" DataFile="~/Views/Datab/th.mdb" SelectCommand="SELECT tbname, tbowner, tbprice, tbsell FROM toolbox WHERE (tbsell = 'yes')"></asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDataSource7" runat="server" DataFile="~/Views/Datab/th.mdb" SelectCommand="SELECT tbname, tbowner, tbprice, tbbiddate, tbbidder FROM toolbox WHERE (tbsell = 'yes')"></asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDataSource8" runat="server" DataFile="~/Views/Datab/th.mdb" SelectCommand="SELECT amount FROM appuserdetails where uname='Tresurehunter'"></asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDataSource9" runat="server" DataFile="~/Views/Datab/th.mdb" SelectCommand="SELECT lucrisboos FROM loggedusers where luname='Tresurehunter'"></asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDataSource10" runat="server" DataFile="~/Views/Datab/th.mdb" SelectCommand="SELECT tbname, tbowner, tbprice, tbbiddate FROM toolbox  WHERE  (tbsell = 'yes' and tbselltype='bid')"></asp:AccessDataSource>
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
                <asp:BoundField DataField="tsbid" HeaderText="tsbid" SortExpression="tsbid" />
                <asp:BoundField DataField="tsbidder" HeaderText="tsbidder" SortExpression="tsbidder" />
                <asp:BoundField DataField="tsaward" HeaderText="tsaward" SortExpression="tsaward" />
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
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
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
        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="AccessDataSource4" ForeColor="#333333" GridLines="None" PageSize="5" style="z-index: 1; left: 18px; top: 69px; position: absolute; height: 158px; width: 387px" ToolTip="Treasure Spots">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                <asp:BoundField DataField="tsname" HeaderText="tsname" SortExpression="tsname" />
                <asp:BoundField DataField="tsowner" HeaderText="tsowner" SortExpression="tsowner" />
                <asp:BoundField DataField="tsprice" HeaderText="tsprice" SortExpression="tsprice" />
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
                <asp:BoundField DataField="tsbidder" HeaderText="tsbidder" SortExpression="tsbidder" />
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
                <asp:BoundField DataField="tbsell" HeaderText="tbsell" SortExpression="tbsell" />
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
                <asp:BoundField DataField="tbbidder" HeaderText="tbbidder" SortExpression="tbbidder" />
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
        <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="Blue" style="z-index: 1; left: 441px; top: 313px; position: absolute; bottom: 403px; height: 19px; right: 312px;" Text="ToolBox items for Bid"></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server" style="z-index: 1; left: 233px; top: 578px; position: absolute" ToolTip="Enter Price Above $5 (Note: 50% of the awarded bid amount goes to treasurehunter)" CausesValidation="True"></asp:TextBox>
        <asp:Label ID="Label5" runat="server" Font-Bold="True" ForeColor="Blue" style="z-index: 1; left: 540px; top: 41px; position: absolute; height: 18px;" Text="Treasure Spots for Bid"></asp:Label>
        <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="Blue" style="z-index: 1; left: 26px; top: 860px; position: absolute" Text="My ToolBox Items"></asp:Label>
        <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Blue" style="z-index: 1; left: 29px; top: 584px; position: absolute; height: 18px;" Text="My Treasure Spots"></asp:Label>
        <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="Blue" style="z-index: 1; left: 21px; top: 40px; position: absolute; bottom: 1040px; right: 695px;" Text="Treasure Spots for Sale"></asp:Label>
        <asp:Label ID="Label6" runat="server" Font-Bold="True" ForeColor="Blue" style="z-index: 1; left: 20px; top: 315px; position: absolute; bottom: 401px; height: 19px;" Text="ToolBox items for Sale"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" style="z-index: 1; left: 742px; top: 40px; position: absolute" ToolTip="Enter Price Above $5 (Note: 50% of the awarded bid amount goes to treasurehunter)" CausesValidation="True"></asp:TextBox>
        <asp:TextBox ID="TextBox4" runat="server" style="z-index: 1; left: 231px; position: absolute; top: 854px;" ToolTip="Enter Price Above $3 (Note: 50% of the awarded bid amount goes to treasurehunter)" CausesValidation="True"></asp:TextBox>
        <asp:DropDownList ID="DropDownList1" runat="server" style="z-index: 1; left: 387px; top: 578px; position: absolute" CausesValidation="True">
            <asp:ListItem>Bid</asp:ListItem>
            <asp:ListItem>Fixed Price</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="DropDownList2" runat="server" style="z-index: 1; left: 402px; top: 855px; position: absolute" CausesValidation="True">
            <asp:ListItem>Bid</asp:ListItem>
            <asp:ListItem>Fixed Price</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="Button9" runat="server" style="z-index: 1; left: 530px; top: 576px; position: absolute" Text="Approve Bid" OnClick="Button9_Click" UseSubmitBehavior="False" />
        <asp:Button ID="Button10" runat="server" style="z-index: 1; left: 651px; top: 577px; position: absolute" Text="Revoke" OnClick="Button10_Click" UseSubmitBehavior="False" />
        <asp:Button ID="Button11" runat="server" style="z-index: 1; left: 530px; top: 853px; position: absolute" Text="Approve Bid" OnClick="Button11_Click" UseSubmitBehavior="False" />
        <asp:Button ID="Button12" runat="server" style="z-index: 1; left: 651px; top: 855px; position: absolute" Text="Revoke" OnClick="Button12_Click" UseSubmitBehavior="False" />
      </asp:Panel>  
    </form>
</body>
</html>
