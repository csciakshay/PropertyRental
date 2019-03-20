
Partial Class graphsReport
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("uid") Is Nothing Then
            Response.Redirect("login.aspx")
        End If
    End Sub
End Class
