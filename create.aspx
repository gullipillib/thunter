<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" EnableViewState="true" AutoEventWireup="true" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>

<!DOCTYPE html>




<script runat="server">
     
    

    public class Treasurespot
    {
        public string tsName { get; set; }
        public string tsUrl { get; set; }
        public string tsctrl1name { get; set; }
        public string tsctrl1url { get; set; }
        public string tsctrl1left { get; set; }
        public string tsctrl1top { get; set; }
        public string tsctrl1width { get; set; }
        public string tsctrl1height { get; set; }
        public string tsctrl1res { get; set; }
        public string tsctrl2name { get; set; }
        public string tsctrl2url { get; set; }
        public string tsctrl2left { get; set; }
        public string tsctrl2top { get; set; }
        public string tsctrl2width { get; set; }
        public string tsctrl2height { get; set; }
        public string tsctrl2res { get; set; }
        public string tsctrl3name { get; set; }
        public string tsctrl3url { get; set; }
        public string tsctrl3left { get; set; }
        public string tsctrl3top { get; set; }
        public string tsctrl3width { get; set; }
        public string tsctrl3height { get; set; }
        public string tsctrl3res { get; set; }
        public string tsctrl4name { get; set; }
        public string tsctrl4url { get; set; }
        public string tsctrl4left { get; set; }
        public string tsctrl4top { get; set; }
        public string tsctrl4width { get; set; }
        public string tsctrl4height { get; set; }
        public string tsctrl4res { get; set; }
        public string tsctrl5name { get; set; }
        public string tsctrl5url { get; set; }
        public string tsctrl5left { get; set; }
        public string tsctrl5top { get; set; }
        public string tsctrl5width { get; set; }
        public string tsctrl5height { get; set; }
        public string tsctrl5res { get; set; }
    }

    string Hiddenfield1;
    string HiddenField2;
    string HiddenField3;
    string HiddenField4;
    string HiddenField5;
    static int controlcounter;
    
    protected void checkusername()
    {
        Hiddenfield1 = Convert.ToString(Session["loggeduser"]);
        HiddenField4 = Convert.ToString(Session["loggeduserid"]);
        HiddenField5 = Convert.ToString(Session["loggeduserurl"]);

        Hiddenfield1 = Hiddenfield1.Replace(" ", "");
        Label26.Text = Hiddenfield1;
        
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
                AccessDataSource1.InsertCommand = "INSERT INTO loggedusers(luname, luid, luposition, luimg, luspriteimg, lucrisboos, luloggedin, lutspots, lulogintimes, luinvites) VALUES ('" + Hiddenfield1 + "', '" + HiddenField4 + "', '{left : 0, top:0}', '" + HiddenField5 + "', '" + HiddenField5 + "', '100', 'yes', '0', '0', '0')";
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

    protected void checknewcomplete()
    {
        AccessDataSource1.SelectCommand = "SELECT Top 1 * FROM tspots WHERE (tsowner = '" + Hiddenfield1 + "' and tsnew = 'yes' or tscompleted = 'no')";
        DataView dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
        DataTable dt = new DataTable();
        dt = dv.ToTable();
        //DataTable dtr = dt;
        //DataRow[] uniname = dtr.Select("uname");
        //username = dt.Rows[0].Field<string>("uname"); usethis to get field value
        //Label3.Text = dt.Rows[0][0].ToString();
        if (dt.Rows.Count == 0)
        {
            Response.Redirect("~/buy.aspx");
        }
    }

    string tempstring = "";
    Treasurespot tsitems = new Treasurespot();

    protected void Button4_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text != null && TextBox2.Text != null)
        {
            Treasurespot tsitems = new Treasurespot();
            tsitems.tsName = Label24.Text;
            tsitems.tsUrl = Label25.Text;
            tsitems.tsctrl1name = Label14.Text;
            tsitems.tsctrl1url = Label19.Text;
            tsitems.tsctrl1height = Image1.Height.ToString();
            tsitems.tsctrl1left = Image1.Style["left"];
            tsitems.tsctrl1top = Image1.Style["top"];
            tsitems.tsctrl1width = Image1.Width.ToString();
            tsitems.tsctrl1res = Label11.Style["top"];
            
            tsitems.tsctrl2name = Label15.Text;
            tsitems.tsctrl2url = Label20.Text;
            tsitems.tsctrl2height = Image2.Height.ToString();
            tsitems.tsctrl2left = Image2.Style["left"];
            tsitems.tsctrl2top = Image1.Style["top"];
            tsitems.tsctrl2width = Image2.Width.ToString();
            tsitems.tsctrl2res = Convert.ToString(Convert.ToInt16(Label11.Style["top"].ToString().Replace("px", "")) - 58 + 130) + "px";

            tsitems.tsctrl3name = Label16.Text;
            tsitems.tsctrl3url = Label21.Text;
            tsitems.tsctrl3height = Image3.Height.ToString();
            tsitems.tsctrl3left = Image3.Style["left"];
            tsitems.tsctrl3top = Image3.Style["top"];
            tsitems.tsctrl3width = Image3.Width.ToString();
            tsitems.tsctrl3res = Label11.Style["top"];

            tsitems.tsctrl4name = Label17.Text;
            tsitems.tsctrl4url = Label22.Text;
            tsitems.tsctrl4height = Image4.Height.ToString();
            tsitems.tsctrl4left = Image4.Style["left"];
            tsitems.tsctrl4top = Image4.Style["top"];
            tsitems.tsctrl4width = Image4.Width.ToString();
            tsitems.tsctrl4res = Label11.Style["top"];

            tsitems.tsctrl5name = Label18.Text;
            tsitems.tsctrl5url = Label23.Text;
            tsitems.tsctrl5height = Image5.Height.ToString();
            tsitems.tsctrl5left = Image5.Style["left"];
            tsitems.tsctrl5top = Image5.Style["top"];
            tsitems.tsctrl5width = Image5.Width.ToString();
            tsitems.tsctrl5res = Label11.Style["top"];


            string json = Newtonsoft.Json.JsonConvert.SerializeObject(tsitems);
            
            tempstring = json;
        
            AccessDataSource1.SelectCommand = "SELECT Top 1 * FROM tspots WHERE tsowner = '" + Hiddenfield1 + "' and tsnew = 'yes' or tscompleted = 'no' order by tsorder ASC";
            DataView dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
            string coownername = dv[0][30].ToString();
            string tsownername = dv[0][13].ToString();
            string tsorderno = dv[0][32].ToString();

            if (TextBox1.Text != null && TextBox2.Text != null)
            {
                    AccessDataSource1.UpdateCommand = "UPDATE tspots SET tsname = '" + TextBox1.Text + "', tsitems = '" + tempstring + "', tsnew = 'no', tscompleted = 'yes'  where tsowner='" + Label26.Text + "' and tsorder='" + tsorderno + "'";
                    AccessDataSource1.Update();
                
                Button5.Enabled = true;
                Button4.Enabled = false;
                TextBox1.Enabled = false;
                TextBox2.Enabled = false;
                GridView1.Enabled = false;
                GridView2.Enabled = false;
                GridView3.Enabled = false;
                GridView4.Enabled = false;

            }
           
        }
    }

   

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {

            checkusername();
            checknewcomplete();
            Session["controlcounter"] = "1";
            controlcounter = Convert.ToInt16(Session["controlcounter"]);
        }
        if (Page.IsPostBack == true)
        {
            
            if (DropDownList1.SelectedValue == "land")
            {

                GridView1.Enabled = true;
                GridView2.Enabled = false;
                GridView3.Enabled = false;
                GridView4.Enabled = true;
                DropDownList1.Enabled = false;
                Button11.Enabled = false;
            }
            if (DropDownList1.SelectedValue == "water")
            {

                GridView1.Enabled = false;
                GridView2.Enabled = true;
                GridView3.Enabled = false;
                GridView4.Enabled = true;
                DropDownList1.Enabled = false;
                Button11.Enabled = false;
            }
            if (DropDownList1.SelectedValue == "air or space")
            {

                GridView1.Enabled = false;
                GridView2.Enabled = false;
                GridView3.Enabled = true;
                GridView4.Enabled = true;
                DropDownList1.Enabled = false;
                Button11.Enabled = false;
            }

            if (GridView4.SelectedIndex != -1)
            {
                GridView4.Rows[GridView4.SelectedIndex].Cells[1].Focus();
            }
            if (GridView3.SelectedIndex != -1)
            {
                GridView3.Rows[GridView3.SelectedIndex].Cells[1].Focus();
            }
            if (GridView2.SelectedIndex != -1)
            {
                GridView2.Rows[GridView2.SelectedIndex].Cells[1].Focus();
            }
            if (GridView1.SelectedIndex != -1)
            {
                GridView1.Rows[GridView1.SelectedIndex].Cells[1].Focus();
            }

        }

    } //end of postback

    
    
   
    protected void Button6_Click(object sender, EventArgs e)
    {
        controlcounter = Convert.ToInt16(Session["controlcounter"]);


        if (GridView1.SelectedIndex != -1)
        {

            if (controlcounter == 1)
            {
                if (GridView4.Rows[GridView4.SelectedIndex].Cells[3].Text == "player")
                {
                    Label14.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[2].Text;
                    Image1.Visible = true;
                    Image1.ImageUrl = GridView1.Rows[GridView1.SelectedIndex].Cells[4].Text;

                }
            }
            if (controlcounter == 2)
            {
                Label15.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[2].Text;
                
                Image2.Visible = true;
                Image2.ImageUrl = GridView1.Rows[GridView1.SelectedIndex].Cells[4].Text;

            }
            if (controlcounter == 3)
            {
                Label16.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[2].Text;
                Image3.Visible = true;
                Image3.ImageUrl = GridView1.Rows[GridView1.SelectedIndex].Cells[4].Text;

            }
            if (controlcounter == 4)
            {
                Label17.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[2].Text;
                Image4.Visible = true;
                Image4.ImageUrl = GridView1.Rows[GridView1.SelectedIndex].Cells[4].Text;

            }
            if (controlcounter == 5)
            {
                Label18.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[2].Text;
                Image5.Visible = true;
                Image5.ImageUrl = GridView1.Rows[GridView1.SelectedIndex].Cells[4].Text;

            }
            
            Panel1.Enabled = true;
            Button6.Enabled = false;
            GridView1.Enabled = false;
            GridView2.Enabled = false;
            GridView3.Enabled = false;
            GridView4.Enabled = false;
            

        }

        if (GridView2.SelectedIndex != -1)
        {
            if (controlcounter == 1)
            {
                if (GridView4.Rows[GridView4.SelectedIndex].Cells[3].Text == "player")
                {
                    Label14.Text = GridView2.Rows[GridView2.SelectedIndex].Cells[2].Text;
                    Image1.Visible = true;
                    Image1.ImageUrl = GridView2.Rows[GridView2.SelectedIndex].Cells[4].Text;

                }
            }
            if (controlcounter == 2)
            {
                Label15.Text = GridView2.Rows[GridView2.SelectedIndex].Cells[2].Text;
                Image2.Visible = true;
                Image2.ImageUrl = GridView2.Rows[GridView2.SelectedIndex].Cells[4].Text;

            }
            if (controlcounter == 3)
            {
                Label16.Text = GridView2.Rows[GridView2.SelectedIndex].Cells[2].Text;
                Image3.Visible = true;
                Image3.ImageUrl = GridView2.Rows[GridView2.SelectedIndex].Cells[4].Text;

            }
            if (controlcounter == 4)
            {
                Label17.Text = GridView2.Rows[GridView2.SelectedIndex].Cells[2].Text;
                Image4.Visible = true;
                Image4.ImageUrl = GridView2.Rows[GridView2.SelectedIndex].Cells[4].Text;

            }
            if (controlcounter == 5)
            {
                Label18.Text = GridView2.Rows[GridView2.SelectedIndex].Cells[2].Text;
                Image5.Visible = true;
                Image5.ImageUrl = GridView2.Rows[GridView2.SelectedIndex].Cells[4].Text;

            }
            
            Panel1.Enabled = true;
            Button6.Enabled = false;
            GridView1.Enabled = false;
            GridView2.Enabled = false;
            GridView3.Enabled = false;
            GridView4.Enabled = false;
            
        }
        if (GridView3.SelectedIndex != -1)
        {

            if (controlcounter == 1)
            {
                if (GridView4.Rows[GridView4.SelectedIndex].Cells[3].Text == "player")
                {
                    Label14.Text = GridView3.Rows[GridView3.SelectedIndex].Cells[2].Text;
                    Image1.Visible = true;
                    Image1.ImageUrl = GridView3.Rows[GridView3.SelectedIndex].Cells[4].Text;

                }
            }
            if (controlcounter == 2)
            {
                Label15.Text = GridView3.Rows[GridView3.SelectedIndex].Cells[2].Text;
                Image2.Visible = true;
                Image2.ImageUrl = GridView3.Rows[GridView3.SelectedIndex].Cells[4].Text;

            }
            if (controlcounter == 3)
            {
                Label16.Text = GridView3.Rows[GridView3.SelectedIndex].Cells[2].Text;
                Image3.Visible = true;
                Image3.ImageUrl = GridView3.Rows[GridView3.SelectedIndex].Cells[4].Text;

            }
            if (controlcounter == 4)
            {
                Label17.Text = GridView3.Rows[GridView3.SelectedIndex].Cells[2].Text;
                Image4.Visible = true;
                Image4.ImageUrl = GridView3.Rows[GridView3.SelectedIndex].Cells[4].Text;

            }
            if (controlcounter == 5)
            {
                Label18.Text = GridView3.Rows[GridView3.SelectedIndex].Cells[2].Text;
                Image5.Visible = true;
                Image5.ImageUrl = GridView3.Rows[GridView3.SelectedIndex].Cells[4].Text;

            }
            
            Panel1.Enabled = true;
            Button6.Enabled = false;
            GridView1.Enabled = false;
            GridView2.Enabled = false;
            GridView3.Enabled = false;
            GridView4.Enabled = false;
           
        }
        if (GridView4.SelectedIndex != -1)
        {

            if (controlcounter == 1)
            {
                if (GridView4.Rows[GridView4.SelectedIndex].Cells[3].Text == "player")
                {
                    Label14.Text = GridView4.Rows[GridView4.SelectedIndex].Cells[2].Text;
                    Image1.Visible = true;
                    Image1.ImageUrl = GridView4.Rows[GridView4.SelectedIndex].Cells[4].Text;

                }
            }
            if (controlcounter == 2)
            {
                Label15.Text = GridView4.Rows[GridView4.SelectedIndex].Cells[2].Text;
                Image2.Visible = true;
                Image2.ImageUrl = GridView4.Rows[GridView4.SelectedIndex].Cells[4].Text;

            }
            if (controlcounter == 3)
            {
                Label16.Text = GridView4.Rows[GridView4.SelectedIndex].Cells[2].Text;
                Image3.Visible = true;
                Image3.ImageUrl = GridView4.Rows[GridView4.SelectedIndex].Cells[4].Text;

            }
            if (controlcounter == 4)
            {
                Label17.Text = GridView4.Rows[GridView4.SelectedIndex].Cells[2].Text;
                Image4.Visible = true;
                Image4.ImageUrl = GridView4.Rows[GridView4.SelectedIndex].Cells[4].Text;

            }
            if (controlcounter == 5)
            {
                Label18.Text = GridView4.Rows[GridView4.SelectedIndex].Cells[2].Text;
                Image5.Visible = true;
                Image5.ImageUrl = GridView4.Rows[GridView4.SelectedIndex].Cells[4].Text;

            }
            
            Panel1.Enabled = true;
            Button6.Enabled = false;
            GridView1.Enabled = false;
            GridView2.Enabled = false;
            GridView3.Enabled = false;
            GridView4.Enabled = false;
           
        }
    }



    protected void Button11_Click(object sender, EventArgs e)
    {
        Session["dropselection"] = DropDownList1.SelectedValue;
        if (Convert.ToString(Session["dropselection"]) == "land")
        {
            DropDownList1.SelectedValue = Convert.ToString(Session["dropselection"]);
            GridView1.Enabled = true;
            GridView2.Enabled = false;
            GridView3.Enabled = false;
            GridView4.Enabled = true;
            //DropDownList1.Enabled = false;
        }
        if (Convert.ToString(Session["dropselection"]) == "water")
        {
            DropDownList1.SelectedValue = Convert.ToString(Session["dropselection"]);
            GridView1.Enabled = false;
            GridView2.Enabled = true;
            GridView3.Enabled = false;
            GridView4.Enabled = true;
            //DropDownList1.Enabled = false;
        }
        if (Convert.ToString(Session["dropselection"]) == "air or space")
        {
            DropDownList1.SelectedValue = Convert.ToString(Session["dropselection"]);
            GridView1.Enabled = false;
            GridView2.Enabled = false;
            GridView3.Enabled = true;
            GridView4.Enabled = true;
            //DropDownList1.Enabled = false;
        }
        Button11.Enabled = false;
    }

    string temp2;
    protected void GridView4_SelectedIndexChanged1(object sender, EventArgs e)
    {
        
        
        if (GridView4.Rows[GridView4.SelectedIndex].Cells[5].Text.Contains("\\&quot;"))
        {
            temp2 = GridView4.Rows[GridView4.SelectedIndex].Cells[5].Text.Replace("\\&quot;", "\"");
            temp2 = temp2.Replace("&quot;", "");
            temp2 = temp2.Trim();
            
            
        }
        else if (GridView4.Rows[GridView4.SelectedIndex].Cells[5].Text.Contains("&quot;"))
        {
            temp2 = GridView4.Rows[GridView4.SelectedIndex].Cells[5].Text.Replace("&quot;", "\"");
        }
        
        
       
        dynamic mytbdetails = Json.Decode(temp2);

        Label10.Text = mytbdetails.tbSubCategory;
        Image6.ImageUrl = mytbdetails.tbCollionResult;
        Button6.Enabled = true;
        GridView3.SelectedIndex = -1;
        GridView2.SelectedIndex = -1;
        GridView1.SelectedIndex = -1;
    }

    protected void GridView3_SelectedIndexChanged1(object sender, EventArgs e)
    {

        if (GridView3.Rows[GridView3.SelectedIndex].Cells[5].Text.Contains("\\&quot;"))
        {
            temp2 = GridView3.Rows[GridView3.SelectedIndex].Cells[5].Text.Replace("\\&quot;", "\"");
            temp2 = temp2.Replace("&quot;", "");
            temp2 = temp2.Trim();


        }
        else if (GridView3.Rows[GridView3.SelectedIndex].Cells[5].Text.Contains("&quot;"))
        {
            temp2 = GridView3.Rows[GridView3.SelectedIndex].Cells[5].Text.Replace("&quot;", "\"");
        }



        dynamic mytbdetails = Json.Decode(temp2);

        Label10.Text = mytbdetails.tbSubCategory;
        Image6.ImageUrl = mytbdetails.tbCollionResult;
        Button6.Enabled = true;
        GridView3.SelectedIndex = -1;
        GridView2.SelectedIndex = -1;
        GridView1.SelectedIndex = -1;
    }

    protected void GridView2_SelectedIndexChanged1(object sender, EventArgs e)
    {
        if (GridView2.Rows[GridView2.SelectedIndex].Cells[5].Text.Contains("\\&quot;"))
        {
            temp2 = GridView2.Rows[GridView2.SelectedIndex].Cells[5].Text.Replace("\\&quot;", "\"");
            temp2 = temp2.Replace("&quot;", "");
            temp2 = temp2.Trim();


        }
        else if (GridView2.Rows[GridView2.SelectedIndex].Cells[5].Text.Contains("&quot;"))
        {
            temp2 = GridView2.Rows[GridView2.SelectedIndex].Cells[5].Text.Replace("&quot;", "\"");
        }



        dynamic mytbdetails = Json.Decode(temp2);

        Label10.Text = mytbdetails.tbSubCategory;
        Image6.ImageUrl = mytbdetails.tbCollionResult;
        Button6.Enabled = true;
        GridView3.SelectedIndex = -1;
        GridView4.SelectedIndex = -1;
        GridView1.SelectedIndex = -1;
    }

    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        if (GridView1.Rows[GridView1.SelectedIndex].Cells[5].Text.Contains("\\&quot;"))
        {
            temp2 = GridView1.Rows[GridView1.SelectedIndex].Cells[5].Text.Replace("\\&quot;", "\"");
            temp2 = temp2.Replace("&quot;", "");
            temp2 = temp2.Trim();


        }
        else if (GridView1.Rows[GridView1.SelectedIndex].Cells[5].Text.Contains("&quot;"))
        {
            temp2 = GridView1.Rows[GridView1.SelectedIndex].Cells[5].Text.Replace("&quot;", "\"");
        }



        dynamic mytbdetails = Json.Decode(temp2);

        Label10.Text = mytbdetails.tbSubCategory;
        Image6.ImageUrl = mytbdetails.tbCollionResult;
        Button6.Enabled = true;
        GridView3.SelectedIndex = -1;
        GridView2.SelectedIndex = -1;
        GridView4.SelectedIndex = -1;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (controlcounter == 1)
        {
            controlcounter = Convert.ToInt16(Session["controlcounter"]);
            Panel1.Enabled = false;
            controlcounter = controlcounter + 1;
            Session["controlcounter"] = Convert.ToString(controlcounter);
            Label19.Text = Label11.Style["top"].ToString();
            
        }
        else if (controlcounter == 2)
        {
            controlcounter = Convert.ToInt16(Session["controlcounter"]);
            Panel1.Enabled = false;
            controlcounter = controlcounter + 1;
            Session["controlcounter"] = Convert.ToString(controlcounter);
            Label20.Text = Label11.Style["top"].ToString();
        }
        else if (controlcounter == 3)
        {
            controlcounter = Convert.ToInt16(Session["controlcounter"]);
            Panel1.Enabled = false;
            controlcounter = controlcounter + 1;
            Session["controlcounter"] = Convert.ToString(controlcounter);
            Label21.Text = Label11.Style["top"].ToString();
        }
        else if (controlcounter == 4)
        {
            controlcounter = Convert.ToInt16(Session["controlcounter"]);
            Panel1.Enabled = false;
            controlcounter = controlcounter + 1;
            Session["controlcounter"] = Convert.ToString(controlcounter);
            Label22.Text = Label11.Style["top"].ToString();
        }
        else if (controlcounter == 5)
        {
            controlcounter = Convert.ToInt16(Session["controlcounter"]);
            Panel1.Enabled = false;
            controlcounter = controlcounter + 1;
            Session["controlcounter"] = Convert.ToString(controlcounter);
            Label23.Text = Label11.Style["top"].ToString();
        }
        GridView1.Enabled = true;
        GridView2.Enabled = true;
        GridView3.Enabled = true;
        GridView4.Enabled = true;
        if (controlcounter > 5)
        {
            Button6.Enabled = false;
            Panel1.Enabled = false;
            Button4.Enabled = true;
            GridView1.Enabled = false;
            GridView2.Enabled = false;
            GridView3.Enabled = false;
            GridView4.Enabled = false;
        }
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        controlcounter = Convert.ToInt16(Session["controlcounter"]);
        if (controlcounter == 1)
        {
            if (Convert.ToInt16(Image1.Style["top"].Replace("px", "")) > Convert.ToInt16(Label11.Style["top"].Replace("px", "")) && Convert.ToInt16(Image1.Style["top"].Replace("px", "")) < 419)
            {
                Image1.Style["top"] = Convert.ToString(Convert.ToInt16(Image1.Style["top"].Replace("px", "")) - 20) + "px";
            }
        }
        if (controlcounter == 2)
        {
            if (Convert.ToInt16(Image2.Style["top"].Replace("px", "")) > Convert.ToInt16(Label11.Style["top"].Replace("px", "")) && Convert.ToInt16(Image1.Style["top"].Replace("px", "")) < 419)
            {
                Image2.Style["top"] = Convert.ToString(Convert.ToInt16(Image2.Style["top"].Replace("px", "")) - 20) + "px";
            }
        }
        if (controlcounter == 3)
        {
            if (Convert.ToInt16(Image3.Style["top"].Replace("px", "")) > Convert.ToInt16(Label11.Style["top"].Replace("px", "")) && Convert.ToInt16(Image1.Style["top"].Replace("px", "")) < 419)
            {
                Image3.Style["top"] = Convert.ToString(Convert.ToInt16(Image3.Style["top"].Replace("px", "")) - 20) + "px";
            }
        }
        if (controlcounter == 4)
        {
            if (Convert.ToInt16(Image4.Style["top"].Replace("px", "")) > Convert.ToInt16(Label11.Style["top"].Replace("px", "")) && Convert.ToInt16(Image1.Style["top"].Replace("px", "")) < 419)
            {
                Image4.Style["top"] = Convert.ToString(Convert.ToInt16(Image4.Style["top"].Replace("px", "")) - 20) + "px";
            }
        }
        if (controlcounter == 5)
        {
            if (Convert.ToInt16(Image5.Style["top"].Replace("px", "")) > Convert.ToInt16(Label11.Style["top"].Replace("px", "")) && Convert.ToInt16(Image1.Style["top"].Replace("px", "")) < 419)
            {
                Image5.Style["top"] = Convert.ToString(Convert.ToInt16(Image5.Style["top"].Replace("px", "")) - 20) + "px";
            }
        }
        GridView1.Enabled = false;
        GridView2.Enabled = false;
        GridView3.Enabled = false;
        GridView4.Enabled = false;  
    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        controlcounter = Convert.ToInt16(Session["controlcounter"]);
        if (controlcounter == 1)
        {
            if (Convert.ToInt16(Image1.Style["top"].Replace("px", "")) > Convert.ToInt16(Label11.Style["top"].Replace("px", "")) && Convert.ToInt16(Image1.Style["top"].Replace("px", "")) < 419)
            {
                Image1.Style["top"] = Convert.ToString(Convert.ToInt16(Image1.Style["top"].Replace("px", "")) + 20) + "px";
            }
        }
        if (controlcounter == 2)
        {
            if (Convert.ToInt16(Image2.Style["top"].Replace("px", "")) > Convert.ToInt16(Label11.Style["top"].Replace("px", "")) && Convert.ToInt16(Image1.Style["top"].Replace("px", "")) < 419)
            {
                Image2.Style["top"] = Convert.ToString(Convert.ToInt16(Image2.Style["top"].Replace("px", "")) + 20) + "px";
            }
        }
        if (controlcounter == 3)
        {
            if (Convert.ToInt16(Image3.Style["top"].Replace("px", "")) > Convert.ToInt16(Label11.Style["top"].Replace("px", "")) && Convert.ToInt16(Image1.Style["top"].Replace("px", "")) < 419)
            {
                Image3.Style["top"] = Convert.ToString(Convert.ToInt16(Image3.Style["top"].Replace("px", "")) + 20) + "px";
            }
        }
        if (controlcounter == 4)
        {
            if (Convert.ToInt16(Image4.Style["top"].Replace("px", "")) > Convert.ToInt16(Label11.Style["top"].Replace("px", "")) && Convert.ToInt16(Image1.Style["top"].Replace("px", "")) < 419)
            {
                Image4.Style["top"] = Convert.ToString(Convert.ToInt16(Image4.Style["top"].Replace("px", "")) + 20) + "px";
            }
        }
        if (controlcounter == 5)
        {
            if (Convert.ToInt16(Image5.Style["top"].Replace("px", "")) > Convert.ToInt16(Label11.Style["top"].Replace("px", "")) && Convert.ToInt16(Image1.Style["top"].Replace("px", "")) < 419)
            {
                Image5.Style["top"] = Convert.ToString(Convert.ToInt16(Image5.Style["top"].Replace("px", "")) + 20) + "px";
            }
        }
        GridView1.Enabled = false;
        GridView2.Enabled = false;
        GridView3.Enabled = false;
        GridView4.Enabled = false;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        controlcounter = Convert.ToInt16(Session["controlcounter"]);
        if (controlcounter == 1)
        {
            if (Convert.ToInt16(Image1.Style["left"].Replace("px", "")) > 7 && Convert.ToInt16(Image1.Style["left"].Replace("px", "")) < 625)
            {
                Image1.Style["left"] = Convert.ToString(Convert.ToInt16(Image1.Style["left"].Replace("px", "")) - 20) + "px";
            }
        }
        if (controlcounter == 2)
        {
            if (Convert.ToInt16(Image2.Style["left"].Replace("px", "")) > 7 && Convert.ToInt16(Image1.Style["left"].Replace("px", "")) < 625)
            {
                Image2.Style["left"] = Convert.ToString(Convert.ToInt16(Image2.Style["left"].Replace("px", "")) - 20) + "px";
            }
        }
        if (controlcounter == 3)
        {
            if (Convert.ToInt16(Image3.Style["left"].Replace("px", "")) > 7 && Convert.ToInt16(Image1.Style["left"].Replace("px", "")) < 625)
            {
                Image3.Style["left"] = Convert.ToString(Convert.ToInt16(Image3.Style["left"].Replace("px", "")) - 20) + "px";
            }
        }
        if (controlcounter == 4)
        {
            if (Convert.ToInt16(Image4.Style["left"].Replace("px", "")) > 7 && Convert.ToInt16(Image1.Style["left"].Replace("px", "")) < 625)
            {
                Image4.Style["left"] = Convert.ToString(Convert.ToInt16(Image4.Style["left"].Replace("px", "")) - 20) + "px";
            }
        }
        if (controlcounter == 5)
        {
            if (Convert.ToInt16(Image5.Style["left"].Replace("px", "")) > 7 && Convert.ToInt16(Image1.Style["left"].Replace("px", "")) < 625)
            {
                Image5.Style["left"] = Convert.ToString(Convert.ToInt16(Image5.Style["left"].Replace("px", "")) - 20) + "px";
            }
        }
        GridView1.Enabled = false;
        GridView2.Enabled = false;
        GridView3.Enabled = false;
        GridView4.Enabled = false;
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        controlcounter = Convert.ToInt16(Session["controlcounter"]);
        if (controlcounter == 1)
        {
            if (Convert.ToInt16(Image1.Style["left"].Replace("px", "")) > 7 && Convert.ToInt16(Image1.Style["left"].Replace("px", "")) < 625)
            {
                Image1.Style["left"] = Convert.ToString(Convert.ToInt16(Image1.Style["left"].Replace("px", "")) + 20) + "px";
            }
        }
        if (controlcounter == 2)
        {
            if (Convert.ToInt16(Image2.Style["left"].Replace("px", "")) > 7 && Convert.ToInt16(Image1.Style["left"].Replace("px", "")) < 625)
            {
                Image2.Style["left"] = Convert.ToString(Convert.ToInt16(Image2.Style["left"].Replace("px", "")) + 20) + "px";
            }
        }
        if (controlcounter == 3)
        {
            if (Convert.ToInt16(Image3.Style["left"].Replace("px", "")) > 7 && Convert.ToInt16(Image1.Style["left"].Replace("px", "")) < 625)
            {
                Image3.Style["left"] = Convert.ToString(Convert.ToInt16(Image3.Style["left"].Replace("px", "")) + 20) + "px";
            }
        }
        if (controlcounter == 4)
        {
            if (Convert.ToInt16(Image4.Style["left"].Replace("px", "")) > 7 && Convert.ToInt16(Image1.Style["left"].Replace("px", "")) < 625)
            {
                Image4.Style["left"] = Convert.ToString(Convert.ToInt16(Image4.Style["left"].Replace("px", "")) + 20) + "px";
            }
        }
        if (controlcounter == 5)
        {
            if (Convert.ToInt16(Image5.Style["left"].Replace("px", "")) > 7 && Convert.ToInt16(Image1.Style["left"].Replace("px", "")) < 625)
            {
                Image5.Style["left"] = Convert.ToString(Convert.ToInt16(Image5.Style["left"].Replace("px", "")) + 20) + "px";
            }
        }
        GridView1.Enabled = false;
        GridView2.Enabled = false;
        GridView3.Enabled = false;
        GridView4.Enabled = false;
    }

    protected void Button10_Click(object sender, EventArgs e)
    {
        controlcounter = Convert.ToInt16(Session["controlcounter"]);
        if (controlcounter == 1)
        {
            if (Image1.Height.Value < 91 && Image1.Height.Value > 19)
            {
                Image1.Style["Height"] = Image1.Height.Value - 10 + "px";
                Image1.Style["Width"] = Image1.Width.Value - 10 + "px";

            }
        }
        if (controlcounter == 2)
        {
            if (Image2.Height.Value < 91 && Image2.Height.Value > 19)
            {
                Image2.Style["Height"] = Image2.Height.Value - 10 + "px";
                Image2.Style["Width"] = Image2.Width.Value - 10 + "px";

            }
        }
        if (controlcounter == 3)
        {
            if (Image3.Height.Value < 91 && Image3.Height.Value > 19)
            {
                Image3.Style["Height"] = Image3.Height.Value - 10 + "px";
                Image3.Style["Width"] = Image3.Width.Value - 10 + "px";

            }
        }
        if (controlcounter == 4)
        {
            if (Image4.Height.Value < 91 && Image4.Height.Value > 19)
            {
                Image4.Style["Height"] = Image4.Height.Value - 10 + "px";
                Image4.Style["Width"] = Image4.Width.Value - 10 + "px";

            }
        }
        if (controlcounter == 5)
        {
            if (Image5.Height.Value < 91 && Image5.Height.Value > 19)
            {
                Image5.Style["Height"] = Image5.Height.Value - 10 + "px";
                Image5.Style["Width"] = Image5.Width.Value - 10 + "px";

            }
        }
        GridView1.Enabled = false;
        GridView2.Enabled = false;
        GridView3.Enabled = false;
        GridView4.Enabled = false;  
    }

    protected void Button9_Click(object sender, EventArgs e)
    {
        controlcounter = Convert.ToInt16(Session["controlcounter"]);
        if (controlcounter == 1)
        {
            if (Image1.Height.Value < 91 && Image1.Height.Value > 19)
            {
                Image1.Style["Height"] = Image1.Height.Value + 10 + "px";
                Image1.Style["Width"] = Image1.Width.Value + 10 + "px";

            }
        }
        if (controlcounter == 2)
        {
            if (Image2.Height.Value < 91 && Image2.Height.Value > 19)
            {
                Image2.Style["Height"] = Image2.Height.Value + 10 + "px";
                Image2.Style["Width"] = Image2.Width.Value + 10 + "px";

            }
        }
        if (controlcounter == 3)
        {
            if (Image3.Height.Value < 91 && Image3.Height.Value > 19)
            {
                Image3.Style["Height"] = Image3.Height.Value + 10 + "px";
                Image3.Style["Width"] = Image3.Width.Value + 10 + "px";

            }
        }
        if (controlcounter == 4)
        {
            if (Image4.Height.Value < 91 && Image4.Height.Value > 19)
            {
                Image4.Style["Height"] = Image4.Height.Value + 10 + "px";
                Image4.Style["Width"] = Image4.Width.Value + 10 + "px";

            }
        }
        if (controlcounter == 5)
        {
            if (Image5.Height.Value < 91 && Image5.Height.Value > 19)
            {
                Image5.Style["Height"] = Image5.Height.Value + 10 + "px";
                Image5.Style["Width"] = Image5.Width.Value + 10 + "px";

            }
        }
        GridView1.Enabled = false;
        GridView2.Enabled = false;
        GridView3.Enabled = false;
        GridView4.Enabled = false;  
    }

    protected void Button12_Click(object sender, EventArgs e)
    {
        controlcounter = Convert.ToInt16(Session["controlcounter"]);
        Label11.Style["top"] = Convert.ToString(Convert.ToInt16(Label11.Style["top"].Replace("px", "")) - 8) + "px";
        
        GridView1.Enabled = false;
        GridView2.Enabled = false;
        GridView3.Enabled = false;
        GridView4.Enabled = false;  
    }

    protected void Button13_Click(object sender, EventArgs e)
    {
        controlcounter = Convert.ToInt16(Session["controlcounter"]);
        Label11.Style["top"] = Convert.ToString(Convert.ToInt16(Label11.Style["top"].Replace("px", "")) + 8) + "px";

        GridView1.Enabled = false;
        GridView2.Enabled = false;
        GridView3.Enabled = false;
        GridView4.Enabled = false;  
    }

    protected void TextBox1_TextChanged1(object sender, EventArgs e)
    {
        if (TextBox1.Text.Length < 50)
        {
            AccessDataSource1.SelectCommand = "SELECT * FROM tspots WHERE (tsname = '" + TextBox1.Text + "')";

            DataView dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();

            //if (dt.Rows.Count == 0)
            //{
            //    TextBox1.Text = "";
            //}

            Label24.Text = TextBox1.Text.Replace(" ", "");
        }
        if (TextBox1.Text.Length >= 50)
        {
            TextBox1.Text = null;
        }
    }

    protected void TextBox2_TextChanged1(object sender, EventArgs e)
    {
        if (TextBox2.Text.Contains("https://googledrive.com/host/0B2sEBRwlC-jMeGdJSWZxVUNQRGs/"))
        {
        }
        else
        {
            TextBox2.Text = "";
        }
        Label25.Text = TextBox2.Text.Replace(" ", "");
    }
