
Partial Class index
    Inherits System.Web.UI.Page


    Protected Sub BtnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnSearch.Click
        Me.GridView1.DataSourceID = Me.sqldsSearch.ID
        Me.GridView1.DataBind()
    End Sub


    Protected Sub sqldsSearch_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles sqldsSearch.Selecting

 
        e.Command.Parameters("@CityID").Value = ddlCity.SelectedValue
        e.Command.Parameters("@ModeID").Value = RadioButton_PropertyMode.SelectedValue
        e.Command.Parameters("@AreaLocID").Value = ddlArea.SelectedValue
        e.Command.Parameters("@TypeID").Value = RadioButton_PropertyType.SelectedValue
        e.Command.Parameters("@CategoryID").Value = ddlCatg.SelectedValue
        e.Command.Parameters("@StateID").Value = ddlState.SelectedValue

       

    End Sub

    
    Protected Sub PropertyModeSqlDataSource1_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles PropertyModeSqlDataSource1.Selected
        Me.RadioButton_PropertyMode.SelectedIndex = 0
    End Sub

    Protected Sub PropertyTypeSqlDataSource1_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles PropertyTypeSqlDataSource1.Selected
        Me.RadioButton_PropertyType.SelectedIndex = 0
    End Sub
End Class
