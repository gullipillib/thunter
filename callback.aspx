<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage"  %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<!DOCTYPE html>
<script runat="server">            
protected void Page_Load(object sender, EventArgs e)    {                       


// 1. Make sure facebook is authenticated
        //-------------------------------------------
        //CanvasAuthorizer auth = new CanvasAuthorizer { Permissions = new[] { "user_about_me" } };
        //if (auth.Authorize()) { sigreq = Request.Params["signed_request"]; }

        // 2. Grab the relevant CREDITS info from page POST form
        //------------------------------------------------------

string requestid = "no request_id"; try { requestid = Request.Form["request_id"]; }
        catch { }

string quantity = "no info"; try { quantity = Request.Form["quantity"]; }
        catch { }
        
string paymentid = "no order id"; try { paymentid = Request.Form["payment_id"]; }
        catch { }
       	
string status = "no status"; try { status = Request.Form["status"]; }
        catch { }
        
string amount = "no amount"; try { amount = Request.Form["amount"]; }
        catch { }
	
	string currency = "no currency"; try { currency = Request.Form["currency"]; }
        catch { }
	
	

// Return the response
 


        System.Web.Script.Serialization.JavaScriptSerializer jss = new System.Web.Script.Serialization.JavaScriptSerializer();                                       var content = new Dictionary<string, object>();                                       content["status"] = status;                    content["quantity"] = quantity;                    content["request_id"] = requestid;                    content["payment_id"] = "paymentid";                    content["currency"] = currency; content["amount"] = amount;	var res = new Dictionary<string, object>();                    res["content"] = content;                    var ob = 

jss.Serialize(res);                    ob = ob.Replace("#$", @"\/");                   Response.ContentType = "application/json";                   Response.Write(ob);

        if (requestid == "tspot")
        {
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

            string tsorderno = dv[0]["tsorder"].ToString();
            tsorderno = Convert.ToString(Convert.ToInt16(tsorderno) + 1);

            SqlDataSource1.InsertCommand = "INSERT INTO tspots(tscompleted,tsnew,tsprice,tsselltype,tsactive,tsapproved,tsapprover1,tsapprover2,tsapprover3,tsbid,tsbidder,tsitems,tsname,tsowner,tsproductid,tsproducturl,tsreported,tsreportcomments,tsa1status,tsa2status,tsa3status,tssell,tsreportaddress,tsbiddate,tsaward,tsrplayers,tsdplayers,tsrplayersdetails,tsdplayersdetails, tspaylater, tsbidfailed, tscoowner, tsorder) Values ('no','yes','5','buy','no','no',' ',' ',' ','no',' ',' ',' ','" + Convert.ToString(Session["loggeduser"]) + "','thppbuy','paypal','no',' ',' ',' ',' ','no',' ',' ',' ',' ',' ',' ',' ', ' ', ' ', '" + Convert.ToString(Session["loggeduser"]) + "', '" + tsorderno + "'";
            SqlDataSource1.Insert();
            Response.End();
        }
        if (requestid == "tool")
        {
            DataView dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);

            string tborderno = dv[0]["tborder"].ToString();
            tborderno = Convert.ToString(Convert.ToInt16(tborderno) + 1);

            SqlDataSource2.InsertCommand = "INSERT INTO toolbox(tbcompleted,tbnew,tbprice,tbselltype,tbactive,tbapproved,tbapprover1,tbapprover2,tbapprover3,tbbid,tbbidder,tbdetails,tbname,tbowner,tbinvoice,tbreported,tbreportcomments,tba1status,tba2status,tba3status,tbsell,tbreportaddress,tbbiddate,tbaward, tbimgurl, tbpaylater, tbbidfailed, tbcoowner, tborder) Values ('no','yes','5','buy','no','no',' ',' ',' ','no',' ',' ',' ','" + Convert.ToString(Session["loggeduser"]) + "','thtbbuy','no',' ',' ',' ',' ','no',' ',' ',' ',' ',' ',' ','" + Convert.ToString(Session["loggeduser"]) + "','" + tborderno + "'";
            SqlDataSource2.Insert();
            Response.End();
        }
        if (requestid == "prof")
        {
            DataView dv = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);

            string proforderno = dv[0]["profrequest"].ToString();
            proforderno = Convert.ToString(Convert.ToInt16(proforderno) + 1);

            SqlDataSource3.UpdateCommand = "UPDATE appuserdetails SET profrequest='yes'" + " where uname='" + Convert.ToString(Session["loggeduser"]) + "'";
            SqlDataSource3.Update();
            Response.End();
        }
        if (requestid == "life")
        {
            DataView dv = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);

            string lifeorderno = dv[0]["lifepack"].ToString();
            lifeorderno = Convert.ToString(Convert.ToInt16(lifeorderno) + 1);

            SqlDataSource3.UpdateCommand = "UPDATE appuserdetails SET lifepack='yes'" + " where uname='" + Convert.ToString(Session["loggeduser"]) + "'";
            SqlDataSource3.Update();
            Response.End();
        }
    //Response.End();                           
    }</script><html><head 

runat="server" >    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">    <meta name="viewport" 

content="width=device-width" />    <title></title></head>
  <body 

style="height: 170px">    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT uname FROM appuserdetails WHERE uname = ''"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT * FROM toolbox"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:db9cd6799a6dac4d58947ea0ba00796278ConnectionString %>" SelectCommand="SELECT profrequest, lifepack FROM appuserdetails"></asp:SqlDataSource>

</body></html>