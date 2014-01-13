<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>

<!DOCTYPE html>

<script runat="server">

    string username = "";
    string logintimes = "";
    string tspots = "";
    string invites = "";
    string Hiddenfield1;
    string HiddenField2;
    string HiddenField3;
    string HiddenField4;
    string HiddenField5;
    
    protected void checkusername()
    {
        Hiddenfield1 = Convert.ToString(Session["loggeduser"]);
        HiddenField4 = Convert.ToString(Session["loggeduserid"]);
        HiddenField5 = Convert.ToString(Session["loggeduserurl"]);
        Hiddenfield1 = Hiddenfield1.Replace(" ", "");
        Label14.Text = Hiddenfield1;
        if (Hiddenfield1 != null)
        {

            //Insert User into appuser,loggeduser,ordercounter,treasureprize;
            AccessDataSource5.SelectCommand = "SELECT uname FROM appuserdetails WHERE (uname = '" + Hiddenfield1 + "')";

            DataView dv = (DataView)AccessDataSource5.Select(DataSourceSelectArguments.Empty);
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
    }
    public class Toolbox
    {
        public string tbName { get; set; }
        public string tbCategory { get; set; }
        public string tbSubCategory { get; set; }
        public string toolsCategory { get; set; }
        public string tbMain { get; set; }
        public string tbMainSound { get; set; }
        public string tbProp { get; set; }
        public string tbPropType { get; set; }
        public string tbCollionResult { get; set; }
        public string tbCollionSound { get; set; }
        public string tbEscape { get; set; }
        public string tbResult { get; set; }
        public string tbTriviaq { get; set; }

    }
    string tempstring = "";
    int goahead = 0;

    protected void Button4_Click(object sender, EventArgs e)
    {
        Toolbox tbitems = new Toolbox();
        tbitems.tbName = TextBox1.Text;
        tbitems.tbCategory = DropDownList2.SelectedValue;
        tbitems.tbSubCategory = DropDownList3.SelectedValue;
        tbitems.toolsCategory = DropDownList4.SelectedValue;
        tbitems.tbMain = TextBox2.Text;
        tbitems.tbMainSound = TextBox5.Text;
        tbitems.tbProp = TextBox3.Text;
        tbitems.tbPropType = DropDownList1.SelectedValue;
        tbitems.tbCollionResult = TextBox4.Text;
        tbitems.tbCollionSound = TextBox6.Text;
        tbitems.tbEscape = DropDownList5.SelectedValue;
        tbitems.tbResult = DropDownList6.SelectedValue;
        if (CheckBox2.Visible == true && CheckBox2.Checked == true)
        {
            tbitems.tbTriviaq = CheckBox2.Text;
        }
        else
        {
            tbitems.tbTriviaq = null;
        }
        string json = Newtonsoft.Json.JsonConvert.SerializeObject(tbitems);
        tempstring = json;
        if (TextBox1.Text != null && TextBox2.Text != null && TextBox3.Text != null && TextBox4.Text != null && TextBox5.Text != null && TextBox6.Text != null)
        {
            AccessDataSource1.SelectCommand = "Select * from toolbox where tbcompleted = 'no'  and tbnew = 'yes' and tbowner = '" + Hiddenfield1 + "' order by tborder ASC";
            DataView dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
            
            string coownername = dv[0][28].ToString();
            string tbownername = dv[0][14].ToString();
            string tborderno = dv[0][31].ToString();
            
            
                AccessDataSource1.UpdateCommand = "UPDATE toolbox SET tbcategory = '" + DropDownList2.SelectedValue + "', tbsubcategory = '" + DropDownList3.SelectedValue + "', tbname = '" + TextBox1.Text + "', tbcoowner = '" + coownername + ":" + Hiddenfield1 + "', tbnew = 'no', tbcompleted = 'yes', tbdetails = '" + tempstring + "', tbtoolscategory = '" + DropDownList4.SelectedValue + "', tbimgurl = '" + TextBox2.Text + "' where tbowner = '" + Hiddenfield1 + "' and tborder='" + tborderno + "'";
                AccessDataSource1.Update();
            
            }
            
                Button5.Enabled = true;
		DropDownList1.Enabled = false;
		DropDownList2.Enabled = false;   
		DropDownList3.Enabled = false;
		DropDownList4.Enabled = false;     
		DropDownList5.Enabled = false;
		DropDownList6.Enabled = false;    
		TextBox1.Enabled = false;
		TextBox2.Enabled = false;   
		TextBox3.Enabled = false;
		TextBox4.Enabled = false;     
		TextBox5.Enabled = false;
		TextBox6.Enabled = false;   
		Button4.Enabled = false;
        CheckBox1.Enabled = false;
        CheckBox2.Enabled = false;
        CheckBox3.Enabled = false;            
}
    

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        TextBox1.Text = TextBox1.Text.Replace(" ", "");
        AccessDataSource1.SelectCommand = "SELECT toolbox.* FROM toolbox where tbname='" + TextBox1.Text + "'";

        DataView dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
        DataTable dt = new DataTable();
        dt = dv.ToTable();
        //DataTable dtr = dt;
        //DataRow[] uniname = dtr.Select("tsname");
        //username = dt.Rows[0].Field<string>("uname"); usethis to get field value

        if (dt.Rows.Count == 1)
        {
            TextBox1.Text = "";
            goahead = 0;
        }
        else
        {
            goahead = 1;
        }
    }

    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox1.Checked == true)
        {
            TextBox3.Enabled = false;
            DropDownList1.Enabled = false;
            
        }
        if (CheckBox1.Checked == false)
        {
            TextBox3.Enabled = true;
            DropDownList1.Enabled = true;
            
        }

    }

    

    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/play.aspx");
    }


    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {
        Image1.ImageUrl = TextBox2.Text;
    }

    protected void TextBox3_TextChanged(object sender, EventArgs e)
    {
        Image2.ImageUrl = TextBox3.Text;
    }

    protected void TextBox4_TextChanged(object sender, EventArgs e)
    {
        Image3.ImageUrl = TextBox4.Text;
    }

   
