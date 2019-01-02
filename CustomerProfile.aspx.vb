Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration

Partial Class CustomerProfile
    Inherits System.Web.UI.Page

    

    '******* Get a reference to the currently logged on user and then determine userID value *************
    ' Get a reference to the currently logged on user 
    Dim currentUser As MembershipUser = Membership.GetUser()

    ' Determine the currently logged on user's UserId value 
    Dim currentUserId As Guid = CType(currentUser.ProviderUserKey, Guid)

    Protected Sub CustomerProfileDataSource_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles CustomerProfileDataSource.Inserted
        change_made()
        CustomerProfile.DataBind()

        Me.ShowInfoMessage.Text = "Record Has been Saved Successfully"
        Me.ShowInfoMessage.Visible = True
    End Sub

    Protected Sub CustomerProfileDataSource_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles CustomerProfileDataSource.Inserting
        ' Assign the currently logged on user's UserId to the @UserId parameter 
        e.Command.Parameters("@UserId").Value = currentUserId
        e.Command.Parameters("@UserType").Value = "Customer"
        e.Command.Parameters("@UserName").Value = currentUser.ToString

    End Sub


    Protected Sub CustomerProfileDataSource_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles CustomerProfileDataSource.Selecting
        ' Assign the currently logged on user's UserId to the @UserId parameter 
        e.Command.Parameters("@UserId").Value = currentUserId
    End Sub

    Protected Sub CustomerProfile_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles CustomerProfile.ItemUpdated
        Me.ShowInfoMessage.Text = "Record Has been Saved Successfully"
        Me.ShowInfoMessage.Visible = True
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        change_made()
        Me.ShowInfoMessage.Visible = False
    End Sub

    Protected Sub change_made()
        'Get connection string stored in web config file and store it to a variable
        Dim connectionString As String = WebConfigurationManager.ConnectionStrings("ConnOres").ConnectionString
        Dim myConnection As New SqlConnection(connectionString)

        'execute query in database
        Dim myCommand As New SqlCommand("SELECT count(*) AS vCount FROM Customer Where UserID = @UserID", myConnection)
        Dim myReader As SqlDataReader

        myCommand.Parameters.AddWithValue("@UserID", currentUserId.ToString)

        Using myConnection

            myConnection.Open()
            myReader = myCommand.ExecuteReader()
            myReader.Read() ' The first row in the result set is now available.

            If myReader("vCount") = 0 Then
                CustomerProfile.DefaultMode = DetailsViewMode.Insert
            Else
                CustomerProfile.DefaultMode = DetailsViewMode.Edit
            End If

            myReader.Close()
        End Using

    End Sub



    
End Class
