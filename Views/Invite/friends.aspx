﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>


<!DOCTYPE html>
<script runat="server">
    System.Net.WebClient webClient = new System.Net.WebClient();
    string mytoken = "";
    string permanenttoken = "";
    string tempstring = "";
    string myid = "";
    string receiptno = "";

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
</script>
<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>friends</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
    </div>
    <asp:HiddenField ID="Hiddenfield1" runat="server"></asp:HiddenField>
    <asp:AccessDataSource id="AccessDataSource1" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT uname FROM appuserdetails WHERE (uname = 'GullipilliBhaskar')"> </asp:AccessDataSource>

<a href='#' onclick="FacebookInviteFriends();" style="position:absolute;left:380px; top:161px; width:97px; text-decoration:none; color: #FFFFFF; background-color: #0000FF;; webkit-border-radius:20px; moz-border-radius:20px; border-radius:20px; text-align: center; right: 423px;">Invite Friends</a><p>
            <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 263px; top: 191px; position: absolute" Text="Invite lots of tour friends to make this game more interesting "></asp:Label>
        </p>
    </form>
   <a href="../Home/Play/play" target="_self" style="position:absolute;left:167px; top:124px; width:152px; text-decoration:none; background-color: #0000FF; color: #FFFFFF; webkit-border-radius:20px; moz-border-radius:20px; border-radius:20px; right: 581px; text-align: center;" > Go On a TreasureHunt </a> 
   
<a href='../Home/Cpanel/gamesettings'  style="position:absolute;left:542px; top:119px; width:91px; text-decoration:none; color: #FFFFFF; background-color: #0000FF;; webkit-border-radius:20px; moz-border-radius:20px; border-radius:20px; text-align: center;">My Game</a>

</body>
</html>
