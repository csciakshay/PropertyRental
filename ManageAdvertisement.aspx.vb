Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration
Partial Class ManageAdvertisement
    Inherits System.Web.UI.Page

    'Get connection string stored in web config file and store it to a variable
    'Dim connectionString As String = WebConfigurationManager.ConnectionStrings("ConnOres").ConnectionString
    'Dim myConnection As New SqlConnection(connectionString)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ShowInfoMessage.Visible = False
    End Sub



    Protected Sub DropDownList1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.DataBound

        Session("pAdvertisementID") = DetailsView1.SelectedValue
    End Sub

    Protected Sub DetailsView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DetailsView1.DataBound
        check_image_status()
        Session("pAdvertisementID") = DetailsView1.SelectedValue


        DtvImage.DataBind()


    End Sub



    Protected Sub DetailsView1_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewPageEventArgs) Handles DetailsView1.PageIndexChanging
        check_image_status()
        Session("pAdvertisementID") = DetailsView1.SelectedValue


        DtvImage.DataBind()
    End Sub



    Public Sub check_image_status()
        'execute query in database

        Dim connectionString1 As String = WebConfigurationManager.ConnectionStrings("ConnOres").ConnectionString
        Dim myConnection1 As New SqlConnection(connectionString1)

        Dim myCommand1 As New SqlCommand("SELECT count(*) AS vCount FROM AddImage Where AdvertisementID = @AdvertisementID", myConnection1)
        Dim myReader1 As SqlDataReader

        myCommand1.Parameters.AddWithValue("@AdvertisementID", DetailsView1.SelectedValue)

        Using myConnection1

            myConnection1.Open()


            myReader1 = myCommand1.ExecuteReader()
            myReader1.Read()

            If myReader1("vCount") = 0 Then

                BbtnImage.Text = "Add Image"

            Else

                BbtnImage.Text = "Edit Image"
            End If

            myReader1.Close()
        End Using
    End Sub

    'Protected Sub SqlDsAdd_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDsAdd.Updating
    '    e.Command.Parameters("@ClientID").Value = Me.DropDownList1.SelectedValue
    'End Sub

    Protected Sub SqlDsAdd_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDsAdd.Updated
        ShowInfoMessage.Text = "Record Has been saved Successfully"
        ShowInfoMessage.Visible = True
    End Sub
End Class
