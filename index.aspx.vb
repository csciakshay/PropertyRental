﻿Imports Class1
Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Partial Class index
    Inherits System.Web.UI.Page
    Dim ss As New Class1

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        Try
            ss.conOpen()
            Dim typeCondition, cityCondition, priceCondition, stateCondition As String
            typeCondition = ""
            cityCondition = ""
            stateCondition = ""
            priceCondition = ""

            If DropDownList2.SelectedIndex > 0 Then
                typeCondition = "and a.ptype like '" + DropDownList2.SelectedValue + "%' "
            End If
            If DropDownList1.SelectedIndex > 0 Then
                cityCondition = "and a.city like '" + DropDownList1.SelectedValue + "%' "
            End If
            If DropDownList4.SelectedIndex > 0 Then
                stateCondition = "and a.state like '" + DropDownList4.SelectedValue + "%' "
            End If
            If DropDownList3.SelectedIndex > 0 Then
                If DropDownList3.SelectedValue = "1000~5000" Then
                    priceCondition = "and a.price between 1000 and 5000 "
                End If
                If DropDownList3.SelectedValue = "5001~10000" Then
                    priceCondition = "and a.price between 5001 and 10000 "
                End If
                If DropDownList3.SelectedValue = "10000 above" Then
                    priceCondition = "and a.price between 10000 and 9999999 "
                End If
            End If

            SqlDataSource1.SelectCommand = "SELECT a.id, a.ptype, a.title, a.description, a.address, (select cityname from dbo.getCity(a.city)) as city, (select stateName from dbo.getState(a.state)) as state, a.location, a.pincode, a.psold, a.aminities, a.readytomove, SUBSTRING(CAST(a.createdate AS VARCHAR(20)), 1, 10) AS createDate, a.carpatarea, a.builtuparea, a.price, a.registerby, a.pricenego, a.uomba, a.uomca, (SELECT TOP (1) images FROM propertyPhotoes  WHERE a.id = pid) AS images from PropertyMaster AS a  WHERE psold = 'N' " + cityCondition + typeCondition + priceCondition + stateCondition

            SqlDataSource1.DataBind()
            DataList1.DataBind()
            If DataList1.Items.Count > 4 Then
                DataList1.RepeatColumns = 4
            Else
                DataList1.RepeatColumns = DataList1.Items.Count
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        Finally
            ss.conClose()
        End Try
        
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If DataList1.Items.Count > 4 Then
                DataList1.RepeatColumns = 4
            Else
                DataList1.RepeatColumns = DataList1.Items.Count
            End If
            If Not Session("uid") Is Nothing Then
                ss.conOpen()
                SqlDataSource3.SelectCommand = "SELECT a.id, a.ptype, a.title, a.description, a.address, (select cityname from dbo.getCity(a.city)) as city, (select stateName from dbo.getState(a.state)) as state, a.location, a.pincode, a.psold, a.aminities, a.readytomove, SUBSTRING(CAST(a.createdate AS VARCHAR(20)), 1, 10) AS createDate, a.carpatarea, a.builtuparea, a.price, a.registerby, a.pricenego, a.uomba, a.uomca,( SELECT TOP (1) images FROM propertyPhotoes WHERE a.id = pid) AS images FROM propertyMaster AS a JOIN favProperty c on a.id=c.pid and a.registerby=c.uid WHERE psold = 'N' and a.registerby='" + Session("uid") + "'"
                SqlDataSource3.DataBind()
                DataList2.DataBind()
                ' MsgBox(DataList2.Items.Count)

                DataList2.RepeatColumns = DataList2.Items.Count
                ss.conClose()
                Label5.Visible = True
            Else
                Label5.Visible = False
            End If

            SqlDataSource4.SelectCommand = "SELECT TOP (5) a.id, a.ptype, a.title, a.description, a.address, (select cityname from dbo.getCity(a.city)) as city, (select stateName from dbo.getState(a.state)) as state, a.location, a.pincode, a.psold, a.aminities, a.readytomove, SUBSTRING(CAST(a.createdate AS VARCHAR(20)), 1, 10) AS createDate, a.carpatarea, a.builtuparea, a.price, a.registerby, a.pricenego, a.uomba, a.uomca,( SELECT TOP (1) images FROM propertyPhotoes WHERE a.id = pid) AS images,views FROM propertyMaster AS a WHERE psold = 'N' order by views desc"
            SqlDataSource4.DataBind()
            DataList3.DataBind()
            DataList3.RepeatColumns = DataList3.Items.Count

            DropDownList1.DataBind()
            DropDownList1.Items.Insert(0, New ListItem("-Select City-", "0"))
        End If
    End Sub
End Class
