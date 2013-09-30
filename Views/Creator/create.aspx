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
        //connectionstring
//Session["ConnectionString"]="data source=localhost; uid=sa; password=thisgreatworld1; database=thunter";
//string myConnection = Session["ConnectionString"].ToString();
        
        
if (!Page.IsPostBack)
{
    //SqlConnection mySqlConnection;
    //SqlCommand mySqlCommand;
    //SqlDataReader mySqlDataReader;

    //mySqlConnection = new SqlConnection();
    //mySqlConnection.ConnectionString = myConnection;
        
    //mySqlCommand = new SqlCommand();
    //mySqlCommand.CommandText = "SELECT tsname FROM tspots";
    //mySqlCommand.CommandType = CommandType.Text;
    //mySqlCommand.Connection = mySqlConnection;

    //mySqlCommand.Connection.Open();
    //mySqlDataReader = mySqlCommand.ExecuteReader(CommandBehavior.CloseConnection);

    ////GridView1.DataSource = mySqlDataReader;
    ////GridView1.DataBind();

    //mySqlCommand.Dispose();
    //mySqlConnection.Dispose();
    //Microsoft.Web.Helpers.Video.Flash("http://www.youtube.com/v/XAbMQx-D7rE");
   
}  
        
    }

protected void Button4_Click(object sender, EventArgs e)
{
    //SqlDataSource1.Select();
    DataView dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
    DataTable dt = new DataTable();
    dt = dv.ToTable();

   

    //DataTable dtr = dt;
    //DataRow[] uniname = dtr.Select("tsname");
    Label1.Text = dt.Rows[0].Field<string>("tsproductid");
}

// json object or class
public class Product
{
  public string Name { get; set; }
  public string Expiry { get; set; }
  public string Price { get; set; }
   
}
//json create    
    public void parser()
    {
        
        Product product = new Product();
        product.Name = "Apple";
        product.Expiry = "2008, 12, 28";
        product.Price = "3.99";
        

        string json = Newtonsoft.Json.JsonConvert.SerializeObject(product);
        TextBox3.Text = json;
    }
//json retrieve elements
    public void deparser()
    {
        //Product product = Newtonsoft.Json.JsonConvert.DeserializeObject<Product>(TextBox3.Text);

        Newtonsoft.Json.JsonTextReader myreader = new Newtonsoft.Json.JsonTextReader(new System.IO.StringReader(TextBox3.Text));
        while (myreader.Read()) 
        {
            
                if ((string) myreader.Value == "id")
                {
                    myreader.Read();
                    TextBox1.Text = (string) myreader.Value;
                    break;
                }
            
        }
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text != "")
        {
            Label2.Visible = true;
            parser();
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        deparser();
    }
</script>


<html>
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width" />
    <title></title>
     <script type="text/javascript" src="http://code.jquery.com/jquery-2.0.0.min.js"></script> 
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
   

<script>
    var marginl = 0;
    var margint = 0;
    var checked = 0;

    var started = 0;
    var fired = 1;
    var enemyhits = 0;
    var currentl = 0;
    var currentt = 0;
    //var myaddctrl = window.setTimeout(function () { addCtrl() }, 1000);
    var userscounter = 3;
    var useridctrl = "ctrl";


    function addCtrl() {
        if (started == 0) {
            for (var x = 1; x <= userscounter; x++) {
                useridctrl = useridctrl.concat(x);

                var $ctrl = $('<img/>').attr({ id: useridctrl, src: 'Images/crosshair.png', style: 'width:33px; height:25px; position:relative; top: 307px; left: 247px; z-index: 2; right: 532px; visibility: visible; margin-left: 0px; margin-top: 0px' });
                $('#viewer').append($ctrl);
                useridctrl = "ctrl";
                //var $ctrl = $('<img/>').attr({ id: 'ctrl2', src: 'Images/crosshair.png', style: 'width:33px; height:25px; position:relative; top: 307px; left: 247px; z-index: 2; right: 532px; visibility: visible; margin-left: 0px; margin-top: 0px' });
                //$('#viewer').append($ctrl);
                //var $ctrl = $('<img/>').attr({ id: 'ctrl3', src: 'Images/explosion.gif', style: 'width:33px; height:25px; position:relative; top: 307px; left: 247px; z-index: 2; right: 532px; visibility: hidden; margin-left: 0px; margin-top: 0px' });
                //$('#viewer').append($ctrl);

                started = 1;
            }
        }
    }

    $(document).ready(function () {



        $(window).keydown(function (event) {



        })
    })
