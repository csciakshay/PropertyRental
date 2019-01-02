Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration

Partial Class Register
    Inherits System.Web.UI.Page

    Protected Sub CreateUserWizard1_CreatedUser(ByVal sender As Object, ByVal e As System.EventArgs) Handles CreateUserWizard1.CreatedUser
        '' Get the UserId of the just-added user 
        'Dim newUser As MembershipUser = Membership.GetUser(CreateUserWizard1.UserName)
        'Dim newUserId As Guid = CType(newUser.ProviderUserKey, Guid)

        '' Insert a new record into customer table
        'Dim connectionString As String = ConfigurationManager.ConnectionStrings("ConnOres").ConnectionString

        'Dim insertSql As String = "INSERT INTO Customer(UserId, Name, PhoneNo, MobileNo, CountryID, StateID, CityID, Address1, Address2, Gender, FaxNo, BirthDate,UserType,UserName) VALUES(@UserId, @Name, @PhoneNo, @MobileNo, @CountryID, @StateID, @CityID, @Address1, @Address2, @Gender, @FaxNo, @BirthDate,@UserType,@UserName)"

        'Using myConnection As New SqlConnection(connectionString)

        '    myConnection.Open()

        '    Dim myCommand As New SqlCommand(insertSql, myConnection)

        '    myCommand.Parameters.AddWithValue("@UserId", newUserId)
        '    myCommand.Parameters.AddWithValue("@Name", DBNull.Value)
        '    myCommand.Parameters.AddWithValue("@PhoneNo", DBNull.Value)
        '    myCommand.Parameters.AddWithValue("@MobileNo", DBNull.Value)
        '    myCommand.Parameters.AddWithValue("@CountryID", DBNull.Value)
        '    myCommand.Parameters.AddWithValue("@StateID", DBNull.Value)
        '    myCommand.Parameters.AddWithValue("@CityID", DBNull.Value)
        '    myCommand.Parameters.AddWithValue("@Address1", DBNull.Value)
        '    myCommand.Parameters.AddWithValue("@Address2", DBNull.Value)
        '    myCommand.Parameters.AddWithValue("@Gender", DBNull.Value)
        '    myCommand.Parameters.AddWithValue("@FaxNo", DBNull.Value)
        '    myCommand.Parameters.AddWithValue("@BirthDate", DBNull.Value)
        '    myCommand.Parameters.AddWithValue("@UserType", "Customer")
        '    myCommand.Parameters.AddWithValue("@UserName", newUser.ToString)


        '    myCommand.ExecuteNonQuery()
        '    myConnection.Close()

        'End Using
        insert_user_role()

    End Sub


    Protected Sub insert_user_role()
        Dim pUserID As New Guid(Membership.GetUser(CreateUserWizard1.UserName).ProviderUserKey.ToString())

        Dim intFeedBack = 0

        Dim connectionString As String = WebConfigurationManager.ConnectionStrings("ConnOres").ConnectionString
        Dim myConnection As New SqlConnection(connectionString)

        'insert user role
        Dim myCommand As New SqlCommand("INSERT INTO aspnet_UsersInRoles (RoleId, UserId) VALUES (@RoleId, @UserId)", myConnection)

        myCommand.Parameters.AddWithValue("@RoleId", "5d696033-e480-4b32-bccf-724d0e2f12f6")   'customer role id
        myCommand.Parameters.AddWithValue("@UserId", pUserID)

        Using myConnection

            myConnection.Open()
            intFeedBack = myCommand.ExecuteScalar()

        End Using

    End Sub

    Protected Sub CreateUserWizard1_SendingMail(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MailMessageEventArgs) Handles CreateUserWizard1.SendingMail
        'Send an email to the address on file
        Dim userInfo As MembershipUser = Membership.GetUser(CreateUserWizard1.UserName)

        'Construct the verification URL
        Dim verifyUrl As String = Request.Url.GetLeftPart(UriPartial.Authority) & Page.ResolveUrl("~/Verify.aspx?ID=" & userInfo.ProviderUserKey.ToString())

        'Replace <%VerifyUrl%> placeholder with verifyUrl value
        e.Message.Body = e.Message.Body.Replace("<%VerifyUrl%>", verifyUrl)


        Dim mm As New Net.Mail.MailMessage()

        mm.From = e.Message.From

        mm.Subject = e.Message.Subject.ToString()

        mm.[To].Add(e.Message.[To](0))

        mm.Body = e.Message.Body
        mm.IsBodyHtml = True

        'e.Message.IsBodyHtml = True

        Dim smtp As New Net.Mail.SmtpClient()
        smtp.EnableSsl = True

        smtp.Send(mm)
        e.Cancel = True
    End Sub

    
End Class
