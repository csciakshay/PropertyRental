
Partial Class logout
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' If Request.QueryString("action") <> "" Then
        'Response.Clear()
        Session.Abandon()
        Session.Clear()
        Session.Timeout = 0
        Response.Redirect("login.aspx")
        'End If

    End Sub
End Class
