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

            Response.Redirect("~/Tspot/buy");
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

    protected void HiddenField2_ValueChanged(object sender, EventArgs e)
    {
        TextBox1.Text = "//www.youtube.com/embed/" + HiddenField2.Value + "?enablejsapi=1&wmmode=transparent&autoplay=1&start=30&end=60&loop=1&playlist=XAbMQx-D7rE&rel=0&showinfo=0&controls=0&disablekb=1";
    }
</script>


<html>
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width" />
    <title></title>
    </head>  
    
     
<body style="height: 585px; ">
    <!-- Place this asynchronous JavaScript just before your </body> tag -->
    <script type="text/javascript">
        (function () {
            var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
            po.src = 'https://apis.google.com/js/client:plusone.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
        })();
    </script>
    <span id="signinButton">
  <span
    class="g-signin"
    data-callback="signinCallback"
    data-clientid="824040232468-81jkefn5eq9dhf88uimpiqa2f2v8o1ak.apps.googleusercontent.com"
    data-cookiepolicy="single_host_origin"
    data-requestvisibleactions="http://schemas.google.com/AddActivity"
    data-scope="https://www.googleapis.com/auth/plus.login">
  </span>
</span>

    <!-- 1. The 'widget' div element will contain the upload widget.
         The 'player' div element will contain the player IFrame. -->
    <div id="widget"></div>
    <div id="player"></div>

    <script>
        // 2. Asynchronously load the Upload Widget and Player API code.
        var tag = document.createElement('script');
        tag.src = "https://www.youtube.com/iframe_api";
        var firstScriptTag = document.getElementsByTagName('script')[0];
        firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

        // 3. Define global variables for the widget and the player.
        //    The function loads the widget after the JavaScript code
        //    has downloaded and defines event handlers for callback
        //    notifications related to the widget.
        var widget;
        var player;
        function onYouTubeIframeAPIReady() {
            widget = new YT.UploadWidget('widget', {
                width: 500,
                webcamOnly: false,
                events: {
                    'onUploadSuccess': onUploadSuccess,
                    'onProcessingComplete': onProcessingComplete
                }
            });
            
        }

        // 4. This function is called when a video has been successfully uploaded.
        function onUploadSuccess(event) {
            alert('Video ID ' + event.data.videoId + ' was uploaded and is currently being processed.');
            HiddenField2.value = event.data.videoId;
            Iframe1.src = '<%=TextBox1.Text%>';
            Iframe1.style.visibility = "visible";
        }

        // 5. This function is called when a video has been successfully
        //    processed.
        function onProcessingComplete(event) {
            player = new YT.Player('player', {
                height: 390,
                width: 640,
                videoId: event.data.videoId,
                events: {}
            });
            
        }
    </script>


<script type="text/javascript"> 
    function addctrl() {
        //useridctrl = "ctrl";
        var ctrl = imager.attributes({ id: 'ctrl1', src: 'Images/fplane.gif', style: 'width:80px; height:60px; position:relative; top: 307px; left: 247px; z-index: 2; right: 532px; visibility: visible; margin-left: 0px; margin-top: 0px' });
        form1.appendChild(ctrl);
        alert("reached here");
    }

</script>

    <form id="form1" runat="server" >
    <iframe id="Iframe1"   src="//www.youtube.com/embed/XAbMQx-D7rE?enablejsapi=1&wmmode=transparent&autoplay=1&start=30&end=60&loop=1&playlist=XAbMQx-D7rE&rel=0&showinfo=0&controls=0&disablekb=1" style="z-index: 0; visibility:hidden; left: 122px; top: 422px; position: absolute; background-color: transparent; width: 623px; height: 361px;"   class="twoto3d"></iframe>
       <img alt="" id="imager" src="Images/fplane.gif" style="z-index: 1; left: 806px; top: 320px; position: absolute; height: 30px; width: 34px" /> 
       
         <asp:AccessDataSource id="AccessDataSource1" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT uname FROM appuserdetails WHERE (uname = 'GullipilliBhaskar')"> </asp:AccessDataSource>
        <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 168px; top: 387px; position: absolute; width: 40px" Text="Name"></asp:Label>
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
        
        
        <asp:HiddenField ID="HiddenField2" runat="server" OnValueChanged="HiddenField2_ValueChanged"  />
        
        
        <asp:TextBox ID="TextBox1" runat="server" style="z-index: 1; left: 228px; top: 383px; position: absolute; width: 414px; height: 24px"></asp:TextBox>
        
        
        <asp:DataList ID="DataList4" runat="server" DataSourceID="AccessDataSource5" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" ShowFooter="False" ShowHeader="False" style="z-index: 1; left: 922px; top: 29px; position: absolute; height: 125px; width: 36px">
            <ItemTemplate>
                <asp:Label ID="tbcategoryLabel" runat="server" Text='<%# Eval("tbcategory") %>' />
<br />
                <asp:ImageButton ID="ImageButton4" runat="server" Height="20px" ImageUrl='<%# Eval("tbimgurl") %>' OnClick="ImageButton4_Click" OnClientClick="addctrl(); return false;" Width="20px" />
                <br />
            </ItemTemplate>
        </asp:DataList>
        
        
        <asp:DataList ID="DataList3" runat="server" DataSourceID="AccessDataSource4" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" ShowFooter="False" ShowHeader="False" style="z-index: 1; left: 863px; top: 30px; position: absolute; height: 327px; width: 50px">
            <ItemTemplate>
                <asp:ImageButton ID="ImageButton3" runat="server"   Height="20px" ImageUrl='<%# Eval("tbimgurl") %>' OnClick="ImageButton3_Click" OnClientClick="addctrl(); return false;" Width="20px" BackColor="Transparent" ClientIDMode="Static"  ImageAlign="Middle" AlternateText='<%# Eval("tbname") %>' ToolTip='<%# Eval("tbname") %>' />
                
<br />
                
            </ItemTemplate>
        </asp:DataList>
        
        
    </form>
   
    
        
   
</body>
</html>

