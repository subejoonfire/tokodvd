﻿<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="Topbar.ascx.vb" Inherits="Polis_Ahdi.Topbar" %>

<%--Topbar--%>
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">


<%--Topbar Navbar--%>
<ul class="navbar-nav ml-auto">


<%--Nav Item - Alerts--%>
<li class="nav-item dropdown no-arrow mx-1">
<a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
<i class="fa-solid fa-bell fa-fw"></i>
<%--Counter - Alerts--%>
<span class="badge badge-danger badge-counter">3+</span>
</a>
<%--Dropdown - Alerts--%>
<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
<h6 class="dropdown-header">Tanggungan Peminjaman</h6>
<a class="dropdown-item d-flex align-items-center" href="#">
<div class="mr-3">
<div class="icon-circle bg-warning">
<i class="fa-solid fa-exclamation-triangle text-white"></i>
</div>
</div>
<div>
<div class="small text-gray-500">Tanggal Pengembalian - Nama Member - Jabatan Member</div>
<span class="font-weight-bold">Judul Buku</span>
</div>
</a>
<a class="dropdown-item text-center small text-gray-500" href="#">Tampil Semua Tanggungan</a>
</div>
</li>


<li><div class="topbar-divider d-none d-sm-block"></div></li>


<%--Nav Item - User Information--%>
<li class="nav-item dropdown no-arrow">
<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
<% 
Dim level As String = Session("level")
Dim nama As String
If level = "member" Then
nama = Session("nama")
Else
nama = level
End If
%>
<span class="mr-2 d-none d-lg-inline text-gray-600 small"><%= nama %></span>
<img class="img-profile rounded-circle" src="/img/LogoPolitala.png">
</a>
<%--Dropdown - User Information--%>
<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
<a class="dropdown-item" href="#">
<i class="fa-solid fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
Profile
</a>
<div class="dropdown-divider"></div>
<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
<i class="fa-solid fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
Logout
</a>
</div>
</li>
</ul>
</nav>
<%--End of Topbar--%>