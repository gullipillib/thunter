<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" ViewStateMode="Enabled" EnableViewState="true" AutoEventWireup="true" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<!DOCTYPE html>




<script runat="server">
     
    

    public class Treasurespot
    {
        public string tsName { get; set; }
        public string tsUrl { get; set; }
        public string tsLeft { get; set; }
        public string tsTop { get; set; }
        public string tsctrl1name { get; set; }
        public string tsctrl1url { get; set; }
        public string tsctrl1left { get; set; }
        public string tsctrl1top { get; set; }
        public string tsctrl1width { get; set; }
        public string tsctrl1height { get; set; }
        public string tsctrl2name { get; set; }
        public string tsctrl2url { get; set; }
        public string tsctrl2left { get; set; }
        public string tsctrl2top { get; set; }
        public string tsctrl2width { get; set; }
        public string tsctrl2height { get; set; }
        public string tsctrl3name { get; set; }
        public string tsctrl3url { get; set; }
        public string tsctrl3left { get; set; }
        public string tsctrl3top { get; set; }
        public string tsctrl3width { get; set; }
        public string tsctrl3height { get; set; }
        public string tsctrl4name { get; set; }
        public string tsctrl4url { get; set; }
        public string tsctrl4left { get; set; }
        public string tsctrl4top { get; set; }
        public string tsctrl4width { get; set; }
        public string tsctrl4height { get; set; }
        public string tsctrl5name { get; set; }
        public string tsctrl5url { get; set; }
        public string tsctrl5left { get; set; }
        public string tsctrl5top { get; set; }
        public string tsctrl5width { get; set; }
        public string tsctrl5height { get; set; }
    }

    string Hiddenfield1;
    string HiddenField2;
    string HiddenField3;
    

    protected void checkusername()
    {
        Hiddenfield1 = Model.Name;
        Hiddenfield1 = Hiddenfield1.Replace(" ", "");
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
                AccessDataSource1.InsertCommand = "INSERT INTO loggedusers(luname, luid, luposition, luimg, luspriteimg, lucrisboos, luloggedin, lutspots, lulogintimes, luinvites) VALUES ('" + Hiddenfield1 + "', '" + Model.Id + "', '{left : 0, top:0}', '" + Model.ProfilePicture.Data.Url + "', '" + Model.ProfilePicture.Data.Url + "', '100', 'yes', '0', '0', '0')";
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

            Response.Redirect("~/Tspot/buy");
        }
    }

    string tempstring = "";
    Treasurespot tsitems = new Treasurespot();

    protected void Button4_Click(object sender, EventArgs e)
    {


        string json = Newtonsoft.Json.JsonConvert.SerializeObject(tsitems);
        tempstring = json;
        if (TextBox1.Text != null && TextBox2.Text != null)
        {
            AccessDataSource1.SelectCommand = "SELECT Top 1 * FROM tspots WHERE (tsowner = '" + Hiddenfield1 + "' and tsnew = 'yes' or tscompleted = 'no')";

            AccessDataSource1.UpdateCommand = "UPDATE tspots SET tsname = '" + TextBox1.Text + "', tsitems = '" + tempstring + "', tsnew = 'no', tscompleted = 'yes'  where tscoowner='" + Hiddenfield1 + "'";
            AccessDataSource1.Update();
            Button5.Enabled = true;
        }
    }

    protected void checknewcomplete()
    {
        AccessDataSource1.SelectCommand = "SELECT Top 1 * FROM tspots WHERE (tsowner = '" + Hiddenfield1 + "' and tsnew = 'yes' or tscompleted = 'no')";
        DataView dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
        DataTable dt = new DataTable();
        dt = dv.ToTable();
        //DataTable dtr = dt;
        //DataRow[] uniname = dtr.Select("uname");
        //username = dt.Rows[0].Field<string>("uname"); usethis to get field value
        //Label3.Text = dt.Rows[0][0].ToString();
        if (dt.Rows.Count == 0)
        {
            Response.Redirect("~/Tspot/buy");
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            checkusername();
            checknewcomplete();
            Session["controlcounter"] = "1";
            controlcounter = Convert.ToInt16(Session["controlcounter"]);
        }
        if (Page.IsPostBack == false)
        {
            if (GridView5.SelectedIndex != -1)
            {
                if (Convert.ToString(Session["dclick"]) == "dropclicked")
                {
                    if (Convert.ToString(Session["dvalue"]) == "land")
                    {

                        GridView1.Enabled = true;
                        GridView2.Enabled = false;
                        GridView3.Enabled = false;
                        GridView4.Enabled = true;

                        Button11.Enabled = false;
                    }
                    if (Convert.ToString(Session["dvalue"]) == "water")
                    {

                        GridView1.Enabled = false;
                        GridView2.Enabled = true;
                        GridView3.Enabled = false;
                        GridView4.Enabled = true;

                        Button11.Enabled = false;
                    }
                    if (Convert.ToString(Session["dvalue"]) == "air or space")
                    {

                        GridView1.Enabled = false;
                        GridView2.Enabled = false;
                        GridView3.Enabled = true;
                        GridView4.Enabled = true;

                        Button11.Enabled = false;
                    }

                }
            }
        }

    } //end of postback


    static int controlcounter;
    protected void Button6_Click(object sender, EventArgs e)
    {
        Label8.Text = "add";

    }

    protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label8.Text = "gridview3changed";
    }

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label8.Text = "gridview2changed";
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label8.Text = "gridview1changed";
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        Label8.Text = "text1changed";
    }

    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {
        Label8.Text = "text2changed";
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Label8.Text = "button2clicked";
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Label8.Text = "button3clicked";
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        Label8.Text = "button7clicked";
    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        Label8.Text = "button8clicked";
    }

    protected void Button10_Click(object sender, EventArgs e)
    {
        Label8.Text = "button10clicked";
    }

    protected void Button9_Click(object sender, EventArgs e)
    {
        Label8.Text = "button9clicked";
    }

    protected void GridView4_SelectedIndexChanged(object sender, GridViewSelectEventArgs e)
    {
        Label8.Text = "gridview4changed";
    }



    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (GridView5.SelectedIndex != -1)
        {
            Session["dclick"] = "dropclicked";
            Session["dvalue"] = GridView5.Rows[GridView5.SelectedIndex].Cells[1].Text;
        }
           }

    
