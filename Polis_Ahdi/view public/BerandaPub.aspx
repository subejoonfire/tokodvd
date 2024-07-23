<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="BerandaPub.aspx.vb" Inherits="Polis_Ahdi.BerandaPub" %>


<%@ Register TagPrefix="uc" TagName="Header" Src="~/view public/Header.ascx" %>
<%@ Register TagPrefix="uc" TagName="Footer" Src="~/view public/Footer.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DVD STORE ID</title>


    <%--Google Web Fonts--%>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600&family=Roboto&display=swap" rel="stylesheet" />


    <%--Icon Font Stylesheet--%>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.5.2/css/all.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />


    <%--Customized Bootstrap Stylesheet--%>
    <link href="../css/BootstrapMin.css" rel="stylesheet" />


    <%--Template Stylesheet--%>
    <link href="../css/Public.css" rel="stylesheet" />
</head>

<body>
    <uc:Header ID="HeaderControl" runat="server" />

    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="mx-auto text-center mb-5" style="max-width: 900px;">
                <br />
                <h5 class="section-title px-3">Beranda</h5>
                <h1 class="mb-4">Selamat Datang</h1>
                <p class="mb-0">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Laborum tempore nam, architecto doloremque velit explicabo? Voluptate sunt eveniet fuga eligendi! Expedita laudantium fugiat corrupti eum cum repellat a laborum quasi.
                </p>

                <form id="form1" runat="server">
                    <div>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <uc:Footer runat="server" />
</body>
</html>
