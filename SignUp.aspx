<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="BookShelf.SignUp" %>
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
                                    <h3>User Sign Up</h3>
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
                                    <asp:TextBox CssClass="form-control" ID="FnameTxt" runat="server" placeholder="Full Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ErrorMessage="* Enter your name *" ControlToValidate="FnameTxt" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Date Of Birth</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="DobTxt" runat="server" TextMode="Date"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorDob" runat="server" ErrorMessage="* Enter your DOB *" ControlToValidate="DobTxt" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                        </div>


                        <div class="row">
                            <div class="col-md-5">
                                <label>Contact Number</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="ConTxt" runat="server" placeholder="Contact Number" TextMode="Number"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorContact" runat="server" ErrorMessage="* Enter your Contact Number *" ControlToValidate="ConTxt" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-md-7">
                                <label>Email ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="EmailTxt" runat="server" placeholder="Email ID" TextMode="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="* Enter your Email *" ControlToValidate="EmailTxt" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                        </div>


                        <div class="row">
                            <div class="col">
                                <label>Full Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="AddTxt" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorAddress" runat="server" ErrorMessage="* Enter your Address *" ControlToValidate="AddTxt" ForeColor="Red"></asp:RequiredFieldValidator>
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
                            <div class="col-md-6">
                                <label>Username</label>
                                <div class="form-group">
                                    <asp:TextBox Class="form-control" ID="UserTxt" runat="server" placeholder="Username" ></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" runat="server" ErrorMessage="* Enter a Username *" ControlToValidate="UserTxt" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Password</label>
                                <div class="form-group">
                                    <asp:TextBox Class="form-control" ID="PasswordTxt" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ErrorMessage="* Enter a Password *" ControlToValidate="PasswordTxt" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                        </div>


                        <div class="row">
                            <div class="col">
                               <div class="form-group">
                                    <asp:Button class="btn btn-success btn-block btn-lg" ID="SignUpBtn" runat="server" Text="Sign Up" OnClick="SignUpBtn_Click"  />
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
            </div>
        </div>

    </div>

</asp:Content>
