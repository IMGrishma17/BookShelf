<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewBooks.aspx.cs" Inherits="BookShelf.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="contentPlaceHolder1" runat="server">
    
    <br />
    
    <div class="container">
        <div class="row">

            <div class="col-sm-12">
                
                <div class="row">
                    <div class="col-sm-12 col-md-12">
                        <asp:Panel CssClass="alert alert-success" roles="alert" ID="Panel1" runat="server" Visible="false">
                            <asp:Label ID="Label1" runat="server" Text="Label1"></asp:Label>
                        </asp:Panel>

                    </div>
                </div>
                <br />

                <div class="row">

                     <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Books Listed by Users</h4>
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
                                        <asp:BoundField DataField="User_Id" HeaderText="Uploaded by User ID" InsertVisible="False" ReadOnly="True" SortExpression="User_Id" />
                                        
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

                                                                     Listing Price -
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
    </div>


    <br />
    <br />
</asp:Content>
