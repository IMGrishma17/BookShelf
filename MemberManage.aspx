<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MemberManage.aspx.cs" Inherits="BookShelf.MemberManage" %>
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
                                    <h4>Member Details</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="120px" src="images/login.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-md-3">
                                <label>Member ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control mr-1" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-primary" ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">GO</asp:LinkButton>                   
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Full Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-5">
                                <label>Account Status</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control mr-1" ID="TextBox3" runat="server" placeholder="Status" ReadOnly="True"></asp:TextBox>

                                        <asp:LinkButton class="btn btn-success mr-1" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"> <i class="fas fa-check-circle"></i> </asp:LinkButton>
                                        <asp:LinkButton class="btn btn-warning mr-1" ID="LinkButton2" runat="server" OnClick="LinkButton2_Click"> <i class="far fa-pause-circle"></i> </asp:LinkButton>
                                        <asp:LinkButton class="btn btn-danger mr-1" ID="LinkButton3" runat="server" OnClick="LinkButton3_Click"> <i class="fas fa-times-circle"></i> </asp:LinkButton>
                                        
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            
                            <div class="col-md-3">
                                <label>DOB</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="DOB" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Contact No</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Contact No" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-5">
                                <label>Email</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Email" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Full Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Full Address" ReadOnly="True" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-8 mx-auto">
                                <asp:Button class="btn btn-lg btn-block btn-danger" ID="Button1" runat="server" Text="Delete User Permanently" OnClick="Button1_Click" />
                            </div>
                        </div>

                    </div>
                </div>
                <a href="home.aspx"><< Back To Home</a>
                <br /> <br />
            </div>

            <div class="col-md-7">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Member List</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookShelfDBConnectionString %>" SelectCommand="SELECT * FROM [Users_Info]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="User_ID" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="User_ID" HeaderText="User ID" ReadOnly="True" SortExpression="User_ID" />
                                        <asp:BoundField DataField="Account_Status" HeaderText="Account Status" SortExpression="Account_Status" />
                                        <asp:BoundField DataField="Full_Name" HeaderText="Full Name" SortExpression="Full_Name" />
                                        <asp:BoundField DataField="Contact_No" HeaderText="Contact" SortExpression="Contact_No" />
                                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                        <asp:BoundField DataField="Full_Address" HeaderText="Address" SortExpression="Full_Address" />
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
