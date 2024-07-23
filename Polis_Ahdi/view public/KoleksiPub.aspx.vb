Public Class KoleksiPub
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim header As Header = CType(Me.HeaderControl, Header)
        header.SetActiveNav("Koleksi")

        'DROPDOWNLIST DDLKATEGORI
        'Tampilkan data kategori di DdlKategori
        Dim dtGen As New DataTable
        Dim kt As New Genre_m
        dtGen = kt.GetAllGenres()


        'Hapus isi dari dropdownlist terlebih dahulu
        DdlGenre.Items.Clear()


        'Atur dropdownlist: data yang ditampilkan dan data yang menjadi nilai
        DdlGenre.DataSource = dtGen
        DdlGenre.DataTextField = "GENRE"
        DdlGenre.DataValueField = "ID"


        'Bind data ke Dropdownlist
        DdlGenre.DataBind()


        'Menambahkan item kosong
        DdlGenre.Items.Insert(0, New ListItem("", ""))

        'GRIDVIEW GV
        'Tampilkan data koleksi di GV
        Dim dtkol As New DataTable
        Dim ko As New Koleksi_m()
        dtkol = ko.GetAllKoleksis()


        'Hapus isi dari GV terlebih dahulu


        'Atur Gridview
        GV.DataSource = dtkol
        GV.DataBind()

    End Sub

End Class