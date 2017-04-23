using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Addcontact : System.Web.UI.Page
{
    private int userId;
    private byte[] raw;
    private string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {



        if (!IsPostBack)
        {
            if (!Page.User.Identity.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
        }
    }
    protected void submitButton_Click(object sender, EventArgs e)
    {


        if ((imgUpload.FileName != ""))
        {
            //to allow only jpg gif and png files to be uploaded.
            string extension = Path.GetExtension(imgUpload.PostedFile.FileName);
            if ((extension == ".jpg") || (extension == ".gif") || (extension == ".png") || (extension == ".bmp"))
            {
                FileStream fs = new FileStream(imgUpload.PostedFile.FileName, FileMode.OpenOrCreate, FileAccess.ReadWrite, FileShare.ReadWrite);

                raw = new byte[fs.Length];
                fs.Read(raw, 0, Convert.ToInt32(fs.Length));

                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("Insert_Contact"))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            if (txtname != null)
                                cmd.Parameters.AddWithValue("@name", txtname.Text.Trim());
                            if (txtMobile != null)
                                cmd.Parameters.AddWithValue("@mobile", Convert.ToInt32(txtMobile.Text.Trim()));
                            else
                                cmd.Parameters.AddWithValue("@mobile", DBNull.Value);

                            if (txtHome.Text != string.Empty)
                                cmd.Parameters.AddWithValue("@home", Convert.ToInt32(txtHome.Text.Trim()));
                            else
                                cmd.Parameters.AddWithValue("@home", DBNull.Value);
                            if (txtEmail.Text != string.Empty)
                                cmd.Parameters.AddWithValue("@email", Convert.ToInt32(txtEmail.Text.Trim()));
                            else
                                cmd.Parameters.AddWithValue("@email", DBNull.Value);
                            if (txtCompany.Text != string.Empty)
                                cmd.Parameters.AddWithValue("@company", Convert.ToInt32(txtCompany.Text.Trim()));
                            else
                                cmd.Parameters.AddWithValue("@company", DBNull.Value);
                            if (txtOffice.Text != string.Empty)
                                cmd.Parameters.AddWithValue("@office", Convert.ToInt32(txtOffice.Text.Trim()));
                            else
                                cmd.Parameters.AddWithValue("@office", DBNull.Value);
                            if (txtWebsite.Text != string.Empty)
                                cmd.Parameters.AddWithValue("@website", Convert.ToInt32(txtWebsite.Text.Trim()));
                            else
                                cmd.Parameters.AddWithValue("@website", DBNull.Value);

                            cmd.Parameters.AddWithValue("@image", raw);
                            cmd.Parameters.AddWithValue("@userName", Page.User.Identity.Name);

                            cmd.Connection = con;
                            con.Open();
                            userId = Convert.ToInt32(cmd.ExecuteScalar());
                            con.Close();
                        }
                    }
                }
            }
        }
        else
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Insert_Contact"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        if (txtname.Text != string.Empty)
                            cmd.Parameters.AddWithValue("@name", txtname.Text.Trim());

                        if (txtMobile.Text != string.Empty)
                            cmd.Parameters.AddWithValue("@mobile", Convert.ToInt32(txtMobile.Text.Trim()));
                        else
                            cmd.Parameters.AddWithValue("@mobile", DBNull.Value);

                        if (txtHome.Text != string.Empty)
                            cmd.Parameters.AddWithValue("@home", Convert.ToInt32(txtHome.Text.Trim()));
                        else
                            cmd.Parameters.AddWithValue("@home", DBNull.Value);
                        if (txtEmail.Text != string.Empty)
                            cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                        else
                            cmd.Parameters.AddWithValue("@email", DBNull.Value);
                        if (txtCompany.Text != string.Empty)
                            cmd.Parameters.AddWithValue("@company", Convert.ToInt32(txtCompany.Text.Trim()));
                        else
                            cmd.Parameters.AddWithValue("@company", DBNull.Value);
                        if (txtOffice.Text != string.Empty)
                            cmd.Parameters.AddWithValue("@office", Convert.ToInt32(txtOffice.Text.Trim()));
                        else
                            cmd.Parameters.AddWithValue("@office", DBNull.Value);
                        if (txtWebsite.Text != string.Empty)
                            cmd.Parameters.AddWithValue("@website", txtWebsite.Text.Trim());
                        else
                        { cmd.Parameters.AddWithValue("@website", string.Empty); }

                        cmd.Parameters.Add("@image", SqlDbType.Image).Value = DBNull.Value;
                        cmd.Parameters.AddWithValue("@userName", Page.User.Identity.Name);
                        cmd.Connection = con;
                        con.Open();
                        userId = Convert.ToInt32(cmd.ExecuteScalar());
                        con.Close();
                    }
                }
            }
        }
        string message = string.Empty;
        switch (userId)
        {
            case -1:
                message = "Username already exists.\\nPlease choose a different username.";
                break;

            default:
                message = "Contact saved successfuly.\\nContact Id: " + userId.ToString();

                break;
        }
        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');", true);
        Response.Redirect("Default.aspx");
    }
    
}



