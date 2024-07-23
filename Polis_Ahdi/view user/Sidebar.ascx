<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="Sidebar.ascx.vb" Inherits="Polis_Ahdi.Sidebar" %>

<%@ Register Src="ModalLogout.ascx" TagPrefix="uc" TagName="ModalLogout" %>

<!-- Sidebar -->
<ul class="navbar-nav bg-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <li class="nav-item">
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
            <div class="sidebar-brand-icon">
                <img src="/img/DVD-Video_Logo.svg.png" width="50" />
            </div>
            <div class="sidebar-brand-text mx-3">Toko DVD</div>
        </a>
    </li

    <!-- Nav Item - Member -->
    <li class="nav-item">
        <a class="nav-link" href="Genre.aspx">
            <i class="fa-solid fa-fw fa-user-friends"></i>
            <span>Genre</span>
        </a>
    </li>

    <!-- Nav Item - Pengguna -->
    <li class="nav-item">
        <a class="nav-link" href="Koleksi.aspx">
            <i class="fa-solid fa-fw fa-user"></i>
            <span>Koleksi</span>
        </a>
    </li>
    <!-- Divider -->
    <li>
        <hr class="sidebar-divider my-0">
    </li>

    <!-- Nav Item - Logout -->
    <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#ModalLogout">
            <i class="fa-solid fa-fw fa-sign-out-alt"></i>
            <span>Logout</span>
        </a>
    </li>
</ul>
<!-- End of Sidebar -->

<!-- Include Modal Logout -->
<uc:ModalLogout ID="ModalLogout" runat="server" />