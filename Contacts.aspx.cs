using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contacts : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.User.Identity.IsAuthenticated)
        {
            FormsAuthentication.RedirectToLoginPage();
        }

        txtUser.Text = Page.User.Identity.Name;
        if (!IsPostBack)
        {
            BindGrid();
        }
    }
    protected void Search(object sender, EventArgs e)
    {
        this.BindGrid();
    }
    private void BindGrid()
    {
        string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "Select_User";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@UserName", txtUser.Text.Trim());
                cmd.Parameters.AddWithValue("@ContactName", search.Text.Trim());
                DataTable dt = new DataTable();
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    sda.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();

                }
            }
        }
    }

    protected void OnRowCreated(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[1].Visible = false;
    }

    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        BindGrid();
    }
    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[0].Width = new Unit("20%");
        System.Diagnostics.Debug.WriteLine(e.Row.Cells[2].Text);
        e.Row.Cells[2].Width = new Unit("40%");

        e.Row.Cells[3].Width = new Unit("40%");
        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[2].Text = "Name";
            e.Row.Cells[3].Text = "Mobile";
        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[2].Text = Regex.Replace(e.Row.Cells[2].Text, search.Text.Trim(), delegate (Match match)
            {
                return string.Format("<span style = 'background-color:#D9EDF7'>{0}</span>", match.Value);
            }, RegexOptions.IgnoreCase);
        }

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Regex regex = new Regex(string.Format("\\<.*?\\>"));

        GridViewRow row = GridView1.SelectedRow;
        System.Diagnostics.Debug.WriteLine(row.Cells[1].Text);
        Response.Redirect("Details.aspx?id=" + row.Cells[1].Text);


    }
   
}