</script>

<style type="text/css">
    .twoto3d {
            
           width:412px;
height:359px;
position:relative;
animation:mymove 0.05s infinite;
-webkit-animation:mymove 0.25s infinite;
        top: 92px;
        left: 0px;
    }

@keyframes mymove
{
from {left:0px;}
to {left:2px;}
}

@-webkit-keyframes mymove /* Safari and Chrome */
{
from {left:0px;}
to {left:2px;}
}
.zoom {
    zoom:1;
}

.leftskewl {
 
  transform: -webkit-perspective( 50px ) rotateY( 25deg );
  transform: -moz-perspective( 50px ) rotateY( 25deg );
}

    .perspective3d {
    perspective:300;
-webkit-perspective:300; /* Safari and Chrome */
perspective-origin: 40% 20%;
-webkit-perspective-origin: 40% 20%; /* Safari and Chrome */
backface-visibility: hidden;
-webkit-backface-visibility: hidden;
transform-style: preserve-3d;
 -webkit-transform-style: preserve-3d;    
    }

    </style>

 
    </head>   
<body style="height: 585px; ">
    
    <form id="form1" runat="server" >
    
    <label id="treasure" style="position: absolute; top: 29px; width: 118px; left: 497px; height: 19px; color: #FFFFFF;" > </label>

         
        <div  id="viewer" class="twoto3d perspective3d" tabindex="0" style="width: 658px; height: 299px; z-index: 1; left: 0px; top: 92px; position: relative"  >
 
                    
