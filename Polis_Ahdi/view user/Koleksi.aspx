<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Koleksi.aspx.vb" Inherits="Polis_Ahdi.Koleksi" %>

<%@ Register TagPrefix="uc" TagName="Sidebar" Src="~/view user/Sidebar.ascx" %>
<%@ Register TagPrefix="uc" TagName="Topbar" Src="~/view user/Topbar.ascx" %>
<%@ Register TagPrefix="uc" TagName="Footer" Src="~/view user/Footer.ascx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<style>
    .wide-gridview {
        width: 100%; /* Full width of its container */
        border-collapse: collapse;
    }

        .wide-gridview th, .wide-gridview td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .wide-gridview th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
</style>

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
                        <h1 class="h3 mb-0 text-gray-800">Koleksi</h1>
                    </div>
                    <!-- Content Row -->
                    <div style="width: 150%">
                        <form id="form1" runat="server">
                            <div class="col-md-6">
                                <!-- Panel for Insert -->
                                <asp:Panel ID="pnlInsert" runat="server" DefaultButton="btnInsert">
                                    <h3>Tambah Koleksi</h3>
                                    <table style="width: 100%;" class="table table-bordered">
                                        <tr>
                                            <td>
                                                <label for="ddlInsertIdgen" class="col-form-label">ID Genre:</label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlInsertIdgen" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="txtInsertJudul" class="col-form-label">Judul:</label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtInsertJudul" runat="server" CssClass="form-control" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="txtInsertTahun" class="col-form-label">Tahun:</label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtInsertTahun" runat="server" CssClass="form-control" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="txtInsertPenerbit" class="col-form-label">Penerbit:</label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtInsertPenerbit" runat="server" CssClass="form-control" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="fileInsertCover" class="col-form-label">Cover:</label>
                                            </td>
                                            <td>
                                                <asp:FileUpload ID="fileInsertCover" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="txtInsertStok" class="col-form-label">Stok:</label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtInsertStok" runat="server" CssClass="form-control" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="txtInsertHarga" class="col-form-label">Harga:</label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtInsertHarga" runat="server" CssClass="form-control" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:Button ID="btnInsert" runat="server" Text="Tambah" CssClass="btn btn-primary" OnClick="btnInsert_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>

                                <!-- GridView for Displaying Data -->
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_dvd" CssClass="table table-bordered wide-gridview" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating">
                                    <Columns>
                                        <asp:BoundField DataField="id_dvd" HeaderText="ID Koleksi" ReadOnly="True" />
                                        <asp:TemplateField HeaderText="ID Genre">
                                            <ItemTemplate>
                                                <%# Eval("idgen") %>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="ddlEditIdgen" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Judul">
                                            <ItemTemplate>
                                                <%# Eval("judul") %>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtEditJudul" runat="server" Text='<%# Bind("judul") %>' CssClass="form-control" />
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Tahun">
                                            <ItemTemplate>
                                                <%# Eval("tahun") %>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtEditTahun" runat="server" Text='<%# Bind("tahun") %>' CssClass="form-control" />
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Penerbit">
                                            <ItemTemplate>
                                                <%# Eval("penerbit") %>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtEditPenerbit" runat="server" Text='<%# Bind("penerbit") %>' CssClass="form-control" />
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cover">
                                            <ItemTemplate>
                                                <asp:Image ID="imgCover" runat="server"  Width="100" Height="100%" ImageUrl='<%# "data:image/jpeg;base64," & Convert.ToBase64String(CType(Eval("cover"), Byte())) %>' />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:FileUpload ID="fileEditCover" runat="server" />
                                                <asp:Image ID="imgEditCover" runat="server" Width="100" Height="100" ImageUrl='<%# "data:image/jpeg;base64," & Convert.ToBase64String(CType(Eval("cover"), Byte())) %>' />
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Stok">
                                            <ItemTemplate>
                                                <%# Eval("stok") %>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtEditStok" runat="server" Text='<%# Bind("stok") %>' CssClass="form-control" />
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Harga">
                                            <ItemTemplate>
                                                <%# Eval("harga") %>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtEditHarga" runat="server" Text='<%# Bind("harga") %>' CssClass="form-control" />
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- End of Main Content -->
            <!-- Panggil Footer -->
            <uc:Footer ID="FooterControl" runat="server" />
        </div>
    </div>
</body>
</html>
