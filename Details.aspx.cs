using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Details : System.Web.UI.Page
{
    string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.User.Identity.IsAuthenticated)
        {
            FormsAuthentication.RedirectToLoginPage();

        }
        else if (Page.User.Identity.IsAuthenticated && Request.QueryString["id"] == null)
        {
            Response.Redirect("~/Contacts.aspx");
        }
        else
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM ContactsTable WHERE id=@id AND userName=@userName"))
                {

                    cmd.Parameters.AddWithValue("@UserName", Page.User.Identity.Name);
                    cmd.Parameters.AddWithValue("@id", Request.QueryString["id"].ToString());
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    dr.Read();
                    if (dr.HasRows)
                    {
                        txtname.Text = dr[1].ToString();
                        txtMobile.Text = dr[2].ToString();
                        txtHome.Text = dr[3].ToString();
                        txtEmail.Text = dr[4].ToString();
                        txtCompany.Text = dr[5].ToString();
                        txtOffice.Text = dr[6].ToString();
                        txtWebsite.Text = dr[7].ToString();
                        imgContact.ImageUrl = "~/Handler.ashx?id=" + dr[0].ToString() + "&userName=" + dr[9].ToString();
                    }
                    con.Close();
                }
            }
    }
    
}