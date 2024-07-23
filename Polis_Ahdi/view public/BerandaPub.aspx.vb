Public Class BerandaPub
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim header As Header = CType(Me.HeaderControl, Header)
        header.SetActiveNav("Beranda")
    End Sub

End Class