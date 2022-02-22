<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="BookShelf.UserProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceHolder1" runat="server">
    <br />
    <br />

    <div class="container">
        
        <div class="row">
            <%-- col can be divided upto 12 parts, md to keep proper format for medium or greater than medium devices: laptop and all, ms-auto bs class for center align  --%>
            <div class="col-md-8 mx-auto"> 
                <%-- card is an inbuilt bootstrap class which gives proper formatting --%>
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="120px" src="images/login.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Your Profile</h3>
                                    <span>Account Status - </span>
                                    <asp:Label class="badge badge-pill badge-info" ID="Label1" runat="server" Text="Status"></asp:Label>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-6">
                                <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Date Of Birth</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>

                        </div>


                        <div class="row">
                            <div class="col-md-6">
                                <label>Contact Number</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Contact Number" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Email ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email ID" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>

                        </div>


                        <div class="row">
                            <div class="col">
                                <label>Full Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>

                        </div>


                        <div class="row">
                            
                            <div class="col">
                                <center>
                               <span class="badge badge-pill badge-info">Login Credentials</span>
                                </center>
                            </div>
                            
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-md-4">
                                <label>User ID</label>
                                <div class="form-group">
                                    <asp:TextBox Class="form-control" ID="TextBox6" runat="server" placeholder="User ID" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Old Password</label>
                                <div class="form-group">
                                    <asp:TextBox Class="form-control" ID="TextBox7" runat="server" placeholder="Password" TextMode="Password" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>New Password</label>
                                <div class="form-group">
                                    <asp:TextBox Class="form-control" ID="TextBox8" runat="server" placeholder="Password" TextMode="Password" ></asp:TextBox>
                                </div>
                            </div>

                        </div>


                        <div class="row">
                            <div class="col">
                               <center>
                               <div class="form-group">
                                    <asp:Button class="btn btn-primary btn-lg" ID="Button1" runat="server" Text="Update" />
                                </div>
                                </center>
                            </div>
                        </div>

                    </div>
                </div>

                <br />
                <a href="home.aspx"> << Back To Home </a>
                <br />
                <br />
                <br />
            </div>
        </div>

    </div>

</asp:Content>
