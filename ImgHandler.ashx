<%@ WebHandler Language="C#" Class="ImgHandler" %>

using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Data.SqlClient;
public class ImgHandler : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        if (context.Request.QueryString["id"] != null)
        {
            // context.Response.Write(context.Request.QueryString["id"]);
            string dbcon = ConfigurationManager.ConnectionStrings["AdvWorks"].ConnectionString;
            SqlConnection con = new SqlConnection(dbcon);
            con.Open();
            SqlCommand cmd = new SqlCommand("Select image from ContactsTable where id=@id AND userName=@userName", con);
            cmd.Parameters.AddWithValue("@id", context.Request.QueryString["id"].ToString());
            cmd.Parameters.AddWithValue("@username", context.Request.QueryString["userName"].ToString());
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            context.Response.BinaryWrite((byte[])dr["image"]);
            dr.Close();
            con.Close();
        }
        else
        {
            context.Response.Write("No Image Found");
        }
    }
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}