</div>        


        
        
        <div id="toolbox" style="border: medium outset #000000; z-index: 1; left: 688px; top: 45px; position: absolute; height: 527px; width: 164px; overflow: scroll;">
    <div style="background-color: #FFFFCC; cursor: hand; overflow: scroll; z-index: 1; left: 3px; top: 38px; position: absolute; height: 62px; width: 159px; scrollbar-3dlight-color:white" id="landitems">  </div>
    <div style="background-color: #FFFFCC; cursor: hand; overflow: scroll; z-index: 1; left: 3px; top: 138px; position: absolute; height: 62px; width: 159px;" id="wateritems">  </div>
    <div style="background-color: #FFFFCC; cursor: hand; overflow: scroll; z-index: 1; left: 3px; top: 248px; position: absolute; height: 62px; width: 159px;" id="airitems">  </div>
    <div style="background-color: #FFFFCC; cursor: hand; overflow: scroll; z-index: 1; left: 3px; top: 358px; position: absolute; height: 62px; width: 159px;" id="effects">  </div>
    <div style="background-color: #FFFFCC; cursor: hand; overflow: scroll; z-index: 1; left: 3px; top: 468px; position: absolute; height: 62px; width: 159px;" id="weapons">  </div>
    <div style="background-color: #FFFFCC; cursor: hand; overflow: scroll; z-index: 1; left: 3px; top: 560px; position: absolute; height: 62px; width: 159px;" id="paths">  </div>
            
            
            <label style="position: absolute; top: 8px; width: 36px; left: 12px; height: 19px; color: #000000; " > Land<br />
            </label>
            <label style="position: absolute; top: 108px; width: 36px; left: 12px; height: 0px; color: #000000; " > Water<br />
            </label>
            <label style="position: absolute; top: 214px; width: 84px; left: 12px; height: 19px; color: #000000; right: 68px;" > Air or Space<br />
            </label>
            <label style="position: absolute; top: 324px; width: 84px; left: 12px; height: 19px; color: #000000; " > Effects<br />
            </label>
            <label style="position: absolute; top: 434px; width: 84px; left: 12px; height: 19px; color: #000000; " > Weapons<br />
            </label>
            <label style="position: absolute; top: 544px; width: 84px; left: 12px; height: 71px; color: #000000; " > Paths Obstacles others<br />
            </label>
        </div>
    
    <label style="position: absolute; top: 18px; width: 64px; left: 690px; height: 19px; color: #000000; right: 118px;" > Tool Box<br />
        </label>
       
        
        
        
        
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server" style="z-index: 1; left: 36px; top: 470px; position: absolute; height: 139px; width: 606px">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Blue" style="z-index: 1; left: 14px; top: 11px; position: absolute; right: 424px" Text="Step 1  Name your TSpot"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" style="z-index: 1; left: 200px; top: 12px; position: absolute; width: 262px; right: 136px;"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="z-index: 1; left: 485px; top: 10px; position: absolute" Text="ok" ToolTip="Click to Confirm Name" />
        <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="Green" style="z-index: 1; left: 531px; top: 13px; position: absolute; right: 6px" Text="completed" Visible="False"></asp:Label>
       

                <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="Blue" style="z-index: 1; left: 14px; top: 51px; position: absolute; right: 424px" Text="Step 2  Add a youtube video embed path"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server" style="z-index: 1; left: 200px; top: 53px; position: absolute; width: 262px; right: 136px;"></asp:TextBox>
                <asp:Button ID="Button2" runat="server"  style="z-index: 1; left: 485px; top: 53px; position: absolute" Text="ok" ToolTip="Click to Confirm path" OnClick="Button2_Click" />
                <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="Green" style="z-index: 1; left: 531px; top: 58px; position: absolute; right: 6px" Text="completed" Visible="False"></asp:Label>
                <asp:Button ID="Button3" runat="server"  style="z-index: 1; left: 15px; top: 93px; position: absolute; width: 98px; height: 24px;" Text="Show me How" ToolTip="Click to Confirm path" />



                <asp:TextBox ID="TextBox3" runat="server" style="z-index: 1; left: 482px; top: 162px; position: absolute; width: 267px; height: 69px;" TextMode="MultiLine">{&quot;data&quot;:[{&quot;id&quot;:&quot;305868849543219&quot;,&quot;user&quot;:{&quot;name&quot;:&quot;Gullipilli Bhaskar&quot;,&quot;id&quot;:&quot;100000589342864&quot;},&quot;application&quot;:{&quot;name&quot;:&quot;Treasure Hunter&quot;,&quot;namespace&quot;:&quot;gullipilli&quot;,&quot;id&quot;:&quot;123405257731200&quot;},&quot;actions&quot;:[{&quot;type&quot;:&quot;charge&quot;,&quot;status&quot;:&quot;completed&quot;,&quot;currency&quot;:&quot;USD&quot;,&quot;amount&quot;:&quot;3.00&quot;,&quot;time_created&quot;:&quot;2013-08-02T18:43:04+0000&quot;,&quot;time_updated&quot;:&quot;2013-08-02T18:43:04+0000&quot;}],&quot;refundable_amount&quot;:{&quot;currency&quot;:&quot;USD&quot;,&quot;amount&quot;:&quot;3.00&quot;},&quot;items&quot;:[{&quot;type&quot;:&quot;IN_APP_PURCHASE&quot;,&quot;product&quot;:&quot;https:\/\/treasurehunter.apphb.com\/coin.html&quot;,&quot;quantity&quot;:1}],&quot;country&quot;:&quot;US&quot;,&quot;request_id&quot;:&quot;abcd1000&quot;,&quot;created_time&quot;:&quot;2013-08-02T18:43:04+0000&quot;,&quot;test&quot;:1,&quot;fraud_status&quot;:&quot;UNKNOWN&quot;,&quot;payout_foreign_exchange_rate&quot;:1}],&quot;paging&quot;:{&quot;previous&quot;:&quot;https:\/\/graph.facebook.com\/100000589342864\/payment_transactions?request_id=abcd1000&amp;access_token=123405257731200|_AphXktFrrV_7aQ1PKX8iKqUNwA&amp;limit=1000&amp;since=1375468984&amp;__paging_token=305868849543219&amp;__previous=1&quot;,&quot;next&quot;:&quot;https:\/\/graph.facebook.com\/100000589342864\/payment_transactions?request_id=abcd1000&amp;access_token=123405257731200|_AphXktFrrV_7aQ1PKX8iKqUNwA&amp;limit=1000&amp;until=1375468984&amp;__paging_token=305868849543219&quot;}}</asp:TextBox>



                <asp:TextBox ID="TextBox4" runat="server" style="z-index: 1; left: 379px; top: 97px; position: absolute"></asp:TextBox>



            </asp:Panel>

        </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
        
       
        
        <asp:AccessDataSource id="AccessDataSource1" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT uname FROM appuserdetails WHERE (uname = 'GullipilliBhaskar')"> </asp:AccessDataSource>

        
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" style="z-index: 1; left: 579px; top: 578px; position: absolute" Text="Button" />
             
        <asp:HiddenField ID="Hiddenfield1" runat="server"></asp:HiddenField>
        
        
    </form>
   
    
        
   
</body>
</html>

