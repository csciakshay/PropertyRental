Imports System.Data.SqlClient

Partial Class ShowPicture
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim pAdvertisementID As Integer = Convert.ToInt32(Request.QueryString("pAdvertisementID"))

        'Connect to the database and bring back the image contents & MIME type for the specified picture
        Using myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnOres").ConnectionString)

            Const SQL As String = "SELECT [MIMEType], [ImageData] FROM [AddImage] WHERE [AdvertisementID] = @AdvertisementID"
            Dim myCommand As New SqlCommand(SQL, myConnection)
            myCommand.Parameters.AddWithValue("@AdvertisementID", pAdvertisementID)

            myConnection.Open()

            Dim myReader As SqlDataReader = myCommand.ExecuteReader
            If myReader.Read Then
                Response.ContentType = myReader("MIMEType").ToString()
                Response.BinaryWrite(myReader("ImageData"))
            End If
            myReader.Close()
            myConnection.Close()
        End Using
    End Sub
End Class
