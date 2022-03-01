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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //upload button click
        protected void Button1_Click(object sender, EventArgs e)
        {
            addNewBook();
        }

        //update button click
        protected void Button3_Click(object sender, EventArgs e)
        {

        }

        //delete button click
        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        //go button click
        protected void LinkButton4_Click(object sender, EventArgs e)
        {

        }

        //user defined function
        void addNewBook()
        {
            try
            {
                //for img file upload
                string filepath = "~/BooksImg/book%20details.jpg";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("BooksImg/" + filename));
                filepath = "~/BooksImg/" + filename;

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

                cmd.Parameters.AddWithValue("@User_Id", "gm");

                cmd.Parameters.AddWithValue("@Book_Img_Link", filepath);


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book added successfully!')</script>");
            }

            catch(Exception ex)
            {

            }
        }
    }
}