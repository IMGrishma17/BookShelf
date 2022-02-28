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
    public partial class SignUp : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //sign up button click event
        protected void SignUpBtn_Click(object sender, EventArgs e)
        {
            if (checkUsernameExists())
            {
                Response.Write("<script>alert('Username already exists. Try another username');</script>");
            }
            else
            {
                UserSignup();
            }

            clear();
        }

        //user defined method

        bool checkUsernameExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM Users_Info where User_ID='"+UserTxt.Text.Trim()+"' ;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }


                con.Close();

                Response.Write("<script>alert('Sign Up Successful! Go to Login page to Login');</script>");
            }
            catch (Exception ex)
            {
                //dynamic exception caught is displayed
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }


            return false;
        }

        void UserSignup()
        {
            //Response.Write("<script>alert('Testing');</script>");

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO Users_Info(Full_Name,DOB,Contact_No,Email,Full_Address,User_ID,Password,Account_Status) VALUES(@full_name,@dob,@contact_no,@email,@full_address,@user_id,@password,@account_status)", con);

                cmd.Parameters.AddWithValue("@full_name", FnameTxt.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", DobTxt.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", ConTxt.Text.Trim());
                cmd.Parameters.AddWithValue("@email", EmailTxt.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", AddTxt.Text.Trim());
                cmd.Parameters.AddWithValue("@user_id", UserTxt.Text.Trim());
                cmd.Parameters.AddWithValue("@password", PasswordTxt.Text.Trim());
                cmd.Parameters.AddWithValue("@account_status", "pending");

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Sign Up Successful! Go to Login page to Login');</script>");
            }
            catch (Exception ex)
            {
                //dynamic exception caught is displayed
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

            clear();
        }

        
        void clear()
        {
            FnameTxt.Text = "";
            DobTxt.Text = "";
            ConTxt.Text = "";
            EmailTxt.Text = "";
            AddTxt.Text = "";
            UserTxt.Text = "";
            PasswordTxt.Text = "";
        }

    }
}