Imports Class1
Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Partial Class userDtl
    Inherits System.Web.UI.Page
    Dim ss As New Class1

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("uid") Is Nothing Then
            Response.Redirect("login.aspx")
        End If
        Dim id As String
        id = Request.QueryString("ID")
        ss.conOpen()

        Dim CMD As New SqlCommand("select * from UserMaster where id='" + id + "'", ss.con)
        Dim adp As New SqlDataAdapter()
        Dim dt As New Data.DataTable()
        adp.SelectCommand = CMD
        adp.Fill(dt)
        DetailsView1.DataSource = dt
        DetailsView1.DataBind()
    End Sub
End Class
