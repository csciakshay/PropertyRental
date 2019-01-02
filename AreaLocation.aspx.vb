
Partial Class PropertyCategory
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click


        If Me.Panelnsert.Visible = False Then
            Me.Panelnsert.Visible = True
        Else
            Me.Panelnsert.Visible = False
        End If



    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ShowInfoMessage.Visible = False
    End Sub


    Protected Sub SqlDataSource1_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Inserted

        If Not e.Exception Is Nothing Then

            If e.Exception.Message.StartsWith("Violation of UNIQUE KEY constraint") Then
                ShowInfoMessage.Text = "Area with same name already exists"
                ShowInfoMessage.Visible = True
                e.ExceptionHandled = True

            ElseIf e.Exception.Message.StartsWith("Cannot insert the value NULL into column") Then
                ShowInfoMessage.Text = "Area name can not be left blank"
                ShowInfoMessage.Visible = True
                e.ExceptionHandled = True

            End If
        Else
            ShowInfoMessage.Text = "Record Has been saved Successfully"
            ShowInfoMessage.Visible = True
        End If

    End Sub


    Protected Sub SqlDataSource1_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Updated
        If Not e.Exception Is Nothing Then

            If e.Exception.Message.StartsWith("Violation of UNIQUE KEY constraint") Then
                ShowInfoMessage.Text = "Area with same name already exists"
                ShowInfoMessage.Visible = True
                e.ExceptionHandled = True

            ElseIf e.Exception.Message.StartsWith("Cannot insert the value NULL into column") Then
                ShowInfoMessage.Text = "Area name can not left blank"
                ShowInfoMessage.Visible = True
                e.ExceptionHandled = True

            End If
        Else
            ShowInfoMessage.Text = "Record Has been updated Successfully"
            ShowInfoMessage.Visible = True
        End If
    End Sub

    Protected Sub SqlDataSource1_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Deleted
        If Not e.Exception Is Nothing Then
            If e.Exception.Message.StartsWith("The DELETE statement conflicted with the REFERENCE constraint") Then
                ShowInfoMessage.Text = "Can't be deleted! Child Records Exits"
                ShowInfoMessage.Visible = True
                e.ExceptionHandled = True
            End If
        Else
            ShowInfoMessage.Text = "Record Has been deleted Successfully"
            ShowInfoMessage.Visible = True
        End If
    End Sub

End Class
