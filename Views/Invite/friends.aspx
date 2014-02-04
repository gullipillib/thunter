<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
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
            
            Response.Redirect("~/buy.aspx");
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
    <div id="fb-root">
        </div>


<script src="https://connect.facebook.net/en_US/all.js">
    FB.init({
        appId: '123405257731200',
        cookie: true,
        status: true,
        xfbml: true
    });
</script>
<script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "https://connect.facebook.net/en_US/all.js#xfbml=1&appId=123405257731200";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>


<script>
    function FacebookInviteFriends() {
        FB.ui({
            method: 'apprequests',
            message: 'You are Invited to Play Treasure Hunter 3D MultiPlayer Game with me'
        });
    }
</script>
   
    <asp:AccessDataSource id="AccessDataSource1" DataFile="~/App_Data/th.mdb" runat="server"  SelectCommand="SELECT uname FROM appuserdetails WHERE (uname = '<%=Hiddenfield1%>')"> </asp:AccessDataSource>

<a href='#' onclick="FacebookInviteFriends();" style="position:absolute;left:42%; top:27%; width:13%; height: 5%; text-decoration:none; color: #FFFFFF; background-color: #0000FF;; webkit-border-radius:20px; moz-border-radius:20px; border-radius:20px; text-align: center; right: 396px;">Invite Friends</a><p>

    <asp:hyperlink ID="Hyperlink1" runat="server"  Font-Underline="False" NavigateUrl="~/Play/play" style="z-index: 1; left: 30%; top: 22%; position: absolute; right: 463px; width: 17%; height: 4%;" Target="_self">Go on a Treasurehunt</asp:hyperlink>
        
<asp:hyperlink ID="Hyperlink4" runat="server"  Font-Underline="False" NavigateUrl="~/gamesettings.aspx" style="z-index: 1; left: 53%; top: 22%; position: absolute; height: 4%;" Target="_self" Width="12%">My Game</asp:hyperlink>   

        
        </form>
   
</body>
</html>
