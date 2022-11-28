<%@ Page Title="" Language="C#" MasterPageFile="~/Panel.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="MinerAdmin.Dashboard" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-xl-4 col-sm-4 col-12">
            <div class="card">
                <div class="card-body">
                    <div class="dash-widget-header">
                        <span class="dash-widget-icon bg-primary">
                            <i class="fe fe-users"></i>
                        </span>
                        <div class="dash-count">
                            <a href="#" class="count-title">User Count</a>
                            <a href="#" class="count">
                                <asp:Label ID="lblUserCount" runat="server" Text=""></asp:Label></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-4 col-sm-4 col-12">
            <div class="card">
                <div class="card-body">
                    <div class="dash-widget-header">
                        <span class="dash-widget-icon bg-warning">
                            <i class="fe fe-phone"></i>
                        </span>
                        <div class="dash-count">
                            <a href="#" class="count-title">Call Duration</a>
                            <a href="#" class="count">14,628</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-4 col-sm-4 col-12">
            <div class="card">
                <div class="card-body">
                    <div class="dash-widget-header">
                        <span class="dash-widget-icon bg-danger">
                            <i class="fe fe-comments"></i>
                        </span>
                        <div class="dash-count">
                            <a href="#" class="count-title">Chat Count</a>
                            <a href="#" class="count">2,980</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 d-flex">

            <div class="card flex-fill">
                <div class="card-header">
                    <h4 class="card-title float-start">User List</h4>
                    <div class="table-search float-end">
                        <input type="text" class="form-control" placeholder="Search">
                        <button class="btn" type="submit"><i class="fa fa-search"></i></button>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">

                        <asp:Repeater ID="Repeater1" runat="server">
                            <HeaderTemplate>
                                <table class="datatable table table-stripped">
                                    <thead>
                                        <tr>
                                            <th>User Name</th>
                                            <th>Full Name</th>
                                            <th class="text-center">Cellphone</th>
                                            <th class="text-center">Email</th>
                                            <th class="text-end">Status</th>
                                            <th class="text-end">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>

                            <ItemTemplate>
                                <tr>
                                    <td class="text-nowrap">
                                        <%# Eval("Username") %>
                                    </td>
                                    <td class="text-nowrap"><%# Eval("Name") %> <%# Eval("Family") %></td>
                                    <td class="text-center"><%# Eval("CellPhone") %></td>
                                    <td class="text-center"><%# Eval("Email") %></td>

                                    <td class="text-end">
                                        <div class='font-weight-600 text-<%# Eval("IsActivated").ToString() == "True" ? "success" : "danger" %> '><%# Eval("IsActivated").ToString() == "True" ? "Active" : "InActive" %></div>
                                    </td>
                                    <td class="text-end">
                                        <div class="actions">
                                            <a href='/Users/UserDetails?userid=<%# Eval("Id") %>' class="btn btn-sm bg-success-light me-2">
                                                <i class="fe fe-pencil"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                        </table>
                            </FooterTemplate>



                        </asp:Repeater>


                    </div>
                </div>
            </div>

        </div>
    </div>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:minerappConnectionString %>" SelectCommand="SELECT * FROM [Users] ORDER BY [Created] DESC"></asp:SqlDataSource>
</asp:Content>


