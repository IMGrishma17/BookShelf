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
    public partial class BooksManage : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //go button click
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            getBookByID();
        }

        //update button click
        //protected void Button3_Click(object sender, EventArgs e)
        //{

        //}

        //delete button click
        protected void Button2_Click(object sender, EventArgs e)
        {
            deleteBook();
            clear();
        }


        void getBookByID()
        {

            if (TextBox1.Text.Trim().Equals(""))
            {
                Response.Write("<script>alert('Book ID cannot be blank');</script>");
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

                    SqlCommand cmd = new SqlCommand("SELECT * FROM Books WHERE Book_Id='" + TextBox1.Text.Trim() + "'", con);
                    SqlDataReader dr = cmd.ExecuteReader();
                    var folderpath = Server.MapPath("~/BooksImg/");
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            TextBox2.Text = dr.GetValue(1).ToString();
                            DropDownList1.SelectedValue = dr.GetValue(3).ToString().Trim();
                            TextBox5.Text = dr.GetValue(4).ToString();

                            ListBox1.ClearSelection();
                            string category = dr.GetValue(2).ToString().Trim();

                            for (int j = 0; j < ListBox1.Items.Count; j++)
                            {
                                if (ListBox1.Items[j].ToString() == category)
                                {
                                    ListBox1.Items[j].Selected = true;
                                }
                            }

                            TextBox3.Text = dr.GetValue(7).ToString();
                            TextBox7.Text = dr.GetValue(6).ToString();
                            TextBox4.Text = dr.GetValue(8).ToString();
                            TextBox6.Text = dr.GetValue(5).ToString();
                            FileUpload1.SaveAs(folderpath + dr.GetValue(9).ToString());
                            global_filepath = dr.GetValue(9).ToString();
                        }


                    }



                    else
                    {
                        Response.Write("<script>alert('Invalid Book ID')</script>");
                    }



                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "')</script>");
                }
            }


        }

        void deleteBook()
        {
            if (TextBox1.Text.Trim().Equals(""))
            {
                Response.Write("<script>alert('Book ID cannot be blank');</script>");
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

                    SqlCommand cmd = new SqlCommand("DELETE FROM Books WHERE Book_Id='" + TextBox1.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Book deleted Permanently');</script>");
                    //clear();
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
            TextBox3.Text = "";
            TextBox7.Text = "";
            TextBox4.Text = "";
            TextBox6.Text = "";
            TextBox2.Text = "";
            TextBox5.Text = "";
            ListBox1.Items.Clear();
            TextBox1.Text = "";
        }
    }
}