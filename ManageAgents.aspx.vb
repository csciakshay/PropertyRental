Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration
Partial Class ManageAgents
    Inherits System.Web.UI.Page
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        If Me.Panelnsert.Visible = False Then
            Me.Panelnsert.Visible = True
        Else
            Me.Panelnsert.Visible = False
        End If

    End Sub


    

    Protected Sub CreateUserWizardAgent_CreatedUser(ByVal sender As Object, ByVal e As System.EventArgs) Handles CreateUserWizardAgent.CreatedUser
        Dim pUserID As New Guid(Membership.GetUser(CreateUserWizardAgent.UserName).ProviderUserKey.ToString())

        Dim intFeedBack = 0

        Dim connectionString As String = WebConfigurationManager.ConnectionStrings("ConnOres").ConnectionString
        Dim myConnection As New SqlConnection(connectionString)

        'insert agent details
        Dim myCommand As New SqlCommand("INSERT INTO Agents (AgentName, AreaLocID, ClientID, UserId) VALUES (@AgentName, @AreaLocID, @ClientID, @UserId)", myConnection)

        myCommand.Parameters.AddWithValue("@AgentName", tboxAgentName.Text)
        myCommand.Parameters.AddWithValue("@AreaLocID", Me.ddlAreaLoc.SelectedValue)
        myCommand.Parameters.AddWithValue("@ClientID", Me.ddlClient.SelectedValue)
        myCommand.Parameters.AddWithValue("@UserId", pUserID)

        Using myConnection

            myConnection.Open()
            intFeedBack = myCommand.ExecuteScalar()

        End Using

        insert_user_role()


    End Sub


    Protected Sub insert_user_role()
        Dim pUserID As New Guid(Membership.GetUser(CreateUserWizardAgent.UserName).ProviderUserKey.ToString())

        Dim intFeedBack = 0

        Dim connectionString As String = WebConfigurationManager.ConnectionStrings("ConnOres").ConnectionString
        Dim myConnection As New SqlConnection(connectionString)

        'insert user role
        Dim myCommand As New SqlCommand("INSERT INTO aspnet_UsersInRoles (RoleId, UserId) VALUES (@RoleId, @UserId)", myConnection)

        myCommand.Parameters.AddWithValue("@RoleId", ddlRoles.SelectedValue)
        myCommand.Parameters.AddWithValue("@UserId", pUserID)

        Using myConnection

            myConnection.Open()
            intFeedBack = myCommand.ExecuteScalar()

        End Using

    End Sub


    Protected Sub SqlDataSource1_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Inserted
        ShowInfoMessage.Text = "Record Has been saved Successfully"
        ShowInfoMessage.Visible = True
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ShowInfoMessage.Visible = False
    End Sub

    
End Class
