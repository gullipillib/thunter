<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<!DOCTYPE html>
<script runat="server">
    

</script>
<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title></title>
</head>
<body>
    <form runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT tsapprovercomments FROM tspots WHERE (tsowner = '<%=Hiddenfield1%>')"></asp:SqlDataSource>
        
    <div>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" GridLines="None" Height="460px" ShowHeader="False" style="z-index: 1; left: 27px; top: 65px; position: absolute; height: 460px; width: 821px" Width="821px">
            <Columns>
                <asp:BoundField DataField="tsapprovercomments" HeaderText="tsapprovercomments" SortExpression="tsapprovercomments" />
            </Columns>
        </asp:GridView>
        
    </form>
   <a href="Views/Home/Play/play" target="_self" style="position:absolute;left:271px; top:23px; width:152px; text-decoration:none; background-color: #0000FF; color: #FFFFFF; webkit-border-radius:20px; moz-border-radius:20px; border-radius:20px; right: 491px; text-align: center;" > Go On a TreasureHunt </a> 
   
        
   <a href="create.aspx" target="_self" style="position:absolute;left:564px; top:17px; width:160px; text-decoration:none; background-color: #0000FF; color: #FFFFFF; webkit-border-radius:20px; moz-border-radius:20px; border-radius:20px; right: 190px; text-align: center; height: 23px;" > Go to My TreasureSpot </a> 
   
        </body>
</html>
