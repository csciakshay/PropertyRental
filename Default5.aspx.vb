Imports Class1
Imports System.Data.SqlClient
Imports System.Data

Partial Class Default3
    Inherits System.Web.UI.Page
    Dim ss As New Class1
    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        Dim Gender As String
        If RadioButton1.Checked Then
            Gender = "Male"
        Else
            Gender = "Female"
        End If
        ss.conOpen()


        Dim rr As New SqlCommand()
        rr.Connection = ss.con
        rr.CommandText = "StoredProcedure4"
        rr.CommandType = CommandType.StoredProcedure
        rr.Parameters.AddWithValue("Name", TextBox1.Text)
        rr.Parameters.AddWithValue("Address", TextBox2.Text)
        rr.Parameters.AddWithValue("Mobileno", TextBox3.Text)
        rr.Parameters.AddWithValue("Password", TextBox4.Text)
        rr.Parameters.AddWithValue("City", TextBox8.Text)
        rr.Parameters.AddWithValue("Pincode", TextBox6.Text)
        rr.Parameters.AddWithValue("Email", TextBox7.Text)
        rr.Parameters.AddWithValue("Gender", Gender)
        rr.Parameters.AddWithValue("Fileupload", Label10.Text)
        rr.Parameters.AddWithValue("registerDate", Date.Now)
        rr.ExecuteNonQuery()
        MsgBox("data successfully inserted!")


    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        TextBox1.Text = ""
        TextBox2.Text = ""
        TextBox3.Text = ""
        TextBox4.Text = ""
        TextBox5.Text = ""
        TextBox6.Text = ""
        TextBox7.Text = ""
        TextBox8.Text = ""

    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        If FileUpload1.HasFile Then
            FileUpload1.PostedFile.SaveAs(Server.MapPath("~\upload\" + FileUpload1.FileName))
            Label10.Text = "~\upload\" + FileUpload1.FileName
        End If
    End Sub

    Protected Sub Button6_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button6.Click
        Dim Gender As String
        If RadioButton1.Checked Then
            Gender = "Male"
        Else
            Gender = "Female"
        End If
        ss.conOpen()


        Dim rr As New SqlCommand()
        rr.Connection = ss.con
        rr.CommandText = "StoredProcedure6"
        rr.CommandType = CommandType.StoredProcedure
        rr.Parameters.AddWithValue("Name", TextBox1.Text)
        rr.Parameters.AddWithValue("Address", TextBox2.Text)
        rr.Parameters.AddWithValue("Mobileno", TextBox3.Text)
        rr.Parameters.AddWithValue("City", TextBox8.Text)
        rr.Parameters.AddWithValue("Pincode", TextBox6.Text)
        rr.Parameters.AddWithValue("Email", TextBox7.Text)
        rr.Parameters.AddWithValue("Gender", Gender)
        rr.Parameters.AddWithValue("Fileupload", Label10.Text)
        rr.ExecuteNonQuery()
        MsgBox("data successfully updated!")

    End Sub

    Protected Sub Button5_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button5.Click
        Dim cmd As New SqlCommand("Select * from usermaster where Email='" + TextBox9.Text + "' ", ss.con)
        Dim adp As New SqlDataAdapter()
        adp.SelectCommand = cmd
        Dim dt As New Data.DataTable()
        adp.Fill(dt)

        If dt.Rows.Count > 0 Then
            TextBox1.Text = dt.Rows(0)("Name").ToString()
            TextBox2.Text = dt.Rows(0)("Address").ToString()
            TextBox3.Text = dt.Rows(0)("Mobileno").ToString()
            TextBox8.Text = dt.Rows(0)("City").ToString()
            TextBox6.Text = dt.Rows(0)("Pincode").ToString()
            ' Label10.Text = dt.Rows(0)("Fileupload").ToString()
            If dt.Rows(0)("Gender").ToString().Contains("Male") Then
                RadioButton1.Checked = True
                RadioButton2.Checked = False

            Else
                RadioButton2.Checked = True
                RadioButton1.Checked = False
            End If
        End If
    End Sub
End Class
