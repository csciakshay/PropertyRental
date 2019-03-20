Imports System.Data.SqlClient
Imports System.Data
Imports Class1
Partial Class FavProperty
    Inherits System.Web.UI.Page
    Dim dbCon As New Class1

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("uid") Is Nothing Then
            Response.Redirect("login.aspx")
        End If
        Try
            Dim id As String
            id = Request.QueryString("ID")
            dbCon.conOpen()

            Dim cmd As New SqlCommand()
            cmd.Connection = dbCon.con
            cmd.CommandText = "insFavProperty"
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("uid", Session("uid"))
            cmd.Parameters.AddWithValue("pid", id)
            If cmd.ExecuteNonQuery() Then
                MsgBox("saved.")
                Response.Redirect("index.aspx")
            Else
                MsgBox("Not saved.")
            End If

        Catch ex As Exception
            MsgBox(ex.Message)
        Finally
            dbCon.conClose()
        End Try
    End Sub
End Class
