<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" EnableViewState="true" AutoEventWireup="true" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>


<!DOCTYPE html>
<script runat="server">
    
   

    string Hiddenfield1;
    string HiddenField4;
    string HiddenField5;
    string img1url = "";
    string img2url = "";
    string img3url = "";
    
    protected void checkusername()
    {
        Hiddenfield1 = Convert.ToString(Session["loggeduser"]);
        HiddenField4 = Convert.ToString(Session["loggeduserid"]);
        HiddenField5 = Convert.ToString(Session["loggeduserurl"]);
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

    string updater = "0";
    string logintimes = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            AccessDataSource1.SelectCommand = "select lubuylater from loggedusers where luname = '" + Hiddenfield1 + "'";
            DataView dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();
            DataView uniname = dt.DefaultView;
            if (dt.Rows.Count != 0)
            {
                logintimes = dt.Rows[0].Field<string>("lubuylater"); //usethis to get field value
            }

            if (logintimes == "yes")
            {
                Response.Redirect("https://treasurehunter.apphb.com");
            }
            
            checkusername();
            AccessDataSource1.SelectCommand = "select lutspots from loggedusers where luname = '" + Hiddenfield1 + "'";
            dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
            dt = new DataTable();
            dt = dv.ToTable();
            if (dt.Rows.Count == 0)
            {
                Response.Redirect("~/gamesettings.aspx");
            }
            AccessDataSource1.SelectCommand = "SELECT tbdetails, tbname, tbapproved, tbactive, tbapprover1, tbapprover2, tbapprover3, tbapprovercomments FROM toolbox where tbapproved = 'no' and tbactive = 'no'";
            dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
            dt = new DataTable();
            dt = dv.ToTable();
            if (dt.Rows.Count != 0)
            {
                Label1.Text = dt.Rows[0].Field<string>("tbname"); //usethis to get field value
                string tb1fulldetails = dt.Rows[0].Field<string>("tbdetails");
                dynamic tb1itemsfulldetails = Newtonsoft.Json.JsonConvert.DeserializeObject(tb1fulldetails);
                img1url = tb1itemsfulldetails.tbMain;
                img2url = tb1itemsfulldetails.tbProp;
                img3url = tb1itemsfulldetails.tbCollionResult;
            }
            else
            {
                Response.Redirect("~/gamesettings.aspx");
            }
        }

        if (Page.IsPostBack == true)
        {
            if (updater == "1")
            {
                AccessDataSource1.SelectCommand = "SELECT tbname, tbapproved, tbactive, tbapprover1, tbapprover2, tbapprover3, tbapprovercomments FROM toolbox where tbapproved = 'no' and tbactive = 'no' and tbname='" + Label1.Text + "'";
                DataView dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
                DataTable dt = new DataTable();
                dt = dv.ToTable();
                string tbapprovercomments = dt.Rows[0].Field<string>("tbapprovercomments"); //usethis to get field value

                AccessDataSource1.UpdateCommand = "UPDATE toolbox SET tbapprovercomments='" + tbapprovercomments + "  " + TextBox3.Text + "' where tbapproved = 'no' and tbactive = 'no' and tbname='" + Label1.Text + "'";
                AccessDataSource1.Update();
                AccessDataSource1.SelectCommand = "SELECT amount FROM appuserdetails where uname = '" + Hiddenfield1 + "'";
                dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
                dt = new DataTable();
                dt = dv.ToTable();
                string amount = dt.Rows[0].Field<string>("amount"); //usethis to get field value
                AccessDataSource1.UpdateCommand = "UPDATE appuserdetails SET amount='" + Convert.ToString(Convert.ToDouble(amount) + Convert.ToDouble("0.10")) + "' where uname = '" + Hiddenfield1 + "'";
                AccessDataSource1.Update();

                HyperLink5.Enabled = true;
            }

            if (updater == "2")
            {
                timer.Enabled = true;
                timer.Elapsed += new System.Timers.ElapsedEventHandler(updatecoins);
            }
            if (updater == "3")
            {
                AccessDataSource1.SelectCommand = "SELECT tbname, tbapproved, tbactive, tbapprover1, tbapprover2, tbapprover3, tbapprovercomments FROM toolbox where tbapproved = 'no' and tbactive = 'no' and tbname='" + Label1.Text + "'";
                DataView dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
                DataTable dt = new DataTable();
                dt = dv.ToTable();
                string tbapprover1 = dt.Rows[0].Field<string>("tbapprover1"); //usethis to get field value
                string tbapprover2 = dt.Rows[0].Field<string>("tbapprover2"); //usethis to get field value
                string tbapprover3 = dt.Rows[0].Field<string>("tbapprover3"); //usethis to get field value
                string tbapprovercomments = dt.Rows[0].Field<string>("tbapprovercomments"); //usethis to get field value
                if (tbapprover1 == null && tbapprover2 == null && tbapprover3 == null)
                {
                    AccessDataSource1.UpdateCommand = "UPDATE toolbox SET tbsapprover1='" + Hiddenfield1 + "',  tbapprovercomments='" + tbapprovercomments + "  " + TextBox3.Text + "' where tbapproved = 'no' and tbactive = 'no' and tbname='" + Label1.Text + "'";
                    AccessDataSource1.Update();
                }
                else if (tbapprover1 != null && tbapprover2 == null && tbapprover3 == null)
                {
                    AccessDataSource1.UpdateCommand = "UPDATE toolbox SET tbapprover2='" + Hiddenfield1 + "',  tbapprovercomments='" + tbapprovercomments + "  " + TextBox3.Text + "' where tbapproved = 'no' and tbactive = 'no' and tbname='" + Label1.Text + "'";
                    AccessDataSource1.Update();
                }
                else if (tbapprover1 != null && tbapprover2 != null && tbapprover3 == null)
                {
                    AccessDataSource1.UpdateCommand = "UPDATE toolbox SET tbapproved='yes', tbactive='yes',  tbapprover3='" + Hiddenfield1 + "',  tbapprovercomments='" + tbapprovercomments + "  " + TextBox3.Text + "' where tbapproved = 'no' and tbactive = 'no' and tbname='" + Label1.Text + "'";
                    AccessDataSource1.Update();

                }
                AccessDataSource1.SelectCommand = "SELECT amount FROM appuserdetails where uname = '" + Hiddenfield1 + "'";
                dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
                dt = new DataTable();
                dt = dv.ToTable();
                string amount = dt.Rows[0].Field<string>("amount"); //usethis to get field value
                AccessDataSource1.UpdateCommand = "UPDATE appuserdetails SET amount='" + Convert.ToString(Convert.ToDouble(amount) + Convert.ToDouble("0.10")) + "' where uname = '" + Hiddenfield1 + "'";
                AccessDataSource1.Update();
                HyperLink5.Enabled = true;
            }
        }
          
    }



    protected void Button2_Click(object sender, EventArgs e)
    {
        updater = "1";
    }
    public static System.Timers.Timer timer = new System.Timers.Timer(5000); // This will raise the event every one minute.
    int test = 0;
    protected void Button3_Click(object sender, EventArgs e)
    {
        updater = "2";
        
    }
    protected void updatecoins(object sender, System.Timers.ElapsedEventArgs e)
    {
        timer.Enabled = false;
        if (test == 0)
        {
            pamel1.BackColor = System.Drawing.Color.AliceBlue;
            test = 1;
            timer.Enabled = false;
        }
        else if (pamel1.BackColor == System.Drawing.Color.AliceBlue)
        {
            pamel1.BackColor = System.Drawing.Color.LightCoral;
        }
        else if (pamel1.BackColor == System.Drawing.Color.LightCoral)
        {
            pamel1.BackColor = System.Drawing.Color.LightGreen;
        }
        else if (pamel1.BackColor == System.Drawing.Color.LightGreen)
        {
            pamel1.BackColor = System.Drawing.Color.Transparent;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        updater = "3";
        
    }
</script>


<html>
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width" />
    <title></title>
</head>


<body style="background-color:azure">
 
    <form id="form1"  runat="server" >
        <asp:AccessDataSource ID="AccessDataSource1" DataFile="~/App_Data/th.mdb" runat="server" SelectCommand="SELECT uname FROM appuserdetails WHERE (uname = '<%=Hiddenfield1%>')"></asp:AccessDataSource>
        <div style="z-index: 300; border: 15px ridge #FF00FF; position: absolute; overflow: hidden; top: 395px; left: 11px; width: 598px; height: 48px;">
            <asp:TextBox ID="TextBox3" runat="server" Style="z-index: 1; left: 0px; top: 0px; position: absolute; width: 592px; height: 45px" TextMode="MultiLine" CausesValidation="True" BackColor="Silver" ForeColor="White"></asp:TextBox>
        </div>

        <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 322px; top: 44px; position: absolute; width: 496px" Text="Label"></asp:Label>


        <asp:Panel ID="pamel1" runat="server" style="z-index: 1; left: 180px; top: 96px; position: absolute; height: 290px; width: 466px">
            <asp:Image src='<%=img1url%>' ID="Image1" runat="server" Height="80px" style="z-index: 1; left: 176px; top: 9px; position: absolute" Width="60px" />
            <asp:Image src='<%=img2url%>' ID="Image2" runat="server" Height="80px" style="z-index: 1; left: 179px; top: 99px; position: absolute" Width="60px" />
            <asp:Image  src='<%=img3url%>' ID="Image3" runat="server" Height="80px" style="z-index: 1; left: 183px; top: 198px; position: absolute" Width="60px" />
            <asp:Button ID="Button3" runat="server" style="z-index: 1; left: 266px; top: 384px; position: absolute" Text="Test" OnClick="Button3_Click" UseSubmitBehavior="False" />
        </asp:Panel>           
<asp:Button ID="Button1" runat="server" style="z-index: 1; left: 245px; top: 481px; position: absolute" Text="Approve" UseSubmitBehavior="False" OnClick="Button1_Click" />

<asp:Button ID="Button2" runat="server" style="z-index: 1; left: 12px; top: 478px; position: absolute; right: 807px;" Text="Disapprove" OnClick="Button2_Click" UseSubmitBehavior="False" />
<asp:HyperLink ID="HyperLink5" runat="server" Enabled="False" ForeColor="Black" NavigateUrl="~/Play/play" style="z-index: 1; left: 773px; top: 56px; position: absolute">Back to Game</asp:HyperLink>
    </form>
</body>

</html>
