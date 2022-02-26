<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="BookShelf.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceHolder1" runat="server">

    <div class="homeInfo">
        <h2 align="center" style="font-family: 'Caveat', cursive; color: black"> Best Place for Buying and Selling Secondhand Books</h2>
    </div>

    <section>
        <center>
        <img src="images/background%20books.png" height="400px" width="98%"/>
        </center>
    </section>
    <br />
    <br />
    <section>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h2 align="center">Our Features</h2>
                </div>
            </div>
            <br />

            <div class="row">
                <div class="col-md-4">
                    <center>
                    <img width="150px" src="images/online%20bookstore.jpg" />
                    <h4>Upload Your Books for Sale</h4>
                    <p>Have you got any books hanging around that you have already read? Upload them to the site, 
                       and we'll assist you in finding a new home for your old books!</p>
                    </center>
                </div>

                <div class="col-md-4">
                    <center>
                    <img width="140px" src="images/search%20book.png" />
                    <h4>Search Books</h4>
                    <p>Want to read books but can't afford to buy them new? Don't be concerned! 
                       Find books that spark your interest and are within your budget on our website.</p>
                    </center>
                </div>

                <div class="col-md-4">
                    <center>
                    <img width="190px" src="images/virtual%20connect.jpg" />
                    <h4>Connect with Users</h4>
                    <p>The practice of reading books is widespread over the world. Connect with people from all over,
                        who share your interests and have come to this website with similar goals.</p>
                    </center>
                </div>

            </div>

        </div>

    </section>

    
    <br />
    <br />


    

</asp:Content>
