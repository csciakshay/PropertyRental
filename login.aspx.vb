﻿Imports Class1
Imports System.Data.SqlClient
Imports System.Data

Partial Class login
    Inherits System.Web.UI.Page
    Dim ss As New Class1

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Try
            ss.conOpen()
            Dim cmd As New SqlCommand("select id,name,imagepath,role,email,mobileno from UserMaster where name='" + TextBox1.Text + "' and password='" + FormsAuthentication.HashPasswordForStoringInConfigFile(TextBox2.Text, "md5") + "'", ss.con)
            Dim da As New SqlDataAdapter
            da.SelectCommand = cmd
            Dim dt As New Data.DataTable()
            da.Fill(dt)
            If dt.Rows.Count > 0 Then
                Session("uid") = dt.Rows(0)("id").ToString
                Session("uname") = dt.Rows(0)("name").ToString
                Session("uimage") = dt.Rows(0)("imagepath").ToString
                Session("role") = dt.Rows(0)("role").ToString
                Session("email") = dt.Rows(0)("email").ToString
                Session("mobile") = dt.Rows(0)("mobileno").ToString
                Response.Redirect("index.aspx")
            Else
                MsgBox("Invalid username/password")
                Response.Redirect("login.aspx")
            End If
        Catch ex As Exception
            ' MsgBox(ex.Message)
        Finally
            ss.conClose()

        End Try
        
    End Sub
End Class
