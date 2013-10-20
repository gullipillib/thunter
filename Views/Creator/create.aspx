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
        public string tsctrl1url { get; set; }
        public string tsctrl1left { get; set; }
        public string tsctrl1top { get; set; }
        public string tsctrl1width { get; set; }
        public string tsctrl1height { get; set; }
        public string tsctrl2name { get; set; }
        public string tsctrl2url { get; set; }
        public string tsctrl2left { get; set; }
        public string tsctrl2top { get; set; }
        public string tsctrl2width { get; set; }
        public string tsctrl2height { get; set; }
        public string tsctrl3name { get; set; }
        public string tsctrl3url { get; set; }
        public string tsctrl3left { get; set; }
        public string tsctrl3top { get; set; }
        public string tsctrl3width { get; set; }
        public string tsctrl3height { get; set; }
        public string tsctrl4name { get; set; }
        public string tsctrl4url { get; set; }
        public string tsctrl4left { get; set; }
        public string tsctrl4top { get; set; }
        public string tsctrl4width { get; set; }
        public string tsctrl4height { get; set; }
        public string tsctrl5name { get; set; }
        public string tsctrl5url { get; set; }
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
    Treasurespot tsitems = new Treasurespot();
    
    protected void Button4_Click(object sender, EventArgs e)
    {
        
        
        string json = Newtonsoft.Json.JsonConvert.SerializeObject(tsitems);
        tempstring = json;
        if (TextBox1.Text != null && TextBox2.Text != null)
        {
            AccessDataSource1.SelectCommand = "SELECT Top 1 * FROM tspots WHERE (tsowner = '" + Hiddenfield1.Value + "' and tsnew = 'yes' or tscompleted = 'no')";

            AccessDataSource1.UpdateCommand = "UPDATE tspots SET tsname = '" + TextBox1.Text + "', tsitems = '" + tempstring + "', tsnew = 'no', tscompleted = 'yes'  where tsowner='" + Hiddenfield1.Value + "'";
            AccessDataSource1.Update();
            Button5.Enabled = true;
        }
    }

    protected void checknewcomplete()
    {
        AccessDataSource1.SelectCommand = "SELECT Top 1 * FROM tspots WHERE (tsowner = '" + Hiddenfield1.Value + "' and tsnew = 'yes' or tscompleted = 'no')";
        DataView dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();
            //DataTable dtr = dt;
            //DataRow[] uniname = dtr.Select("uname");
            //username = dt.Rows[0].Field<string>("uname"); usethis to get field value
            //Label3.Text = dt.Rows[0][0].ToString();
            if (dt.Rows.Count == 0)
            {
                Response.Redirect("~/Tspot/buy");
            }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        checkusername();
        checknewcomplete();
    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue == "land")
        {
            GridView1.Enabled = true;
            GridView2.Enabled = false;
            GridView3.Enabled = false;
            
         }
        if (DropDownList1.SelectedValue == "water")
        {
            GridView1.Enabled = false;
            GridView2.Enabled = true;
            GridView3.Enabled = false;
           
            
        }
        if (DropDownList1.SelectedValue == "air or space")
        {
            GridView1.Enabled = false;
            GridView2.Enabled = false;
            GridView3.Enabled = true;
           
           
        }
    }
    int controlcounter = 1;
    protected void Button6_Click(object sender, EventArgs e)
    {
        
        
        if (GridView1.Enabled == true)
        {
            if (GridView4.Rows[GridView4.SelectedIndex].Cells[2].Text == "player")
            {
                if (controlcounter == 1)
                {
                    tsitems.tsctrl1name = GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text;
                    tsitems.tsctrl1url = GridView1.Rows[GridView1.SelectedIndex].Cells[4].Text;
                    Image1.Visible = true;
                    Image1.ImageUrl = GridView1.Rows[GridView1.SelectedIndex].Cells[4].Text;
                    controlcounter = controlcounter + 1;
                }
            }
                if (controlcounter == 2)
                {
                    tsitems.tsctrl1name = GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text;
                    tsitems.tsctrl1url = GridView1.Rows[GridView1.SelectedIndex].Cells[4].Text;
                    Image2.Visible = true;
                    Image2.ImageUrl = GridView1.Rows[GridView1.SelectedIndex].Cells[4].Text;
                    controlcounter = controlcounter + 1;
                }
                if (controlcounter == 3)
                {
                    tsitems.tsctrl1name = GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text;
                    tsitems.tsctrl1url = GridView1.Rows[GridView1.SelectedIndex].Cells[4].Text;
                    Image3.Visible = true;
                    Image3.ImageUrl = GridView1.Rows[GridView1.SelectedIndex].Cells[4].Text;
                    controlcounter = controlcounter + 1;
                }
                if (controlcounter == 4)
                {
                    tsitems.tsctrl1name = GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text;
                    tsitems.tsctrl1url = GridView1.Rows[GridView1.SelectedIndex].Cells[4].Text;
                    Image4.Visible = true;
                    Image4.ImageUrl = GridView1.Rows[GridView1.SelectedIndex].Cells[4].Text;
                    controlcounter = controlcounter + 1;
                }
                if (controlcounter == 5)
                {
                    tsitems.tsctrl1name = GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text;
                    tsitems.tsctrl1url = GridView1.Rows[GridView1.SelectedIndex].Cells[4].Text;
                    Image5.Visible = true;
                    Image5.ImageUrl = GridView1.Rows[GridView1.SelectedIndex].Cells[4].Text;
                    controlcounter = controlcounter + 1;
                }
                Button6.Enabled = false;
                Panel1.Enabled = true;
                if (controlcounter > 5)
                {
                    Button6.Enabled = false;
                    Panel1.Enabled = false;
                    Button4.Enabled = true;
                }
            
        }
        if (GridView2.Enabled == true)
        {
            if (GridView4.Rows[GridView4.SelectedIndex].Cells[2].Text == "player")
            {
                if (controlcounter == 1)
                {
                    tsitems.tsctrl2name = GridView2.Rows[GridView2.SelectedIndex].Cells[1].Text;
                    tsitems.tsctrl2url = GridView2.Rows[GridView2.SelectedIndex].Cells[4].Text;
                    Image1.Visible = true;
                    Image1.ImageUrl = GridView2.Rows[GridView2.SelectedIndex].Cells[4].Text;
                    controlcounter = controlcounter + 1;
                }
            }
            if (controlcounter == 2)
            {
                tsitems.tsctrl2name = GridView2.Rows[GridView2.SelectedIndex].Cells[1].Text;
                tsitems.tsctrl2url = GridView2.Rows[GridView2.SelectedIndex].Cells[4].Text;
                Image2.Visible = true;
                Image2.ImageUrl = GridView2.Rows[GridView2.SelectedIndex].Cells[4].Text;
                controlcounter = controlcounter + 1;
            }
            if (controlcounter == 3)
            {
                tsitems.tsctrl2name = GridView2.Rows[GridView2.SelectedIndex].Cells[1].Text;
                tsitems.tsctrl2url = GridView2.Rows[GridView2.SelectedIndex].Cells[4].Text;
                Image3.Visible = true;
                Image3.ImageUrl = GridView2.Rows[GridView2.SelectedIndex].Cells[4].Text;
                controlcounter = controlcounter + 1;
            }
            if (controlcounter == 4)
            {
                tsitems.tsctrl2name = GridView2.Rows[GridView2.SelectedIndex].Cells[1].Text;
                tsitems.tsctrl2url = GridView2.Rows[GridView2.SelectedIndex].Cells[4].Text;
                Image4.Visible = true;
                Image4.ImageUrl = GridView2.Rows[GridView2.SelectedIndex].Cells[4].Text;
                controlcounter = controlcounter + 1;
            }
            if (controlcounter == 5)
            {
                tsitems.tsctrl2name = GridView2.Rows[GridView2.SelectedIndex].Cells[1].Text;
                tsitems.tsctrl2url = GridView2.Rows[GridView2.SelectedIndex].Cells[4].Text;
                Image5.Visible = true;
                Image5.ImageUrl = GridView2.Rows[GridView2.SelectedIndex].Cells[4].Text;
                controlcounter = controlcounter + 1;
            }
            Button6.Enabled = false;
            Panel1.Enabled = true;
            if (controlcounter > 5)
            {
                Button6.Enabled = false;
                Panel1.Enabled = false;
                Button4.Enabled = true;
            }
        }
        if (GridView3.Enabled == true)
        {
            if (GridView4.Rows[GridView4.SelectedIndex].Cells[2].Text == "player")
            {
                if (controlcounter == 1)
                {
                    tsitems.tsctrl3name = GridView3.Rows[GridView3.SelectedIndex].Cells[1].Text;
                    tsitems.tsctrl3url = GridView3.Rows[GridView3.SelectedIndex].Cells[4].Text;
                    Image1.Visible = true;
                    Image1.ImageUrl = GridView3.Rows[GridView3.SelectedIndex].Cells[4].Text;
                    controlcounter = controlcounter + 1;
                }
            }
            if (controlcounter == 2)
            {
                tsitems.tsctrl3name = GridView3.Rows[GridView3.SelectedIndex].Cells[1].Text;
                tsitems.tsctrl3url = GridView3.Rows[GridView3.SelectedIndex].Cells[4].Text;
                Image2.Visible = true;
                Image2.ImageUrl = GridView3.Rows[GridView3.SelectedIndex].Cells[4].Text;
                controlcounter = controlcounter + 1;
            }
            if (controlcounter == 3)
            {
                tsitems.tsctrl3name = GridView3.Rows[GridView3.SelectedIndex].Cells[1].Text;
                tsitems.tsctrl3url = GridView3.Rows[GridView3.SelectedIndex].Cells[4].Text;
                Image3.Visible = true;
                Image3.ImageUrl = GridView3.Rows[GridView3.SelectedIndex].Cells[4].Text;
                controlcounter = controlcounter + 1;
            }
            if (controlcounter == 4)
            {
                tsitems.tsctrl3name = GridView3.Rows[GridView3.SelectedIndex].Cells[1].Text;
                tsitems.tsctrl3url = GridView3.Rows[GridView3.SelectedIndex].Cells[4].Text;
                Image4.Visible = true;
                Image4.ImageUrl = GridView3.Rows[GridView3.SelectedIndex].Cells[4].Text;
                controlcounter = controlcounter + 1;
            }
            if (controlcounter == 5)
            {
                tsitems.tsctrl3name = GridView3.Rows[GridView3.SelectedIndex].Cells[1].Text;
                tsitems.tsctrl3url = GridView3.Rows[GridView3.SelectedIndex].Cells[4].Text;
                Image5.Visible = true;
                Image5.ImageUrl = GridView3.Rows[GridView3.SelectedIndex].Cells[4].Text;
                controlcounter = controlcounter + 1;
            }
            Button6.Enabled = false;
            Panel1.Enabled = true;
            if (controlcounter > 5)
            {
                Button6.Enabled = false;
                Panel1.Enabled = false;
                Button4.Enabled = true;
            }
        }
        if (GridView4.Enabled == true)
        {
            if (GridView4.Rows[GridView4.SelectedIndex].Cells[2].Text == "player")
            {
                if (controlcounter == 1)
                {
                    tsitems.tsctrl4name = GridView4.Rows[GridView4.SelectedIndex].Cells[1].Text;
                    tsitems.tsctrl4url = GridView4.Rows[GridView4.SelectedIndex].Cells[4].Text;
                    Image1.Visible = true;
                    Image1.ImageUrl = GridView4.Rows[GridView4.SelectedIndex].Cells[4].Text;
                    controlcounter = controlcounter + 1;
                }
            }
            if (controlcounter == 2)
            {
                tsitems.tsctrl4name = GridView4.Rows[GridView4.SelectedIndex].Cells[1].Text;
                tsitems.tsctrl4url = GridView4.Rows[GridView4.SelectedIndex].Cells[4].Text;
                Image2.Visible = true;
                Image2.ImageUrl = GridView4.Rows[GridView4.SelectedIndex].Cells[4].Text;
                controlcounter = controlcounter + 1;
            }
            if (controlcounter == 3)
            {
                tsitems.tsctrl4name = GridView4.Rows[GridView4.SelectedIndex].Cells[1].Text;
                tsitems.tsctrl4url = GridView4.Rows[GridView4.SelectedIndex].Cells[4].Text;
                Image3.Visible = true;
                Image3.ImageUrl = GridView4.Rows[GridView4.SelectedIndex].Cells[4].Text;
                controlcounter = controlcounter + 1;
            }
            if (controlcounter == 4)
            {
                tsitems.tsctrl4name = GridView4.Rows[GridView4.SelectedIndex].Cells[1].Text;
                tsitems.tsctrl4url = GridView4.Rows[GridView4.SelectedIndex].Cells[4].Text;
                Image4.Visible = true;
                Image4.ImageUrl = GridView4.Rows[GridView4.SelectedIndex].Cells[4].Text;
                controlcounter = controlcounter + 1;
            }
            if (controlcounter == 5)
            {
                tsitems.tsctrl4name = GridView4.Rows[GridView4.SelectedIndex].Cells[1].Text;
                tsitems.tsctrl4url = GridView4.Rows[GridView4.SelectedIndex].Cells[4].Text;
                Image5.Visible = true;
                Image5.ImageUrl = GridView4.Rows[GridView4.SelectedIndex].Cells[4].Text;
                controlcounter = controlcounter + 1;
            }
            Button6.Enabled = false;
            Panel1.Enabled = true;
            if (controlcounter > 5)
            {
                Button6.Enabled = false;
                Panel1.Enabled = false;
                Button4.Enabled = true;
            }
        }
    }

    protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.SelectedIndex = -1;
        GridView2.SelectedIndex = -1;
        GridView4.SelectedIndex = -1;
    }

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.SelectedIndex = -1;
        GridView3.SelectedIndex = -1;
        GridView4.SelectedIndex = -1;
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView3.SelectedIndex = -1;
        GridView2.SelectedIndex = -1;
        GridView4.SelectedIndex = -1;
    }

    protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.SelectedIndex = -1;
        GridView2.SelectedIndex = -1;
        GridView3.SelectedIndex = -1;
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        AccessDataSource1.SelectCommand = "SELECT * FROM tspots WHERE (tsname = '" + TextBox1.Text + "')";

            DataView dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();
            //DataTable dtr = dt;
            //DataRow[] uniname = dtr.Select("uname");
            //username = dt.Rows[0].Field<string>("uname"); usethis to get field value
            //Label3.Text = dt.Rows[0][0].ToString();
            if (dt.Rows.Count == 0)
            {
                TextBox1.Text = "";
            }
            if (dt.Rows.Count != 0)
            {
                tsitems.tsName = TextBox1.Text;
                tsitems.tsLeft = "14px";
                tsitems.tsTop = "57px";    
            }
    }

    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {
        tsitems.tsUrl = TextBox2.Text;
        HiddenField2.Value = TextBox2.Text;
        
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (controlcounter == 1)
        {
            if (Convert.ToInt16(Image1.Style["left"].Replace("px", "")) > 15)
            {
               Image1.Style["left"] = Convert.ToString(Convert.ToInt16(Image1.Style["left"].Replace("px", "")) - 1) + "px";
            }
        }
        if (controlcounter == 2)
        {
            if (Convert.ToInt16(Image2.Style["left"].Replace("px", "")) > 15)
            {
                Image2.Style["left"] = Convert.ToString(Convert.ToInt16(Image2.Style["left"].Replace("px", "")) - 1) + "px";
            }
        }
        if (controlcounter == 3)
        {
            if (Convert.ToInt16(Image3.Style["left"].Replace("px", "")) > 15)
            {
                Image3.Style["left"] = Convert.ToString(Convert.ToInt16(Image3.Style["left"].Replace("px", "")) - 1) + "px";
            }
        }
        if (controlcounter == 4)
        {
            if (Convert.ToInt16(Image4.Style["left"].Replace("px", "")) > 15)
            {
                Image4.Style["left"] = Convert.ToString(Convert.ToInt16(Image4.Style["left"].Replace("px", "")) - 1) + "px";
            }
        }
        if (controlcounter == 5)
        {
            if (Convert.ToInt16(Image5.Style["left"].Replace("px", "")) > 15)
            {
                Image5.Style["left"] = Convert.ToString(Convert.ToInt16(Image5.Style["left"].Replace("px", "")) - 1) + "px";
            }
        }
        
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        if (controlcounter == 1)
        {
            if (Convert.ToInt16(Image1.Style["left"].Replace("px", "")) < 636)
            {
                Image1.Style["left"] = Convert.ToString(Convert.ToInt16(Image1.Style["left"].Replace("px", "")) + 1) + "px";
            }
        }
        if (controlcounter == 2)
        {
            if (Convert.ToInt16(Image2.Style["left"].Replace("px", "")) < 636)
            {
                Image2.Style["left"] = Convert.ToString(Convert.ToInt16(Image2.Style["left"].Replace("px", "")) + 1) + "px";
            }
        }
        if (controlcounter == 3)
        {
            if (Convert.ToInt16(Image3.Style["left"].Replace("px", "")) < 636)
            {
                Image3.Style["left"] = Convert.ToString(Convert.ToInt16(Image3.Style["left"].Replace("px", "")) + 1) + "px";
            }
        }
        if (controlcounter == 4)
        {
            if (Convert.ToInt16(Image4.Style["left"].Replace("px", "")) < 636)
            {
                Image4.Style["left"] = Convert.ToString(Convert.ToInt16(Image4.Style["left"].Replace("px", "")) + 1) + "px";
            }
        }
        if (controlcounter == 5)
        {
            if (Convert.ToInt16(Image5.Style["left"].Replace("px", "")) < 636)
            {
                Image5.Style["left"] = Convert.ToString(Convert.ToInt16(Image5.Style["left"].Replace("px", "")) + 1) + "px";
            }
        }
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        if (controlcounter == 1)
        {
            if (Convert.ToInt16(Image1.Style["top"].Replace("px", "")) > 58)
            {
                Image1.Style["top"] = Convert.ToString(Convert.ToInt16(Image1.Style["top"].Replace("px", "")) - 1) + "px";
            }
        }
        if (controlcounter == 2)
        {
            if (Convert.ToInt16(Image2.Style["top"].Replace("px", "")) > 58)
            {
                Image2.Style["top"] = Convert.ToString(Convert.ToInt16(Image2.Style["top"].Replace("px", "")) - 1) + "px";
            }
        }
        if (controlcounter == 3)
        {
            if (Convert.ToInt16(Image3.Style["top"].Replace("px", "")) > 58)
            {
                Image3.Style["top"] = Convert.ToString(Convert.ToInt16(Image3.Style["top"].Replace("px", "")) - 1) + "px";
            }
        }
        if (controlcounter == 4)
        {
            if (Convert.ToInt16(Image4.Style["top"].Replace("px", "")) > 58)
            {
                Image4.Style["top"] = Convert.ToString(Convert.ToInt16(Image4.Style["top"].Replace("px", "")) - 1) + "px";
            }
        }
        if (controlcounter == 5)
        {
            if (Convert.ToInt16(Image5.Style["top"].Replace("px", "")) > 58)
            {
                Image5.Style["top"] = Convert.ToString(Convert.ToInt16(Image5.Style["top"].Replace("px", "")) - 1) + "px";
            }
        }
    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        if (controlcounter == 1)
        {
            if (Convert.ToInt16(Image1.Style["top"].Replace("px", "")) < 417)
            {
                Image1.Style["top"] = Convert.ToString(Convert.ToInt16(Image1.Style["top"].Replace("px", "")) + 1) + "px";
            }
        }
        if (controlcounter == 2)
        {
            if (Convert.ToInt16(Image2.Style["top"].Replace("px", "")) < 417)
            {
                Image2.Style["top"] = Convert.ToString(Convert.ToInt16(Image2.Style["top"].Replace("px", "")) + 1) + "px";
            }
        }
        if (controlcounter == 3)
        {
            if (Convert.ToInt16(Image3.Style["top"].Replace("px", "")) < 417)
            {
                Image3.Style["top"] = Convert.ToString(Convert.ToInt16(Image3.Style["top"].Replace("px", "")) + 1) + "px";
            }
        }
        if (controlcounter == 4)
        {
            if (Convert.ToInt16(Image4.Style["top"].Replace("px", "")) < 417)
            {
                Image4.Style["top"] = Convert.ToString(Convert.ToInt16(Image4.Style["top"].Replace("px", "")) + 1) + "px";
            }
        }
        if (controlcounter == 5)
        {
            if (Convert.ToInt16(Image5.Style["top"].Replace("px", "")) < 417)
            {
                Image5.Style["top"] = Convert.ToString(Convert.ToInt16(Image5.Style["top"].Replace("px", "")) + 1) + "px";
            }
        }
    }

    protected void Button10_Click(object sender, EventArgs e)
    {
        if (controlcounter == 1)
        {
            if (Convert.ToInt16(Image1.Style["height"].Replace("px", "")) > 20)
            {
                Image1.Style["height"] = Convert.ToString(Convert.ToInt16(Image1.Style["height"].Replace("px", "")) - 10) + "px";
                Image1.Style["width"] = Convert.ToString(Convert.ToInt16(Image1.Style["width"].Replace("px", "")) - 10) + "px";
            
            }
        }
        if (controlcounter == 2)
        {
            if (Convert.ToInt16(Image2.Style["height"].Replace("px", "")) > 20)
            {
                Image2.Style["height"] = Convert.ToString(Convert.ToInt16(Image2.Style["height"].Replace("px", "")) - 10) + "px";
                Image2.Style["width"] = Convert.ToString(Convert.ToInt16(Image2.Style["width"].Replace("px", "")) - 10) + "px";
            
            }
        }
        if (controlcounter == 3)
        {
            if (Convert.ToInt16(Image3.Style["height"].Replace("px", "")) > 20)
            {
                Image3.Style["height"] = Convert.ToString(Convert.ToInt16(Image3.Style["height"].Replace("px", "")) - 10) + "px";
                Image3.Style["width"] = Convert.ToString(Convert.ToInt16(Image3.Style["width"].Replace("px", "")) - 10) + "px";
            
            }
        }
        if (controlcounter == 4)
        {
            if (Convert.ToInt16(Image4.Style["height"].Replace("px", "")) > 20)
            {
                Image4.Style["height"] = Convert.ToString(Convert.ToInt16(Image4.Style["height"].Replace("px", "")) - 10) + "px";
                Image4.Style["width"] = Convert.ToString(Convert.ToInt16(Image4.Style["width"].Replace("px", "")) - 10) + "px";
            
            }
        }
        if (controlcounter == 5)
        {
            if (Convert.ToInt16(Image5.Style["height"].Replace("px", "")) > 20)
            {
                Image5.Style["height"] = Convert.ToString(Convert.ToInt16(Image5.Style["height"].Replace("px", "")) - 10) + "px";
                Image5.Style["width"] = Convert.ToString(Convert.ToInt16(Image5.Style["width"].Replace("px", "")) - 10) + "px";
            
            }
        }
    }

    protected void Button9_Click(object sender, EventArgs e)
    {
        if (controlcounter == 1)
        {
            if (Convert.ToInt16(Image1.Style["height"].Replace("px", "")) < 60)
            {
                Image1.Style["height"] = Convert.ToString(Convert.ToInt16(Image1.Style["height"].Replace("px", "")) + 10) + "px";
                Image1.Style["width"] = Convert.ToString(Convert.ToInt16(Image1.Style["width"].Replace("px", "")) + 10) + "px";
            
            }
        }
        if (controlcounter == 2)
        {
            if (Convert.ToInt16(Image2.Style["height"].Replace("px", "")) < 60)
            {
                Image2.Style["height"] = Convert.ToString(Convert.ToInt16(Image2.Style["height"].Replace("px", "")) + 10) + "px";
                Image2.Style["width"] = Convert.ToString(Convert.ToInt16(Image2.Style["width"].Replace("px", "")) + 10) + "px";
            
            }
        }
        if (controlcounter == 3)
        {
            if (Convert.ToInt16(Image3.Style["height"].Replace("px", "")) < 60)
            {
                Image3.Style["height"] = Convert.ToString(Convert.ToInt16(Image3.Style["height"].Replace("px", "")) + 10) + "px";
                Image3.Style["width"] = Convert.ToString(Convert.ToInt16(Image3.Style["width"].Replace("px", "")) + 10) + "px";
            
            }
        }
        if (controlcounter == 4)
        {
            if (Convert.ToInt16(Image4.Style["height"].Replace("px", "")) < 60)
            {
                Image4.Style["height"] = Convert.ToString(Convert.ToInt16(Image4.Style["height"].Replace("px", "")) + 10) + "px";
                Image4.Style["width"] = Convert.ToString(Convert.ToInt16(Image4.Style["width"].Replace("px", "")) + 10) + "px";
            
            }
        }
        if (controlcounter == 5)
        {
            if (Convert.ToInt16(Image5.Style["height"].Replace("px", "")) < 60)
            {
                Image5.Style["height"] = Convert.ToString(Convert.ToInt16(Image5.Style["height"].Replace("px", "")) + 10) + "px";
                Image5.Style["width"] = Convert.ToString(Convert.ToInt16(Image5.Style["width"].Replace("px", "")) + 10) + "px";
            
            }
        }
    }
