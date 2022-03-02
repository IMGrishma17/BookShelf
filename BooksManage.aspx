<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BooksManage.aspx.cs" Inherits="BookShelf.BooksManage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>


</asp:Content>

    
<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceHolder1" runat="server">

    <br />
<br />

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">

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
                                    <img id="imgview" height="150px" width="160px" src="BooksImg/book%20details.jpg" />
                                </center>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                                <asp:FileUpload onchange="readURL(this);" class="form-control" ID="FileUpload1" runat="server" />  
                            </div>
                        </div>
                        <br />
                        <div class="row">

                            <div class="col-md-3">
                                <label>Book ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control mr-1" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-primary" ID="LinkButton4" runat="server" >GO</asp:LinkButton>                   
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-9">
                                <label>Book Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Book Name" ></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ErrorMessage="* Enter the book name *" ControlToValidate="TextBox2" ForeColor="Red"></asp:RequiredFieldValidator>
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
                                    <asp:ListBox CssClass="form-control" ID="ListBox1" runat="server" Rows="4">
                                        <asp:ListItem Text="Fantasy" Value="Fantasy" />
                                        <asp:ListItem Text="Science-Fiction" Value="Si-Fiction" />
                                        <asp:ListItem Text="Romance" Value="Romance" />
                                        <asp:ListItem Text="Crime" Value="Crime" />
                                        <asp:ListItem Text="Drama" Value="Drama" />
                                        <asp:ListItem Text="Poetry" Value="Poetry" />
                                        <asp:ListItem Text="MBBS" Value="MBBS" />
                                        <asp:ListItem Text="Engineering" Value="Engineering" />
                                        <asp:ListItem Text="IT" Value="IT" />
                                        <asp:ListItem Text="Law" Value="Law" />
                                    </asp:ListBox>
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
                                <asp:Button class="btn btn-lg btn-block btn-warning" ID="Button3" runat="server" Text="Update"  />
                            </div>

                            <div class="col-md-4">
                                <asp:Button class="btn btn-lg btn-block btn-danger" ID="Button2" runat="server" Text="Delete"  />
                            </div>

                        </div>

                    </div>
                </div>
                <br />
                <a href="home.aspx"><< Back To Home</a>
                <br /> <br />
            </div>

            <div class="col-md-7">

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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookShelfDBConnectionString %>" SelectCommand="SELECT * FROM [Books]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Book_Id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="Book_Id" HeaderText="Book Id" InsertVisible="False" ReadOnly="True" SortExpression="Book_Id" />
                                        
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <div class="col-lg-10">

                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Book_Name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-12">

                                                                    Author -
                                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("Author_Name") %>'></asp:Label>
                                                                    &nbsp;| Category -
                                                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("Category") %>'></asp:Label>
                                                                    &nbsp;| Language -
                                                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("Language") %>'></asp:Label>

                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-12">

                                                                    Uploaded by User -
                                                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("User_Id") %>'></asp:Label>
                                                                    &nbsp;| Listing Price -
                                                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("Listing_Price") %>'></asp:Label>

                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-12">

                                                                    Listing Address -
                                                                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("Listing_Address") %>'></asp:Label>

                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-12">

                                                                    Contact Info -
                                                                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("Contact_Info") %>'></asp:Label>

                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-12">

                                                                    Description of Book -
                                                                    <asp:Label ID="Label9" runat="server" Font-Bold="False" Font-Italic="True" Font-Size="Smaller" Text='<%# Eval("Book_Description") %>'></asp:Label>

                                                                </div>
                                                            </div>

                                                        </div>

                                                        <div class="col-lg-2">
                                                            <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("Book_Img_Link") %>' />
                                                        </div>

                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                    </Columns>
                                </asp:GridView>

                            </div>
                        </div>

                    </div>
                </div>

            </div>

        </div>



    </div>

</asp:Content>
