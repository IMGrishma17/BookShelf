using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookShelf
{
    public partial class BooksUpload : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        static string global_filepath;

        protected void Page_Load(object sender, EventArgs e)
        {
            userBookData();
        }

        //upload button click
        protected void Button1_Click(object sender, EventArgs e)
        {
            addNewBook();
        }

        //update button click
        protected void Button3_Click(object sender, EventArgs e)
        {
            updateBook();
        }

        //delete button click
        protected void Button2_Click(object sender, EventArgs e)
        {
            deleteBook();
        }

        //go button click
        //protected void LinkButton4_Click(object sender, EventArgs e)
        //{
        //    getBookByID();
        //}

        //user defined function

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
                    userBookData();
                    GridView1.DataBind();
                }

                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }

        void updateBook()
        {
            if (TextBox1.Text.Trim().Equals(""))
            {
                Response.Write("<script>alert('Book ID cannot be blank');</script>");
            }

            else
            {
                try
                {
                    string filepath = "~/BooksImg/book%20details.jpg";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if (filename == "" || filename == null)
                    {
                        filepath = global_filepath;
                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("BooksImg/" + filename));
                        filepath = "~/BooksImg/" + filename;
                    }


                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("UPDATE Books SET Book_Name=@book_name,Category=@category,Language=@language,Author_Name=@author_name,Listing_Price=@listing_price,Listing_Address=@listing_address,Book_Description=@book_description,Contact_Info=@contact_info,Book_Img_Link=@book_img_link WHERE Book_Id='" + TextBox1.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@book_name", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@category", ListBox1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@author_name", TextBox5.Text.Trim());

                    cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@listing_price", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@listing_address", TextBox7.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_description", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@contact_info", TextBox4.Text.Trim());

                    cmd.Parameters.AddWithValue("@book_img_link", filepath);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    //clear();
                    Response.Write("<script>alert('Book details Updated');</script>");

                    userBookData();
                }

                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }

        void getBookByID()
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

        void userBookData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                
                SqlCommand cmd = new SqlCommand("SELECT Book_Id,Book_Name,Author_Name,Listing_Price,Book_Description FROM Books WHERE User_Id='"+Session["username"]+"';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void addNewBook()
        {
            try
            {
                //for img file upload
                string filepath = "~/BooksImg/book%20details.jpg";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath(filename));
                //FileUpload1.SaveAs(Server.MapPath("BooksImg/" + filename));
                filepath = filename;
                //filepath = "~/BooksImg/" + filename;

                SqlConnection con = new SqlConnection(strcon);
                if(con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO Books(Book_Name,Category,Language,Author_Name,Listing_Price,Listing_Address,Book_Description,Contact_Info,Book_Img_Link,User_Id) VALUES (@Book_Name,@Category,@Language,@Author_Name,@Listing_Price,@Listing_Address,@Book_Description,@Contact_Info,@Book_Img_Link,@User_Id)", con);

                cmd.Parameters.AddWithValue("@Book_Name", TextBox2.Text.Trim());

                cmd.Parameters.AddWithValue("@Category", ListBox1.SelectedItem.Value);

                cmd.Parameters.AddWithValue("@Language", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Author_Name", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@Listing_Price", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@Listing_Address", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@Book_Description", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@Contact_Info", TextBox4.Text.Trim());

                cmd.Parameters.AddWithValue("@User_Id", Session["username"]);

                cmd.Parameters.AddWithValue("@Book_Img_Link", filepath);


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book added successfully!')</script>");
                userBookData();
            }

            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Button button = (Button)sender;
            //var bookId = button.CommandArgument;
            //Response.Redirect(string.Format("~/BooksUpload.aspx?id={0}", bookId));

            //getBookByID();
        }


        protected void btnDetail_Click(object sender, EventArgs e)
        {
            int rowind = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            TextBox1.Text = GridView1.Rows[rowind].Cells[1].Text;
            getBookByID();
        }
    }
}