using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookShelf
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //try
            //{
                //        if (Session["role"].Equals(""))
                //        {
                //            LinkButton2.Visible = true; //user login link button
                //            LinkButton3.Visible = true; //Sign up link button

                //            LinkButton4.Visible = false; //logout link button
                //            LinkButton5.Visible = false; //hello user link button

                //            LinkButton6.Visible = true; //admin login link button
                //            LinkButton7.Visible = false; //manage member link button
                //            LinkButton8.Visible = false; //book manage link button
                //        }
                //        else
            //    if (Session["role"].Equals("user"))
            //    {
            //        LinkButton2.Visible = false; //user login link button
            //        LinkButton3.Visible = false; //Sign up link button

            //        LinkButton4.Visible = true; //logout link button
            //        LinkButton5.Visible = true; //hello user link button
            //        LinkButton5.Text = "Hello " + Session["fullname"].ToString();

            //        LinkButton6.Visible = false; //admin login link button
            //        LinkButton7.Visible = false; //manage member link button
            //        LinkButton8.Visible = false; //book manage link button
            //    }

            //}
            //catch (Exception ex)
            //{
            //    Response.Write("<script>alert('" + ex.Message + "');</script>");
            //}

        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }
    }
}