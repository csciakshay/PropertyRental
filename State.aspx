<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="State.aspx.vb" Inherits="PropertyCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <h2>Manage State</h2>
        
         <div class="insertbtn"> <asp:Button ID="Button1" runat="server" 
                 Text="Insert New Record" Visible="False" />  </div>
    
    <!-- insert window/panel --> 
    <asp:Panel ID="Panelnsert" runat="server">
    
      
       <div class="rnd_box">
         <b class="rnd_top"><b class="rnd_b1"></b><b class="rnd_b2"></b><b class="rnd_b3"></b><b class="rnd_b4"></b></b>
           <div class="rnd_content">
               <div class="linespace">   </div>
               <asp:DetailsView ID="DetailsView1" runat="server" Height="109px" Width="276px" 
                   DataSourceID="SqlDataSource1" DefaultMode="Insert" 
                   AutoGenerateRows="False" DataKeyNames="StateID" GridLines="None">
                   <Fields>
                       <asp:BoundField DataField="StateID" HeaderText="StateID" 
                           InsertVisible="False" ReadOnly="True" SortExpression="StateID" />
                       <asp:BoundField DataField="StateName" HeaderText="State Name :" 
                           SortExpression="StateName" >
                       <HeaderStyle ForeColor="#B5C83C" />
                       </asp:BoundField>
                       <asp:BoundField DataField="CountryID" HeaderText="Country ID :" 
                           SortExpression="CountryID" ReadOnly="True" Visible="False" >
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
    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="StateID" 
    DataSourceID="SqlDataSource1" PageSize="8">
    <Columns>
        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
            ShowEditButton="True" />
        <asp:BoundField DataField="StateID" HeaderText="State ID" 
            SortExpression="StateID" InsertVisible="False" ReadOnly="True" >
        </asp:BoundField>
        <asp:BoundField DataField="StateName" HeaderText="State Name"  
            SortExpression="StateName" >  

        <ItemStyle Width="175px" />
        </asp:BoundField>

        <asp:BoundField DataField="CountryID" HeaderText="CountryID" 
            SortExpression="CountryID" ReadOnly="True" />

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
    DeleteCommand="DELETE FROM [State] WHERE [StateID] = @original_StateID AND (([StateName] = @original_StateName) OR ([StateName] IS NULL AND @original_StateName IS NULL)) AND (([CountryID] = @original_CountryID) OR ([CountryID] IS NULL AND @original_CountryID IS NULL)) AND (([Active] = @original_Active) OR ([Active] IS NULL AND @original_Active IS NULL))" 
    InsertCommand="INSERT INTO [State] ([StateName], [CountryID], [Active]) VALUES (@StateName, @CountryID, @Active)" 
    OldValuesParameterFormatString="original_{0}" 
    SelectCommand="SELECT [StateID], [StateName], [CountryID], [Active] FROM [State]" 
    
        
        UpdateCommand="UPDATE [State] SET [StateName] = @StateName, [CountryID] = @CountryID, [Active] = @Active WHERE [StateID] = @original_StateID AND (([StateName] = @original_StateName) OR ([StateName] IS NULL AND @original_StateName IS NULL)) AND (([CountryID] = @original_CountryID) OR ([CountryID] IS NULL AND @original_CountryID IS NULL)) AND (([Active] = @original_Active) OR ([Active] IS NULL AND @original_Active IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_StateID" Type="Int32" />
        <asp:Parameter Name="original_StateName" Type="String" />
        <asp:Parameter Name="original_CountryID" Type="Int32" />
        <asp:Parameter Name="original_Active" Type="Boolean" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="StateName" Type="String" />
        <asp:Parameter Name="CountryID" Type="Int32" DefaultValue="10" />
        <asp:Parameter Name="Active" Type="Boolean" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="StateName" Type="String" />
        <asp:Parameter Name="CountryID" Type="Int32" DefaultValue="10" />
        <asp:Parameter Name="Active" Type="Boolean" DefaultValue="" />
        <asp:Parameter Name="original_StateID" Type="Int32" />
        <asp:Parameter Name="original_StateName" Type="String" />
        <asp:Parameter Name="original_CountryID" Type="Int32" />
        <asp:Parameter Name="original_Active" Type="Boolean" />
    </UpdateParameters>
</asp:SqlDataSource>

  
  
  <asp:Label ID="ShowInfoMessage" runat="server" Text="Label" 
        CssClass="InfoMsgBox" Enabled="False" Visible="False"></asp:Label>
  
</asp:Content>

