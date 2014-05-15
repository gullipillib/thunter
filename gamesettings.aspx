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
        SqlDataSource2.SelectCommand = "SELECT tsprice, tsapproved, tsactive, tsname, tsowner, tsreported, tscompleted, tssell, tsbid, tsbidder, tsaward FROM tspots WHERE tscoowner like '%" + Hiddenfield1  + "%'";
        SqlDataSource3.SelectCommand = "SELECT tbprice, tbapproved, tbactive, tbname, tbowner, tbreported, tbcompleted, tbsell, tbbid, tbbidder, tbaward FROM toolbox WHERE tbcoowner like '%" + Hiddenfield1 + "%'";
        if (Hiddenfield1 != null)
        {
            
            //Insert User into appuser,loggeduser,ordercounter,treasureprize;
            SqlDataSource1.SelectCommand = "SELECT uname FROM appuserdetails WHERE (uname = '" + Hiddenfield1 + "')";
    
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();
            //DataTable dtr = dt;
            //DataRow[] uniname = dtr.Select("uname");
            //username = dt.Rows[0].Field<string>("uname"); usethis to get field value
            //Label3.Text = dt.Rows[0][0].ToString();
            if (dt.Rows.Count == 0)
            {
                //Insert User into appuser,loggeduser,ordercounter,winners;
                SqlDataSource1.InsertCommand = "INSERT INTO appuserdetails(uname, uloggedin, winner, wintimes, paid, amount, currenttspot) VALUES ('" + Hiddenfield1 + "', 'no', 'no', '0', 'no', '0', '')";
                SqlDataSource1.Insert();
                SqlDataSource1.SelectCommand = "SELECT * FROM loggedusers";
                SqlDataSource1.InsertCommand = "INSERT INTO loggedusers(luname, luid, luposition, luimg, luspriteimg, lucrisboos, luloggedin, lutspots, lulogintimes, luinvites) VALUES ('" + Hiddenfield1 + "', '" + HiddenField4 + "', '{left : 0, top:0}', '" + HiddenField5 + "', '" + HiddenField5 + "', '100', 'yes', '0', '0', '0')";
                SqlDataSource1.Insert();
                SqlDataSource1.SelectCommand = "SELECT * FROM ordercounter";
                SqlDataSource1.InsertCommand = "INSERT INTO ordercounter(uname, ccounter) Values ('" + Hiddenfield1 + "','0')";
                SqlDataSource1.Insert();
                SqlDataSource1.SelectCommand = "SELECT * FROM winners";
                SqlDataSource1.InsertCommand = "INSERT INTO winners(uname, crisboos) Values ('" + Hiddenfield1 + "','0')";
                SqlDataSource1.Insert();
            }

        }
        else
        {
    
            Response.Redirect("~/buy.aspx");
        }
    }
    string updater = "0";
