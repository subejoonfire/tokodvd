Imports MySql.Data.MySqlClient
Imports System.Data

Public Class Genre
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindGridView()
        End If
    End Sub

    Private Sub BindGridView()
        Dim genreModel As New Genre_m
        GridView1.DataSource = genreModel.GetAllGenres()
        GridView1.DataBind()
    End Sub

    Protected Sub btnCreate_Click(sender As Object, e As EventArgs)
        Dim genreModel As New Genre_m
        Dim genre As String = txtGenre.Text.Trim()
        If genreModel.CreateGenre(genre) Then
            BindGridView()
            txtGenre.Text = String.Empty
        Else
            ' Handle error
            ' You can display an error message to the user here.
        End If
    End Sub

    Protected Sub GridView1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        Dim idgen As Integer = Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Value)
        Dim genreModel As New Genre_m
        If genreModel.DeleteGenre(idgen) Then
            BindGridView()
        Else
            ' Handle error
        End If
    End Sub

    Protected Sub GridView1_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles GridView1.RowEditing
        GridView1.EditIndex = e.NewEditIndex
        BindGridView()
    End Sub

    Protected Sub GridView1_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles GridView1.RowCancelingEdit
        GridView1.EditIndex = -1
        BindGridView()
    End Sub

    Protected Sub GridView1_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles GridView1.RowUpdating
        Dim idgen As Integer = Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Value)
        Dim txtEditGenre As TextBox = CType(GridView1.Rows(e.RowIndex).FindControl("txtEditGenre"), TextBox)

        If txtEditGenre IsNot Nothing Then
            ' Get the updated genre from the TextBox
            Dim genre As String = txtEditGenre.Text
            MsgBox(genre)
            Dim genreModel As New Genre_m
            If genreModel.UpdateGenre(idgen, genre) Then
                ' Reset the edit index
                GridView1.EditIndex = -1
                ' Rebind the GridView to show updated data
                BindGridView()
            Else
                ' Handle error
            End If
        Else
            ' Handle error: TextBox not found
        End If
    End Sub

End Class
