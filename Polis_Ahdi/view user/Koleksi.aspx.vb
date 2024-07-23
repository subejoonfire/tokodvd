Imports System
Imports System.Data
Imports System.IO
Imports System.Web.UI.WebControls
Imports MySql.Data.MySqlClient

Public Class Koleksi
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindGridView()
            BindGenreDropDownList()
        End If
    End Sub

    ' Bind data to GridView
    Private Sub BindGridView()
        Dim koleksiModel As New Koleksi_m()
        Dim dtKoleksis As DataTable = koleksiModel.GetAllKoleksis()
        GridView1.DataSource = dtKoleksis
        GridView1.DataBind()

        Dim imageColumn As New TemplateField()
        imageColumn.ItemTemplate = New ImageTemplate()
        GridView1.Columns.Add(imageColumn)
    End Sub

    ' Bind genres to DropDownList
    Private Sub BindGenreDropDownList()
        Dim genreModel As New Genre_m()
        Dim dtGenres As DataTable = genreModel.GetAllGenres()

        ddlInsertIdgen.Items.Clear()
        ddlInsertIdgen.Items.Add(New ListItem("Select Genre", String.Empty))

        For Each row As DataRow In dtGenres.Rows
            ddlInsertIdgen.Items.Add(New ListItem(row("genre").ToString(), row("idgen").ToString()))
        Next
    End Sub

    ' Insert Button Click Event
    Protected Sub btnInsert_Click(sender As Object, e As EventArgs)
        Dim idgen As Integer
        If Not Integer.TryParse(ddlInsertIdgen.SelectedValue, idgen) Then
            ' Handle the case where the selected value is not a valid integer
            Return
        End If

        Dim judul As String = txtInsertJudul.Text.Trim()
        Dim tahun As Integer
        If Not Integer.TryParse(txtInsertTahun.Text.Trim(), tahun) Then
            ' Handle the case where the year is not a valid integer
            Return
        End If

        Dim penerbit As String = txtInsertPenerbit.Text.Trim()
        Dim stok As Integer
        If Not Integer.TryParse(txtInsertStok.Text.Trim(), stok) Then
            ' Handle the case where stock is not a valid integer
            Return
        End If

        Dim harga As Decimal
        If Not Decimal.TryParse(txtInsertHarga.Text.Trim(), harga) Then
            ' Handle the case where price is not a valid decimal
            Return
        End If

        Dim cover As Byte() = Nothing
        If fileInsertCover.HasFile Then
            Using ms As New MemoryStream(fileInsertCover.FileBytes)
                cover = ms.ToArray()
            End Using
        End If

        Dim koleksiModel As New Koleksi_m()
        If koleksiModel.CreateKoleksi(idgen, judul, tahun, penerbit, cover, stok, harga) Then
            BindGridView()
            pnlInsert.Visible = False
        Else
            ' Handle error (e.g., display a message to the user)
        End If
        Response.Redirect("Koleksi.aspx")
    End Sub

    ' GridView Row Editing Event
    Protected Sub GridView1_RowEditing(sender As Object, e As GridViewEditEventArgs)
        GridView1.EditIndex = e.NewEditIndex
        BindGridView()
        BindGenreDropDownListForEditing()
        Dim imageColumn As New TemplateField()
        imageColumn.ItemTemplate = New ImageTemplate()
        GridView1.Columns.Add(imageColumn)
    End Sub

    Private Sub BindGenreDropDownListForEditing()
        Dim genreModel As New Genre_m()
        Dim dtGenres As DataTable = genreModel.GetAllGenres()

        For Each row As GridViewRow In GridView1.Rows
            If row.RowType = DataControlRowType.DataRow AndAlso row.RowIndex = GridView1.EditIndex Then
                Dim ddlEditIdgen As DropDownList = CType(row.FindControl("ddlEditIdgen"), DropDownList)

                ' Check if ddlEditIdgen is found
                If ddlEditIdgen IsNot Nothing Then
                    ddlEditIdgen.Items.Clear()
                    ddlEditIdgen.Items.Add(New ListItem("Select Genre", String.Empty))

                    For Each genreRow As DataRow In dtGenres.Rows
                        ddlEditIdgen.Items.Add(New ListItem(genreRow("genre").ToString(), genreRow("idgen").ToString()))
                    Next

                    ' Check if DataItem is valid
                    Dim dataItem As DataRowView = TryCast(row.DataItem, DataRowView)
                    If dataItem IsNot Nothing Then
                        Dim idgen As String = dataItem("idgen").ToString()
                        ddlEditIdgen.SelectedValue = idgen
                    End If
                End If
            End If
        Next
    End Sub

    ' GridView Row Canceling Edit Event
    Protected Sub GridView1_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs)
        GridView1.EditIndex = -1
        Response.Redirect("Koleksi.aspx")
    End Sub

    ' GridView Row Updating Event
    Protected Sub GridView1_RowUpdating(sender As Object, e As GridViewUpdateEventArgs)
        Dim id_dvd As Integer = Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Value)

        ' Get DropDownList and ensure it has a selected value
        Dim ddlEditIdgen As DropDownList = CType(GridView1.Rows(e.RowIndex).FindControl("ddlEditIdgen"), DropDownList)
        Dim idgen As Integer
        Integer.TryParse(ddlEditIdgen.SelectedValue, idgen)

        ' Retrieve other fields
        Dim judul As String = CType(GridView1.Rows(e.RowIndex).FindControl("txtEditJudul"), TextBox).Text.Trim()
        Dim tahun As Integer = Integer.Parse(CType(GridView1.Rows(e.RowIndex).FindControl("txtEditTahun"), TextBox).Text.Trim())
        Dim penerbit As String = CType(GridView1.Rows(e.RowIndex).FindControl("txtEditPenerbit"), TextBox).Text.Trim()
        Dim coverFile As FileUpload = CType(GridView1.Rows(e.RowIndex).FindControl("fileEditCover"), FileUpload)
        Dim stok As Integer = Integer.Parse(CType(GridView1.Rows(e.RowIndex).FindControl("txtEditStok"), TextBox).Text.Trim())
        Dim harga As Decimal = Decimal.Parse(CType(GridView1.Rows(e.RowIndex).FindControl("txtEditHarga"), TextBox).Text.Trim())

        Dim cover As Byte() = Nothing
        If coverFile.HasFile Then
            Using ms As New MemoryStream(coverFile.FileBytes)
                cover = ms.ToArray()
            End Using
        End If

        ' Perform update
        Dim koleksiModel As New Koleksi_m()
        If koleksiModel.UpdateKoleksi(id_dvd, idgen, judul, tahun, penerbit, cover, stok, harga) Then
            GridView1.EditIndex = -1
            BindGridView()
        Else
        End If

        Response.Redirect("Koleksi.aspx")
    End Sub

    ' GridView Row Deleting Event
    Protected Sub GridView1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim id_dvd As Integer = Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Value)
        Dim koleksiModel As New Koleksi_m()
        If koleksiModel.DeleteKoleksi(id_dvd) Then
            BindGridView()
        Else
            ' Handle error (e.g., display a message to the user)
        End If
    End Sub

End Class
Public Class ImageTemplate
    Implements ITemplate

    Public Sub InstantiateIn(container As Control) Implements ITemplate.InstantiateIn
        Dim image As New Image()
        container.Controls.Add(image)
    End Sub
End Class