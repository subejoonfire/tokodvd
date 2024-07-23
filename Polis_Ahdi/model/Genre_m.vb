Imports MySql.Data.MySqlClient

Public Class Genre_m
    Dim idgen As Integer
    Dim genre As String

    Public Function GetAllGenres() As DataTable
        Dim query As String = "SELECT * FROM genre"
        Dim k As New KoneksiDB
        Return k.GetResult(query)
    End Function

    Public Function CreateGenre(genre As String) As Boolean
        Dim query As String = "INSERT INTO genre (genre) VALUES (@genre)"
        Dim parameters As New List(Of MySqlParameter)
        parameters.Add(New MySqlParameter("@genre", genre))
        Dim k As New KoneksiDB
        Return k.Execute(query, parameters.ToArray())
    End Function

    Public Function GetGenre(idgen As Integer) As DataTable
        Dim query As String = "SELECT * FROM genre WHERE idgen = " & idgen
        Dim k As New KoneksiDB
        Return k.GetResult(query)
    End Function

    Public Function UpdateGenre(idgen As Integer, genre As String) As Boolean
        Dim query As String = "UPDATE genre SET genre = @genre WHERE idgen = @idgen"
        Dim parameters As New List(Of MySqlParameter)
        parameters.Add(New MySqlParameter("@genre", genre))
        parameters.Add(New MySqlParameter("@idgen", idgen))
        Dim k As New KoneksiDB
        Return k.Execute(query, parameters.ToArray())
    End Function

    Public Function DeleteGenre(idgen As Integer) As Boolean
        Dim query As String = "DELETE FROM genre WHERE idgen = @idgen"
        Dim parameters As New List(Of MySqlParameter)
        parameters.Add(New MySqlParameter("@idgen", idgen))
        Dim k As New KoneksiDB
        Return k.Execute(query, parameters.ToArray())
    End Function

End Class