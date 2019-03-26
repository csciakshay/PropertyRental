Imports Class1
Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Partial Class propertyDtl
    Inherits System.Web.UI.Page
    Dim pid As String
    Dim ss As New Class1

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Session("uid") Is Nothing Then
                Response.Redirect("login.aspx")
            End If

            pid = Request.QueryString("ID")
            ss.conOpen()
            Dim CMD As New SqlCommand("select PropertyMaster.id,ptype,title,description,PropertyMaster.address,(select cityname from dbo.getCity(PropertyMaster.city)) as city, (select stateName from dbo.getState(PropertyMaster.state)) as state,location,PropertyMaster.pincode,aminities,readytomove,PropertyMaster.createdate,carpatarea,builtuparea,price,userMaster.name,pricenego,views from PropertyMaster join userMaster on PropertyMaster.registerby=userMaster.id where PropertyMaster.id='" + pid + "'", ss.con)
            Dim adp As New SqlDataAdapter()
            Dim dt As New Data.DataTable()
            adp.SelectCommand = CMD
            adp.Fill(dt)
            DetailsView1.DataSource = dt
            DetailsView1.DataBind()

            Dim CMD1 As New SqlCommand("select images from PropertyPhotoes where pid='" + pid + "'", ss.con)
            Dim adp1 As New SqlDataAdapter()
            Dim dt1 As New Data.DataTable()
            adp1.SelectCommand = CMD1
            adp1.Fill(dt1)
            DataList1.DataSource = dt1
            DataList1.DataBind()
            DataList1.RepeatColumns = DataList1.Items.Count

            Dim cmd2 As New SqlCommand("update PropertyMaster set views=" + getNoOfViews().ToString + " where id='" + pid + "'", ss.con)
            cmd2.ExecuteNonQuery()
        Catch ex As Exception
            MsgBox(ex.Message)
        Finally
            ss.conClose()
        End Try
        


    End Sub
    Protected Function getNoOfViews() As Integer
        'con.Open()
        Dim max As Integer
        Try

            Dim cmd As New SqlCommand("Select COALESCE(views,0) from propertymaster where id='" + pid + "'", ss.con)
            If IsDBNull(cmd.ExecuteScalar()) Then
                max = 0
            Else
                max = cmd.ExecuteScalar()
            End If

            ' con.Close()

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        Return max + 1

    End Function

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Try
            ss.conOpen()
            Dim cmd As New SqlCommand()
            cmd.Connection = ss.con
            cmd.CommandText = "insFavProperty"
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("uid", Session("uid"))
            cmd.Parameters.AddWithValue("pid", pid)
            If cmd.ExecuteNonQuery() Then
                MsgBox("saved.")
                Response.Redirect("index.aspx")
            Else
                MsgBox("Not saved.")
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        Finally
            ss.conClose()
        End Try

    End Sub
End Class