</script>


<html>
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>Create Treasure Spot</title>
    
</head>


<body style="height: 585px; background-color:transparent">
    <a href="Play/play" target="_self" style="position: absolute; left: 540px; top: 53px; width: 152px; text-decoration: none; background-color: #0000FF; color: #FFFFFF; webkit-border-radius: 20px; moz-border-radius: 20px; border-radius: 20px; right: 221px; text-align: center; height: 22px;">Complete Later </a>
    <a href="Play/play" target="_self" style="position: absolute; left: 542px; top: 85px; width: 152px; text-decoration: none; background-color: #0000FF; color: #FFFFFF; webkit-border-radius: 20px; moz-border-radius: 20px; border-radius: 20px; right: 219px; text-align: center; height: 22px;">Approver Comments </a>
    
    <div id="divplayer" style="z-index: 0; background-color: transparent; overflow: hidden; position:absolute; top: 38px; left: 6px; width: 476px; height: 394px;">
    <img alt="Images" src='<%=TextBox2.Text%>' style="z-index:21; position:absolute; left: 0px; top: 0px; background-color: transparent; width: 476px; height: 394px;" class="twoto3d"  id="Iframe1" />
        <asp:Image ID="Image1" runat="server" BorderStyle="Solid" Style="z-index: 200; left: 250px; top: 345px; position: absolute" ClientIDMode="Static" Height="20px" Width="20px" />
        <asp:Image ID="Image2" runat="server" BorderStyle="Solid" Style="z-index: 200; left: 240px; top: 345px; position: absolute; right: 654px;" ClientIDMode="Static" Height="20px" Width="20px" />
        <asp:Image ID="Image3" runat="server" BorderStyle="Solid" Style="z-index: 200; left: 132px; top: 315px; position: absolute" ClientIDMode="Static" Height="20px" Width="20px" />
        <asp:Image ID="Image4" runat="server" BorderStyle="Solid" Style="z-index: 200; left: 412px; top: 295px; position: absolute; height: 16px;" ClientIDMode="Static" Height="20px" Width="20px" />
        <asp:Image ID="Image5" runat="server" BorderStyle="Solid" Style="z-index: 200; left: 251px; top: 175px; position: absolute" ClientIDMode="Static" Height="20px" Width="20px" />
        
    </div>  
   
    <iframe id="iframe2" style="position:absolute; top: 639px; left: 10px; width: 895px; height: 353px;" src="googlepickerlatest2.html"></iframe>
 
   
    <form id="form1" runat="server">
        

        <asp:AccessDataSource ID="AccessDataSource1" DataFile="~/Views/Datab/th.mdb" runat="server" SelectCommand="SELECT uname FROM appuserdetails WHERE (uname = '<%=Hiddenfield1%>')" UpdateCommand="UPDATE tspots SET tscompleted = '[no]'"></asp:AccessDataSource>
        <asp:CheckBox ID="CheckBox3" runat="server" Checked="True" Enabled="False" ForeColor="Red" style="z-index: 1; left: 356px; top: 3px; position: absolute" Text="I Agree to the terms and conditions of treasurehunter" />
        <asp:Label ID="Label1" runat="server" Style="z-index: 1; left: 525px; top: 121px; position: absolute; width: 41px; height: 20px;" Text="Name" Font-Bold="True" ForeColor="Blue"></asp:Label>
        <asp:Label ID="Label7" runat="server" Style="z-index: 1; left: 15px; top: 474px; position: absolute; width: 68px; height: 20px;" Text="Video Url" Font-Bold="True" ForeColor="Blue"></asp:Label>
        <asp:AccessDataSource ID="AccessDataSource2" DataFile="~/Views/Datab/th.mdb" runat="server" SelectCommand="SELECT tbname, tbcategory, tbtoolscategory, tbactive, tbdetails, tbimgurl FROM toolbox WHERE (tbactive = 'yes') and (tbcategory = 'land')"></asp:AccessDataSource>

        <asp:AccessDataSource ID="AccessDataSource3" DataFile="~/Views/Datab/th.mdb" runat="server" SelectCommand="SELECT tbname, tbtoolscategory,  tbcategory, tbactive, tbdetails, tbimgurl FROM toolbox WHERE (tbactive = 'yes') and (tbcategory = 'water')"></asp:AccessDataSource>
            
           
    <a href="creatorhelp.aspx" target="_self" style="position: absolute; left: 504px; top: 487px; width: 86px; text-decoration: none; background-color: #0000FF; color: #FFFFFF; webkit-border-radius: 20px; moz-border-radius: 20px; border-radius: 20px; right: 324px; text-align: center; height: 22px;">Help </a>
            
           
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/toc.aspx" style="z-index: 1; left: 567px; top: 26px; position: absolute" Target="_blank">Terms and Conditions</asp:HyperLink>
        <asp:Button ID="Button11" runat="server" Style="z-index: 1; left: 297px; top: 5px; position: absolute; cursor:pointer;" Text="Select" OnClick="Button11_Click" UseSubmitBehavior="False" BackColor="#99CCFF" ForeColor="Maroon" />
        <asp:AccessDataSource ID="AccessDataSource4" DataFile="~/Views/Datab/th.mdb" runat="server" SelectCommand="SELECT tbname, tbcategory, tbtoolscategory, tbactive, tbdetails, tbimgurl FROM toolbox WHERE (tbactive = 'yes') and (tbcategory = 'air or space')"></asp:AccessDataSource>
        <asp:Label ID="Label13" runat="server" style="z-index: 1; left: 13px; top: 16px; position: absolute; height:14px; width: 67px; right: 834px;" Text="Game Category" Font-Size="7pt" Font-Bold="True" ForeColor="Blue"></asp:Label>
        <asp:Label ID="Label14" runat="server" style="z-index: 1; left: 644px; top: 244px; position: absolute; height:14px; width: 59px; right: 211px;" Text="" Font-Size="7pt" Font-Bold="True" ForeColor="Blue"></asp:Label>
        <asp:Label ID="Label15" runat="server" style="z-index: 1; left: 646px; top: 264px; position: absolute; height:11px; width: 56px; right: 212px;" Text="" Font-Size="7pt" Font-Bold="True" ForeColor="Blue"></asp:Label>
        <asp:Label ID="Label16" runat="server" style="z-index: 1; left:  644px; top: 286px; position: absolute; height:14px; width: 58px; right: 212px;" Text="" Font-Size="7pt" Font-Bold="True" ForeColor="Blue"></asp:Label>
        <asp:Label ID="Label17" runat="server" style="z-index: 1; left:  641px; top: 306px; position: absolute; height:11px; width: 60px; right: 213px;" Text="" Font-Size="7pt" Font-Bold="True" ForeColor="Blue"></asp:Label>
        <asp:Label ID="Label18" runat="server" style="z-index: 1; left:  643px; top: 325px; position: absolute; height:14px; width: 61px; right: 210px;" Text="" Font-Size="7pt" Font-Bold="True" ForeColor="Blue"></asp:Label>
        <asp:Label ID="Label19" runat="server" style="z-index: 1; left:  719px; top: 246px; position: absolute; height:14px; width: 40px; right: 155px;" Text="" Font-Size="7pt" Font-Bold="True" ForeColor="Blue"></asp:Label>
        <asp:Label ID="Label20" runat="server" style="z-index: 1; left:  718px; top: 265px; position: absolute; height:14px; width: 38px; right: 158px;" Text="" Font-Size="7pt" Font-Bold="True" ForeColor="Blue"></asp:Label>
        <asp:Label ID="Label21" runat="server" style="z-index: 1; left:  719px; top: 285px; position: absolute; height:14px; width: 37px; right: 158px;" Text="" Font-Size="7pt" Font-Bold="True" ForeColor="Blue"></asp:Label>
        <asp:Label ID="Label22" runat="server" style="z-index: 1; left: 716px; top: 307px; position: absolute; height:14px; width: 32px; right: 166px;" Text="" Font-Size="7pt" Font-Bold="True" ForeColor="Blue"></asp:Label>
        <asp:Label ID="Label23" runat="server" style="z-index: 1; left:  719px; top: 329px; position: absolute; height:14px; width: 32px; right: 163px;" Text="" Font-Size="7pt" Font-Bold="True" ForeColor="Blue"></asp:Label>
        <asp:Label ID="Label24" runat="server" style="z-index: 1; left:  174px; top: 610px; position: absolute; height:14px; width: 32px; right: 708px;" Text="" Font-Size="7pt" Font-Bold="True" ForeColor="Transparent"></asp:Label>
        <asp:Label ID="Label25" runat="server" style="z-index: 1; left:  262px; top: 607px; position: absolute; height:14px; width: 32px; right: 620px;" Text="" Font-Size="7pt" Font-Bold="True" ForeColor="Transparent"></asp:Label>
        <asp:Label ID="Label26" runat="server" style="z-index: 1; left:  346px; top: 437px; position: absolute; height:14px; width: 214px; right: 354px;" Text="" Font-Size="7pt" Font-Bold="True" ForeColor="Blue"></asp:Label>
        <asp:AccessDataSource ID="AccessDataSource5" DataFile="~/Views/Datab/th.mdb" runat="server" SelectCommand="SELECT tbname, tbcategory, tbtoolscategory, tbactive, tbdetails, tbimgurl FROM toolbox WHERE (tbactive = 'yes') and (tbcategory = 'others or players')  or  (tbtoolscategory = 'player')"></asp:AccessDataSource>

        <asp:Image ID="Image6" runat="server" Height="20px" style="z-index: 1; left: 702px; top: 228px; position: absolute; height:10px; width:10px" Width="20px" />
        <asp:Label ID="Label10" runat="server" style="z-index: 1; left: 668px; top: 209px; position: absolute; height:14px; width: 85px" Text="" Font-Size="7pt" Font-Bold="True" ForeColor="Blue"></asp:Label>
        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="12pt" ForeColor="Blue" Style="z-index: 1; top: 421px; position: absolute; left: 606px" Text="others or players"></asp:Label>
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="12pt" ForeColor="Blue" Style="z-index: 1; left: 714px; top: 11px; position: absolute; height: 22px;" Text="land"></asp:Label>
        <asp:Label ID="Label8" runat="server" style="z-index: 1; left: 488px; top: 36px; position: absolute; height:14px; width: 18px" Text="0" Font-Size="7pt" Font-Bold="True" ForeColor="Blue"></asp:Label>
        <asp:Label ID="Label9" runat="server" style="z-index: 1; left: 491px; top: 426px; position: absolute; height:14px; width: 37px" Text="350" Font-Size="7pt" Font-Bold="True" ForeColor="Blue"></asp:Label>
        <asp:Label ID="Label11" runat="server" style="z-index: 1; left: 485px; top: 58px; position: absolute; height:18px; width: 20px" Text="&lt;-" Font-Size="11pt" Font-Bold="True" ForeColor="Blue"></asp:Label>
        

        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="12pt" ForeColor="Blue" Style="z-index: 1; top: 200px; position: absolute; left: 768px" Text="water"></asp:Label>


        <asp:DropDownList ID="DropDownList1" runat="server" Style="z-index: 1; height:40px; width:60px; left: 98px; top: 9px; position: absolute; height: 23px; width: 190px; right: 626px;" ToolTip="Press Select to confirm" CausesValidation="True" BackColor="#99CCFF" ForeColor="Maroon">
            <asp:ListItem Selected="True">land</asp:ListItem>
            <asp:ListItem>water</asp:ListItem>
            <asp:ListItem>air or space</asp:ListItem>
        </asp:DropDownList>
        
         <asp:Panel ID="Panel4" runat="server" style="z-index: 1; left: 766px; top: 221px; position: absolute; height: 162px; width: 134px; overflow:scroll" ScrollBars="Vertical">
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BorderStyle="Solid" DataSourceID="AccessDataSource3" GridLines="None" PageSize="200000" ShowHeader="False" Style="z-index: 1; left: 0px; top: 0px; position: absolute; height: 133px; width: 53px" Enabled="False" ClientIDMode="Static" ViewStateMode="Enabled" OnSelectedIndexChanged="GridView2_SelectedIndexChanged1">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Select" ToolTip='<%# Eval("tbtoolscategory") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:ImageField DataImageUrlField="tbimgurl">
                    <ControlStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Height="40px" Width="40px" />
                </asp:ImageField>
                <asp:BoundField DataField="tbname" HeaderText="tbname">
                    <ControlStyle Width="1px" />
                    <ItemStyle ForeColor="Transparent" Height="1px" Width="1px" Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="tbtoolscategory" HeaderText="tbtoolscategory">
                    <ControlStyle Width="1px" />
                    <ItemStyle ForeColor="Transparent" Height="1px" Width="1px" Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="tbimgurl" HeaderText="tbimgurl" SortExpression="tbimgurl">
                    <ControlStyle ForeColor="Transparent" Width="1px" />
                    <ItemStyle ForeColor="Transparent" Height="1px" Width="1px" Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="tbdetails" HeaderText="tbdetails" >
                <ItemStyle ForeColor="Transparent" Height="1px" Width="1px" Wrap="False" />
                </asp:BoundField>
            </Columns>
            <RowStyle Height="30px" />
            <SelectedRowStyle BackColor="#FFFFCC" />
        </asp:GridView>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" style="z-index: 1; left: 601px; top: 447px; position: absolute; height: 162px; width: 134px; overflow:scroll" ScrollBars="Vertical">
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" BorderStyle="Solid" DataSourceID="AccessDataSource5" GridLines="None" PageSize="200000" ShowHeader="False" Style="z-index: 1; top: 0px; position: absolute; height: 137px; width: 42px; left: 0px" ClientIDMode="Static" ViewStateMode="Enabled" CellPadding="0" Enabled="False" OnSelectedIndexChanged="GridView4_SelectedIndexChanged1">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Select" ToolTip='<%# Eval("tbtoolscategory") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:ImageField DataImageUrlField="tbimgurl">
                    <ControlStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Height="40px" Width="40px" />
                </asp:ImageField>
                <asp:BoundField DataField="tbname" HeaderText="tbname">
                    <ControlStyle Width="1px" />
                    <ItemStyle ForeColor="Transparent" Height="1px" Width="1px" Wrap="False"  />
                </asp:BoundField>
                <asp:BoundField DataField="tbtoolscategory" HeaderText="tbtoolscategory">
                    <ControlStyle Width="1px" />
                    <ItemStyle ForeColor="Transparent" Height="1px" Width="1px" Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="tbimgurl" HeaderText="tbimgurl" SortExpression="tbimgurl">
                    <ControlStyle ForeColor="Transparent" Width="1px" />
                    <ItemStyle ForeColor="Transparent" Height="1px" Width="1px" Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="tbdetails" HeaderText="tbdetails" >
                <ItemStyle ForeColor="Transparent" Height="1px" Width="1px" Wrap="False" />
                </asp:BoundField>
            </Columns>
            <RowStyle Height="30px" />
            <SelectedRowStyle BackColor="#FFFFCC" />
        </asp:GridView>
            </asp:Panel>

        <asp:Panel ID="Panel5" runat="server" style="z-index: 1; left: 747px; top: 415px; position: absolute; height: 162px; width: 134px;overflow:scroll" ScrollBars="Vertical">
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" BorderStyle="Solid" DataSourceID="AccessDataSource4" GridLines="None" PageSize="200000" ShowHeader="False" Style="z-index: 1; left: 0px; top: 0px; position: absolute; height: 133px; width: 65px; bottom: 404px;" Enabled="False" ClientIDMode="Static" OnSelectedIndexChanged="GridView3_SelectedIndexChanged1">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Select" ToolTip='<%# Eval("tbtoolscategory") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:ImageField DataImageUrlField="tbimgurl">
                    <ControlStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Height="40px" Width="40px" />
                </asp:ImageField>
                <asp:BoundField DataField="tbname" HeaderText="tbname">
                    <ControlStyle Width="1px" />
                    <ItemStyle ForeColor="Transparent" Height="1px" Width="1px" Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="tbtoolscategory" HeaderText="tbtoolscategory">
                    <ControlStyle Width="1px" />
                    <ItemStyle ForeColor="Transparent" Height="1px" Width="1px" Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="tbimgurl" HeaderText="tbimgurl" SortExpression="tbimgurl">
                    <ControlStyle ForeColor="Transparent" Width="1px" />
                    <ItemStyle ForeColor="Transparent" Height="1px" Width="1px" Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="tbdetails" HeaderText="tbdetails" >
                <ItemStyle ForeColor="Transparent" Height="1px" Width="1px" Wrap="False" />
                </asp:BoundField>
            </Columns>
            <RowStyle Height="30px" />
            <SelectedRowStyle BackColor="#FFFFCC" />
        </asp:GridView>
            </asp:Panel>
        <asp:Panel ID="Panel3" runat="server" style="z-index: 1; left: 712px; top: 36px; position: absolute; height: 162px; width: 134px; overflow:scroll" ScrollBars="Vertical">
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderStyle="Solid" DataSourceID="AccessDataSource2" GridLines="None" PageSize="200000" ShowHeader="False" Style="z-index: 1; left: 0px; top: 0px; position: absolute; height: 154px; width: 139px" Visible="False" ClientIDMode="Static" ViewStateMode="Enabled" Enabled="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Select" ToolTip='<%# Eval("tbtoolscategory") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:ImageField DataImageUrlField="tbimgurl">
                    <ControlStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Height="40px" Width="40px" />
                </asp:ImageField>
                <asp:BoundField DataField="tbname" HeaderText="tbname">
                    <ControlStyle Width="1px" />
                    <ItemStyle ForeColor="Transparent" Height="1px" Width="1px" Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="tbtoolscategory" HeaderText="tbtoolscategory">
                    <ControlStyle Width="1px" />
                    <ItemStyle ForeColor="Transparent" Height="1px" Width="1px" Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="tbimgurl" HeaderText="tbimgurl" SortExpression="tbimgurl">
                    <ControlStyle Width="1px" />
                    <ItemStyle ForeColor="Transparent" Height="1px" Width="1px" Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="tbdetails" HeaderText="tbdetails" >
                <ItemStyle ForeColor="Transparent" Height="1px" Width="1px" Wrap="False" />
                </asp:BoundField>
            </Columns>
             <RowStyle Height="30px" />
            <SelectedRowStyle BackColor="#FFFFCC" />
        </asp:GridView>
            </asp:Panel>
        <asp:Panel runat="server" ID="Panel7">
        <asp:TextBox ID="TextBox1" runat="server" Style="z-index: 1; left: 523px; top: 151px; position: absolute; width: 168px; height: 24px" ClientIDMode="Static" ViewStateMode="Enabled" OnTextChanged="TextBox1_TextChanged1" ToolTip="less than 50 chars only"></asp:TextBox>
        <asp:TextBox ID="TextBox2" runat="server" Style="z-index: 1; left: 95px; top: 468px; position: absolute; width: 388px; height: 24px" ClientIDMode="Static" ViewStateMode="Enabled" OnTextChanged="TextBox2_TextChanged1" ToolTip="Enter Only Youtube Video ID"></asp:TextBox>
        <asp:Button ID="Button4" runat="server" BackColor="Blue" ForeColor="White" Style="z-index: 1; left: 516px; top: 528px; position: absolute; height: 26px; cursor:pointer;" Text="Finalize" ToolTip="Only after all the fields are completed, finalization takes place" OnClick="Button4_Click" Enabled="False" ClientIDMode="Static" UseSubmitBehavior="False" />
        <asp:Button ID="Button5" runat="server" BackColor="Blue" ForeColor="White" Style="z-index: 1; left: 777px; top: 6px; position: absolute; height: 26px; bottom: 561px; cursor:pointer;" Text="Back to Game" ToolTip="Only after all the fields are completed, finalization takes place" Enabled="False" UseSubmitBehavior="False" />
        <asp:Button ID="Button6" runat="server" Style="z-index: 1; left: 667px; top: 355px; position: absolute; bottom: 188px; width: 71px; height:40px;" Text="Add" OnClick="Button6_Click" ClientIDMode="Static" CausesValidation="False" Enabled="False" Height="40px" Width="70px" UseSubmitBehavior="False" />
        </asp:Panel>
            <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="12pt" ForeColor="Blue" Style="z-index: 1; top: 391px; position: absolute; left: 769px; bottom: 183px;" Text="air or space" ViewStateMode="Enabled"></asp:Label>


        <asp:Panel ID="Panel1" runat="server" Style="z-index: 1; left: 18px; top: 510px; position: absolute; height: 73px; width: 466px" BorderStyle="Solid" Enabled="False" ClientIDMode="Static" ViewStateMode="Enabled">


            <asp:Button ID="Button7" runat="server" Style="z-index: 1; left: 67px; top: 5px; position: absolute; height: 26px;" Text="Top" ClientIDMode="Static" OnClick="Button7_Click" UseSubmitBehavior="False" />
            <asp:Button ID="Button2" runat="server" Style="z-index: 1; left: 8px; top: 33px; position: absolute" Text="Left" ClientIDMode="Static" UseSubmitBehavior="False" OnClick="Button2_Click" />
            <asp:Button ID="Button3" runat="server" Style="z-index: 1; left: 119px; top: 33px; position: absolute" Text="Right" ClientIDMode="Static" UseSubmitBehavior="False" OnClick="Button3_Click" />
            <asp:Button ID="Button8" runat="server" Style="z-index: 1; left: 59px; top: 44px; position: absolute" Text="Down" ClientIDMode="Static" UseSubmitBehavior="False" OnClick="Button8_Click" />
            <asp:Button ID="Button9" runat="server" Style="z-index: 1; left: 228px; top: 24px; position: absolute" Text="+" ClientIDMode="Static" UseSubmitBehavior="False" OnClick="Button9_Click" />
            <asp:Button ID="Button10" runat="server" Style="z-index: 1; left: 193px; top: 25px; position: absolute; right: 255px;" Text="-" ClientIDMode="Static" UseSubmitBehavior="False" OnClick="Button10_Click" />
            <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="12pt" ForeColor="Blue" Style="z-index: 1; left: 209px; top: 3px; position: absolute" Text="size"></asp:Label>
           <asp:Button ID="Button12" runat="server" Style="z-index: 1; left: 293px; top: 25px; position: absolute; right: 155px;" Text="-" ClientIDMode="Static" UseSubmitBehavior="False" OnClick="Button12_Click"  />
            <asp:Button ID="Button13" runat="server" Style="z-index: 1; left: 333px; top: 25px; position: absolute; right: 111px;" Text="+" ClientIDMode="Static" UseSubmitBehavior="False" OnClick="Button13_Click"  />
            <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="8pt" ForeColor="Blue" Style="z-index: 1; left: 274px; top: 3px; position: absolute" Text="Placement Restriction"></asp:Label>
             <asp:Button ID="Button1" runat="server" Style="z-index: 1; cursor:pointer; left: 393px; top: 39px; position: absolute" Text="Confirm" ClientIDMode="Static" ViewStateMode="Enabled" OnClick="Button1_Click" UseSubmitBehavior="False" BackColor="#99CCFF" ForeColor="Maroon" />

        </asp:Panel>




    </form>





   
    
</body>
</html>

