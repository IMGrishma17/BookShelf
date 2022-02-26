<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BooksUpload.aspx.cs" Inherits="BookShelf.BooksUpload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceHolder1" runat="server">

<br />
<br />

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Book Details</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="160px" src="images/book%20details.jpg" />
                                </center>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                                <asp:FileUpload class="form-control" ID="FileUpload1" runat="server" />  
                            </div>
                        </div>
                        <br />
                        <div class="row">

                            <div class="col-md-3">
                                <label>Book ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control mr-1" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-primary" ID="LinkButton4" runat="server">GO</asp:LinkButton>                   
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-9">
                                <label>Book Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Book Name" ></asp:TextBox>
                                </div>
                            </div>


                        </div>

                        <div class="row">
                            
                            <div class="col-md-4">
                                <label>Language</label>
                                <div class="form-group">
                                    <asp:DropDownList Class="form-control" ID="DropDownList1" runat="server">
                                        <asp:ListItem Text="English" Value="English" />
                                        <asp:ListItem Text="Nepali" Value="Nepali" />
                                        <asp:ListItem Text="Hindi" Value="Hindi" />
                                        <asp:ListItem Text="French" Value="French" />
                                        <asp:ListItem Text="Urdu" Value="Urdu" />
                                        <asp:ListItem Text="Sanskrit" Value="Sanskrit" />
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-8">
                                <label>Author Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Author Name" ></asp:TextBox>
                                </div>
                            </div>


                        </div>

                        <div class="row">
                            <div class="col-md-8">
                                <label>Category </label>
                                <div class="form-group">
                                    <asp:ListBox ID="ListBox1" runat="server"></asp:ListBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Description of Book </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Book Description"  TextMode="MultiLine" Rows="4"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Listing Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Listing Address"  TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Contact Info</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Contact Info"  TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Listing Price</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Price" ></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <asp:Button class="btn btn-lg btn-block btn-success" ID="Button1" runat="server" Text="Upload" />
                            </div>

                            <div class="col-md-4">
                                <asp:Button class="btn btn-lg btn-block btn-warning" ID="Button3" runat="server" Text="Update" />
                            </div>

                            <div class="col-md-4">
                                <asp:Button class="btn btn-lg btn-block btn-danger" ID="Button2" runat="server" Text="Delete" />
                            </div>
                        </div>

                    </div>
                </div>
                <br />
                <a href="home.aspx"><< Back To Home</a>
                <br /> <br />
            </div>

            <div class="col-md-6">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Books You have Listed</h4>
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
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server"></asp:GridView>
                            </div>
                        </div>

                    </div>
                </div>

            </div>

        </div>



    </div>


</asp:Content>
