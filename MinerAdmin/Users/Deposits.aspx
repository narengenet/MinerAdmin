<%@ Page Title="" Language="C#" MasterPageFile="~/Panel.Master" AutoEventWireup="true" CodeBehind="Deposits.aspx.cs" Inherits="MinerAdmin.Users.Deposits" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12 d-flex">

            <div class="card flex-fill">
                <div class="card-header">
                    <h4 class="card-title float-start">Deposits</h4>
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
                                            <th>Amount</th>
                                            <th class="text-center">Hash</th>
                                            <th class="text-center">Transfered</th>
                                            <th class="text-center">Confirmed</th>
                                            <th class="text-center">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>

                            <ItemTemplate>
                                <tr id="tr-<%# Eval("Id") %>">
                                    <td class="text-nowrap">
                                        <%# Eval("Username") %>
                                    </td>
                                    <td class="text-nowrap"><%# Eval("Amount") %>$</td>
                                    <td class="text-center"><%# Eval("TheHash") %></td>
                                    <td class="text-center"><%# Eval("Created") %></td>
                                    <td class="text-end">
                                        <div class='confirmed font-weight-600 text-<%# Eval("Confirmed").ToString() == "True" ? "success" : "danger" %> '><%# Eval("Confirmed").ToString() == "True" ? "Yes" : "No" %></div>
                                    </td>

                                    <td class="text-end">
                                        <div class="actions">
                                            <span style='display: <%# Eval("Confirmed").ToString() == "True" ? "none;" : "inline-block;" %>' onclick='confirmDeposit("<%# Eval("Id") %>");' class="confirm-btn btn btn-sm bg-success-light me-2">Confirm
                                            </span>
                                            <a href='/Users/UserDetails?userid=<%# Eval("UserID") %>' class="btn btn-sm bg-success-light me-2">
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

    <script>
        function confirmExampleModal() {
            $('#exampleModal').modal('toggle');

            $.ajax({
                url: '../api/useractions/confirmdeposit?transactionid=' + transacID,
                type: 'GET',
                success: function (result) {
                    if (result == '1') {
                        $('#tr-' + transacID).css('background-color', 'khaki');
                        $('#tr-' + transacID + ' .confirm-btn').hide();
                        $('#tr-' + transacID + ' .confirmed').text('Yes');
                        $('#tr-' + transacID + ' .confirmed').removeClass('text-danger');
                        $('#tr-' + transacID + ' .confirmed').addClass('text-success');
                    } else {
                        alert("failed");

                    }
                },
            });
        }

        var transacID = "-1";

        function confirmDeposit(transactionid) {
            transacID = transactionid;
            $('#exampleModalLabel').text('Confirm Deposit');
            $('#exampleModal .modal-body').text('Are you sure?');
            $('#exampleModal').modal('toggle');
        }
    </script>



</asp:Content>