protected void Page_Load(object sender, EventArgs e)
{
    if (Page.IsPostBack == false)
    {
        checkusername();
        SqlDataSource8.SelectCommand = "SELECT amount FROM appuserdetails where uname='" + Hiddenfield1 + "'";
        SqlDataSource9.SelectCommand = "SELECT lucrisboos FROM loggedusers where luname='" + Hiddenfield1 + "'";
    
    }
    if (Page.IsPostBack == true)
    {
        if (updater == "1")
        {
            Session["tspotname"] = GridView3.Rows[GridView3.SelectedIndex].Cells[0].Text;
            Session["tspotprice"] = GridView3.Rows[GridView3.SelectedIndex].Cells[2].Text;
            Response.Redirect("~/buy.aspx");  
        }
        if (updater == "2")
        {
            Session["toolboxname"] = GridView5.Rows[GridView5.SelectedIndex].Cells[0].Text;
            Session["tbprice"] = GridView5.Rows[GridView5.SelectedIndex].Cells[2].Text;
            Response.Redirect("~/buy.aspx"); 
        }
        if (updater == "3")
        {
            SqlDataSource1.SelectCommand = "SELECT tsname, tsbidder, tsaward, tsowner FROM tspots";
            SqlDataSource1.UpdateCommand = "UPDATE tspots SET tsaward = 'yes' where tsowner = '" + Hiddenfield1 + "' and tsname='" + GridView1.Rows[GridView1.SelectedIndex].Cells[3].Text + "'";
            SqlDataSource1.Update(); 
        }
        if (updater == "4")
        {
            SqlDataSource1.SelectCommand = "SELECT tsname, tsbidder, tsaward, tsowner FROM tspots";
            SqlDataSource1.UpdateCommand = "UPDATE tspots SET tsaward = 'no' where tsowner = '" + Hiddenfield1 + "' and tsname='" + GridView1.Rows[GridView1.SelectedIndex].Cells[3].Text + "'";
            SqlDataSource1.Update();
        }
        if (updater == "5")
        {
            SqlDataSource1.SelectCommand = "SELECT tbname, tbbidder, tbaward, tbowner FROM toolbox";
            SqlDataSource1.UpdateCommand = "UPDATE toolbox SET tbaward = 'yes' where tbowner='" + Hiddenfield1 + "' and tbname='" + GridView2.Rows[GridView2.SelectedIndex].Cells[3].Text + "'";
            SqlDataSource1.Update();
        }
        if (updater == "6")
        {
            SqlDataSource1.SelectCommand = "SELECT tbname, tbbidder, tbaward, tbowner FROM toolbox";
            SqlDataSource1.UpdateCommand = "UPDATE toolbox SET tbaward = 'no' where tbowner='" + Hiddenfield1 + "' and tbname='" + GridView2.Rows[GridView2.SelectedIndex].Cells[3].Text + "'";
            SqlDataSource1.Update();
        }
        if (updater == "7")
        {
            if (GridView1.Rows[GridView1.SelectedIndex].Cells[4].Text == Hiddenfield1)
            {

                if (DropDownList1.SelectedValue == "Bid")
                {
                    SqlDataSource1.UpdateCommand = "update tspots set tsbid = 'yes', tsbidamount = '" + TextBox3.Text + "'" + "where tsname = '" + GridView1.Rows[GridView1.SelectedIndex].Cells[3].Text + "'";
                    SqlDataSource1.Update();
                }
                if (DropDownList1.SelectedValue == "Sell")
                {
                    SqlDataSource1.UpdateCommand = "update tspots set tssell = 'yes', tssellamount = '" + TextBox3.Text + "'" + "where tsname = '" + GridView1.Rows[GridView1.SelectedIndex].Cells[3].Text + "'";
                    SqlDataSource1.Update();
                }
            }
        }
        if (updater == "8")
        {
            if (GridView2.Rows[GridView2.SelectedIndex].Cells[4].Text == Hiddenfield1)
            {
                if (DropDownList2.SelectedValue == "Bid")
                {
                    SqlDataSource2.UpdateCommand = "update toolbox set tbbid = 'yes', tbbidamount = '" + TextBox4.Text + "'" + "where tbname = '" + GridView2.Rows[GridView2.SelectedIndex].Cells[3].Text + "'";
                    SqlDataSource2.Update();
                }
                if (DropDownList2.SelectedValue == "Sell")
                {
                    SqlDataSource2.UpdateCommand = "update toolbox set tbsell = 'yes', tbsellamount = '" + TextBox4.Text + "'" + "where tbname = '" + GridView2.Rows[GridView2.SelectedIndex].Cells[3].Text + "'";
                    SqlDataSource2.Update();
                }
            }
        }
    }
}

protected void Button1_Click(object sender, EventArgs e)
{
    updater = "1";
}

protected void Button3_Click(object sender, EventArgs e)
{
    updater = "2";
}

protected void Button9_Click(object sender, EventArgs e)
{
    updater = "3";
}

protected void Button10_Click(object sender, EventArgs e)
{
    updater = "4";
}

protected void Button11_Click(object sender, EventArgs e)
{
    updater = "5";
}

protected void Button12_Click(object sender, EventArgs e)
{
    updater = "6";
}

protected void Button6_Click(object sender, EventArgs e)
{
    updater = "7";
}

protected void Button5_Click(object sender, EventArgs e)
{
    updater = "8";
}


