<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Genre.aspx.vb" Inherits="Polis_Ahdi.Genre" %>

<%@ Register TagPrefix="uc" TagName="Sidebar" Src="~/view user/Sidebar.ascx" %>
<%@ Register TagPrefix="uc" TagName="Topbar" Src="~/view user/Topbar.ascx" %>
<%@ Register TagPrefix="uc" TagName="Footer" Src="~/view user/Footer.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>POLIS - Perpustakaan Politala</title>

    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.5.2/css/all.css" />

    <!-- Template Stylesheet -->
    <link href="/css/SBAdmin.css" rel="stylesheet" />
</head>

<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
        <!-- Panggil Sidebar -->
        <uc:Sidebar ID="SidebarControl" runat="server" />

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
                <!-- Panggil Topbar -->
                <uc:Topbar ID="TopbarControl" runat="server" />

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Genre</h1>
                    </div>

                    <!-- Content Row -->
                    <div style="width:auto;">
                        <form id="form1" runat="server">
                            <div class="col-md-6">
                                <!-- Input Fields to Add New Data -->
                                <table style="width: 500px;" class="table table-bordered">
                                    <tr>
                                        <td>
                                            <label for="txtGenre" class="col-form-label">Nama Genre:</label></td>
                                        <td>
                                            <asp:TextBox ID="txtGenre" runat="server" class="form-control" /></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Button ID="btnCreate" runat="server" CssClass="btn btn-primary" Text="Tambah Genre" OnClick="btnCreate_Click" />
                                        </td>
                                    </tr>
                                </table>

                                <!-- GridView to Display Data -->
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idgen" CssClass="table table-bordered table-striped" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating">
                                    <Columns>
                                        <asp:BoundField DataField="idgen" HeaderText="ID Genre" ReadOnly="True" />
                                        <asp:TemplateField HeaderText="Genre">
                                            <ItemTemplate>
                                                <%# Eval("genre") %>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtEditGenre" runat="server" Text='<%# Bind("genre") %>' CssClass="form-control" />
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- End Container Fluid -->

            </div>
            <!-- End Main Content -->

            <!-- Panggil Footer -->
            <uc:Footer ID="FooterControl" runat="server" />

        </div>
        <!-- End Content Wrapper -->

    </div>
    <!-- End Page Wrapper -->
</body>
</html>
