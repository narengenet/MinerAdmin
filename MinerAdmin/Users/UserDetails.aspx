<%@ Page Title="" Language="C#" MasterPageFile="~/Panel.Master" AutoEventWireup="true" CodeBehind="UserDetails.aspx.cs" Inherits="MinerAdmin.Users.UserDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <div class="row align-items-center">
            <div class="col">
                <h3 class="page-title">User Details</h3>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a runat="server" href="~/Users/Dashboard">Dashboard</a></li>
                    <li class="breadcrumb-item active">User Details</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="row settings-tab">
        <div class="col-md-4">
            <div class="card">
                <div class="card-header all-center">
                    <a href="general.html" class="avatar avatar-sm me-2">
                        <img class="avatar-img rounded-circle" runat="server" src="~/assets/img/profiles/avatar-01.jpg" alt="User Image">
                        <i class="fe fe-camera"></i>
                    </a>
                    <h6 runat="server" id="lblUsername"></h6>
                    <p>Administrator</p>
                </div>
                <div class="card-body p-0">
                    <div class="profile-list">
                        <a href="#"><i class="fa fa-dollar"></i></a>
                        <a href="#">Balance</a>
                        <a href="#" class="float-end">
                            <h5 runat="server" id="lblMoney"></h5>
                        </a>
                    </div>
                    <div class="profile-list">
                        <a href="#"><i class="fa fa-whatsapp"></i></a>
                        <asp:HyperLink ID="hplWhatsapp" Target="_blank" runat="server">Chat</asp:HyperLink>
                        <asp:HyperLink ID="hplWhatsapp2" Target="_blank" runat="server" class="float-end">
                            <h5 runat="server" id="lblCellphone"></h5>
                        </asp:HyperLink>
                    </div>
                    <div class="profile-list">
                        <a href="#"><i class="fe fe-user"></i></a>
                        <a href="#">Invited By</a>
                        <asp:HyperLink ID="hplInviter" runat="server" class="float-end">
                            <h5 runat="server" id="lblInviterUsername"></h5>
                        </asp:HyperLink>

                    </div>
                    <div class="profile-list">
                        <a href="group-history.html">
                            <button type="button" class="btn btn-block btn-outline-light">View History</button></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-8">
            <div class="card">
                <div class="alert alert-success collapse" id="alertSuccess" role="alert">
                    <strong>Success!</strong> Your <a href="#" class="alert-link">message</a> has been sent successfully.
                    <button type="button" class="close" data-bs-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="alert alert-danger collapse" id="alertFailed" role="alert">
                    <strong>Failed!</strong> <div id="failedMessage"></div>
                    <button type="button" class="close" data-bs-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="card-header">
                    <h4 class="card-title">User Details</h4>
                </div>
                <div class="card-body">

                    <div class="form-group">
                        <label>Name</label>
                        <asp:TextBox ID="txtName" minlength="3" class="text-control form-control" required runat="server"></asp:TextBox>
                        <div class="valid-feedback">
                            Looks good!
                        </div>
                        <div class="invalid-feedback">
                            Please choose a First Name. Minimum length is 3 chars.
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Surename</label>
                        <asp:TextBox ID="txtFamily" minlength="3" class="text-control form-control" required runat="server"></asp:TextBox>
                        <div class="valid-feedback">
                            Looks good!
                        </div>
                        <div class="invalid-feedback">
                            Please choose a Surename. Minimum length is 3 chars.
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Email Address</label>
                        <asp:TextBox ID="txtEmail" class="form-control" required runat="server" TextMode="Email"></asp:TextBox>
                        <div class="valid-feedback">
                            Looks good!
                        </div>
                        <div class="invalid-feedback">
                            Please choose a valid Email.
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Username</label>
                        <asp:TextBox ID="txtUsername" required minlength="5" class="text-control form-control" runat="server"></asp:TextBox>
                        <div class="valid-feedback">
                            Looks good!
                        </div>
                        <div class="invalid-feedback">
                            Please choose a Username. Minimum length is 5 chars.
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Cellphone</label>
                        <asp:TextBox ID="txtCellphone" required minlength="13" class="number-control form-control" runat="server" TextMode="Phone"></asp:TextBox>
                        <div class="valid-feedback">
                            Looks good!
                        </div>
                        <div class="invalid-feedback">
                            Please choose a valid Cellphone. Minimum length is 13 chars.
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Wallet Address</label>
                        <asp:TextBox ID="txtWallet" class="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>Is Activated</label>
                        <asp:CheckBox ID="chkActivated" class="form-check-input" runat="server" />
                    </div>

                    <div class="form-group">
                        <label class="text-danger">Is Deleted</label>
                        <asp:CheckBox ID="chkDeleted" CssClass="form-check-input is-invalid" class="form-check-input" runat="server" />
                    </div>


                    <asp:HiddenField ID="hdfUserId" runat="server" />
                    <div class="text-end">
                        <asp:Button ID="btnUpdate" CssClass="btn btn-primary" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                        <%--<button type="submit" class="btn btn-primary">Update</button>--%>
                    </div>

                </div>
            </div>
        </div>
    </div>




    <script>
        var success = -1;
        var message = "";
        document.addEventListener("DOMContentLoaded", function () {
            if (success == 1) {
                $('#alertSuccess').show();
            }
            if (success == -2) {
                $('#failedMessage').html(message);
                $('#alertFailed').show();
            }

            $('.form-control.text-control').on('keyup', function (e) {
                if ($(e.target).attr('required')) {
                    if ($(e.target).val() == "") {
                        $(e.target).removeClass('is-valid');
                        $(e.target).removeClass('is-invalid');
                        $(e.target).addClass('is-invalid');
                    } else {
                        if ($(e.target).attr('minlength')) {
                            let minlength = parseInt($(e.target).attr('minlength'));
                            if ($(e.target).val().length < minlength) {
                                $(e.target).removeClass('is-valid');
                                $(e.target).removeClass('is-invalid');
                                $(e.target).addClass('is-invalid');
                                return;
                            }

                        }
                        $(e.target).removeClass('is-valid');
                        $(e.target).removeClass('is-invalid');
                        $(e.target).addClass('is-valid');
                    }
                }
            });

            $('.form-control.number-control').on('keyup', function (e) {
                $(e.target).val($(e.target).val().replace(/[^0-9]/g, ""));

                if ($(e.target).attr('required')) {
                    if ($(e.target).val() == "") {
                        $(e.target).removeClass('is-valid');
                        $(e.target).removeClass('is-invalid');
                        $(e.target).addClass('is-invalid');
                    } else {
                        if ($(e.target).attr('minlength')) {
                            let minlength = parseInt($(e.target).attr('minlength'));
                            if ($(e.target).val().length < minlength) {
                                $(e.target).removeClass('is-valid');
                                $(e.target).removeClass('is-invalid');
                                $(e.target).addClass('is-invalid');
                                return;
                            }

                        }
                        $(e.target).removeClass('is-valid');
                        $(e.target).removeClass('is-invalid');
                        $(e.target).addClass('is-valid');
                    }
                }
            });

            $('#MainContent_chkDeleted').addClass('form-check-input is-invalid');
            $('#MainContent_chkActivated').addClass('form-check-input is-valid');



        });


        function sina() {
            alert('sina');
            return false;
        }

    </script>
</asp:Content>
