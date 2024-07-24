Imports System.Data

Public Class KoleksiPub
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim header As Header = CType(Me.HeaderControl, Header)
        header.SetActiveNav("Koleksi")

        If Not IsPostBack Then
            LoadGenres()
            LoadKoleksis()
            Dim imageColumn As New TemplateField()
            imageColumn.ItemTemplate = New ImageTemplate()
            GV.Columns.Add(imageColumn)
        End If
    End Sub

    Private Sub LoadGenres()
        Try
            Dim dtGen As New DataTable
            Dim kt As New Genre_m
            dtGen = kt.GetAllGenres()

            DdlGenre.Items.Clear()
            DdlGenre.DataSource = dtGen
            DdlGenre.DataTextField = "genre"
            DdlGenre.DataValueField = "idgen"
            DdlGenre.DataBind()
            DdlGenre.Items.Insert(0, New ListItem("Pilih Genre", ""))
        Catch ex As Exception
            System.Diagnostics.Debug.WriteLine("Error loading genres: " & ex.Message)
        End Try
    End Sub

    Private Sub LoadKoleksis(Optional ByVal genreId As Integer = 0)
        Try
            Dim dtkol As New DataTable
            Dim ko As New Koleksi_m()

            If genreId = 0 Then
                dtkol = ko.GetAllKoleksis()
            Else
                dtkol = ko.GetKoleksiByGenre(genreId)
            End If

            GV.DataSource = dtkol
            GV.DataBind()
        Catch ex As Exception
            System.Diagnostics.Debug.WriteLine("Error loading collections: " & ex.Message)
        End Try
    End Sub

    Protected Sub BtnPilih_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BtnPilih.Click
        Dim selectedGenreId As Integer = If(String.IsNullOrEmpty(DdlGenre.SelectedValue), 0, Convert.ToInt32(DdlGenre.SelectedValue))
        LoadKoleksis(selectedGenreId)
    End Sub
End Class
