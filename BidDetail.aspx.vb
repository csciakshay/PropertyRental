Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration
Partial Class BidDetail
    Inherits System.Web.UI.Page
    Dim currentUser As MembershipUser  'Variable that hold current loggedin user info   
    Dim currentUserId As Guid    'holds currently logged on user's UserId value 

    'Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
    '    If Me.Panelnsert.Visible = False Then
    '        Me.Panelnsert.Visible = True
    '    Else
    '        Me.Panelnsert.Visible = False
    '    End If
    'End Sub



    

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        currentUser = Membership.GetUser()

        If currentUser Is Nothing Then

            'Me.TextBox2.Text = "user is not loggedin"
        Else
            currentUserId = CType(currentUser.ProviderUserKey, Guid)


            If IsPropertyBidExists() Then
                DtvInsert.DefaultMode = DetailsViewMode.Edit
            Else
                DtvInsert.DefaultMode = DetailsViewMode.Insert
            End If

        End If
        Me.ShowInfoMessage.Visible = False
    End Sub


    Protected Function IsPropertyBidExists() As Boolean
        'execute query in database
        Dim connectionString As String = WebConfigurationManager.ConnectionStrings("ConnOres").ConnectionString
        Dim myConnection As New SqlConnection(connectionString)

        Dim myCommand As New SqlCommand("SELECT count(*) AS vCount FROM BidMaster Where PropertyID=@PropertyID", myConnection)
        Dim vPropertyID As Boolean
        Dim myReader As SqlDataReader

        myCommand.Parameters.AddWithValue("@PropertyID", CType(Session.Item("pPropertyID"), String))

        Using myConnection

            myConnection.Open()
            myReader = myCommand.ExecuteReader()
            myReader.Read() ' The first row in the result set is now available.

            If currentUser Is Nothing Then
            Else
                If myReader("vCount") = 0 Then
                    vPropertyID = False
                Else
                    vPropertyID = True
                End If
            End If
            myReader.Close()
        End Using

        Return vPropertyID
    End Function

    Protected Sub SqlDsBidMaster_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDsBidMaster.Inserted
        Me.ShowInfoMessage.Text = "Record Has been Saved Successfully"
        Me.ShowInfoMessage.Visible = True

        Me.DtvInsert.DataBind()

    End Sub

    Protected Sub SqlDsBidMaster_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDsBidMaster.Updated
        Me.ShowInfoMessage.Text = "Record Has been Saved Successfully"
        Me.ShowInfoMessage.Visible = True
    End Sub
End Class
