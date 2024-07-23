Imports MySql.Data.MySqlClient

Public Class Akun_m
    Dim idadmin As Integer
    Dim username As String
    Dim password As String

    Public Function LihatLogin(username As String, password As String) As DataTable
        Dim dt As New DataTable
        Dim query As String = "SELECT * FROM akun WHERE username = '" & username & "' AND password = '" & password & "'"
        Dim k As New KoneksiDB
        dt = k.GetResult(query)
        Return dt
    End Function

End Class