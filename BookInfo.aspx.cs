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
    public partial class BookInfo : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            //var id = Request.QueryString["id"];
            SqlDataSource1.SelectParameters["Id"].DefaultValue = Request.QueryString["id"];
            //SqlDataSource1.SelectParameters.Add("id", DbType.String, id.ToString());

        }

        //comment post button click
        protected void Button1_Click(object sender, EventArgs e)
        {

            if (TextBox1.Text.Trim().Equals(""))
            {
                Response.Write("<script>alert('Comment field cannot be blank');</script>");
            }
            else
            {
                PostComment();
            }

            

        }

        void PostComment()
        {
            var Book_Id = Request.QueryString["id"];

            //foreach (GridViewRow row in GridView1.Rows)
            //{
                var Owner_Id = GridView1.Rows[0].Cells[0];
            //}

            //var Owner_Id = GridView1.Rows[i].Cells[3].Text;

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO Comments(Comments,Book_Owner_Id,Commented_User_Id,Book_Id) VALUES (@Comments,@Book_Owner_Id,@Commented_User_Id,@Book_Id)", con);

                cmd.Parameters.AddWithValue("@Comments", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@Book_Owner_Id", Owner_Id);
                cmd.Parameters.AddWithValue("@Commented_User_Id", Session["username"]);
                cmd.Parameters.AddWithValue("@Book_Id", Book_Id);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Comment added successfully!')</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}