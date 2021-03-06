<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="BookShelf.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceHolder1" runat="server">
    <br />
    <br />

    <div class="container">
        
        <div class="row">
            <%-- col can be divided upto 12 parts, md(medium device) to keep proper format for shrink or mob devices, ms-auto bs class for center align  --%>
            <div class="col-md-6 mx-auto"> 
                <%-- card is an inbuilt bootstrap class which gives proper formatting --%>
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="180px" src="images/admin%20login.jpg" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Admin Login</h3>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <%-- form-group is a bs class which makes the div form enabled with bs styling --%>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Email"></asp:TextBox>

                                </div>

                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>

                                </div>

                                <%-- btn-success is for color, block for whole legth block, lg for large size --%>
                                <div class="form-group">
                                    <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Log In" />
                                </div>

                                
                            </div>
                        </div>

                    </div>
                </div>

                <br />
                <a href="home.aspx"> << Back To Home </a>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </div>
        </div>

    </div>


</asp:Content>
