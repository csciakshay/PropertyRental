
Partial Class ContactUs
    Inherits System.Web.UI.Page

    Dim currentUser As MembershipUser  'Variable that hold current loggedin user info   
    Dim currentUserId As Guid          'holds currently logged on user's UserId value 

    

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' Get a reference to the currently logged on user 
        currentUser = Membership.GetUser()

        If currentUser Is Nothing Then
            'Me.TextBox2.Text = "user is not loggedin"
        Else
            currentUserId = CType(currentUser.ProviderUserKey, Guid)
        End If

        Me.ShowInfoMessage.Visible = False
    End Sub

    Protected Sub SqlDsContactUs_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDsContactUs.Inserted

        Me.ShowInfoMessage.Text = "Record Has been Saved Successfully"
        Me.ShowInfoMessage.Visible = True

    End Sub

    Protected Sub SqlDsContactUs_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDsContactUs.Inserting

        If currentUser Is Nothing Then
            'Me.TextBox2.Text = "user is not loggedin"
        Else
            e.Command.Parameters("@UserId").Value = currentUserId
        End If

    End Sub


End Class