</script>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>tools</title>
    
</head>
    

<body>
   
<iframe id="iframe1" style="position:absolute; top: 639px; left: 10px; width: 895px; height: 353px;" src="googlepickerlatest.html"></iframe>
  
   
   <form id="form1" runat="server">
 <asp:Label ID="Label14" runat="server" style="z-index: 1; left: 709px; top: 12px; position: absolute; height: 21px; width: 172px" Text="Label"></asp:Label>
     
   
        <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="20pt" style="z-index: 1; left: 251px; top: 12px; position: absolute; height: 21px" Text="Treasure Hunter Tool Box Creator"></asp:Label>
    
       <asp:AccessDataSource id="AccessDataSource1" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT uname FROM appuserdetails WHERE (uname = '<%=Hiddenfield1.Value%>')"> </asp:AccessDataSource>

        <asp:AccessDataSource id="AccessDataSource2" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT categoryname FROM category"> </asp:AccessDataSource>

        <asp:Button ID="Button5" runat="server" Enabled="False" style="z-index: 1; left: 681px; top: 55px; position: absolute; cursor:pointer" Text="Back to Game " OnClick="Button5_Click" UseSubmitBehavior="False" />
         <asp:AccessDataSource id="AccessDataSource3" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT subcategoryname FROM subcategory"> </asp:AccessDataSource>
            <asp:AccessDataSource id="AccessDataSource4" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT othersname FROM others"> </asp:AccessDataSource>
        <asp:AccessDataSource id="AccessDataSource6" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT crname FROM collisionresult"> </asp:AccessDataSource>
        <asp:AccessDataSource id="AccessDataSource7" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT cescname FROM collisionescape"> </asp:AccessDataSource>


