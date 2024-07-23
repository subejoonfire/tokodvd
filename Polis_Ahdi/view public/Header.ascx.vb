Public Class Header
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Public Sub SetActiveNav(nav As String)
        If nav = "Beranda" Then
            navBeranda.Attributes("class") &= " active"
        ElseIf nav = "Koleksi" Then
            navKoleksi.Attributes("class") &= " active"
        ElseIf nav = "Layanan" Then
            navLayanan.Attributes("class") &= " active"
        ElseIf nav = "Kontak" Then
            navKontak.Attributes("class") &= " active"
        End If
    End Sub

End Class