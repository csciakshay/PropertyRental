<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="PropertyCity.aspx.vb" Inherits="PropertyCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <h2>Manage City</h2>
        
         <div class="insertbtn"> <asp:Button ID="Button1" runat="server" 
                 Text="Insert New Record" Visible="False" />  </div>
    
    <!-- insert window/panel --> 
    <asp:Panel ID="Panelnsert" runat="server">
    
      
       <div class="rnd_box">
         <b class="rnd_top"><b class="rnd_b1"></b><b class="rnd_b2"></b><b class="rnd_b3"></b><b class="rnd_b4"></b></b>
           <div class="rnd_content">
               <div class="linespace">   </div>
               <asp:DetailsView ID="DetailsView1" runat="server" Height="100px" Width="276px" 
                   DataSourceID="SqlDataSource1" DefaultMode="Insert" 
                   AutoGenerateRows="False" DataKeyNames="CityID" GridLines="None">
                   <Fields>
                       <asp:BoundField DataField="CityID" HeaderText="City ID" 
                           InsertVisible="False" ReadOnly="True" SortExpression="CityID" />
                       <asp:BoundField DataField="CityName" HeaderText="City Name :" 
                           SortExpression="CityName" >
                       <HeaderStyle ForeColor="#B5C83C" />
                       </asp:BoundField>
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
    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CityID" 
    DataSourceID="SqlDataSource1" PageSize="8">
    <Columns>
        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
            ShowEditButton="True">
        <ItemStyle Width="150px" />
        </asp:CommandField>
        <asp:BoundField DataField="CityID" HeaderText="City ID" 
            SortExpression="CityID" InsertVisible="False" ReadOnly="True" >
        <ItemStyle Width="125px" />
        </asp:BoundField>
        <asp:BoundField DataField="CityName" HeaderText="City Name"  
            SortExpression="CityName" >  

        <ItemStyle Width="300px" />
        </asp:BoundField>

        <asp:CheckBoxField DataField="Active" HeaderText="Active" 
            SortExpression="Active" >
        <ItemStyle Width="75px" />
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
    DeleteCommand="DELETE FROM [City] WHERE [CityID] = @original_CityID AND [CityName] = @original_CityName AND [Active] = @original_Active" 
    InsertCommand="INSERT INTO [City] ([CityName], [Active]) VALUES (@CityName, @Active)" 
    OldValuesParameterFormatString="original_{0}" 
    SelectCommand="SELECT [CityID], [CityName], [Active] FROM [City]" 
    
        UpdateCommand="UPDATE [City] SET [CityName] = @CityName, [Active] = @Active WHERE [CityID] = @original_CityID AND [CityName] = @original_CityName AND [Active] = @original_Active">
    <DeleteParameters>
        <asp:Parameter Name="original_CityID" Type="Int32" />
        <asp:Parameter Name="original_CityName" Type="String" />
        <asp:Parameter Name="original_Active" Type="Boolean" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="CityName" Type="String" />
        <asp:Parameter Name="Active" Type="Boolean" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="CityName" Type="String" />
        <asp:Parameter Name="Active" Type="Boolean" />
        <asp:Parameter Name="original_CityID" Type="Int32" />
        <asp:Parameter Name="original_CityName" Type="String" />
        <asp:Parameter Name="original_Active" Type="Boolean" />
    </UpdateParameters>
</asp:SqlDataSource>

  
  
  <asp:Label ID="ShowInfoMessage" runat="server" Text="Label" 
        CssClass="InfoMsgBox" Enabled="False" Visible="False"></asp:Label>
  
</asp:Content>