<asp:TextBox ID="TextBox2" runat="server" style="z-index: 1; left: 250px; top: 235px; position: absolute; width: 385px; height: 24px" ToolTip="only png and gif file with transparent background, 100 x 120 and 30kb size only" ClientIDMode="Static" OnTextChanged="TextBox2_TextChanged" AutoPostBack="True"></asp:TextBox>
<asp:TextBox ID="TextBox3" runat="server" style="z-index: 1; left: 234px; top: 337px; position: absolute; width: 383px; height: 29px" ToolTip="only png and gif file with transparent background, 100 x 120 and 30kb size only" ClientIDMode="Static" OnTextChanged="TextBox3_TextChanged" AutoPostBack="True"></asp:TextBox>
 <asp:TextBox ID="TextBox4" runat="server" style="z-index: 1; left: 229px; top: 411px; position: absolute; width: 382px; height: 28px" ToolTip="only png and gif file with transparent background, 100 x 120 and 30kb size only" ClientIDMode="Static" OnTextChanged="TextBox4_TextChanged" AutoPostBack="True"></asp:TextBox>
            
           
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/toc.aspx" style="z-index: 1; left: 711px; top: 130px; position: absolute" Target="_blank">Terms and Conditions</asp:HyperLink>
        <asp:CheckBox ID="CheckBox3" runat="server" Checked="True" Enabled="False" ForeColor="Red" style="z-index: 1; left: 523px; top: 103px; position: absolute" Text="I Agree to the terms and conditions of treasurehunter" />
        <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="AccessDataSource6" DataTextField="crname" DataValueField="crname" style="z-index: 1; left: 215px; top: 562px; position: absolute; height: 33px; width: 311px; right: 374px" AutoPostBack="True">
        </asp:DropDownList>
        <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="AccessDataSource7" DataTextField="cescname" DataValueField="cescname" style="z-index: 1; left: 224px; top: 516px; position: absolute; height: 30px; width: 309px" AutoPostBack="True">
        </asp:DropDownList>
        
        <asp:CheckBox ID="CheckBox1" runat="server" style="z-index: 1; left: 71px; top: 367px; position: absolute; width: 64px" Text="None" OnCheckedChanged="CheckBox1_CheckedChanged" AutoPostBack="True" />
                 <asp:CheckBox ID="CheckBox2" runat="server" style="z-index: 1; left: 588px; top: 189px; position: absolute" Text="Enable Trivia" AutoPostBack="True" />

        
        

        <asp:Label ID="Label13" runat="server" Font-Bold="True" style="z-index: 1; left: 575px; top: 503px; position: absolute; height: 79px; width: 317px" Text="Note: This item will be active only after an approval. Considerations will be for no obscenity, reality and other factors. A resale can be possible only if the item is active."></asp:Label>

        <asp:Image ID="Image3" runat="server" style="z-index: 1; left: 686px; top: 456px; position: absolute; height: 30px; width: 30px" />
        <asp:Image ID="Image2" runat="server" style="z-index: 1; left: 685px; top: 374px; position: absolute; height: 30px; width: 32px" />

        <asp:Image ID="Image1" runat="server" style="z-index: 1; left: 677px; top: 273px; position: absolute; width: 28px; height: 29px;"/>

       <asp:Panel runat="server">
        <asp:Button ID="Button4" runat="server" BackColor="Blue" ForeColor="White" style="z-index: 1; left: 668px; top: 588px; position: absolute; cursor:pointer" Text="Finalize" ToolTip="Only after all the fields are completed, finalization takes place" OnClick="Button4_Click" UseSubmitBehavior="False" />