</script>


<html>
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width" />
    <title></title>
    <style type="text/css">
        #Button12 {
            z-index: 1;
            left: 494px;
            top: 103px;
            position: absolute;
        }
        #Submit1 {
            z-index: 1;
            left: 505px;
            top: 107px;
            position: absolute;
        }
    </style>
</head>


<body style="height: 585px;">
    
    <a href="../Play/play" target="_self" style="position: absolute; left: 366px; top: 26px; width: 152px; text-decoration: none; background-color: #0000FF; color: #FFFFFF; webkit-border-radius: 20px; moz-border-radius: 20px; border-radius: 20px; right: 396px; text-align: center; height: 22px;">Complete Later </a>
    <iframe id="Iframe1" src='<%=HiddenField2%>' style="z-index: 0; left: 10px; top: 556px; position: absolute; background-color: transparent; width: 623px; height: 361px;" class="twoto3d"></iframe>

    <form id="form1" runat="server">
        <asp:AccessDataSource ID="AccessDataSource1" DataFile="~/Views/Datab/th.mdb" runat="server" SelectCommand="SELECT uname FROM appuserdetails WHERE (uname = '<%=Hiddenfield1%>')"></asp:AccessDataSource>
        <asp:Label ID="Label1" runat="server" Style="z-index: 1; left: 23px; top: 434px; position: absolute; width: 41px; height: 20px;" Text="Name"></asp:Label>
        <asp:Label ID="Label7" runat="server" Style="z-index: 1; left: 23px; top: 474px; position: absolute; width: 68px; height: 20px;" Text="Video Url"></asp:Label>
        <asp:AccessDataSource ID="AccessDataSource2" DataFile="~/Views/Datab/th.mdb" runat="server" SelectCommand="SELECT tbname, tbcategory, tbtoolscategory, tbactive, tbdetails, tbimgurl FROM toolbox WHERE (tbactive = 'yes') and (tbcategory = 'land')"></asp:AccessDataSource>

        <asp:AccessDataSource ID="AccessDataSource3" DataFile="~/Views/Datab/th.mdb" runat="server" SelectCommand="SELECT tbname, tbtoolscategory,  tbcategory, tbactive, tbdetails, tbimgurl FROM toolbox WHERE (tbactive = 'yes') and (tbcategory = 'water')"></asp:AccessDataSource>
        <asp:Button ID="Button11" runat="server" Style="z-index: 1; left: 290px; top: 18px; position: absolute" Text="OK" OnClientClick="return dropdownclick()" />
        <asp:AccessDataSource ID="AccessDataSource4" DataFile="~/Views/Datab/th.mdb" runat="server" SelectCommand="SELECT tbname, tbcategory, tbtoolscategory, tbactive, tbdetails, tbimgurl FROM toolbox WHERE (tbactive = 'yes') and (tbcategory = 'air or space')"></asp:AccessDataSource>
       
        <asp:AccessDataSource ID="AccessDataSource5" DataFile="~/Views/Datab/th.mdb" runat="server" SelectCommand="SELECT tbname, tbcategory, tbtoolscategory, tbactive, tbdetails, tbimgurl FROM toolbox WHERE (tbactive = 'yes') and (tbcategory = 'others')  or  (tbtoolscategory = 'player')"></asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDataSource6" DataFile="~/Views/Datab/th.mdb" runat="server" SelectCommand="SELECT [categoryname] FROM [category]"></asp:AccessDataSource>
        
        <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource6" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" ShowHeader="False" style="z-index: 1; left: 20px; top: 24px; position: absolute; height: 133px; width: 187px">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" OnClick="DropDownList1_SelectedIndexChanged" Text="Select" UseSubmitBehavior="False" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="categoryname" HeaderText="categoryname" SortExpression="categoryname" />
            </Columns>
            <SelectedRowStyle ForeColor="Yellow" />
        </asp:GridView>
        
        <asp:Label ID="Label10" runat="server" Style="z-index: 1; left: 508px; top: 0px; position: absolute" Text="Label" ClientIDMode="Static"></asp:Label>

        <asp:Label ID="Label9" runat="server" Style="z-index: 1; left: 408px; top: 0px; position: absolute; right: 472px;" Text="Label" ClientIDMode="Static"></asp:Label>




        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/fplane.gif" Style="z-index: 200; left: 374px; top: 233px; position: absolute; height: 28px; width: 29px" ClientIDMode="Static" Visible="False" />






        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="12pt" ForeColor="Blue" Style="z-index: 1; top: 413px; position: absolute; left: 594px" Text="others or players"></asp:Label>
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="12pt" ForeColor="Blue" Style="z-index: 1; left: 796px; top: 386px; position: absolute; height: 22px;" Text="land"></asp:Label>


        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/fplane.gif" Style="z-index: 200; left: 250px; top: 233px; position: absolute; height: 28px; width: 29px" ClientIDMode="Static" Visible="False" />








        <asp:TextBox ID="TextBox2" runat="server" Style="z-index: 1; left: 102px; top: 468px; position: absolute; width: 388px; height: 24px" ClientIDMode="Static" ViewStateMode="Enabled"></asp:TextBox>

        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="12pt" ForeColor="Blue" Style="z-index: 1; top: 195px; position: absolute; left: 778px" Text="water"></asp:Label>





        <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/fplane.gif" Style="z-index: 200; left: 454px; top: 233px; position: absolute; height: 28px; width: 29px" ClientIDMode="Static" Visible="False" />
        <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/fplane.gif" Style="z-index: 200; left: 414px; top: 233px; position: absolute; height: 28px; width: 29px" ClientIDMode="Static" Visible="False" />
        <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/fplane.gif" Style="z-index: 200; left: 414px; top: 173px; position: absolute; height: 28px; width: 29px" ClientIDMode="Static" Visible="False" />


        <asp:Button ID="Button6" runat="server" Style="z-index: 1; left: 650px; top: 267px; position: absolute" Text="Add" OnClick="Button6_Click" ClientIDMode="Static" ViewStateMode="Enabled" CausesValidation="False" />
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderStyle="Solid" DataSourceID="AccessDataSource3" GridLines="None" PageSize="4" ShowHeader="False" Style="z-index: 1; left: 769px; top: 222px; position: absolute; height: 133px; width: 53px" Enabled="False" ClientIDMode="Static" ViewStateMode="Enabled">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Select" ToolTip='<%# Eval("tbtoolscategory") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:ImageField DataImageUrlField="tbimgurl">
                    <ControlStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Height="40px" Width="40px" />
                </asp:ImageField>
                <asp:BoundField DataField="tbimgurl" HeaderText="tbimgurl" SortExpression="tbimgurl" Visible="False">
                    <ControlStyle ForeColor="Transparent" />
                    <ItemStyle ForeColor="Transparent" />
                </asp:BoundField>
            </Columns>
            <SelectedRowStyle BackColor="#FFFFCC" />
        </asp:GridView>
        <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderStyle="Solid" DataSourceID="AccessDataSource5" GridLines="None" PageSize="4" ShowHeader="False" Style="z-index: 1; top: 469px; position: absolute; height: 137px; width: 42px; left: 539px" ViewStateMode="Enabled" CellPadding="0" Enabled="False">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Select" ToolTip='<%# Eval("tbtoolscategory") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:ImageField DataImageUrlField="tbimgurl">
                    <ControlStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Height="40px" Width="40px" />
                </asp:ImageField>
                <asp:TemplateField HeaderText="tbname" SortExpression="tbname" Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("tbname") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("tbname") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="tbtoolscategory" SortExpression="tbtoolscategory" Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("tbtoolscategory") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("tbtoolscategory") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="tbimgurl" HeaderText="tbimgurl" SortExpression="tbimgurl" Visible="False">
                    <ItemStyle ForeColor="Transparent" />
                </asp:BoundField>
            </Columns>
            <SelectedRowStyle BackColor="#FFFFCC" />
        </asp:GridView>
        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderStyle="Solid" DataSourceID="AccessDataSource4" GridLines="None" PageSize="4" ShowHeader="False" Style="z-index: 1; left: 712px; top: 42px; position: absolute; height: 133px; width: 65px; bottom: 404px;" Enabled="False" ClientIDMode="Static" ViewStateMode="Enabled">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Select" ToolTip='<%# Eval("tbtoolscategory") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:ImageField DataImageUrlField="tbimgurl">
                    <ControlStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Height="40px" Width="40px" />
                </asp:ImageField>
                <asp:BoundField DataField="tbimgurl" HeaderText="tbimgurl" SortExpression="tbimgurl" Visible="False">
                    <ControlStyle ForeColor="Transparent" />
                    <ItemStyle ForeColor="Transparent" />
                </asp:BoundField>
            </Columns>
            <SelectedRowStyle BackColor="#FFFFCC" />
        </asp:GridView>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderStyle="Solid" DataSourceID="AccessDataSource2" GridLines="None" PageSize="4" ShowHeader="False" Style="z-index: 1; left: 782px; top: 414px; position: absolute; height: 133px; width: 55px" Visible="False" ClientIDMode="Static" ViewStateMode="Enabled" Enabled="False">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Select" ToolTip='<%# Eval("tbtoolscategory") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:ImageField DataImageUrlField="tbimgurl">
                    <ControlStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Height="40px" Width="40px" />
                </asp:ImageField>
                <asp:BoundField DataField="tbimgurl" HeaderText="tbimgurl" SortExpression="tbimgurl" Visible="False">
                    <ItemStyle ForeColor="Transparent" />
                </asp:BoundField>
            </Columns>
            <SelectedRowStyle BackColor="#FFFFCC" />
        </asp:GridView>
        <asp:TextBox ID="TextBox1" runat="server" Style="z-index: 1; left: 73px; top: 428px; position: absolute; width: 414px; height: 24px" ClientIDMode="Static" ViewStateMode="Enabled"></asp:TextBox>
        <asp:Button ID="Button4" runat="server" BackColor="Blue" ForeColor="White" Style="z-index: 1; left: 637px; top: 343px; position: absolute; height: 26px;" Text="Finalize" ToolTip="Only after all the fields are completed, finalization takes place" OnClick="Button4_Click" Enabled="False" ClientIDMode="Static" ViewStateMode="Enabled" />
        <asp:Button ID="Button5" runat="server" BackColor="Blue" ForeColor="White" Style="z-index: 1; left: 539px; top: 24px; position: absolute; height: 26px;" Text="Back to Game" ToolTip="Only after all the fields are completed, finalization takes place" UseSubmitBehavior="False" Enabled="False" />
        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="12pt" ForeColor="Blue" Style="z-index: 1; top: 15px; position: absolute; left: 709px; bottom: 559px;" Text="air or space" ViewStateMode="Enabled"></asp:Label>


        <asp:Panel ID="Panel1" runat="server" Style="z-index: 1; left: 18px; top: 510px; position: absolute; height: 73px; width: 466px" BorderStyle="Solid" Enabled="False" ClientIDMode="Static" ViewStateMode="Enabled">


            <asp:Button ID="Button7" runat="server" Style="z-index: 1; left: 67px; top: 5px; position: absolute" Text="Top" OnClick="Button7_Click" ClientIDMode="Static" ViewStateMode="Enabled" />
            <asp:Button ID="Button2" runat="server" Style="z-index: 1; left: 8px; top: 33px; position: absolute" Text="Left" OnClick="Button2_Click" ClientIDMode="Static" ViewStateMode="Enabled" />
            <asp:Button ID="Button3" runat="server" Style="z-index: 1; left: 119px; top: 33px; position: absolute" Text="Right" OnClick="Button3_Click" ClientIDMode="Static" ViewStateMode="Enabled" />
            <asp:Button ID="Button8" runat="server" Style="z-index: 1; left: 59px; top: 44px; position: absolute" Text="Down" OnClick="Button8_Click" ClientIDMode="Static" ViewStateMode="Enabled" />
            <asp:Button ID="Button9" runat="server" Style="z-index: 1; left: 288px; top: 24px; position: absolute" Text="+" OnClick="Button9_Click" ClientIDMode="Static" ViewStateMode="Enabled" />
            <asp:Button ID="Button10" runat="server" Style="z-index: 1; left: 233px; top: 25px; position: absolute; right: 215px;" Text="-" OnClick="Button10_Click" ClientIDMode="Static" ViewStateMode="Enabled" />
            <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="12pt" ForeColor="Blue" Style="z-index: 1; left: 259px; top: 3px; position: absolute" Text="size"></asp:Label>
            <asp:Button ID="Button1" runat="server" Style="z-index: 1; left: 371px; top: 19px; position: absolute" Text="Confirm" ClientIDMode="Static" ViewStateMode="Enabled" />

        </asp:Panel>




        <asp:Label ID="Label8" runat="server" Style="z-index: 1; left: 598px; top: 0px; position: absolute" Text="Label" ClientIDMode="Static"></asp:Label>

    </form>




</body>
</html>

