Imports Class1
Imports System.Data.SqlClient
Imports System.Data

Partial Class Default4
    Inherits System.Web.UI.Page
    Dim yy As New Class1

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        yy.conOpen()
        Dim cc As New SqlCommand()
        cc.Connection = yy.con
        cc.CommandText = "StoredProcedure5"
        cc.CommandType = CommandType.StoredProcedure
        cc.Parameters.AddWithValue("propertytype", TextBox1.Text)
        cc.Parameters.AddWithValue("Titel", TextBox2.Text)
        cc.Parameters.AddWithValue("Decrpsetion", TextBox3.Text)
        cc.Parameters.AddWithValue("Address", TextBox4.Text)
        cc.Parameters.AddWithValue("Location", TextBox5.Text)
        cc.Parameters.AddWithValue("city", TextBox6.Text)
        cc.Parameters.AddWithValue("Propertysize", TextBox7.Text)
        cc.Parameters.AddWithValue("Price", TextBox8.Text)
        cc.Parameters.AddWithValue("propertyid", TextBox9.Text)
        cc.ExecuteNonQuery()
        MsgBox("data successfully inserted!")

    End Sub
    Function getpid() As Integer
        yy.conOpen()
        Dim max As Integer
        Dim hh As New SqlCommand("select MAX(coalesce(Propertyid,0)) from pmaster", yy.con)
        If IsDBNull(hh.Executescalar()) Then
            max = 0
        Else
            max = hh.Executescalar()
        End If


        Return max + 1
    End Function

    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        TextBox9.Text = getpid()
        yy.con.Close()
    End Sub
End Class