</asp:Panel>
        <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Blue" style="z-index: 1; left: 42px; top: 64px; position: absolute" Text="Name of Tool Box Item" ToolTip="Tool Box display Name"></asp:Label>
        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="AccessDataSource4" DataTextField="othersname" DataValueField="othersname" style="z-index: 1; left: 221px; top: 182px; position: absolute; height: 31px; width: 270px" AutoPostBack="True">
        </asp:DropDownList>
        <asp:Label ID="Label11" runat="server" style="z-index: 1; left: 31px; top: 186px; position: absolute" Text="Tools Sub Category"></asp:Label>
        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="AccessDataSource3" DataTextField="subcategoryname" DataValueField="subcategoryname" style="z-index: 1; left: 219px; top: 142px; position: absolute; height: 31px; width: 233px" AutoPostBack="True">
        </asp:DropDownList>
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="AccessDataSource2" DataTextField="categoryname" DataValueField="categoryname" style="z-index: 1; left: 220px; top: 99px; position: absolute; height: 31px; width: 236px" AutoPostBack="True">
        </asp:DropDownList>
        <asp:DropDownList ID="DropDownList1" runat="server" style="z-index: 1; left: 260px; top: 376px; position: absolute; height: 21px; width: 135px" AutoPostBack="True">
            <asp:ListItem Selected="True">fixed</asp:ListItem>
            <asp:ListItem>movable</asp:ListItem>
        </asp:DropDownList>
        <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Red" NavigateUrl="http://eng.universal-soundbank.com" style="z-index: 1; left: 235px; top: 303px; position: absolute" Target="_blank">Sound Files link, copy only the url path do not download</asp:HyperLink>
        <asp:TextBox ID="TextBox5" runat="server" style="z-index: 1; left: 233px; top: 270px; position: absolute; width: 373px; height: 27px" ClientIDMode="Static" AutoPostBack="True"></asp:TextBox>
        <asp:Label ID="Label8" runat="server" style="z-index: 1; left: 33px; top: 270px; position: absolute" Text="Sound file url found at"></asp:Label>
        
        <asp:TextBox ID="TextBox1" runat="server" style="z-index: 1; left: 219px; top: 62px; position: absolute; width: 420px; height: 26px" ToolTip="Less than 50 chars, no spaces allowed" OnTextChanged="TextBox1_TextChanged" ClientIDMode="Static" AutoPostBack="True"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" ForeColor="Blue" style="z-index: 1; left: 43px; top: 100px; position: absolute; height: 18px" Text="Play Category"></asp:Label>
        <asp:Label ID="Label4" runat="server" ForeColor="Blue" style="z-index: 1; left: 25px; top: 236px; position: absolute" Text="Image file url to display in game" ToolTip="this image will be used in the game"></asp:Label>
        <asp:Label ID="Label5" runat="server" ForeColor="Blue" style="z-index: 1; left: 51px; top: 340px; position: absolute" Text="Prop Image file url" ToolTip="eg: coss hair, or sword or spear or books, pointers etc"></asp:Label>
        <asp:Label ID="Label6" runat="server" ForeColor="Blue" style="z-index: 1; left: 41px; top: 419px; position: absolute" Text="Collision image file url" ToolTip="eg: explosions, lightnings, showers etc"></asp:Label>
        
            <asp:Label ID="Label3" runat="server" ForeColor="Blue" style="z-index: 1; left: 40px; top: 138px; position: absolute" Text="Play Sub Category"></asp:Label>
       <asp:Label ID="Label9" runat="server" style="z-index: 1; left: 37px; top: 456px; position: absolute" Text="Sound file url found at"></asp:Label>
        <asp:TextBox ID="TextBox6" runat="server" style="z-index: 1; left: 225px; top: 453px; position: absolute; width: 384px; height: 26px;" ClientIDMode="Static" AutoPostBack="True"></asp:TextBox>
    <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="Red" NavigateUrl="http://eng.universal-soundbank.com" style="z-index: 1; left: 222px; top: 486px; position: absolute" Target="_blank">Sound Files link, copy only the url path do not download</asp:HyperLink>
        <asp:Label ID="Label10" runat="server" style="z-index: 1; left: 34px; top: 519px; position: absolute; right: 766px" Text="Escape Collision"></asp:Label>
        <asp:Label ID="Label12" runat="server" style="z-index: 1; left: 39px; top: 554px; position: absolute" Text="Collision Result"></asp:Label>
   
    
        
        <asp:AccessDataSource id="AccessDataSource5" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT uname FROM appuserdetails WHERE (uname = 'GullipilliBhaskar')"> </asp:AccessDataSource>
        <asp:Label ID="Label15" runat="server" Font-Bold="True" ForeColor="Green" style="z-index: 1; left: 678px; top: 215px; position: absolute; width: 204px" Text="Go to the bottom of this page for files uploader"></asp:Label>
        </form>
    
</body>
</html>
