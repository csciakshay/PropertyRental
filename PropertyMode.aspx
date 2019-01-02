<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="PropertyMode.aspx.vb" Inherits="PropertyCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <h2>Manage Property Mode</h2>
        
         <div class="insertbtn"> <asp:Button ID="Button1" runat="server" 
                 Text="Insert New Record" Visible="False" />  </div>
    
    <!-- insert window/panel --> 
    <asp:Panel ID="Panelnsert" runat="server">
    
       <div class="rnd_box">
         <b class="rnd_top"><b class="rnd_b1"></b><b class="rnd_b2"></b><b class="rnd_b3"></b><b class="rnd_b4"></b></b>
           <div class="rnd_content">
               <div class="linespace">   </div>
                  
                   <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                       DataKeyNames="ModeID" DataSourceID="SqlDataSource1" DefaultMode="Insert" 
                       GridLines="None" Height="100px" Width="276px">
                       <Fields>
                           <asp:BoundField DataField="ModeID" HeaderText="ModeID" InsertVisible="False" 
                               ReadOnly="True" SortExpression="ModeID" />
                           <asp:BoundField DataField="ModeName" HeaderText="Mode Name :" 
                               SortExpression="ModeName" >
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
    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ModeID" 
    DataSourceID="SqlDataSource1" PageSize="8">
    <Columns>
        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
            ShowEditButton="True">
        <ItemStyle Width="150px" />
        </asp:CommandField>
        <asp:BoundField DataField="ModeID" HeaderText="Mode ID" 
            SortExpression="ModeID" InsertVisible="False" ReadOnly="True" >
        <ItemStyle Width="125px" />
        </asp:BoundField>
        <asp:BoundField DataField="ModeName" HeaderText="Mode Name"  
            SortExpression="ModeName" >  

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
    DeleteCommand="DELETE FROM [PropertyMode] WHERE [ModeID] = @original_ModeID AND [Active] = @original_Active AND [ModeName] = @original_ModeName" 
    InsertCommand="INSERT INTO [PropertyMode] ([Active], [ModeName]) VALUES (@Active, @ModeName)" 
    OldValuesParameterFormatString="original_{0}" 
    SelectCommand="SELECT [ModeID], [Active], [ModeName] FROM [PropertyMode]" 
    
        UpdateCommand="UPDATE [PropertyMode] SET [Active] = @Active, [ModeName] = @ModeName WHERE [ModeID] = @original_ModeID AND [Active] = @original_Active AND [ModeName] = @original_ModeName">
    <DeleteParameters>
        <asp:Parameter Name="original_ModeID" Type="Int32" />
        <asp:Parameter Name="original_Active" Type="Boolean" />
        <asp:Parameter Name="original_ModeName" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Active" Type="Boolean" />
        <asp:Parameter Name="ModeName" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Active" Type="Boolean" />
        <asp:Parameter Name="ModeName" Type="String" />
        <asp:Parameter Name="original_ModeID" Type="Int32" />
        <asp:Parameter Name="original_Active" Type="Boolean" />
        <asp:Parameter Name="original_ModeName" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>

  
  
  <asp:Label ID="ShowInfoMessage" runat="server" Text="Label" 
        CssClass="InfoMsgBox" Enabled="False" Visible="False"></asp:Label>
  
</asp:Content>

