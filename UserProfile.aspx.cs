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
    
    public partial class UserProfile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"].ToString() == "" || Session["username"] == null)
                {
                    Response.Write("<script>alert('Session Expired. Login Again');</script>");
                    Response.Redirect("userlogin.aspx");
                }
                else
                {

                    getUserInfo();
                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("UserLogin.aspx");
            }


        }

        //user defined function
        void getUserInfo()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM Users_Info WHERE User_Id='" + Session["username"] + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                TextBox1.Text = dt.Rows[0]["Full_Name"].ToString();
                TextBox2.Text = dt.Rows[0]["DOB"].ToString();
                TextBox3.Text = dt.Rows[0]["Contact_No"].ToString();
                TextBox4.Text = dt.Rows[0]["Email"].ToString();
                TextBox5.Text = dt.Rows[0]["Full_Address"].ToString();
                TextBox6.Text = dt.Rows[0]["User_ID"].ToString();
                TextBox7.Text = dt.Rows[0]["Password"].ToString();

                Label1.Text = dt.Rows[0]["Account_Status"].ToString().Trim();

                if (dt.Rows[0]["Account_Status"].ToString().Trim() == "active")
                {
                    Label1.Attributes.Add("class", "badge badge-pill badge-success");
                }
                else if (dt.Rows[0]["Account_Status"].ToString().Trim() == "pending")
                {
                    Label1.Attributes.Add("class", "badge badge-pill badge-warning");
                }
                else if (dt.Rows[0]["Account_Status"].ToString().Trim() == "deactive")
                {
                    Label1.Attributes.Add("class", "badge badge-pill badge-danger");
                }
                else
                {
                    Label1.Attributes.Add("class", "badge badge-pill badge-info");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        //update button click
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"].ToString() == "" || Session["username"] == null)
                {
                    Response.Write("<script>alert('Session Expired. Login Again');</script>");
                    Response.Redirect("userlogin.aspx");
                }
                else
                {

                    updateUserInfo();
                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("UserLogin.aspx");
            }
        }

        void updateUserInfo()
        {
            string password = "";

            if (TextBox8.Text.Trim() == "")
            {
                password = TextBox7.Text.Trim();
            }
            else
            {
                password = TextBox8.Text.Trim();
            }

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE Users_Info SET Full_Name=@full_name, DOB=@dob, Contact_No=@contact_no, Email=@email, Full_Address=@full_address, Password=@password, Account_Status=@account_status WHERE User_ID='" + Session["username"] + "'", con);

                cmd.Parameters.AddWithValue("@full_name", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@email", TextBox4.Text.Trim()); 
                cmd.Parameters.AddWithValue("@full_address", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@account_status", "pending");

                int result = cmd.ExecuteNonQuery();
                con.Close();

                if (result > 0)
                {

                    Response.Write("<script>alert('Your Details Updated Successfully');</script>");
                    getUserInfo();
                }
                else
                {
                    Response.Write("<script>alert('Invaid entry');</script>");
                }

            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}