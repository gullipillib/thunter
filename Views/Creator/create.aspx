<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
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
        public string tsctrl1left { get; set; }
        public string tsctrl1top { get; set; }
        public string tsctrl1width { get; set; }
        public string tsctrl1height { get; set; }
        public string tsctrl2left { get; set; }
        public string tsctrl2top { get; set; }
        public string tsctrl2width { get; set; }
        public string tsctrl2height { get; set; }
        public string tsctrl3left { get; set; }
        public string tsctrl3top { get; set; }
        public string tsctrl3width { get; set; }
        public string tsctrl3height { get; set; }
        public string tsctrl4left { get; set; }
        public string tsctrl4top { get; set; }
        public string tsctrl4width { get; set; }
        public string tsctrl4height { get; set; }
        public string tsctrl5left { get; set; }
        public string tsctrl5top { get; set; }
        public string tsctrl5width { get; set; }
        public string tsctrl5height { get; set; }
    }

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

            Response.Redirect("~/Tspot/buy");
        }
    }
    string tempstring = "";
    protected void Button4_Click(object sender, EventArgs e)
    {
        Treasurespot tbitems = new Treasurespot();
        
        string json = Newtonsoft.Json.JsonConvert.SerializeObject(tbitems);
        tempstring = json;
        if (TextBox1.Text != null && TextBox2.Text != null && TextBox3.Text != null && TextBox4.Text != null && TextBox5.Text != null && TextBox6.Text != null)
        {
            AccessDataSource1.UpdateCommand = "UPDATE toolbox SET tbcategory = '" + DropDownList2.SelectedValue + "', tbsubcategory = '" + DropDownList3.SelectedValue + "', tbname = '" + TextBox1.Text + "', tbcoowner = '" + Hiddenfield1.Value + "', new = 'no', tbdetails = '" + tempstring + "', tbtoolscategory = '" + DropDownList4.SelectedValue + "', tbimageurl = '" + TextBox2.Text + "' where tbcoowner='" + Hiddenfield1.Value + "'";
            AccessDataSource1.Update();
            Button5.Enabled = true;
        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        checkusername();
    }


    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

    }

    protected void ImageButton2_Click1(object sender, ImageClickEventArgs e)
    {

    }

    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        
    }

    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {

    }

    

    protected void Button2_Click(object sender, EventArgs e)
    {
        Image1.ID = "ctrl1";
        Image1.Style["left"] = "50px";
        Page.Controls.Add(Image1);
    }
</script>


<html>
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width" />
    <title></title>
    <style type="text/css">
        #uploadFile_div {
            width: 232px;
            z-index: 1;
            left: 665px;
            top: 429px;
            position: absolute;
            height: 19px;
        }
        #file {
            z-index: 1;
            left: 673px;
            top: 392px;
            position: absolute;
        }
    </style>
    </head>  
  
     
<body style="height: 585px; ">
    <script src="//js.live.net/v5.0/wl.js" type="text/javascript"></script>
    <script type="text/javascript">
        var APPLICATION_CLIENT_ID = "0000000040108151",
        REDIRECT_URL = "https://treasurehunter.apphb.com";
        WL.Event.subscribe("auth.login", onLogin);
        WL.init({
            client_id: APPLICATION_CLIENT_ID,
            redirect_uri: REDIRECT_URL,
            response_type: "token"
        });

        WL.ui({
            name: "signin",
            element: "signInButton",
            brand: "hotmail",
            type: "connect"
        });

        function greetUser(session) {
            var strGreeting = "";
            WL.api(
            {
                path: "me",
                method: "GET"
            },
            function (response) {
                if (!response.error) {
                    strGreeting = "Hi, " + response.first_name + "!"
                    document.getElementById("greeting").innerHTML = strGreeting;
                }
            });
        }

        function onLogin() {
            var session = WL.getSession();
            if (session) {
                //greetUser(session);
            }
        }
    </script>  

    
    <div id="greeting"></div>
    <div id="signInButton"></div>
   <form>
    <input id="file" name="file" type="file" />
