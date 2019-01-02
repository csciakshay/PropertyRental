Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration
Partial Class UpdateBidStatus
    Inherits System.Web.UI.Page
    'Get connection string stored in web config file and store it to a variable
    'Dim connectionString As String = WebConfigurationManager.ConnectionStrings("ConnOres").ConnectionString
    'Dim myConnection As New SqlConnection(connectionString)

    Dim currentUser As MembershipUser  'Variable that hold current loggedin user info   
    Dim currentUserId As Guid          'holds currently logged on user's UserId value 



    Protected Sub SqlDataSource1_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource1.Inserting
        ' Assign the currently logged on user's UserId to the @UserId parameter 
        'e.Command.Parameters("@UserId").Value = currentUserId
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        ' Get a reference to the currently logged on user 
        currentUser = Membership.GetUser()

        If currentUser Is Nothing Then
            'Me.TextBox2.Text = "user is not loggedin"
        Else
            currentUserId = CType(currentUser.ProviderUserKey, Guid)
        End If

        If check_property() Then
            'Set initial value for property type
            'Dim ProperType As RadioButtonList = Me.DetailsView1.FindControl("RadioButton_PropertyType")
            'ProperType.SelectedIndex = 0


            'Set initial value for property mode
            'Dim PropertyMode As RadioButtonList = Me.DetailsView1.FindControl("RadioButton_PropertyMode")
            'PropertyMode.SelectedIndex = 0

            Me.BbtnImage.Visible = False
        Else
            Me.PanelBidding.Visible = False
            Me.BbtnImage.Visible = False

        End If

        ShowInfoMessage.Visible = False

    End Sub


    Protected Sub SqlDataSource1_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting
        ' Assign the currently logged on user's UserId to the @UserId parameter 
        'e.Command.Parameters("@UserId").Value = currentUserId
    End Sub



    Protected Sub DetailsView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DetailsView1.DataBound
        dtvShowImage.DataBind()

        'If check_property() Then
        '    check_image_status()
        '    Session("pPropertyID") = DetailsView1.SelectedValue
        'End If

    End Sub

    Protected Sub DetailsView1_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewPageEventArgs) Handles DetailsView1.PageIndexChanging

        dtvShowImage.DataBind()

        'If check_property() Then
        '    check_image_status()
        '    Session("pPropertyID") = DetailsView1.SelectedValue
        'End If

    End Sub

    Protected Sub check_image_status()
        'execute query in database

        Dim connectionString1 As String = WebConfigurationManager.ConnectionStrings("ConnOres").ConnectionString
        Dim myConnection1 As New SqlConnection(connectionString1)

        Dim myCommand1 As New SqlCommand("SELECT count(*) AS vCount FROM PropertyImage Where PropertyID = @PropertyID", myConnection1)
        Dim myReader1 As SqlDataReader

        myCommand1.Parameters.AddWithValue("@PropertyID", DetailsView1.SelectedValue)

        Using myConnection1

            myConnection1.Open()


            myReader1 = myCommand1.ExecuteReader()
            myReader1.Read() ' The first row in the result set is now available.

            If myReader1("vCount") = 0 Then

                BbtnImage.Text = "Add Image"

            Else

                BbtnImage.Text = "Edit Image"
            End If

            myReader1.Close()
        End Using
    End Sub

    Protected Sub SqlDataSource1_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource1.Updating
        'e.Command.Parameters("@UserId").Value = currentUserId
    End Sub

    Protected Function check_property() As Boolean
        Dim connectionString1 As String = WebConfigurationManager.ConnectionStrings("ConnOres").ConnectionString
        Dim myConnection1 As New SqlConnection(connectionString1)
        Dim isPropertyExists As Boolean

        Dim myCommand1 As New SqlCommand("SELECT count(*) AS vCount FROM Property Where UserId = @UserId", myConnection1)
        Dim myReader1 As SqlDataReader

        myCommand1.Parameters.AddWithValue("@UserId", currentUserId)

        Using myConnection1

            myConnection1.Open()

            myReader1 = myCommand1.ExecuteReader()
            myReader1.Read() ' The first row in the result set is now available.

            If myReader1("vCount") = 0 Then
                isPropertyExists = False

            Else
                isPropertyExists = True
            End If

            myReader1.Close()
        End Using
        Return isPropertyExists
    End Function


    Protected Sub btnStartBid_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.SqlDsBidMaster.Insert()
    End Sub



    Protected Sub SqlDsBidMaster_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDsBidMaster.Inserting

        'Dim vBidStarting As TextBox = Me.grdBidMaster.Controls(0).Controls(0).FindControl("txtBidStarting")
        'e.Command.Parameters("@BidStarting").Value = vBidStarting.Text

        'Dim vBidEnding As TextBox = Me.grdBidMaster.Controls(0).Controls(0).FindControl("txtBidEndng")
        'e.Command.Parameters("@BidEnding").Value = vBidEnding.Text

        'Me.grdBidMaster.DataBind()

    End Sub

   
    Protected Sub sqldsBidDetail_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles sqldsBidDetail.Updated
        ShowInfoMessage.Text = "Record Has been updated Successfully"
        ShowInfoMessage.Visible = True
    End Sub
End Class
