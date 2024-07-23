<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="Polis_Ahdi.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>POLIS - Perpustakaan Politala</title>


    <%--Custom fonts for this template--%>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.5.2/css/all.css" />
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet" />


    <%--Custom styles for this template--%>
    <link href="/css/SBAdmin.css" rel="stylesheet" />
</head>
<body class="bg-gradient-primary">
    <div class="container">
        <%--Outer Row--%>
        <div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12 col-md-9">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <%--Nested Row within Card Body--%>
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block">
                                <%-- insert picture --%>
                                <table style="width: 100%; height: 100%; border: 0;">
                                    <tr>
                                        <td style="text-align: center; vertical-align: middle;">
                                            <img src="/img/DVD-Video_Logo.svg.png" alt="Logo Politala" width="300" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Selamat Datang</h1>
                                        <h1 class="h6 text-gray-900 mb-4">LOGIN TOKO DVD</h1>
                                    </div>
                                    <form class="user" id="form1" runat="server">
                                        <div class="form-group">
                                            <asp:TextBox ID="TxtUsername" class="form-control form-control-user" placeholder="Username" runat="server" />
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="TxtPassword" class="form-control form-control-user" placeholder="Password" TextMode="Password" runat="server" />
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <asp:Button ID="BtnMasuk" Text="Masuk" class="btn btn-primary btn-user btn-block" runat="server" />
                                            </div>
                                            <div class="col-md-6">
                                                <asp:Button ID="BtnKembali" Text="Kembali" class="btn btn-secondary btn-user btn-block" runat="server" />
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