</form>
    <div id="uploadFile_div">SkyDrive save button to appear here</div>
    <script type="text/javascript">
        WL.ui({
            name: "skydrivepicker",
            element: "uploadFile_div",
            mode: "save",
            onselected: onUploadFileCompleted,
            onerror: onUploadFileError
        });

        function onUploadFileCompleted(response) {
            WL.upload({
                path: response.data.folders[0].id,
                element: "file",
                overwrite: "rename"
            }).then(
                function (response) {
                    document.getElementById("info").innerText =
                        "File uploaded.";
                },
                function (responseFailed) {
                    document.getElementById("info").innerText =
                        "Error uploading file: " + responseFailed.error.message;
                }
            );
        };

        function onUploadFileError(response) {
            document.getElementById("info").innerText =
                "Error getting folder info: " + response.error.message;
        }
    </script>
 
    <form id="form1" runat="server" >
    <iframe id="Iframe1"   src="//www.youtube.com/embed/XAbMQx-D7rE?enablejsapi=1&wmmode=transparent&autoplay=1&start=30&end=60&loop=1&playlist=XAbMQx-D7rE&rel=0&showinfo=0&controls=0&disablekb=1" style="z-index: 0;  left: 150px; top: 454px; position: absolute; background-color: transparent; width: 623px; height: 361px;"   class="twoto3d"></iframe>
       <img alt="" id="imager" src="Images/fplane.gif" style="z-index: 1; left: 806px; top: 320px; position: absolute; height: 30px; width: 34px" /> 
       
         <asp:AccessDataSource id="AccessDataSource1" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT uname FROM appuserdetails WHERE (uname = 'GullipilliBhaskar')"> </asp:AccessDataSource>
        <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 124px; top: 414px; position: absolute; width: 55px; height: 20px;" Text="Name"></asp:Label>
        <asp:AccessDataSource id="AccessDataSource2" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT tbname, tbcategory, tbactive, tbdetails, tbimgurl FROM toolbox WHERE (tbactive = 'yes') and (tbcategory = 'land')"> </asp:AccessDataSource>
        <asp:AccessDataSource id="AccessDataSource3" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT tbname, tbcategory, tbactive, tbdetails, tbimgurl FROM toolbox WHERE (tbactive = 'yes') and (tbcategory = 'water')"> </asp:AccessDataSource>
        <asp:DataList ID="DataList2" runat="server" DataSourceID="AccessDataSource3" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" ShowFooter="False" ShowHeader="False" style="z-index: 1; left: 787px; top: 30px; position: absolute; height: 125px; width: 36px">
            <ItemTemplate>
                <asp:Label ID="tbcategoryLabel" runat="server" Text='<%# Eval("tbcategory") %>' />
                <br />
                <asp:ImageButton ID="ImageButton2" runat="server" Height="20px" ImageUrl='<%# Eval("tbimgurl") %>' OnClick="ImageButton2_Click1" OnClientClick="addctrl(); return false;" Width="20px" />
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="AccessDataSource2" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" ShowFooter="False" ShowHeader="False" style="z-index: 1; left: 705px; top: 29px; position: absolute; height: 125px; width: 36px">
            <ItemTemplate>
                <asp:Label ID="tbcategoryLabel" runat="server" Text='<%# Eval("tbcategory") %>' Font-Bold="True" />
                <br />
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("tbimgurl") %>' OnClick="ImageButton1_Click" Height="20px" OnClientClick="addctrl(); return false;" Width="20px" />
                <br />
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:AccessDataSource id="AccessDataSource4" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT tbname, tbcategory, tbactive, tbdetails, tbimgurl FROM toolbox WHERE (tbactive = 'yes') and (tbcategory = 'air or space')"> </asp:AccessDataSource>
        <asp:AccessDataSource id="AccessDataSource5" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT tbname, tbcategory, tbactive, tbdetails, tbimgurl FROM toolbox WHERE (tbactive = 'yes') and (tbcategory = 'others or players')"> </asp:AccessDataSource>
        
        <asp:HiddenField ID="Hiddenfield1" runat="server"></asp:HiddenField>
        
        
        <asp:TextBox ID="TextBox1" runat="server" style="z-index: 1; left: 216px; top: 410px; position: absolute; width: 414px; height: 24px"></asp:TextBox>
        
        
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/fplane.gif" style="z-index: 200; left: 532px; top: 523px; position: absolute; height: 28px; width: 29px" ClientIDMode="Static" />
        
        
        <asp:DataList ID="DataList4" runat="server" DataSourceID="AccessDataSource5" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" ShowFooter="False" ShowHeader="False" style="z-index: 1; left: 922px; top: 29px; position: absolute; height: 125px; width: 36px">
            <ItemTemplate>
                <asp:Label ID="tbcategoryLabel" runat="server" Text='<%# Eval("tbcategory") %>' />
<br />
                <asp:ImageButton ID="ImageButton4" runat="server" Height="20px" ImageUrl='<%# Eval("tbimgurl") %>' OnClick="ImageButton4_Click" OnClientClick="addctrl(); return false;" Width="20px" />
                <br />
            </ItemTemplate>
        </asp:DataList>
        
        
        <asp:DataList ID="DataList3" runat="server" DataSourceID="AccessDataSource4" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" ShowFooter="False" ShowHeader="False" style="z-index: 1; left: 863px; top: 30px; position: absolute; height: 327px; width: 40px">
            <ItemTemplate>
                <asp:ImageButton ID="ImageButton3" runat="server"   Height="20px" ImageUrl='<%# Eval("tbimgurl") %>' OnClick="ImageButton3_Click"  Width="20px" ClientIDMode="Static"  ImageAlign="Middle" ToolTip='<%# Eval("tbname") %>' Enabled="False" />
                
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" style="z-index: 200; left: 21px; top: 333px; position: absolute; height: 34px; width: 56px; cursor: crosshair" UseSubmitBehavior="False" BorderColor="Black" BorderStyle="None" BorderWidth="1px" Text='<%# Eval("tbname") %>' />
                
<br />
                
            </ItemTemplate>
        </asp:DataList>
        
        
        

       
        <asp:Button ID="Button4" runat="server" BackColor="Blue" ForeColor="White" style="z-index: 1; left: 813px; top: 811px; position: absolute" Text="Finalize" ToolTip="Only after all the fields are completed, finalization takes place" OnClick="Button4_Click" UseSubmitBehavior="False" />

        
        
        
    </form>
   
    
        
   
   <a href="../Toolbox/Play/play" target="_self" style="position:absolute;left:699px; top:359px; width:152px; text-decoration:none; background-color: #0000FF; color: #FFFFFF; webkit-border-radius:20px; moz-border-radius:20px; border-radius:20px; right: 118px; text-align: center; height: 22px;" > Complete Later </a> 
   
            
        
   
</body>
</html>

