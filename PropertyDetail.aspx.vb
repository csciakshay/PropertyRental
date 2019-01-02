Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration

Partial Class PropertyDetail
    Inherits System.Web.UI.Page
    'Get connection string stored in web config file and store it to a variable
    Dim connectionString As String = WebConfigurationManager.ConnectionStrings("ConnOres").ConnectionString
    Dim myConnection As New SqlConnection(connectionString)

    Dim currentUser As MembershipUser  'Variable that hold current loggedin user info   
    Dim UserRole As String
    Dim currentUserId As Guid    'holds currently logged on user's UserId value 


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        ' Get a reference to the currently logged on user 
        currentUser = Membership.GetUser()

        If currentUser Is Nothing Then
            panelBidding.Visible = False
            'Me.TextBox2.Text = "user is not loggedin"
        Else
            currentUserId = CType(currentUser.ProviderUserKey, Guid)
            get_user_role()

            If UserRole = "Customer" And IsPropertyBidExists() Then
                panelBidding.Visible = True
            Else
                panelBidding.Visible = False
            End If

        End If
        Me.ShowInfoMessage.Visible = False

    End Sub


    Protected Sub get_user_role()

        Dim connectionString As String = WebConfigurationManager.ConnectionStrings("ConnOres").ConnectionString
        Dim myConnection As New SqlConnection(connectionString)

        Dim myCommand As New SqlCommand("SELECT distinct aspnet_Roles.RoleName as RoleName FROM aspnet_Roles INNER JOIN aspnet_UsersInRoles ON aspnet_Roles.RoleId = aspnet_UsersInRoles.RoleId WHERE (aspnet_UsersInRoles.UserId = @UserId)", myConnection)
        Dim myReader As SqlDataReader

        myCommand.Parameters.AddWithValue("@UserID", currentUserId)

        Using myConnection

            myConnection.Open()
            myReader = myCommand.ExecuteReader()
            myReader.Read() ' The first row in the result set is now available.

            If currentUser Is Nothing Then
            Else
                UserRole = myReader("RoleName")
            End If

            myReader.Close()
        End Using

    End Sub


    Protected Sub DetailsView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DetailsView1.DataBound
        'execute query in database
        Dim myCommand As New SqlCommand("SELECT count(*) AS vCount FROM PropertyBid Where UserID = @UserID AND PropertyID=@PropertyID", myConnection)

        Dim myReader As SqlDataReader

        'Dim vDtvBid As DetailsView = Me.LgnvCustomer.FindControl("DtvBid")

        myCommand.Parameters.AddWithValue("@UserID", currentUserId)
        myCommand.Parameters.AddWithValue("@PropertyID", Me.DetailsView1.SelectedValue)

        Using myConnection

            myConnection.Open()
            myReader = myCommand.ExecuteReader()
            myReader.Read() ' The first row in the result set is now available.

            If currentUser Is Nothing Then
            Else
                If myReader("vCount") = 0 Then
                    vDtvBid.DefaultMode = DetailsViewMode.Insert
                Else
                    vDtvBid.DefaultMode = DetailsViewMode.ReadOnly
                End If
            End If

            myReader.Close()
        End Using
        'vDtvBid.DataBind()


    End Sub

    Protected Sub SqlDsBid_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDsBid.Inserted
        DetailsView1.DataBind()
        Me.ShowInfoMessage.Text = "Record Has been Saved Successfully"
        Me.ShowInfoMessage.Visible = True
    End Sub


    'Protected Sub SqlDsBid_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs)
    '    e.Command.Parameters("@UserId").Value = currentUserId

    '    'Dim vDtvBidMaster As DetailsView = Me.LgnvCustomer.FindControl("grdBidMaster")
    '    'e.Command.Parameters("@BidID").Value = vDtvBidMaster.SelectedValue
    'End Sub



    'Protected Sub SqlDsBid_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs)
    '    e.Command.Parameters("@UserId").Value = currentUserId
    'End Sub


    Protected Sub SqlDsBid_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDsBid.Inserting
        e.Command.Parameters("@UserId").Value = currentUserId
    End Sub

    Protected Sub SqlDsBid_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles SqlDsBid.Selecting
        e.Command.Parameters("@UserId").Value = currentUserId
        e.Command.Parameters("@BidID").Value = getBidID()
        e.Command.Parameters("@PropertyID").Value = Me.DetailsView1.SelectedValue

    End Sub

    Protected Function getBidID() As Integer
        'execute query in database
        Dim connectionString As String = WebConfigurationManager.ConnectionStrings("ConnOres").ConnectionString
        Dim myConnection As New SqlConnection(connectionString)

        Dim myCommand As New SqlCommand("SELECT BidID AS BidID FROM PropertyBid Where UserID = @UserID AND PropertyID=@PropertyID", myConnection)
        Dim vBidID As Integer
        Dim myReader As SqlDataReader

        'Dim vDtvBid As DetailsView = Me.LgnvCustomer.FindControl("DtvBid")

        myCommand.Parameters.AddWithValue("@UserID", currentUserId)
        myCommand.Parameters.AddWithValue("@PropertyID", Me.DetailsView1.SelectedValue)

        Using myConnection

            myConnection.Open()
            myReader = myCommand.ExecuteReader()
            myReader.Read() ' The first row in the result set is now available.

            If currentUser Is Nothing Then
            Else
                vBidID = myReader("BidID")

            End If

            myReader.Close()
        End Using

        Return vBidID
    End Function

    Protected Function IsPropertyBidExists() As Boolean
        'execute query in database
        Dim connectionString As String = WebConfigurationManager.ConnectionStrings("ConnOres").ConnectionString
        Dim myConnection As New SqlConnection(connectionString)

        Dim myCommand As New SqlCommand("SELECT count(*) AS vCount FROM BidMaster Where PropertyID=@PropertyID", myConnection)
        Dim vPropertyID As Boolean
        Dim myReader As SqlDataReader

        myCommand.Parameters.AddWithValue("@PropertyID", Request.QueryString("ID"))

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
    
    Protected Sub SqlDsCustomerDetail_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles SqlDsCustomerDetail.Selecting
        e.Command.Parameters("@UserId").Value = get_customer_id()
    End Sub


    Protected Function get_customer_id() As Guid

        Dim vCustomerId As Guid

        'execute query in database
        Dim connectionString As String = WebConfigurationManager.ConnectionStrings("ConnOres").ConnectionString
        Dim myConnection As New SqlConnection(connectionString)

        Dim myCommand As New SqlCommand("SELECT Customer.UserId AS UserId FROM Property INNER JOIN Customer ON Property.UserID = Customer.UserId WHERE (Property.PropertyID = @PropertyID)", myConnection)

        Dim myReader As SqlDataReader

        myCommand.Parameters.AddWithValue("@PropertyID", Request.QueryString("ID"))

        Using myConnection

            myConnection.Open()
            myReader = myCommand.ExecuteReader()
            myReader.Read() ' The first row in the result set is now available.

            vCustomerId = myReader("UserId")
            myReader.Close()
        End Using

        Return vCustomerId

    End Function


   
End Class
