<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AreaLocation.aspx.vb" Inherits="PropertyCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <h2>Manage Area Location</h2>
        
         <div class="insertbtn"> <asp:Button ID="Button1" runat="server" 
                 Text="Insert New Record" Visible="False" />  </div>
    
    <!-- insert window/panel --> 
    <asp:Panel ID="Panelnsert" runat="server">
    
      
       <div class="rnd_box">
         <b class="rnd_top"><b class="rnd_b1"></b><b class="rnd_b2"></b><b class="rnd_b3"></b><b class="rnd_b4"></b></b>
           <div class="rnd_content">
               <div class="linespace">   </div>
               <asp:DetailsView ID="DetailsView1" runat="server" Height="150px" Width="400px" 
                   DataSourceID="SqlDataSource1" DefaultMode="Insert" 
                   AutoGenerateRows="False" DataKeyNames="AreaLocID" GridLines="None">
                   <Fields>
                       <asp:BoundField DataField="AreaLocID" HeaderText="AreaLocID" 
                           InsertVisible="False" ReadOnly="True" SortExpression="AreaLocID" />
                       <asp:BoundField DataField="AreaLocName" HeaderText="Location Name :" 
                           SortExpression="AreaLocName" >
                       <HeaderStyle ForeColor="#B5C83C" />
                       </asp:BoundField>
                       <asp:TemplateField HeaderText="City :" SortExpression="CityID">
                           <EditItemTemplate>
                               <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CityID") %>'></asp:TextBox>
                           </EditItemTemplate>
                           <InsertItemTemplate>
                               <asp:DropDownList ID="DropDownList1" runat="server" 
                                   DataSourceID="CitySqlDataSource1" DataTextField="CityName" 
                                   DataValueField="CityID" SelectedValue='<%# Bind("CityID") %>' Width="175px">
                               </asp:DropDownList>
                               <asp:SqlDataSource ID="CitySqlDataSource1" runat="server" 
                                   ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
                                   SelectCommand="SELECT [CityID], [CityName], [Active] FROM [City] 
WHERE Active = 1 
ORDER BY [CityName]">
                               </asp:SqlDataSource>
                           </InsertItemTemplate>
                           <ItemTemplate>
                               <asp:Label ID="Label1" runat="server" Text='<%# Bind("CityID") %>'></asp:Label>
                           </ItemTemplate>
                           <HeaderStyle ForeColor="#B5C83C" />
                       </asp:TemplateField>
                       <asp:CheckBoxField DataField="Active" HeaderText="Active :" 
                           SortExpression="Active" >
                       <HeaderStyle ForeColor="#B5C83C" />
                       </asp:CheckBoxField>
                       <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
                   </Fields>
               </asp:DetailsView>
           </div>
         <b class="rnd_bottom"><b class="rnd_b4"></b><b class="rnd_b3"></b><b class="rnd_b2"></b><b class="rnd_b1"></b></b>
       </div>
              
</asp:Panel>

<!-- Gridview --> 
<div class="linespace">   </div>
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="AreaLocID" 
    DataSourceID="SqlDataSource1" PageSize="8">
    <Columns>
        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
            ShowEditButton="True">
        <ItemStyle Width="150px" />
        </asp:CommandField>
        <asp:BoundField DataField="AreaLocID" HeaderText="Loc ID" 
            SortExpression="AreaLocID" InsertVisible="False" ReadOnly="True" 
            Visible="False" >
        </asp:BoundField>
        <asp:BoundField DataField="AreaLocName" HeaderText="Location Name"  
            SortExpression="AreaLocName" >  

        <ItemStyle Width="250px" />
        </asp:BoundField>

        <asp:TemplateField HeaderText="City" SortExpression="CityID">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("CityID") %>' 
                    Visible="False"></asp:Label>
                <asp:DropDownList ID="DropDownList2" runat="server" 
                    DataSourceID="CitySqlDataSource2" DataTextField="CityName" 
                    DataValueField="CityID" SelectedValue='<%# Bind("CityID") %>' Width="150px">
                </asp:DropDownList>
                
                <asp:SqlDataSource ID="CitySqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
                    SelectCommand="SELECT [CityID], [CityName], [Active] FROM [City]">
                </asp:SqlDataSource>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:CheckBoxField DataField="Active" HeaderText="Active" 
            SortExpression="Active" >
        </asp:CheckBoxField>
    </Columns>
    <RowStyle CssClass="RowStyle" />
    <EmptyDataRowStyle CssClass="EmptyRowStyle" />
    <PagerStyle CssClass="PagerStyle" />
    <SelectedRowStyle CssClass="SelectedRowStyle" />
    <HeaderStyle CssClass="HeaderStyle" />
    <EditRowStyle CssClass="EditRowStyle" />
    <AlternatingRowStyle CssClass="AltRowStyle" /> 
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConflictDetection="CompareAllValues" 
    ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
    DeleteCommand="DELETE FROM [AreaLocation] WHERE [AreaLocID] = @original_AreaLocID AND [AreaLocName] = @original_AreaLocName AND [Active] = @original_Active AND (([CityID] = @original_CityID) OR ([CityID] IS NULL AND @original_CityID IS NULL))" 
    InsertCommand="INSERT INTO [AreaLocation] ([AreaLocName], [Active], [CityID]) VALUES (@AreaLocName, @Active, @CityID)" 
    OldValuesParameterFormatString="original_{0}" 
    SelectCommand="SELECT [AreaLocID], [AreaLocName], [Active], [CityID] FROM [AreaLocation]" 
    
        UpdateCommand="UPDATE [AreaLocation] SET [AreaLocName] = @AreaLocName, [Active] = @Active, [CityID] = @CityID WHERE [AreaLocID] = @original_AreaLocID AND [AreaLocName] = @original_AreaLocName AND [Active] = @original_Active AND (([CityID] = @original_CityID) OR ([CityID] IS NULL AND @original_CityID IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_AreaLocID" Type="Int32" />
        <asp:Parameter Name="original_AreaLocName" Type="String" />
        <asp:Parameter Name="original_Active" Type="Boolean" />
        <asp:Parameter Name="original_CityID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="AreaLocName" Type="String" />
        <asp:Parameter Name="Active" Type="Boolean" />
        <asp:Parameter Name="CityID" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="AreaLocName" Type="String" />
        <asp:Parameter Name="Active" Type="Boolean" />
        <asp:Parameter Name="CityID" Type="Int32" />
        <asp:Parameter Name="original_AreaLocID" Type="Int32" />
        <asp:Parameter Name="original_AreaLocName" Type="String" />
        <asp:Parameter Name="original_Active" Type="Boolean" />
        <asp:Parameter Name="original_CityID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>

  
  
  <asp:Label ID="ShowInfoMessage" runat="server" Text="Label" 
        CssClass="InfoMsgBox" Enabled="False" Visible="False"></asp:Label>
  
</asp:Content>

