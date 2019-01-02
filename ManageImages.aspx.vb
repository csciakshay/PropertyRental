Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports System.IO

Partial Class AddImages
    Inherits System.Web.UI.Page

    Protected Sub Page_InitComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.InitComplete
        'execute query in database

        Dim connectionString1 As String = WebConfigurationManager.ConnectionStrings("ConnOres").ConnectionString
        Dim myConnection1 As New SqlConnection(connectionString1)

        Dim myCommand1 As New SqlCommand("SELECT count(*) AS vCount FROM PropertyImage Where PropertyID = @PropertyID", myConnection1)
        Dim myReader1 As SqlDataReader

        myCommand1.Parameters.AddWithValue("@PropertyID", CType(Session.Item("pPropertyID"), String))


        Using myConnection1

            myConnection1.Open()
            myReader1 = myCommand1.ExecuteReader()
            myReader1.Read() ' The first row in the result set is now available.

            If myReader1("vCount") = 0 Then
                Me.DtvImage.DefaultMode = DetailsViewMode.Insert

            Else
                Me.DtvImage.DefaultMode = DetailsViewMode.ReadOnly

            End If

            myReader1.Close()
        End Using
    End Sub

    Protected Sub SqlDsImage_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDsImage.Deleted
        ShowErrorMessage("Record Has been Deleted Successfully.")
    End Sub

    Protected Sub SqlDsImage_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDsImage.Inserted
        ShowErrorMessage("Record Has been Saved Successfully.")
    End Sub


    Protected Sub SqlDsImage_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles SqlDsImage.Selecting
        e.Command.Parameters("@PropertyID").Value = CType(Session.Item("pPropertyID"), String)
    End Sub

    Protected Sub DtvImage_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) Handles DtvImage.ItemDeleted
        Response.Redirect("~/ManageProperty1.aspx")
    End Sub



    Protected Sub DtvImage_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles DtvImage.ItemInserting

        'Reference the FileUpload control
        Dim UploadedFile As FileUpload = CType(DtvImage.FindControl("UploadedFile"), FileUpload)

        'Make sure a file has been successfully uploaded
        If UploadedFile.PostedFile Is Nothing OrElse String.IsNullOrEmpty(UploadedFile.PostedFile.FileName) OrElse UploadedFile.PostedFile.InputStream Is Nothing Then
            ShowErrorMessage("No file was uploaded. Please make sure that you've selected a file to upload.")
            e.Cancel = True
            Exit Sub
        End If

        'Make sure we are dealing with a JPG or GIF file
        Dim extension As String = Path.GetExtension(UploadedFile.PostedFile.FileName).ToLower()
        Dim MIMEType As String = Nothing

        Select Case extension
            Case ".gif"
                MIMEType = "image/gif"
            Case ".jpg", ".jpeg", ".jpe"
                MIMEType = "image/jpeg"
            Case ".png"
                MIMEType = "image/png"

            Case Else
                'Invalid file type uploaded
                ShowErrorMessage("Only GIF, JPG, and PNG files can be uploaded.")
                e.Cancel = True
                Exit Sub
        End Select

        e.Values("PropertyID") = CType(Session.Item("pPropertyID"), String)


        'Specify the values for the MIMEType and ImageData parameters
        e.Values("MIMEType") = MIMEType

        'Load FileUpload's InputStream into Byte array
        Dim imageBytes(UploadedFile.PostedFile.InputStream.Length) As Byte
        UploadedFile.PostedFile.InputStream.Read(imageBytes, 0, imageBytes.Length)

        e.Values("ImageData") = imageBytes

    End Sub

    Private Sub ShowErrorMessage(ByVal msg As String)
        ErrorMessage.Text = msg
        ErrorMessage.Visible = True
    End Sub

    Protected Sub DtvImage_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DtvImage.ItemInserted
        'If item successfully inserted, send user back to default
        If e.Exception Is Nothing Then
            Response.Redirect("~/ManageImages.aspx")
        End If
    End Sub

    'Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs)
    'If Cancel button is clicked, send user to Default
    '    Response.Redirect("~/ManageImages.aspx")
    'End Sub

    Protected Sub btnCancel1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("~/ManageProperty1.aspx")
    End Sub

    Protected Sub btnCancel_Click1(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("~/ManageProperty1.aspx")
    End Sub

    Protected Sub btnBack_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("~/ManageProperty1.aspx")
    End Sub
End Class