</script>
<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>gamesettings</title>
</head><!-- Google Code for Remarketing Tag -->
<!--------------------------------------------------
Remarketing tags may not be associated with personally identifiable information or placed on pages related to sensitive categories. See more information and instructions on how to setup the tag on: http://google.com/ads/remarketingsetup
--------------------------------------------------->
<script type="text/javascript">
var google_tag_params = {
ecomm_prodid: 'REPLACE_WITH_VALUE',
ecomm_pagetype: 'REPLACE_WITH_VALUE',
ecomm_totalvalue: 'REPLACE_WITH_VALUE',
};
</script>
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 967011017;
var google_custom_params = window.google_tag_params;
var google_remarketing_only = true;
/* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/967011017/?value=0&amp;guid=ON&amp;script=0"/>
</div>
</noscript> 
<body style="background-color: #FF00FF">
    <form id="form1" runat="server">
        <img alt="" src="https://treasurehunter.apphb.com/Images/bg.jpg" style="z-index: 0; left: 0px; top: 0px; position: absolute; width:100%; height:100%" />
    <asp:Panel ID="Panel1" runat="server" style="z-index: 1; left: 16px; top: 5px; position: absolute; height: 1098px; width: 894px">
        
        
        <asp:Label ID="Label7" runat="server" Font-Bold="True" style="z-index: 1; left: 8px; top: 7px; position: absolute" Text="Money Earned" Font-Names="Victorian LET" ForeColor="#3333FF"></asp:Label>
        <asp:Label ID="Label8" runat="server" Font-Bold="True" style="z-index: 1; left: 204px; top: 8px; position: absolute; height: 22px; width: 87px" Text="Gold Coins" Font-Names="Victorian LET" ForeColor="#3333FF"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT uname FROM appuserdetails WHERE (uname = '<%=Hiddenfield1%>')"></asp:SqlDataSource>    
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT uname FROM appuserdetails WHERE (uname = '<%=Hiddenfield1%>')"></asp:SqlDataSource>
        <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource8" DataTextField="amount" DataValueField="amount" Enabled="False" style="z-index: 1; left: 122px; top: 7px; position: absolute; height: 23px; width: 72px;" BackColor="Transparent"></asp:ListBox>
        <asp:ListBox ID="ListBox2" runat="server" DataSourceID="SqlDataSource9" DataTextField="lucrisboos" DataValueField="lucrisboos" Enabled="False" style="z-index: 1; left: 295px; top: 7px; position: absolute; height: 25px; width: 75px;" BackColor="Transparent"></asp:ListBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Style="z-index: 1; left: 224px; top: 38px; position: absolute; border-radius: 15px;" Text="Buy" UseSubmitBehavior="False" BackColor="#FF9900" ForeColor="White" />
        
        <asp:Button ID="Button2" runat="server" Style="z-index: 1; left: 696px; top: 35px; position: absolute; border-radius: 15px;" Text="Bid" UseSubmitBehavior="False" BackColor="#FF9900" ForeColor="White" />
        <asp:Button ID="Button3" runat="server" Style="z-index: 1; left: 219px; top: 310px; position: absolute; border-radius: 15px;" Text="Buy" OnClick="Button3_Click" UseSubmitBehavior="False" BackColor="#FF9900" ForeColor="White" />
       <asp:Button ID="Button4" runat="server" Style="z-index: 1; left: 627px; top: 316px; position: absolute; border-radius: 15px;" Text="Bid" UseSubmitBehavior="False" BackColor="#FF9900" ForeColor="White" />
        <asp:Button ID="Button5" runat="server" Style="z-index: 1; left: 168px; top: 855px; position: absolute; border-radius: 15px;" Text="Sell" OnClick="Button5_Click" UseSubmitBehavior="False" BackColor="#FF9900" ForeColor="White" />
        <asp:Button ID="Button6" runat="server" Style="z-index: 1; left: 176px; top: 576px; position: absolute; border-radius: 15px;" Text="Sell" OnClick="Button6_Click" UseSubmitBehavior="False" BackColor="#FF9900" ForeColor="White" /> 
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT tsprice, tsapproved, tsactive, tsname, tsowner, tsreported, tscompleted, tssell, tsbid, tsbidder, tsaward FROM tspots WHERE tscoowner = ''" UpdateCommand="update tspots set tsprice = ''"></asp:SqlDataSource>
        <asp:TextBox ID="TextBox2" runat="server" style="z-index: 1; left: 681px; top: 320px; position: absolute" ToolTip="Enter Price Above $3 (Note: 50% of the awarded bid amount goes to treasurehunter)" CausesValidation="True" BackColor="#3399FF" BorderStyle="Ridge" ForeColor="White"></asp:TextBox>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT tbprice, tbapproved, tbactive, tbname, tbowner, tbreported, tbcompleted, tbsell, tbbid, tbbidder, tbaward FROM toolbox WHERE tbcoowner = ''"></asp:SqlDataSource>
        <asp:HyperLink ID="Hyperlink2" runat="server" Font-Underline="False" NavigateUrl="~/buy.aspx" Style="z-index: 1; left: 744px; top: 11px; position: absolute; right: 8px; border-radius: 15px;" Target="_self" Font-Names="Academy Engraved LET" BackColor="#99FF99">Buy a ToolBox Item</asp:HyperLink>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT tsname, tsowner, tsprice FROM tspots  WHERE  (tssell = 'yes')"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT tsname, tsowner, tsprice, tsbiddate, tsbidder FROM  tspots WHERE (tssell = 'yes')"></asp:SqlDataSource>
        <asp:HyperLink ID="Hyperlink1" runat="server" Font-Underline="False" NavigateUrl="~/buy.aspx" Style="z-index: 1; left: 601px; top: 10px; position: absolute; border-radius: 15px" Target="_self" Font-Names="Academy Engraved LET" BackColor="#99FF99">Buy a Treasure Spot</asp:HyperLink>
        <asp:HyperLink ID="Hyperlink3" runat="server" Font-Underline="False" NavigateUrl="~/approver.aspx" Style="z-index: 1; left: 375px; top: 11px; position: absolute; border-radius: 15px" Target="_self" Font-Names="Academy Engraved LET" BackColor="Transparent">Treasure Spot Approving($0.25)</asp:HyperLink>
        <asp:HyperLink ID="Hyperlink4" runat="server" Font-Underline="False" NavigateUrl="~/approver1.aspx" style="z-index: 1; left: 286px; top: 41px; position: absolute; width: 208px;" Target="_self" Font-Names="Academy Engraved LET" BackColor="#99FF99">Game Items Approving ($0.10)</asp:HyperLink>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT tbname, tbowner, tbprice, tbsell FROM toolbox WHERE (tbsell = 'yes')"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT tbname, tbowner, tbprice, tbbiddate, tbbidder FROM toolbox WHERE (tbsell = 'yes')"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT amount FROM appuserdetails where uname='Tresurehunter'"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT lucrisboos FROM loggedusers where luname='Tresurehunter'"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT tbname, tbowner, tbprice, tbbiddate FROM toolbox  WHERE  (tbsell = 'yes' and tbselltype='bid')"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="3" DataSourceID="SqlDataSource2" GridLines="None" PageSize="5" style="z-index: 1; left: 24px; top: 608px; position: absolute; height: 204px; width: 668px" ToolTip="Treasure Spots" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1">
            <Columns>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" >
                <ControlStyle BackColor="#FF9900" Font-Names="Victorian LET" ForeColor="White" />
                </asp:CommandField>
                <asp:BoundField DataField="tsprice" HeaderText="Price" SortExpression="tsprice" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
                <asp:BoundField DataField="tsapproved" HeaderText="Approved" SortExpression="tsapproved" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
                <asp:BoundField DataField="tsactive" HeaderText="Active" SortExpression="tsactive" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
                <asp:BoundField DataField="tsname" HeaderText="Name" SortExpression="tsname" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
                <asp:BoundField DataField="tsowner" HeaderText="Owner" SortExpression="tsowner" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
                <asp:BoundField DataField="tsreported" HeaderText="Reported" SortExpression="tsreported" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
                <asp:BoundField DataField="tscompleted" HeaderText="Completed" SortExpression="tscompleted" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
                <asp:BoundField DataField="tssell" HeaderText="Sell" SortExpression="tssell" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
                <asp:BoundField DataField="tsbid" HeaderText="Bid" SortExpression="tsbid" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
                <asp:BoundField DataField="tsbidder" HeaderText="Bidder" SortExpression="tsbidder" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
                <asp:BoundField DataField="tsaward" HeaderText="Award" SortExpression="tsaward" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
        </asp:GridView>
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="3" DataSourceID="SqlDataSource3" GridLines="None" PageSize="5" style="z-index: 1; left: 19px; top: 885px; position: absolute; height: 204px; width: 668px" ToolTip="Treasure Spots" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1">
            <Columns>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" >
                <ControlStyle BackColor="#FF9900" Font-Names="Victorian LET" ForeColor="White" />
                </asp:CommandField>
                <asp:BoundField DataField="tbprice" HeaderText="Price" SortExpression="tbprice" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
                <asp:BoundField DataField="tbapproved" HeaderText="Approved" SortExpression="tbapproved" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
                <asp:BoundField DataField="tbactive" HeaderText="Active" SortExpression="tbactive" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
                <asp:BoundField DataField="tbname" HeaderText="Name" SortExpression="tbname" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
                <asp:BoundField DataField="tbowner" HeaderText="Owner" SortExpression="tbowner" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
                <asp:BoundField DataField="tbreported" HeaderText="Reported" SortExpression="tbreported" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
                <asp:BoundField DataField="tbcompleted" HeaderText="Completed" SortExpression="tbcompleted" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
                <asp:BoundField DataField="tbsell" HeaderText="Sell" SortExpression="tbsell" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
                <asp:BoundField DataField="tbbid" HeaderText="Bid" SortExpression="tbbid" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
                <asp:BoundField DataField="tbbidder" HeaderText="Bidder" SortExpression="tbbidder" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
                <asp:BoundField DataField="tbaward" HeaderText="Award" SortExpression="tbaward" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
        </asp:GridView>
        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="3" DataSourceID="SqlDataSource4" PageSize="5" style="z-index: 1; left: 18px; top: 69px; position: absolute; height: 158px; width: 387px" ToolTip="Treasure Spots" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2">
            <Columns>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" >
                <ControlStyle BackColor="#FF9900" Font-Names="Victorian LET" ForeColor="White" />
                </asp:CommandField>
                <asp:BoundField DataField="tsname" HeaderText="Name" SortExpression="tsname" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
                <asp:BoundField DataField="tsowner" HeaderText="Owner" SortExpression="tsowner" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
                <asp:BoundField DataField="tsprice" HeaderText="Price" SortExpression="tsprice" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
        <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="3" DataSourceID="SqlDataSource5" PageSize="5" style="z-index: 1; left: 420px; top: 66px; position: absolute; height: 211px; width: 530px" ToolTip="Treasure Spots" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2">
            <Columns>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" >
                <ControlStyle BackColor="#FF9900" Font-Names="Victorian LET" ForeColor="White" />
                </asp:CommandField>
                <asp:BoundField DataField="tsname" HeaderText="Name" SortExpression="tsname" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
                <asp:BoundField DataField="tsowner" HeaderText="Owner" SortExpression="tsowner" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
                <asp:BoundField DataField="tsprice" HeaderText="Price" SortExpression="tsprice" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
                <asp:BoundField DataField="tsbiddate" HeaderText="Bid Date" SortExpression="tsbiddate" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
                <asp:BoundField DataField="tsbidder" HeaderText="Bidder" SortExpression="tsbidder" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
        <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="2" DataSourceID="SqlDataSource6" ForeColor="Black" GridLines="None" PageSize="5" style="z-index: 1; left: 18px; top: 341px; position: absolute; height: 158px; width: 387px" ToolTip="Treasure Spots" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" >
                <ControlStyle BackColor="#FF9900" Font-Names="Victorian LET" ForeColor="White" />
                </asp:CommandField>
                <asp:BoundField DataField="tbname" HeaderText="Name" SortExpression="tbname" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
                <asp:BoundField DataField="tbowner" HeaderText="Owner" SortExpression="tbowner" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
                <asp:BoundField DataField="tbprice" HeaderText="Price" SortExpression="tbprice" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
                <asp:BoundField DataField="tbsell" HeaderText="Sell" SortExpression="tbsell" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
        <asp:GridView ID="GridView6" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="2" DataSourceID="SqlDataSource7" ForeColor="Black" GridLines="None" PageSize="5" style="z-index: 1; left: 437px; top: 349px; position: absolute; height: 158px; width: 387px" ToolTip="Treasure Spots" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" >
                <ControlStyle BackColor="#FF9900" Font-Names="Victorian LET" ForeColor="White" />
                </asp:CommandField>
                <asp:BoundField DataField="tbname" HeaderText="Name" SortExpression="tbname" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
                <asp:BoundField DataField="tbowner" HeaderText="Owner" SortExpression="tbowner" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
                <asp:BoundField DataField="tbprice" HeaderText="Price" SortExpression="tbprice" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
                <asp:BoundField DataField="tbbiddate" HeaderText="Bid Date" SortExpression="tbbiddate" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
                <asp:BoundField DataField="tbbidder" HeaderText="Bidder" SortExpression="tbbidder" >
                <ItemStyle Font-Names="Victorian LET" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
        <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="Blue" style="z-index: 1; left: 441px; top: 322px; position: absolute; bottom: 757px; height: 19px; right: 287px;" Text="ToolBox items for Bid" Font-Names="Victorian LET"></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server" style="z-index: 1; left: 233px; top: 578px; position: absolute" ToolTip="Enter Price Above $5 (Note: 50% of the awarded bid amount goes to treasurehunter)" CausesValidation="True" BackColor="#6600FF" BorderStyle="Ridge" ForeColor="White"></asp:TextBox>
        <asp:Label ID="Label5" runat="server" Font-Bold="True" ForeColor="Blue" style="z-index: 1; left: 522px; top: 40px; position: absolute; height: 18px;" Text="Treasure Spots for Bid" Font-Names="Victorian LET" BackColor="#99FF99"></asp:Label>
        <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="Blue" style="z-index: 1; left: 26px; top: 860px; position: absolute" Text="My ToolBox Items" Font-Names="Victorian LET"></asp:Label>
        <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Blue" style="z-index: 1; left: 29px; top: 584px; position: absolute; height: 18px;" Text="My Treasure Spots" Font-Names="Victorian LET"></asp:Label>
        <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="Blue" style="z-index: 1; left: 21px; top: 40px; position: absolute; bottom: 1040px; right: 695px;" Text="Treasure Spots for Sale" Font-Names="Victorian LET"></asp:Label>
        <asp:Label ID="Label6" runat="server" Font-Bold="True" ForeColor="Blue" style="z-index: 1; left: 20px; top: 315px; position: absolute; bottom: 401px; height: 19px;" Text="ToolBox items for Sale" Font-Names="Victorian LET"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" style="z-index: 1; left: 742px; top: 40px; position: absolute" ToolTip="Enter Price Above $5 (Note: 50% of the awarded bid amount goes to treasurehunter)" CausesValidation="True" BackColor="#99CCFF" BorderStyle="Ridge" ForeColor="White"></asp:TextBox>
        <asp:TextBox ID="TextBox4" runat="server" style="z-index: 1; left: 231px; position: absolute; top: 854px;" ToolTip="Enter Price Above $3 (Note: 50% of the awarded bid amount goes to treasurehunter)" CausesValidation="True" BackColor="#3333FF" BorderStyle="Ridge" ForeColor="White"></asp:TextBox>
        <asp:DropDownList ID="DropDownList1" runat="server" style="z-index: 1; left: 387px; top: 578px; position: absolute" CausesValidation="True" BackColor="#CC0066" ForeColor="White">
            <asp:ListItem>Bid</asp:ListItem>
            <asp:ListItem>Fixed Price</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="DropDownList2" runat="server" style="z-index: 1; left: 402px; top: 855px; position: absolute" CausesValidation="True" BackColor="#CC0066" ForeColor="White">
            <asp:ListItem>Bid</asp:ListItem>
            <asp:ListItem>Fixed Price</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="Button9" runat="server" Style="z-index: 1; left: 530px; top: 576px; position: absolute; border-radius: 15px;" Text="Approve Bid" OnClick="Button9_Click" UseSubmitBehavior="False" BackColor="#FF9900" ForeColor="White" />
        <asp:Button ID="Button10" runat="server" Style="z-index: 1; left: 651px; top: 577px; position: absolute; border-radius: 15px;" Text="Revoke" OnClick="Button10_Click" UseSubmitBehavior="False" BackColor="#FF9900" ForeColor="White" />
        <asp:Button ID="Button11" runat="server" Style="z-index: 1; left: 530px; top: 853px; position: absolute; border-radius: 15px;" Text="Approve Bid" OnClick="Button11_Click" UseSubmitBehavior="False" BackColor="#FF9900" ForeColor="White" />
        <asp:Button ID="Button12" runat="server" Style="z-index: 1; left: 651px; top: 855px; position: absolute; border-radius: 15px;" Text="Revoke" OnClick="Button12_Click" UseSubmitBehavior="False" BackColor="#FF9900" ForeColor="White" />
      </asp:Panel>  
    </form>
</body>
</html>
