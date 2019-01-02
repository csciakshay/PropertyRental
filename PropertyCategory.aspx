<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="PropertyCategory.aspx.vb" Inherits="PropertyCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <h2>Manage Property Category</h2>
        
         <div class="insertbtn"> <asp:Button ID="Button1" runat="server" 
                 Text="Insert New Record" Visible="False" />  </div>
    
    <!-- insert window/panel --> 
    <asp:Panel ID="Panelnsert" runat="server">
    
      
       <div class="rnd_box">
         <b class="rnd_top"><b class="rnd_b1"></b><b class="rnd_b2"></b><b class="rnd_b3"></b><b class="rnd_b4"></b></b>
           <div class="rnd_content">
               <div class="linespace">   </div>
               <asp:DetailsView ID="DetailsView1" runat="server" Height="100px" Width="330px" 
                   DataSourceID="SqlDataSource1" DefaultMode="Insert" 
                   AutoGenerateRows="False" DataKeyNames="CategoryID" GridLines="None" 
                   style="margin-right: 0px">
                   <Fields>
                       <asp:BoundField DataField="CategoryID" HeaderText="Category ID" 
                           InsertVisible="False" ReadOnly="True" SortExpression="CategoryID" />
                       <asp:TemplateField HeaderText="Category Name :" SortExpression="CategoryName">
                           <EditItemTemplate>
                               <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CategoryName") %>'></asp:TextBox>
                           </EditItemTemplate>
                           <InsertItemTemplate>
                               <asp:TextBox ID="txtCategory" runat="server" Text='<%# Bind("CategoryName") %>'></asp:TextBox>
                               *
                           </InsertItemTemplate>
                           <ItemTemplate>
                               <asp:Label ID="Label1" runat="server" Text='<%# Bind("CategoryName") %>'></asp:Label>
                           </ItemTemplate>
                           <HeaderStyle ForeColor="#B5C83C" />
                       </asp:TemplateField>
                       <asp:CheckBoxField DataField="Active" HeaderText="Active :" 
                           SortExpression="Active" >
                       <HeaderStyle ForeColor="#B5C83C" />
                       </asp:CheckBoxField>
                       <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
                   </Fields>
                   <HeaderStyle Wrap="False" />
               </asp:DetailsView>
           </div>
         <b class="rnd_bottom"><b class="rnd_b4"></b><b class="rnd_b3"></b><b class="rnd_b2"></b><b class="rnd_b1"></b></b>
       </div>
              
</asp:Panel>

<!-- Gridview --> 
<div class="linespace">   
    </div>
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CategoryID" 
    DataSourceID="SqlDataSource1" PageSize="8">
    <Columns>
        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
            ShowEditButton="True" >
        <ItemStyle Width="150px" />
        </asp:CommandField>
        <asp:BoundField DataField="CategoryID" HeaderText="Category ID" 
            SortExpression="CategoryID" InsertVisible="False" ReadOnly="True" >
        <ItemStyle Width="125px" />
        </asp:BoundField>
        <asp:TemplateField HeaderText="Category Name" SortExpression="CategoryName">
            <EditItemTemplate>
                <asp:TextBox ID="txtCategory1" runat="server" 
                    Text='<%# Bind("CategoryName") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("CategoryName") %>'></asp:Label>
            </ItemTemplate>
            <ItemStyle Width="300px" />
        </asp:TemplateField>

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
    DeleteCommand="DELETE FROM [PropertyCatgeory] WHERE [CategoryID] = @original_CategoryID AND [CategoryName] = @original_CategoryName AND [Active] = @original_Active" 
    InsertCommand="INSERT INTO [PropertyCatgeory] ([CategoryName], [Active]) VALUES (@CategoryName, @Active)" 
    OldValuesParameterFormatString="original_{0}" 
    SelectCommand="SELECT [CategoryID], [CategoryName], [Active] FROM [PropertyCatgeory] ORDER BY [CategoryID]" 
    UpdateCommand="UPDATE [PropertyCatgeory] SET [CategoryName] = @CategoryName, [Active] = @Active WHERE [CategoryID] = @original_CategoryID AND [CategoryName] = @original_CategoryName AND [Active] = @original_Active">
    <DeleteParameters>
        <asp:Parameter Name="original_CategoryID" Type="Int32" />
        <asp:Parameter Name="original_CategoryName" Type="String" />
        <asp:Parameter Name="original_Active" Type="Boolean" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="CategoryName" Type="String" />
        <asp:Parameter Name="Active" Type="Boolean" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="CategoryName" Type="String" />
        <asp:Parameter Name="Active" Type="Boolean" />
        <asp:Parameter Name="original_CategoryID" Type="Int32" />
        <asp:Parameter Name="original_CategoryName" Type="String" />
        <asp:Parameter Name="original_Active" Type="Boolean" />
    </UpdateParameters>
</asp:SqlDataSource>

  
  
  <asp:Label ID="ShowInfoMessage" runat="server" Text="Label" 
        CssClass="InfoMsgBox" Enabled="False" Visible="False"></asp:Label>
  
</asp:Content>