</script>


<html>
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width" />
    <title></title>
    <style type="text/css">
        #uploadFile_div {
            width: 152px;
            z-index: 1;
            left: 716px;
            top: 580px;
            position: absolute;
            height: 19px;
        }
        #file {
            z-index: 1;
            left: 722px;
            top: 540px;
            position: absolute;
            width: 151px;
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
 
    <form id="form1" runat="server" >
        <asp:Button ID="Button5" runat="server" style="z-index: 1; left: 503px; top: 25px; position: absolute" Text="Back to Game" Enabled="False" />
    
        <input id="file" name="file" type="file" />
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
 
    <iframe id="Iframe1"   src='<%=HiddenField2.Value%>' style="z-index: 0;  left: 14px; top: 57px; position: absolute; background-color: transparent; width: 623px; height: 361px;"   class="twoto3d"></iframe>
       &nbsp;<asp:AccessDataSource id="AccessDataSource1" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT uname FROM appuserdetails WHERE (uname = 'GullipilliBhaskar')"> </asp:AccessDataSource>
        <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 23px; top: 434px; position: absolute; width: 41px; height: 20px;" Text="Name"></asp:Label>
        <asp:Label ID="Label7" runat="server" style="z-index: 1; left: 23px; top: 474px; position: absolute; width: 68px; height: 20px;" Text="Video Url"></asp:Label>
        <asp:AccessDataSource id="AccessDataSource2" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT tbname, tbcategory, tbactive, tbdetails, tbimgurl FROM toolbox WHERE (tbactive = 'yes') and (tbcategory = 'land')"> </asp:AccessDataSource>
        <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" style="z-index: 1; left: 36px; top: 20px; position: absolute; height: 38px; width: 241px">
            <asp:ListItem Selected="True">land</asp:ListItem>
            <asp:ListItem>water</asp:ListItem>
            <asp:ListItem>air or space</asp:ListItem>
        </asp:DropDownList>
        <asp:AccessDataSource id="AccessDataSource3" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT tbname, tbcategory, tbactive, tbdetails, tbimgurl FROM toolbox WHERE (tbactive = 'yes') and (tbcategory = 'water')"> </asp:AccessDataSource>
        <asp:AccessDataSource id="AccessDataSource4" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT tbname, tbcategory, tbactive, tbdetails, tbimgurl FROM toolbox WHERE (tbactive = 'yes') and (tbcategory = 'air or space')"> </asp:AccessDataSource>
        <asp:AccessDataSource id="AccessDataSource5" DataFile="~/Views/Datab/th.mdb" runat="server"  SelectCommand="SELECT tbname, tbcategory, tbactive, tbdetails, tbimgurl FROM toolbox WHERE (tbactive = 'yes') and (tbcategory = 'others')  or  (tbcategory = 'players')"> </asp:AccessDataSource>
        
        <asp:HiddenField ID="Hiddenfield1" runat="server"></asp:HiddenField>
        
        
        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/fplane.gif" style="z-index: 200; left: 374px; top: 233px; position: absolute; height: 28px; width: 29px" ClientIDMode="Static" Visible="False" />
        
        
        <asp:HiddenField ID="HiddenField2" runat="server" />
        
        
        <asp:Button ID="Button6" runat="server" style="z-index: 1; left: 650px; top: 267px; position: absolute" Text="Add" OnClick="Button6_Click" />
        
        
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderStyle="Solid" DataSourceID="AccessDataSource3" GridLines="None" PageSize="4" ShowHeader="False" style="z-index: 1; left: 711px; top: 208px; position: absolute; height: 133px; width: 187px" Enabled="False" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                <asp:BoundField DataField="tbname" HeaderText="tbname" SortExpression="tbname" />
                <asp:BoundField DataField="tbcategory" HeaderText="tbcategory" SortExpression="tbcategory" />
                <asp:ImageField DataImageUrlField="tbimgurl">
                </asp:ImageField>
                <asp:BoundField DataField="tbimgurl" HeaderText="tbimgurl" SortExpression="tbimgurl" Visible="False" />
            </Columns>
        </asp:GridView>
        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="12pt" ForeColor="Blue" style="z-index: 1; top: 418px; position: absolute; left: 515px" Text="others or players"></asp:Label>
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="12pt" ForeColor="Blue" style="z-index: 1; left: 711px; top: 362px; position: absolute" Text="land"></asp:Label>
        <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderStyle="Solid" DataSourceID="AccessDataSource5" GridLines="None" PageSize="4" ShowHeader="False" style="z-index: 1; top: 443px; position: absolute; height: 133px; width: 187px; left: 510px" OnSelectedIndexChanged="GridView4_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                <asp:BoundField DataField="tbname" HeaderText="tbname" SortExpression="tbname" />
                <asp:BoundField DataField="tbcategory" HeaderText="tbcategory" SortExpression="tbcategory" />
                <asp:ImageField DataImageUrlField="tbimgurl">
                </asp:ImageField>
                <asp:BoundField DataField="tbimgurl" HeaderText="tbimgurl" SortExpression="tbimgurl" Visible="False" />
            </Columns>
        </asp:GridView>
        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderStyle="Solid" DataSourceID="AccessDataSource4" GridLines="None" PageSize="4" ShowHeader="False" style="z-index: 1; left: 709px; top: 36px; position: absolute; height: 133px; width: 187px" Enabled="False" OnSelectedIndexChanged="GridView3_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                <asp:BoundField DataField="tbname" HeaderText="tbname" SortExpression="tbname" />
                <asp:BoundField DataField="tbcategory" HeaderText="tbcategory" SortExpression="tbcategory" />
                <asp:ImageField DataImageUrlField="tbimgurl">
                </asp:ImageField>
                <asp:BoundField DataField="tbimgurl" HeaderText="tbimgurl" SortExpression="tbimgurl" Visible="False" />
            </Columns>
        </asp:GridView>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderStyle="Solid" DataSourceID="AccessDataSource2" GridLines="None" PageSize="4" ShowHeader="False" style="z-index: 1; left: 710px; top: 381px; position: absolute; height: 133px; width: 187px" Visible="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                <asp:BoundField DataField="tbname" HeaderText="tbname" SortExpression="tbname" />
                <asp:BoundField DataField="tbcategory" HeaderText="tbcategory" SortExpression="tbcategory" />
                <asp:ImageField DataImageUrlField="tbimgurl">
                </asp:ImageField>
                <asp:BoundField DataField="tbimgurl" HeaderText="tbimgurl" SortExpression="tbimgurl" Visible="False" />
            </Columns>
        </asp:GridView>
        
        
        <asp:TextBox ID="TextBox1" runat="server" style="z-index: 1; left: 73px; top: 428px; position: absolute; width: 414px; height: 24px" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
        
        
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/fplane.gif" style="z-index: 200; left: 344px; top: 233px; position: absolute; height: 28px; width: 29px" ClientIDMode="Static" Visible="False" />
        
        
        <asp:Button ID="Button4" runat="server" BackColor="Blue" ForeColor="White" style="z-index: 1; left: 637px; top: 343px; position: absolute; height: 26px;" Text="Finalize" ToolTip="Only after all the fields are completed, finalization takes place" OnClick="Button4_Click" UseSubmitBehavior="False" Enabled="False" />

        
   <a href="../Toolbox/Play/play" target="_self" style="position:absolute;left:326px; top:26px; width:152px; text-decoration:none; background-color: #0000FF; color: #FFFFFF; webkit-border-radius:20px; moz-border-radius:20px; border-radius:20px; right: 436px; text-align: center; height: 22px;" > Complete Later </a> 
   
        
        <asp:TextBox ID="TextBox2" runat="server" style="z-index: 1; left: 102px; top: 468px; position: absolute; width: 388px; height: 24px" OnTextChanged="TextBox2_TextChanged" ClientIDMode="Static" ></asp:TextBox>
        
            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="12pt" ForeColor="Blue" style="z-index: 1; top: 187px; position: absolute; left: 714px" Text="water"></asp:Label>
 
        
        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="12pt" ForeColor="Blue" style="z-index: 1; top: 15px; position: absolute; left: 709px" Text="air or space"></asp:Label>
        
        
        
        
        <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/fplane.gif" style="z-index: 200; left: 454px; top: 233px; position: absolute; height: 28px; width: 29px" ClientIDMode="Static" Visible="False" />
        <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/fplane.gif" style="z-index: 200; left: 414px; top: 233px; position: absolute; height: 28px; width: 29px" ClientIDMode="Static" Visible="False" />
        <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/fplane.gif" style="z-index: 200; left: 414px; top: 173px; position: absolute; height: 28px; width: 29px" ClientIDMode="Static" Visible="False" />
        
        
       
        
        
       
        
        
        <asp:Panel ID="Panel1" runat="server" style="z-index: 1; left: 18px; top: 510px; position: absolute; height: 73px; width: 466px" BorderStyle="Solid" Enabled="False">
        
        
        <asp:Button ID="Button7" runat="server" style="z-index: 1; left: 67px; top: 5px; position: absolute" Text="Top" OnClick="Button7_Click" />
       <asp:Button ID="Button2" runat="server" style="z-index: 1; left: 8px; top: 33px; position: absolute" Text="Left" OnClick="Button2_Click" />
       <asp:Button ID="Button3" runat="server" style="z-index: 1; left: 119px; top: 33px; position: absolute" Text="Right" OnClick="Button3_Click" />
       <asp:Button ID="Button8" runat="server" style="z-index: 1; left: 59px; top: 44px; position: absolute" Text="Down" OnClick="Button8_Click" />
       <asp:Button ID="Button9" runat="server" style="z-index: 1; left: 288px; top: 24px; position: absolute" Text="+" OnClick="Button9_Click" />
       <asp:Button ID="Button10" runat="server" style="z-index: 1; left: 233px; top: 25px; position: absolute; right: 215px;" Text="-" OnClick="Button10_Click" />
        <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="12pt" ForeColor="Blue" style="z-index: 1; left: 259px; top: 3px; position: absolute" Text="size"></asp:Label>
        <asp:Button ID="Button1" runat="server" style="z-index: 1; left: 371px; top: 19px; position: absolute" Text="Confirm" />
       
        </asp:Panel>
        
       
        
        
       
        
    </form>
   
    
        
   
   </body>
</html>

