Imports Microsoft.VisualBasic
Imports System.Data.SqlClient

Public Class Class1
    Public con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)

    Public Sub conOpen()
        con.Open()

    End Sub
    Public Sub conClose()
        con.Close()

    End Sub

End Class
