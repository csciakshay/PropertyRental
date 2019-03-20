Imports Class1
Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Partial Class propertyreg
    Inherits System.Web.UI.Page
    Dim ss As New Class1
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Try
            Dim priceNego, psold, aminities, readytomove As String
            ss.conOpen()
            aminities = ""
            readytomove = ""
            priceNego = ""
            psold = ""

            If CheckBox1.Checked Then
                priceNego = "Y"
            End If
            If CheckBox2.Checked Then
                psold = "Y"
            Else
                psold = "N"
            End If
            If CheckBox10.Checked Then
                readytomove = "Y"
            End If
            If CheckBox3.Checked Then
                aminities = aminities + "Lifts,"
            End If
            If CheckBox4.Checked Then
                aminities = aminities + "Parks,"
            End If
            If CheckBox5.Checked Then
                aminities = aminities + "VP,"
            End If
            If CheckBox6.Checked Then
                aminities = aminities + "IN,"
            End If
            If CheckBox7.Checked Then
                aminities = aminities + "WS,"
            End If
            If CheckBox8.Checked Then
                aminities = aminities + "Security,"
            End If
            If CheckBox9.Checked Then
                aminities = aminities + "FA,"
            End If
            Dim cmd As New SqlCommand()
            cmd.Connection = ss.con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "insProperty"
            cmd.Parameters.AddWithValue("id", TextBox10.Text)
            cmd.Parameters.AddWithValue("ptype", DropDownList1.SelectedValue)
            cmd.Parameters.AddWithValue("title", TextBox1.Text)
            cmd.Parameters.AddWithValue("description", TextBox2.Text)
            cmd.Parameters.AddWithValue("address", TextBox3.Text)
            cmd.Parameters.AddWithValue("city", DropDownList2.SelectedValue)
            cmd.Parameters.AddWithValue("state", DropDownList3.SelectedValue)
            cmd.Parameters.AddWithValue("location", TextBox4.Text)
            cmd.Parameters.AddWithValue("pincode", TextBox5.Text)
            cmd.Parameters.AddWithValue("aminities", aminities)
            cmd.Parameters.AddWithValue("readytomove", readytomove)
            cmd.Parameters.AddWithValue("carpatarea", TextBox6.Text)
            cmd.Parameters.AddWithValue("builduparea", TextBox7.Text)
            cmd.Parameters.AddWithValue("price", TextBox8.Text)
            cmd.Parameters.AddWithValue("createdate", Now.Date)
            cmd.Parameters.AddWithValue("registerby", "1")
            cmd.Parameters.AddWithValue("pricenego", priceNego)
            cmd.Parameters.AddWithValue("psold", psold)
            cmd.Parameters.AddWithValue("uomba", DropDownList5.SelectedValue)
            cmd.Parameters.AddWithValue("uomca", DropDownList4.SelectedValue)
            If cmd.ExecuteNonQuery() Then
                Dim cmd1 As New SqlCommand()

                ' Get the HttpFileCollection
                Dim hfc As HttpFileCollection = Request.Files
                For i As Integer = 0 To hfc.Count - 1
                    Dim hpf As HttpPostedFile = hfc(i)
                    If hpf.ContentLength > 0 Then
                        hpf.SaveAs(Server.MapPath("upload") & "\" & Path.GetFileName(hpf.FileName))
                        cmd1.CommandText = "insert into PropertyPhotoes values(" + TextBox10.Text + ",'~\upload\" & Path.GetFileName(hpf.FileName) + "')"
                        cmd1.Connection = ss.con
                        cmd1.ExecuteNonQuery()
                    Else
                        cmd1.CommandText = "insert into PropertyPhotoes values(" + TextBox10.Text + ",'~\upload\noimage.png')"
                        cmd1.Connection = ss.con
                        cmd1.ExecuteNonQuery()
                    End If
                Next i
                
                MsgBox("Register success!")

            Else
                MsgBox("Register fail!")
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        Finally
            ss.conClose()
            Button3_Click(sender, e)
        End Try
    End Sub
    Function getpropertyid() As Integer
        Dim max As Integer
        Try
            ss.conOpen()
            Dim cmd As New SqlCommand("select MAX(coalesce(id,0)) from propertyMaster", ss.con)
            If IsDBNull(cmd.ExecuteScalar()) Then
                max = 0
            Else
                max = cmd.ExecuteScalar()
            End If
        Catch ex As Exception
            MsgBox(ex.Message)

        Finally
            ss.conClose()
        End Try
        Return max + 1

    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        TextBox10.Text = getpropertyid()

    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Try
            Dim priceNego, psold, aminities, readytomove As String
            ss.conOpen()
            aminities = ""
            readytomove = ""
            priceNego = ""
            psold = ""

            If CheckBox1.Checked Then
                priceNego = "Y"
            End If
            If CheckBox2.Checked Then
                psold = "Y"
            End If
            If CheckBox10.Checked Then
                readytomove = "Y"
            End If
            If CheckBox3.Checked Then
                aminities = aminities + "Lifts,"
            End If
            If CheckBox4.Checked Then
                aminities = aminities + "Parks,"
            End If
            If CheckBox5.Checked Then
                aminities = aminities + "VP,"
            End If
            If CheckBox6.Checked Then
                aminities = aminities + "IN,"
            End If
            If CheckBox7.Checked Then
                aminities = aminities + "WS,"
            End If
            If CheckBox8.Checked Then
                aminities = aminities + "Security,"
            End If
            If CheckBox9.Checked Then
                aminities = aminities + "FA,"
            End If
            Dim cmd As New SqlCommand()
            cmd.Connection = ss.con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "updProperty"
            cmd.Parameters.AddWithValue("id", TextBox10.Text)
            cmd.Parameters.AddWithValue("ptype", DropDownList1.SelectedValue)
            cmd.Parameters.AddWithValue("title", TextBox1.Text)
            cmd.Parameters.AddWithValue("description", TextBox2.Text)
            cmd.Parameters.AddWithValue("address", TextBox3.Text)
            cmd.Parameters.AddWithValue("city", DropDownList2.SelectedValue)
            cmd.Parameters.AddWithValue("state", DropDownList3.SelectedValue)
            cmd.Parameters.AddWithValue("location", TextBox4.Text)
            cmd.Parameters.AddWithValue("pincode", TextBox5.Text)
            cmd.Parameters.AddWithValue("aminities", aminities)
            cmd.Parameters.AddWithValue("readytomove", readytomove)
            cmd.Parameters.AddWithValue("carpatarea", TextBox6.Text)
            cmd.Parameters.AddWithValue("builduparea", TextBox7.Text)
            cmd.Parameters.AddWithValue("price", TextBox8.Text)
            cmd.Parameters.AddWithValue("createdate", Now.Date)
            cmd.Parameters.AddWithValue("registerby", "1")
            cmd.Parameters.AddWithValue("pricenego", priceNego)
            cmd.Parameters.AddWithValue("psold", psold)
            cmd.Parameters.AddWithValue("uomba", DropDownList5.SelectedValue)
            cmd.Parameters.AddWithValue("uomca", DropDownList4.SelectedValue)
            If cmd.ExecuteNonQuery() Then

                MsgBox("Update success!")

            Else
                MsgBox("Update fail!")
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        Finally
            ss.conClose()
            Button3_Click(sender, e)
        End Try
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        TextBox1.Text = ""
        TextBox10.Text = getpropertyid()
        TextBox2.Text = ""
        TextBox3.Text = ""
        TextBox4.Text = ""
        TextBox5.Text = ""
        TextBox6.Text = ""
        TextBox7.Text = ""
        TextBox8.Text = ""
        TextBox9.Text = ""
        DropDownList1.SelectedIndex = 0
        DropDownList2.SelectedIndex = 0
        DropDownList3.SelectedIndex = 0
        DropDownList4.SelectedIndex = 0
        DropDownList5.SelectedIndex = 0
        CheckBox1.Checked = False
        CheckBox2.Checked = False
        CheckBox3.Checked = False
        CheckBox4.Checked = False
        CheckBox5.Checked = False
        CheckBox6.Checked = False
        CheckBox7.Checked = False
        CheckBox8.Checked = False
        CheckBox9.Checked = False
        CheckBox10.Checked = False

    End Sub

    Protected Sub Button5_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button5.Click
        Try
            ss.conOpen()
            Dim aminities As String = ""
            Dim cmd As New SqlCommand("select * from propertyMaster where id=" + TextBox9.Text + "", ss.con)
            Dim adp As New SqlDataAdapter
            adp.SelectCommand = cmd
            Dim dt As New Data.DataTable
            adp.Fill(dt)
            If dt.Rows.Count > 0 Then
                TextBox10.Text = dt.Rows(0)("id")
                TextBox2.Text = dt.Rows(0)("description")
                TextBox1.Text = dt.Rows(0)("title")
                TextBox3.Text = dt.Rows(0)("address")
                TextBox4.Text = dt.Rows(0)("location")
                TextBox5.Text = dt.Rows(0)("pincode")
                TextBox6.Text = dt.Rows(0)("carpatarea")
                TextBox7.Text = dt.Rows(0)("builtuparea")
                TextBox8.Text = dt.Rows(0)("price")
                DropDownList1.SelectedValue = dt.Rows(0)("ptype").ToString
                DropDownList2.SelectedValue = dt.Rows(0)("city").ToString
                DropDownList3.SelectedValue = dt.Rows(0)("state").ToString
                DropDownList5.SelectedValue = dt.Rows(0)("uomba").ToString
                DropDownList4.SelectedValue = dt.Rows(0)("uomca").ToString
                aminities = dt.Rows(0)("aminities").ToString

                If dt.Rows(0)("psold").Equals("Y") Then
                    CheckBox2.Checked = True
                Else
                    CheckBox2.Checked = False
                End If
                If dt.Rows(0)("pricenego").Equals("Y") Then
                    CheckBox1.Checked = True
                Else
                    CheckBox1.Checked = False
                End If
                Dim words As String() = aminities.Split(New Char() {","c})

                ' Use For Each loop over words and display them

                Dim word As String
                For Each word In words
                    If word.Contains("Lifts") Then
                        CheckBox3.Checked = True
                    End If
                    If word.Contains("Parks") Then
                        CheckBox4.Checked = True
                    End If
                    If word.Contains("VP") Then
                        CheckBox5.Checked = True
                    End If
                    If word.Contains("IN") Then
                        CheckBox6.Checked = True
                    End If
                    If word.Contains("WS") Then
                        CheckBox7.Checked = True
                    End If
                    If word.Contains("Security") Then
                        CheckBox8.Checked = True
                    End If
                    If word.Contains("FA") Then
                        CheckBox9.Checked = True
                    End If
                Next
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
End Class
