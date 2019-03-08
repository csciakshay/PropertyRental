Imports Class1
Imports System.Data.SqlClient
Imports System.Data

Partial Class Default3
    Inherits System.Web.UI.Page
    Dim ss As New Class1
    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        Try
            Dim imagepath As String
            Dim Gender As String
        If RadioButton1.Checked Then
            Gender = "Male"
        Else
            Gender = "Female"
        End If
        If FileUpload1.HasFile Then
            FileUpload1.PostedFile.SaveAs(Server.MapPath("~\upload\" + FileUpload1.FileName))
                imagepath = "~\upload\" + FileUpload1.FileName
            Else
                imagepath = "~\upload\default.png"
            End If
        ss.conOpen()
        Dim rr As New SqlCommand()
        rr.Connection = ss.con
        rr.CommandText = "StoredProcedure2"
            rr.CommandType = CommandType.StoredProcedure
            rr.Parameters.AddWithValue("userId", getuserid())
        rr.Parameters.AddWithValue("userName", TextBox1.Text)
        rr.Parameters.AddWithValue("address", TextBox2.Text)
        rr.Parameters.AddWithValue("mobileno", TextBox3.Text)
            rr.Parameters.AddWithValue("password", FormsAuthentication.HashPasswordForStoringInConfigFile(TextBox4.Text, "md5"))
            rr.Parameters.AddWithValue("city", DropDownList1.SelectedValue)
            rr.Parameters.AddWithValue("state", DropDownList1.SelectedValue)
        rr.Parameters.AddWithValue("pincode", TextBox6.Text)
        rr.Parameters.AddWithValue("email", TextBox7.Text)
        rr.Parameters.AddWithValue("gender", Gender)
            rr.Parameters.AddWithValue("imagepath", imagepath)
        rr.Parameters.AddWithValue("createdate", Date.Now)
            If rr.ExecuteNonQuery() Then
                MsgBox("Register success!")
            Else
                MsgBox("Register fail!")
            End If

        Catch ex As Exception
            MsgBox(ex.Message)
        Finally
            ss.conClose()
        End Try

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        TextBox1.Text = ""
        TextBox2.Text = ""
        TextBox3.Text = ""
        TextBox4.Text = ""
        TextBox5.Text = ""
        TextBox6.Text = ""
        TextBox7.Text = ""
        'TextBox8.Text = ""
        DropDownList1.TabIndex = 0
    End Sub

    'Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
    '    If FileUpload1.HasFile Then
    '        FileUpload1.PostedFile.SaveAs(Server.MapPath("~\upload\" + FileUpload1.FileName))
    '        Label10.Text = "~\upload\" + FileUpload1.FileName
    '    End If
    'End Sub

    Protected Sub Button6_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button6.Click
        Dim Gender, imagepath As String
        If RadioButton1.Checked Then
            Gender = "Male"
        Else
            Gender = "Female"
        End If
        imagepath = ""
        If FileUpload1.HasFile Then
            FileUpload1.PostedFile.SaveAs(Server.MapPath("~\upload\" + FileUpload1.FileName))
            imagepath = "~\upload\" + FileUpload1.FileName
        End If
        ss.conOpen()
       

        Dim rr As New SqlCommand()
        rr.Connection = ss.con
        rr.CommandText = "StoredProcedure5"
        rr.CommandType = CommandType.StoredProcedure
        rr.Parameters.AddWithValue("userId", TextBox9.Text)
        rr.Parameters.AddWithValue("userName", TextBox1.Text)
        rr.Parameters.AddWithValue("address", TextBox2.Text)
        rr.Parameters.AddWithValue("mobileno", TextBox3.Text)
        rr.Parameters.AddWithValue("password", FormsAuthentication.HashPasswordForStoringInConfigFile(TextBox4.Text, "md5"))
        rr.Parameters.AddWithValue("city", DropDownList1.SelectedValue)
        rr.Parameters.AddWithValue("state", DropDownList1.SelectedValue)
        rr.Parameters.AddWithValue("pincode", TextBox6.Text)
        rr.Parameters.AddWithValue("email", TextBox7.Text)
        rr.Parameters.AddWithValue("gender", Gender)
        rr.Parameters.AddWithValue("imagepath", imagepath)
        rr.ExecuteNonQuery()
        MsgBox("data successfully updated!")

    End Sub
    Function getuserid() As Integer
        Dim max As Integer
        Try
            ' ss.conOpen()
            Dim cmd As New SqlCommand("select MAX(coalesce(id,0)) from userMaster", ss.con)
            If IsDBNull(cmd.ExecuteScalar()) Then
                max = 0
            Else
                max = cmd.ExecuteScalar()
            End If
        Catch ex As Exception
            MsgBox(ex.Message)

        Finally
            '  ss.conClose()
        End Try
        Return max + 1

    End Function

    Protected Sub Button5_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button5.Click
        Try
            ss.conOpen()
            '
            Dim cmd As New SqlCommand("select * from userMaster where id='" + TextBox9.Text + "'", ss.con)
            Dim adp As New SqlDataAdapter()
            adp.SelectCommand = cmd
            Dim dt As New Data.DataTable()
            adp.Fill(dt)
            If dt.Rows.Count > 0 Then
                TextBox1.Text = dt.Rows(0)("name").ToString
                TextBox2.Text = dt.Rows(0)("address").ToString
                TextBox3.Text = dt.Rows(0)("mobileno").ToString
                '  TextBox4.Text = dt.Rows(0)("password").ToString
                ' TextBox5.Text = dt.Rows(0)("address").ToString
                TextBox6.Text = dt.Rows(0)("pincode").ToString
                TextBox7.Text = dt.Rows(0)("email").ToString
                DropDownList1.SelectedValue = dt.Rows(0)("city").ToString
                DropDownList2.SelectedValue = dt.Rows(0)("state").ToString
                Image1.ImageUrl = dt.Rows(0)("imagepath").ToString
                If dt.Rows(0)("gender").Equals("Male") Then
                    RadioButton1.Checked = True
                Else
                    RadioButton2.Checked = False
                End If
            Else
                MsgBox("No record found")
            End If

        Catch ex As Exception
            MsgBox(ex.Message)
        Finally
            ss.conClose()
        End Try
    End Sub
End Class
