Imports System.IO
Imports System.Drawing
Imports Class1
Imports System.Data.SqlClient
Imports System.Data
Imports ClosedXML.Excel

Partial Class propertyReport
    Inherits System.Web.UI.Page
    Dim ss As New Class1

    Protected Sub ExportExcel(ByVal sender As Object, ByVal e As EventArgs)

        Using cmd As New SqlCommand("SELECT id,ptype,title,description,address,(select cityname from dbo.getCity(PropertyMaster.city)) as city, (select stateName from dbo.getState(PropertyMaster.state)) as state,location,pincode,aminities,readytomove,createdate,price,registerby FROM [propertyMaster] WHERE ([psold] = 'N')")
            Using sda As New SqlDataAdapter()
                cmd.Connection = ss.con
                sda.SelectCommand = cmd
                Using dt As New DataTable()
                    sda.Fill(dt)
                    Using wb As New XLWorkbook()
                        wb.Worksheets.Add(dt, "Properties")

                        Response.Clear()
                        Response.Buffer = True
                        Response.Charset = ""
                        Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
                        Response.AddHeader("content-disposition", "attachment;filename=Properties.xlsx")
                        Using MyMemoryStream As New MemoryStream()
                            wb.SaveAs(MyMemoryStream)
                            MyMemoryStream.WriteTo(Response.OutputStream)
                            Response.Flush()
                            Response.End()
                        End Using
                    End Using
                End Using
            End Using
        End Using

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("uid") Is Nothing Then
            Response.Redirect("login.aspx")
        End If
        If Not IsPostBack Then
            Me.BindGrid()
        End If
    End Sub
    Private Sub BindGrid()

        Using cmd As New SqlCommand("SELECT * FROM [propertyMaster] WHERE ([psold] = 'N')", ss.con)
            Using sda As New SqlDataAdapter()
                sda.SelectCommand = cmd
                Using dt As New DataTable()
                    sda.Fill(dt)
                    GridView1.DataSource = dt
                    GridView1.DataBind()
                End Using
            End Using
        End Using

    End Sub
    Protected Sub OnPageIndexChanging(ByVal sender As Object, ByVal e As GridViewPageEventArgs)
        GridView1.PageIndex = e.NewPageIndex
        Me.BindGrid()
    End Sub
   
End Class
