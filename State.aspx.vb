Imports System.Data.SqlClient
Imports System.Data
Imports Class1
Partial Class state
    Inherits System.Web.UI.Page
    Dim dbCon As New Class1

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Try
            dbCon.conOpen()

            Dim cmd As New SqlCommand()
            cmd.Connection = dbCon.con
            cmd.CommandText = "insState"
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("stateId", TextBox1.Text)
            cmd.Parameters.AddWithValue("stateName", TextBox2.Text)
            If cmd.ExecuteNonQuery() Then
                MsgBox("State saved.")
            Else
                MsgBox("State not saved.")
            End If
            SqlDataSource1.DataBind()
        Catch ex As Exception
            MsgBox(ex.Message)
        Finally
            dbCon.conClose()
        End Try
    End Sub
    Function getstateid() As Integer
        Dim max As Integer
        Try
            dbCon.conOpen()
            Dim cmd As New SqlCommand("select MAX(coalesce(Stateid,0)) from stateMaster", dbCon.con)
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

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        TextBox1.Text = getstateid()
        TextBox2.Text = ""
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        Try
            dbCon.conOpen()

            Dim cmd As New SqlCommand()
            cmd.Connection = dbCon.con
            cmd.CommandText = "updState"
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("stateId", TextBox1.Text)
            cmd.Parameters.AddWithValue("stateName", TextBox2.Text)
            If cmd.ExecuteNonQuery() Then
                MsgBox("State update.")
            Else
                MsgBox("State not update.")
            End If
            SqlDataSource1.DataBind()
        Catch ex As Exception
            MsgBox(ex.Message)
        Finally
            dbCon.conClose()
        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("uid") Is Nothing Then
            Response.Redirect("login.aspx")
        Else
            TextBox1.Text = getstateid()
            DropDownList1.DataBind()
            DropDownList1.Items.Insert(0, New ListItem("Select State", "0"))
        End If


    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        Try
            dbCon.conOpen()

            Dim cmd As New SqlCommand("select * from stateMaster where stateId=" + DropDownList1.SelectedValue + "", dbCon.con)
            Dim adp As New SqlDataAdapter()
            adp.SelectCommand = cmd
            Dim dt As New Data.DataTable()
            adp.Fill(dt)
            If dt.Rows.Count > 0 Then
                TextBox1.Text = dt.Rows(0)("stateId").ToString
                TextBox2.Text = dt.Rows(0)("stateName").ToString
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
