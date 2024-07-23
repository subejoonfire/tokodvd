<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="ModalLogout.ascx.vb" Inherits="Polis_Ahdi.ModalLogout" %>

<%-- Logout Modal --%>
<div class="modal fade" id="ModalLogout" tabindex="-1" role="dialog" aria-labelledby="ModalLogoutLabel" aria-hidden="true">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
<h5 class="modal-title" id="ModalLogoutLabel">Konfirmasi Logout</h5>
<button type="button" class="close" data-dismiss="modal" aria-label="Close">
<span aria-hidden="true">&times;</span>
</button>
</div>
<div class="modal-body">
Apakah Anda yakin ingin logout?
</div>
<div class="modal-footer">
<button type="button" class="btn btn-secondary" data-dismiss="modal">Tidak</button>
<a href="<%= ResolveUrl("/view user/Logout.aspx") %>" class="btn btn-primary">Ya</a>
</div>
</div>
</div>
</div>
