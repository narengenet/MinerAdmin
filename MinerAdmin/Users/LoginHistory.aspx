<%@ Page Title="" Language="C#" MasterPageFile="~/Panel.Master" AutoEventWireup="true" CodeBehind="LoginHistory.aspx.cs" Inherits="MinerAdmin.Users.LoginHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="row">
        <div class="col-md-12 d-flex">

            <div class="card flex-fill">
                <div class="card-header">
                    <h4 class="card-title float-start">Login History</h4>
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
                                            <th>Device Model</th>
                                            <th class="text-center">IMEI</th>
                                            <th class="text-center">First Login</th>
                                            <th class="text-center">Last Activity</th>
                                            <th class="text-center">Still Login</th>
                                            <th class="text-center">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>

                            <ItemTemplate>
                                <tr>
                                    <td class="text-nowrap">
                                        <%# Eval("Username") %>
                                    </td>
                                    <td class="text-nowrap"><%# Eval("DeviceModel") %></td>
                                    <td class="text-center"><%# Eval("IMEI") %></td>
                                    <td class="text-center"><%# Eval("Created") %></td>
                                    <td class="text-center"><%# Eval("LastModified") %></td>

                                    <td class="text-end">
                                        <div class='font-weight-600 text-<%# Eval("IsDeleted").ToString() == "False" ? "success" : "danger" %> '><%# Eval("IsDeleted").ToString() == "False" ? "Is Login" : "Logged Out" %></div>
                                    </td>
                                    <td class="text-end">
                                        <div class="actions">
                                            <a href='/Users/UserDetails?userid=<%# Eval("User") %>' class="btn btn-sm bg-success-light me-2">
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
</asp:Content>
