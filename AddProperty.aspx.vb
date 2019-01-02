Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration
Partial Class AddProperty
    Inherits System.Web.UI.Page
    'Get connection string stored in web config file and store it to a variable
    Dim connectionString As String = WebConfigurationManager.ConnectionStrings("ConnOres").ConnectionString
    Dim myConnection As New SqlConnection(connectionString)

    '******* Get a reference to the currently logged on user and then determine userID value *************
    ' Get a reference to the currently logged on user 
    Dim currentUser As MembershipUser = Membership.GetUser()

    ' Determine the currently logged on user's UserId value 
    Dim currentUserId As Guid = CType(currentUser.ProviderUserKey, Guid)

    Protected Sub SqlDataSource1_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Inserted
        Me.ShowInfoMessage.Text = "Record Has been Saved Successfully"
        Me.ShowInfoMessage.Visible = True

    End Sub

    Protected Sub SqlDataSource1_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource1.Inserting
        ' Assign the currently logged on user's UserId to the @UserId parameter 
        e.Command.Parameters("@UserId").Value = currentUserId
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Set initial value for property type
        Dim ProperType As RadioButtonList = Me.DetailsView1.FindControl("RadioButton_PropertyType")
        ProperType.SelectedIndex = 0

        'Set initial value for property mode
        Dim PropertyMode As RadioButtonList = Me.DetailsView1.FindControl("RadioButton_PropertyMode")
        PropertyMode.SelectedIndex = 0


        Me.ShowInfoMessage.Visible = False

        'Set initial value for is Negotiable
        'Dim ISNegotiable As CheckBox = Me.DetailsView1.FindControl("IsNegotiable")
        ' ISNegotiable.Checked = True
    End Sub

    'Protected Sub DropDownList5_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
    '    Dim DDL As DropDownList = sender

    '    Dim AreaLoc As DropDownList = Me.DetailsView1.FindControl("DropDownList4")
    '    AreaLoc.DataBind()

    'End Sub


End Class
