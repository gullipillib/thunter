<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 14px; top: 110px; position: absolute" Text="Comments"></asp:Label>
        
            <asp:Label ID="Label2" runat="server" style="z-index: 1; left: 12px; top: 51px; position: absolute" Text="TreasureSpot Name"></asp:Label>
        
     
        <asp:Label ID="Label3" runat="server" style="z-index: 1; left: 16px; top: 301px; position: absolute" Text="Email"></asp:Label>
        
            
        
        <asp:TextBox ID="TextBox1" runat="server" style="z-index: 1; left: 175px; top: 52px; position: absolute; width: 621px; height: 25px;"></asp:TextBox>
        <asp:TextBox ID="TextBox2" runat="server" style="z-index: 1; left: 181px; top: 115px; position: absolute; width: 621px; height: 147px;" TextMode="MultiLine"></asp:TextBox>
         <asp:TextBox ID="TextBox3" runat="server" style="z-index: 1; left: 157px; top: 301px; position: absolute; width: 621px; height: 33px;"></asp:TextBox>   
        
        <asp:Button ID="Button1" runat="server" style="z-index: 1; left: 594px; top: 404px; position: absolute" Text="Submit" />
        
    </form>
</body>
</html>
