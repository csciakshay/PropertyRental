Imports System.Data.SqlClient
Imports System.Data
Imports Class1


Partial Class city
    Inherits System.Web.UI.Page
    Dim dbCon As New Class1

    Function getcityid() As Integer
        Dim max As Integer
        Try
            dbCon.conOpen()
            Dim cmd As New SqlCommand("select MAX(coalesce(Cityid,0)) from cityMaster", dbCon.con)
            If IsDBNull(cmd.ExecuteScalar()) Then
                max = 0
            Else
                max = cmd.ExecuteScalar()
            End If
        Catch ex As Exception
            MsgBox(ex.Message)

        Finally
            dbCon.conClose()
        End Try
        Return max + 1

    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("uid") Is Nothing Then
            Response.Redirect("login.aspx")
        Else
            TextBox1.Text = getcityid()
        End If

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Try
            dbCon.conOpen()

            Dim cmd As New SqlCommand()
            cmd.Connection = dbCon.con
            cmd.CommandText = "StoredProcedure1"
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("cityId", TextBox1.Text)
            cmd.Parameters.AddWithValue("cityName", TextBox2.Text)
            If cmd.ExecuteNonQuery() Then
                MsgBox("City saved.")
            Else
                MsgBox("City not saved.")
            End If
            SqlDataSource1.DataBind()
        Catch ex As Exception
            MsgBox(ex.Message)
        Finally
            dbCon.conClose()
        End Try
        
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        TextBox2.Text = ""
        TextBox1.Text = getcityid()
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        Try
            dbCon.conOpen()

            Dim cmd As New SqlCommand()
            cmd.Connection = dbCon.con
            cmd.CommandText = "updCity"
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("cityId", TextBox1.Text)
            cmd.Parameters.AddWithValue("cityName", TextBox2.Text)
            If cmd.ExecuteNonQuery() Then
                MsgBox("City saved.")
            Else
                MsgBox("City not saved.")
            End If
            SqlDataSource1.DataBind()
        Catch ex As Exception
            MsgBox(ex.Message)
        Finally
            dbCon.conClose()
        End Try
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        Try
            dbCon.conOpen()

            Dim cmd As New SqlCommand("select * from cityMaster where cityId=" + DropDownList1.SelectedValue + "", dbCon.con)
            Dim adp As New SqlDataAdapter()
            adp.SelectCommand = cmd
            Dim dt As New Data.DataTable()
            adp.Fill(dt)
            If dt.Rows.Count > 0 Then
                TextBox1.Text = dt.Rows(0)("cityId").ToString
                TextBox2.Text = dt.Rows(0)("cityName").ToString
            Else
                MsgBox("No record found")
            End If

        Catch ex As Exception
            MsgBox(ex.Message)
        Finally
            dbCon.conClose()
        End Try
    End Sub
End Class
