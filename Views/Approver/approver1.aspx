<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<treasurehunter.Models.MyAppUser>" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>


<!DOCTYPE html>
<script runat="server">
    
   

    string Hiddenfield1;

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
    
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
        checkusername();
        AccessDataSource1.SelectCommand = "SELECT tbdetails, tbname, tbapproved, tbactive, tbapprover1, tbapprover2, tbapprover3, tbapprovercomments FROM toolbox where tbapproved = 'no' and tbactive = 'no'";
        DataView dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
        DataTable dt = new DataTable();
        dt = dv.ToTable();
        Label1.Text = dt.Rows[0].Field<string>("tbname"); //usethis to get field value
    }



    protected void Button2_Click(object sender, EventArgs e)
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
        AccessDataSource1.UpdateCommand = "UPDATE appuserdetails SET amount='" + Convert.ToString(Convert.ToInt16(amount) + Convert.ToInt16("0.10")) + "' where uname = '" + Hiddenfield1 + "'";
        AccessDataSource1.Update();

        HyperLink5.Enabled = true;
    }
</script>


<html>
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width" />
    <title></title>
</head>


<body>
    

    




    <form id="form1"  runat="server" >
        <asp:AccessDataSource ID="AccessDataSource1" DataFile="~/Views/Datab/th.mdb" runat="server" SelectCommand="SELECT uname FROM appuserdetails WHERE (uname = '<%=Hiddenfield1%>')"></asp:AccessDataSource>
        <asp:Image ID="Image2" runat="server" Height="80px" style="z-index: 1; left: 181px; top: 200px; position: absolute" Width="60px" />

        <asp:TextBox ID="TextBox3" runat="server" style="z-index: 1; left: 29px; top: 393px; position: absolute; height: 54px; width: 562px" TextMode="MultiLine"></asp:TextBox>
        <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 322px; top: 44px; position: absolute; width: 496px" Text="Label"></asp:Label>

<asp:Button ID="Button3" runat="server" style="z-index: 1; left: 457px; top: 483px; position: absolute" Text="Test" />

        <asp:Image ID="Image1" runat="server" Height="80px" style="z-index: 1; left: 180px; top: 96px; position: absolute" Width="60px" />
    <asp:Image ID="Image3" runat="server" Height="80px" style="z-index: 1; left: 183px; top: 293px; position: absolute" Width="60px" />
           
<asp:Button ID="Button1" runat="server" style="z-index: 1; left: 274px; top: 478px; position: absolute" Text="Approve" />

<asp:Button ID="Button2" runat="server" style="z-index: 1; left: 5px; top: 478px; position: absolute" Text="Disapprove" OnClick="Button2_Click" />
<asp:HyperLink ID="HyperLink5" runat="server" Enabled="False" ForeColor="Black" NavigateUrl="~/Play/play" style="z-index: 1; left: 773px; top: 56px; position: absolute">Back to Game</asp:HyperLink>
    </form>
</body>

</html>
