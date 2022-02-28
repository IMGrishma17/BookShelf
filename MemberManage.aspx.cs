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
    public partial class MemberManage : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        //go button
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            getUserByID();
        }

        //active status
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            updateUserStatus("active");
        }

        //pending status
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            updateUserStatus("pending");
        }

        //deactivate status
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            updateUserStatus("deactive");
        }

        //delete user button
        protected void Button1_Click(object sender, EventArgs e)
        {
            deleteUser();
        }


        //user defined function

        void deleteUser()
        {
            if (TextBox1.Text.Trim().Equals(""))
            {
                Response.Write("<script>alert('User ID cannot be blank');</script>");
            }

            else
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE FROM Users_Info WHERE User_ID='" + TextBox1.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('User deleted Permanently');</script>");
                    clear();
                    GridView1.DataBind();
                }

                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }

        void clear()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox4.Text = "";
        }

        void updateUserStatus(string status)
        {
            if (TextBox1.Text.Trim().Equals(""))
            {
                Response.Write("<script>alert('User ID cannot be blank');</script>");
            }

            else
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("UPDATE Users_Info SET Account_Status='" + status + "' WHERE User_ID='" + TextBox1.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    clear();
                    Response.Write("<script>alert('User Status Updated');</script>");
                }

                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }

        void getUserByID()
        {
            if (TextBox1.Text.Trim().Equals(""))
            {
                Response.Write("<script>alert('User ID cannot be blank');</script>");
            }

            else
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("SELECT * FROM Users_Info WHERE User_ID='" + TextBox1.Text.Trim() + "'", con);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            TextBox2.Text = dr.GetValue(0).ToString();
                            TextBox3.Text = dr.GetValue(7).ToString();
                            TextBox4.Text = dr.GetValue(1).ToString();
                            TextBox5.Text = dr.GetValue(2).ToString();
                            TextBox6.Text = dr.GetValue(3).ToString();
                            TextBox7.Text = dr.GetValue(4).ToString();
                            TextBox4.Text = dr.GetValue(1).ToString();
                        }

                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid credentials');</script>");
                    }
                }

                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }
    }
}