using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookShelf
{
    public partial class UserLogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                if ((TextBox1.Text.Trim() == "admin") && (TextBox2.Text.Trim() == "admin"))
                {
                    Session["role"] = "admin";
                    Response.Redirect("home.aspx");
                    Response.Write("<script>alert('Login Successful');</script>");
                }

                else
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM Users_Info WHERE User_ID='" + TextBox1.Text.Trim() + "' AND Password='" + TextBox2.Text.Trim() + "'", con);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {


                            Session["username"] = dr.GetValue(5).ToString();
                            Session["fullname"] = dr.GetValue(0).ToString();
                            Session["role"] = "user";
                            Session["status"] = dr.GetValue(7).ToString();
                            Response.Redirect("home.aspx");
                            Response.Write("<script>alert('Login Successful');</script>");

                        }

                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid credentials');</script>");
                    }
                }

                //SqlCommand cmd = new SqlCommand("SELECT * FROM Users_Info WHERE User_ID='"+TextBox1.Text.Trim()+ "' AND Password='"+TextBox2.Text.Trim()+"'", con);
                //SqlDataReader dr = cmd.ExecuteReader();
                //if (dr.HasRows)
                //{
                //    while (dr.Read())
                //    {


                //        Session["username"] = dr.GetValue(5).ToString();
                //        Session["fullname"] = dr.GetValue(0).ToString();
                //        Session["role"] = "user";
                //        Session["status"] = dr.GetValue(7).ToString();
                //        Response.Redirect("home.aspx");
                //        Response.Write("<script>alert('Login Successful');</script>");

                //    }

                //}
                //else
                //{
                //    Response.Write("<script>alert('Invalid credentials');</script>");
                //}
            }

            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

            clear();
            //Response.Write("<script>alert('Login');</script>");
        }

        void clear()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}