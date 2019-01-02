
Partial Class AddAdvertisements
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ShowInfoMessage.Visible = False
    End Sub

    Protected Sub SqlDsAddAdvertisement_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDsAddAdvertisement.Inserted
        ShowInfoMessage.Text = "Record Has been saved Successfully"
        ShowInfoMessage.Visible = True
    End Sub
End Class
