<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="Topbar.ascx.vb" Inherits="Polis_Ahdi.Topbar" %>

<%--Topbar--%>
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">


    <%--Topbar Navbar--%>
    <ul class="navbar-nav ml-auto">


        <li>
            <div class="topbar-divider d-none d-sm-block"></div>
        </li>


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
                <img class="img-profile rounded-circle" src="/img/DVD-Video_Logo.svg.png">
            </a>
        </li>
    </ul>
</nav>
<%--End of Topbar--%>