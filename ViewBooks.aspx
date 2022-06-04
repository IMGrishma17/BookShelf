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

            <div class="row">
                <div class="col-10">
                    <asp:DropDownList ID="DropDownList1" Class="form-control" runat="server">
                    <asp:ListItem Value="0">- Category -</asp:ListItem>
                    <asp:ListItem Text="Fantasy" Value="Fantasy" />
                    <asp:ListItem Text="Fiction" Value="Fiction" />
                    <asp:ListItem Text="Science-Fiction" Value="Si-Fiction" />
                    <asp:ListItem Text="Romance" Value="Romance" />
                    <asp:ListItem Text="Crime" Value="Crime" />
                    <asp:ListItem Text="Drama" Value="Drama" />
                    <asp:ListItem Text="Poetry" Value="Poetry" />
                    <asp:ListItem Text="Class 10" Value="Class 10" />
                    <asp:ListItem Text="MBBS" Value="MBBS" />
                    <asp:ListItem Text="Engineering" Value="Engineering" />
                    <asp:ListItem Text="IT" Value="IT" />
                    <asp:ListItem Text="Law" Value="Law" />
                </asp:DropDownList>
                </div>
                
                <div class="col-2">
                    <%--<asp:LinkButton class="btn btn-primary" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">GO</asp:LinkButton>--%>
                    <asp:Button ID="Button2" class="btn btn-primary" runat="server" OnClick="LinkButton1_Click" Text="GO" />
                </div>

            </div>

            


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
                                <%--DataSourceID="SqlDataSource1"--%>
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Book_Id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
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
                                                        <center>
                                                        <asp:Button ID="Button1" cssClass="btn btn-info" runat="server" Text="View Info" CommandArgument='<%#Eval("Book_Id")%>' OnClick="Button1_Click" />
                                                        </center>
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
