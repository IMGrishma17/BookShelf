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
    public partial class WebForm1 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //ViewBooksLoad();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            var bookId = button.CommandArgument;
            Response.Redirect(string.Format("~/BookInfo.aspx?id={0}", bookId));
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            loadFromCategory();
        }

        void loadFromCategory()
        {
            var category = DropDownList1.SelectedItem.Value;
            try
            {

                if (DropDownList1.SelectedIndex == 0)
                {
                    Response.Write("<script>alert('Please Select a Category')</script>");
                }

                else
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("SELECT * FROM Books WHERE Category='" + category + "';", con);
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.HasRows)
                    {
                        GridView1.DataSource = dr;
                        GridView1.DataBind();
                    }

                    else
                    {
                        Response.Write("<script>alert('No book found for that category')</script>");
                    }
                }

                

                    

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void ViewBooksLoad()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM Books", con);
                SqlDataReader dr = cmd.ExecuteReader();

                
                    GridView1.DataSource = dr;
                    GridView1.DataBind();
               

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

    }
}