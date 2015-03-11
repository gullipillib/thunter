<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>
<script runat="server">

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
</script>


<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title></title>
</head>
<body style="background-color: #99CCFF">
   <form runat="server" id="form1">
       <asp:Label ID="Label1" runat="server" Text="TreasureHunter 3D Help" Font-Bold="True" Font-Size="16pt" ForeColor="#CC6600" style="z-index: 1; left: 331px; top: 24px; position: absolute"></asp:Label>

       <asp:Label ID="Label2" runat="server" Text="What is TreasureHunter 3D?" Font-Bold="True" Font-Size="12pt" ForeColor="#CC6600" style="z-index: 1; left: 16px; top: 71px; position: absolute"></asp:Label>
       <asp:TextBox ID="TextBox1" runat="server" BorderColor="Transparent" BorderStyle="None" ForeColor="#FF3300" style="z-index: 1; left: 325px; top: 53px; position: absolute; width: 479px; height: 99px" TextMode="MultiLine" BackColor="Transparent" OnTextChanged="TextBox1_TextChanged">A 3D  Multi Player Game. The main aim is to collect Gold Coins at different Treasure Spots. Attack, Interact with other players.  Many prizes in cash or other are there for collecting Coins, Conquering Treasure Spots.</asp:TextBox>
       
       <asp:Label ID="Label3" runat="server" Text="What is a Treasure Spot?" Font-Bold="True" Font-Size="12pt" ForeColor="#CC6600" style="z-index: 1; left: 14px; top: 192px; position: absolute"></asp:Label>
       <asp:TextBox ID="TextBox2" runat="server" BorderColor="Transparent" BorderStyle="None" ForeColor="#FF3300" style="z-index: 1; left: 323px; top: 167px; position: absolute; width: 479px; height: 51px" TextMode="MultiLine" BackColor="Transparent">Treasure Spot is created by other players where you will be taken to hunt for gold coins and other items.</asp:TextBox>

           <asp:Label ID="Label4" runat="server" Text="How to Create Treasure Spot?" Font-Bold="True" Font-Size="12pt" ForeColor="#CC6600" style="z-index: 1; left: 11px; top: 263px; position: absolute"></asp:Label>
       <asp:TextBox ID="TextBox3" runat="server" BorderColor="Transparent" BorderStyle="None" ForeColor="#FF3300" style="z-index: 1; left: 325px; top: 252px; position: absolute; width: 479px; height: 90px" TextMode="MultiLine" BackColor="Transparent">You can buy a Treasure Spot Creator in the Game(you can later sell it) or get a free one(the owner of that treasure spot will be TREASUREHUNTER, you can&#39;t sell or bid till you do a real purchase)</asp:TextBox>

        <asp:Label ID="Label5" runat="server" Text="Payment Methods available?" Font-Bold="True" Font-Size="12pt" ForeColor="#CC6600" style="z-index: 1; left: 17px; top: 371px; position: absolute"></asp:Label>
       <asp:TextBox ID="TextBox4" runat="server" BorderColor="Transparent" BorderStyle="None" ForeColor="#FF3300" style="z-index: 1; left: 327px; top: 359px; position: absolute; width: 479px; height: 37px" TextMode="MultiLine" BackColor="Transparent">Facebook Payments, Trial Pay(Earn Free Currency), PayPal.</asp:TextBox>

       <asp:Label ID="Label6" runat="server" Text="How much will I earn(Real Cash)?" Font-Bold="True" Font-Size="12pt" ForeColor="#CC6600" style="z-index: 1; left: 12px; top: 453px; position: absolute"></asp:Label>
       <asp:TextBox ID="TextBox5" runat="server" BorderColor="Transparent" BorderStyle="None" ForeColor="#FF3300" style="z-index: 1; left: 325px; top: 441px; position: absolute; width: 479px; height: 57px" TextMode="MultiLine" BackColor="Transparent">There is a Treasure Prize in cash, 50% of the bid amount made by other players for game items and Treasurespots</asp:TextBox>

       <asp:Label ID="Label7" runat="server" Text="Invite many Friends to have More Fun" Font-Bold="True" Font-Size="12pt" ForeColor="#6666FF" style="z-index: 1; left: 321px; top: 537px; position: absolute"></asp:Label>
       <a href="https://treasurehunter.apphb.com" target="_self" style="position: absolute; left: 52px; top: 22px; width: 152px; text-decoration: none; background-color: #0000FF; color: #FFFFFF; border-radius: 20px; right: 680px; text-align: center;">Back to Game</a>
   </form>
</body>
</html>
