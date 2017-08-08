using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace _1stProject
{
    public partial class LogInPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Calendar1.Visible = false;
                DataSet ds = Getdata("spGetCountry", null);
                ddlCountry.DataSource = ds;
                ddlCountry.DataBind();
                ddlState.Enabled = false;
                ddlCity.Enabled = false;
                
                ListItem LiCountry = new ListItem("Select Country", "-1");
                ddlCountry.Items.Insert(0, LiCountry);

                ListItem LiState = new ListItem("Select State", "-1");
                ddlState.Items.Insert(0, LiState);

                ListItem LiCity = new ListItem("Select City", "-1");
                ddlCity.Items.Insert(0, LiCity);

            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (!Calendar1.Visible)
            {
                Calendar1.Visible = true;
            }
            else
                Calendar1.Visible = false;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            TextBox4.Text = Calendar1.SelectedDate.ToString("d");
            Calendar1.Visible = false;
        }

        private DataSet Getdata(string SPName, SqlParameter SPparameter)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter da = new SqlDataAdapter(SPName, con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (SPparameter != null)
            {
                da.SelectCommand.Parameters.Add(SPparameter);
            }
            DataSet ds = new DataSet();
            da.Fill(ds);

            return ds;
        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCountry.SelectedIndex == 0)
            {
                ddlState.Enabled = false;
                ddlState.SelectedIndex = 0;

                ddlCity.Enabled = false;
                ddlCity.SelectedIndex = 0;
            }
            else
            {
                ddlState.Enabled = true;
                SqlParameter parameter = new SqlParameter("@CountryId", ddlCountry.SelectedValue);
                ddlState.DataSource = Getdata("spGetStateByCountryide", parameter);
                ddlState.DataBind();

                ddlCity.Enabled = false;

                ListItem LiState = new ListItem("Select State", "-1");
                ddlState.Items.Insert(0, LiState);
            }
        }

        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlState.SelectedIndex == 0)
            {
                ddlCity.SelectedIndex = 0;
                ddlCity.Enabled = false;
            }

            else
            {
                ddlCity.Enabled = true;
                SqlParameter parameter = new SqlParameter("@StateId", ddlState.SelectedValue);
                ddlCity.DataSource = Getdata("spGetCityByStateide", parameter);
                ddlCity.DataBind();

                ListItem LiCity = new ListItem("Select City", "-1");
                ddlCity.Items.Insert(0, LiCity);
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("UpdateTable", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", TextBox1.Text);
                cmd.Parameters.AddWithValue("@EmailId", TextBox2.Text);
                cmd.Parameters.AddWithValue("@PhNo", TextBox3.Text);
                cmd.Parameters.AddWithValue("@DOB", TextBox4.Text);
                cmd.Parameters.AddWithValue("@Country", ddlCountry.SelectedValue);
                cmd.Parameters.AddWithValue("@State", ddlState.SelectedValue);
                cmd.Parameters.AddWithValue("@City", ddlCity.SelectedValue);

                con.Open();
                cmd.ExecuteNonQuery();
                Label1.Text = "Candiadate" + TextBox1.Text.ToString() + "Information Upadated";
            }

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            TextBox1.Text = string.Empty;
            TextBox2.Text = string.Empty;
            TextBox3.Text = string.Empty;
            TextBox4.Text = string.Empty;
            ddlState.SelectedIndex = 0;
            ddlCity.SelectedIndex = 0;
            ddlCountry.SelectedIndex = 0;
            ddlCity.Enabled = false;
            ddlState.Enabled = false;
        }


    }
}