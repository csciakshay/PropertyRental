Imports Microsoft.VisualBasic
Imports System.Data.SqlClient

Public Class Class1
    Public con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)

    Public Sub conOpen()
        Try
            con.Open()
        Catch ex As Exception
            MsgBox(ex.Message)

        End Try


    End Sub
    Public Sub conClose()
        Try
            con.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub

End Class
