Imports MySql.Data.MySqlClient

Public Class Koleksi_m
    Dim id_dvd As Integer
    Dim idgen As Integer
    Dim judul As String
    Dim tahun As Integer
    Dim penerbit As String
    Dim cover As Byte()
    Dim stok As Integer
    Dim harga As Integer

    Public Function GetAllKoleksis() As DataTable
        Dim query As String = "SELECT * FROM koleksi INNER JOIN genre ON genre.idgen = koleksi.idgenre"
        Dim k As New KoneksiDB
        Return k.GetResult(query)
    End Function
    Public Function GetAllKoleksis2() As DataTable
        Dim query As String = "SELECT " &
                  "koleksi.id_dvd AS 'ID DVD', " &
                  "koleksi.idgenre AS 'ID Genre', " &
                  "koleksi.judul AS 'Judul', " &
                  "koleksi.tahun AS 'Tahun', " &
                  "koleksi.penerbit AS 'Penerbit', " &
                  "koleksi.cover AS 'Cover', " &
                  "koleksi.stok AS 'Stok', " &
                  "koleksi.harga AS 'Harga', " &
                  "genre.idgen AS 'ID Genre', " &
                  "genre.genre AS 'Genre' " &
                  "FROM koleksi " &
                  "INNER JOIN genre ON genre.idgen = koleksi.idgenre"
        Dim k As New KoneksiDB
        Return k.GetResult(query)
    End Function
    Public Function GetKoleksiByGenre(idgen As String) As DataTable
        Dim query As String = "SELECT * FROM koleksi INNER JOIN genre ON genre.idgen = koleksi.idgenre WHERE genre.idgen = " & idgen
        Dim k As New KoneksiDB
        Return k.GetResult(query)
    End Function

    Public Function CreateKoleksi(idgen As Integer, judul As String, tahun As Integer, penerbit As String, cover As Byte(), stok As Integer, harga As Integer) As Boolean
        Dim query As String = "INSERT INTO koleksi (idgenre, judul, tahun, penerbit, cover, stok, harga) VALUES (@idgen, @judul, @tahun, @penerbit, @cover, @stok, @harga)"
        Dim parameters As New List(Of MySqlParameter)
        parameters.Add(New MySqlParameter("@idgen", idgen))
        parameters.Add(New MySqlParameter("@judul", judul))
        parameters.Add(New MySqlParameter("@tahun", tahun))
        parameters.Add(New MySqlParameter("@penerbit", penerbit))
        parameters.Add(New MySqlParameter("@cover", cover))
        parameters.Add(New MySqlParameter("@stok", stok))
        parameters.Add(New MySqlParameter("@harga", harga))
        Dim k As New KoneksiDB
        Return k.Execute(query, parameters.ToArray())
    End Function

    Public Function GetKoleksi(id_dvd As Integer) As DataTable
        Dim query As String = "SELECT * FROM koleksi WHERE id_dvd = " & id_dvd
        Dim k As New KoneksiDB
        Return k.GetResult(query)
    End Function

    Public Function UpdateKoleksi(id_dvd As Integer, idgen As Integer, judul As String, tahun As Integer, penerbit As String, cover As Byte(), stok As Integer, harga As Integer) As Boolean
        Dim query As String = "UPDATE koleksi SET idgenre = @idgen, judul = @judul, tahun = @tahun, penerbit = @penerbit, cover = @cover, stok = @stok, harga = @harga WHERE id_dvd = @id_dvd"
        Dim parameters As New List(Of MySqlParameter)
        parameters.Add(New MySqlParameter("@idgen", idgen))
        parameters.Add(New MySqlParameter("@judul", judul))
        parameters.Add(New MySqlParameter("@tahun", tahun))
        parameters.Add(New MySqlParameter("@penerbit", penerbit))
        parameters.Add(New MySqlParameter("@cover", cover))
        parameters.Add(New MySqlParameter("@stok", stok))
        parameters.Add(New MySqlParameter("@harga", harga))
        parameters.Add(New MySqlParameter("@id_dvd", id_dvd))
        Dim k As New KoneksiDB
        Return k.Execute(query, parameters.ToArray())
    End Function

    Public Function DeleteKoleksi(id_dvd As Integer) As Boolean
        Dim query As String = "DELETE FROM koleksi WHERE id_dvd = @id_dvd"
        Dim parameters As New List(Of MySqlParameter)
        parameters.Add(New MySqlParameter("@id_dvd", id_dvd))
        Dim k As New KoneksiDB
        Return k.Execute(query, parameters.ToArray())
    End Function

End Class