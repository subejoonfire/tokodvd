Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub BtnMasuk_Click(sender As Object, e As EventArgs) Handles BtnMasuk.Click
        Dim username As String = TxtUsername.Text
        Dim password As String = TxtPassword.Text
        Dim dt As New DataTable

        'validasi username dan password tidak kosong
        If username = "" Then
            MsgBox("Username tidak boleh kosong")
            TxtUsername.Focus()
        ElseIf password = "" Then
            MsgBox("Password tidak boleh kosong")
            TxtPassword.Focus()
        Else
            'Gunakan kelas Akun_m untuk memeriksa login
            Dim akun As New Akun_m
            dt = akun.LihatLogin(username, password)

            'cek apakah dt kosong
            If dt.Rows.Count = 0 Then
                MsgBox("Maaf username/password yang Anda masukkan kurang tepat")
                Response.Redirect("/view user/Login.aspx")
            Else
                ' Redirect ke halaman dashboard jika login berhasil
                Session("username") = username
                Response.Redirect("~/view user/Beranda.aspx")
            End If
        End If
    End Sub

End Class