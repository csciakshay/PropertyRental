<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ManageClients.aspx.vb" Inherits="PropertyCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <h2>Manage Clients</h2>
        
         <div class="insertbtn"> <asp:Button ID="Button1" runat="server" 
                 Text="Insert New Record" Visible="False" />  </div>
    
    <!-- insert window/panel --> 
    <asp:Panel ID="Panelnsert" runat="server">
    
      
       <div class="rnd_box">
         <b class="rnd_top"><b class="rnd_b1"></b><b class="rnd_b2"></b><b class="rnd_b3"></b><b class="rnd_b4"></b></b>
           <div class="rnd_content">
               <div class="linespace">   </div>
               <asp:DetailsView ID="DetailsView1" runat="server" Height="286px" Width="550px" 
                   DataSourceID="SqlDataSource1" DefaultMode="Insert" 
                   AutoGenerateRows="False" DataKeyNames="ClientID" GridLines="None">
                   <Fields>
                       <asp:BoundField DataField="ClientID" HeaderText="Client ID" 
                           InsertVisible="False" ReadOnly="True" SortExpression="ClientID" />
                       <asp:TemplateField HeaderText="Client Name :" SortExpression="ClientName">
                           <EditItemTemplate>
                               <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ClientName") %>'></asp:TextBox>
                           </EditItemTemplate>
                           <InsertItemTemplate>
                               <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ClientName") %>'></asp:TextBox>
                               *<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                   ControlToValidate="TextBox2" CssClass="ErrorMsgBox" 
                                   ErrorMessage="Name is Required"></asp:RequiredFieldValidator>
                               <br />
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                                   ControlToValidate="TextBox2" CssClass="ErrorMsgBox" 
                                   ErrorMessage="Only Characters" ValidationExpression="[a-zA-Z]*"></asp:RegularExpressionValidator>
                           </InsertItemTemplate>
                           <ItemTemplate>
                               <asp:Label ID="Label2" runat="server" Text='<%# Bind("ClientName") %>'></asp:Label>
                           </ItemTemplate>
                           <HeaderStyle ForeColor="#B5C83C" VerticalAlign="Top" />
                           <ItemStyle VerticalAlign="Top" />
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Client Address :" SortExpression="ClientAddress">
                           <EditItemTemplate>
                               <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ClientAddress") %>'></asp:TextBox>
                           </EditItemTemplate>
                           <InsertItemTemplate>
                               <asp:TextBox ID="TextBox1" runat="server" Height="70px" 
                                   Text='<%# Bind("ClientAddress") %>' TextMode="MultiLine" Width="284px"></asp:TextBox>
                           </InsertItemTemplate>
                           <ItemTemplate>
                               <asp:Label ID="Label1" runat="server" Text='<%# Bind("ClientAddress") %>'></asp:Label>
                           </ItemTemplate>
                           <HeaderStyle ForeColor="#B5C83C" VerticalAlign="Top" />
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Client Phone :" SortExpression="ClientPhone">
                           <EditItemTemplate>
                               <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ClientPhone") %>'></asp:TextBox>
                           </EditItemTemplate>
                           <InsertItemTemplate>
                               <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ClientPhone") %>'></asp:TextBox>
                               *<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                   ControlToValidate="TextBox3" CssClass="ErrorMsgBox" 
                                   ErrorMessage="Phone no is Required"></asp:RequiredFieldValidator>
                           </InsertItemTemplate>
                           <ItemTemplate>
                               <asp:Label ID="Label3" runat="server" Text='<%# Bind("ClientPhone") %>'></asp:Label>
                           </ItemTemplate>
                           <HeaderStyle ForeColor="#B5C83C" />
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Client Email :" SortExpression="ClientEmail">
                           <EditItemTemplate>
                               <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ClientEmail") %>'></asp:TextBox>
                           </EditItemTemplate>
                           <InsertItemTemplate>
                               <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ClientEmail") %>'></asp:TextBox>
                               *<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                   ControlToValidate="TextBox4" CssClass="ErrorMsgBox" 
                                   ErrorMessage="E-Mail is Required"></asp:RequiredFieldValidator>
                               <br />
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                   ControlToValidate="TextBox4" CssClass="ErrorMsgBox" 
                                   ErrorMessage="E-Mail is Not Valid " 
                                   ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                           </InsertItemTemplate>
                           <ItemTemplate>
                               <asp:Label ID="Label4" runat="server" Text='<%# Bind("ClientEmail") %>'></asp:Label>
                           </ItemTemplate>
                           <HeaderStyle ForeColor="#B5C83C" />
                       </asp:TemplateField>
                       <asp:CheckBoxField DataField="Active" HeaderText="Active :" 
                           SortExpression="Active" >
                       <HeaderStyle ForeColor="#B5C83C" />
                       </asp:CheckBoxField>
                       <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
                   </Fields>
                   <HeaderStyle VerticalAlign="Top" />
               </asp:DetailsView>
           </div>
         <b class="rnd_bottom"><b class="rnd_b4"></b><b class="rnd_b3"></b><b class="rnd_b2"></b><b class="rnd_b1"></b></b>
       </div>
              
</asp:Panel>

<!-- Gridview --> 
<div class="linespace">   </div>

<div class="scroll">

<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ClientID" 
    DataSourceID="SqlDataSource1">
    <Columns>
        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
            ShowEditButton="True" />
        <asp:BoundField DataField="ClientID" HeaderText="Client ID" 
            SortExpression="ClientID" InsertVisible="False" ReadOnly="True" >
        <HeaderStyle Wrap="False" />
        </asp:BoundField>
        <asp:TemplateField HeaderText="Client Name" SortExpression="ClientName">
            <EditItemTemplate>
                <asp:TextBox ID="TxtnameEdit" runat="server" Text='<%# Bind("ClientName") %>'></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TxtnameEdit" CssClass="ErrorMsgBox" 
                    ErrorMessage="Name is Required"></asp:RequiredFieldValidator>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("ClientName") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle Wrap="False" />
            <ItemStyle Width="100px" />
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Client Address" SortExpression="ClientAddress">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ClientAddress") %>' 
                    TextMode="MultiLine"></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ClientAddress") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle Width="200px" />
            <ItemStyle Width="125px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Client Phone" SortExpression="ClientPhone">
            <EditItemTemplate>
                <asp:TextBox ID="txtphoneedit" runat="server" Text='<%# Bind("ClientPhone") %>'></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtphoneedit" CssClass="ErrorMsgBox" 
                    ErrorMessage="Phone No is Required"></asp:RequiredFieldValidator>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("ClientPhone") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle Wrap="False" />
            <ItemStyle Width="125px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Client Email" SortExpression="ClientEmail">
            <EditItemTemplate>
                <asp:TextBox ID="txtEmailEdit" runat="server" Text='<%# Bind("ClientEmail") %>'></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtEmailEdit" CssClass="ErrorMsgBox" 
                    ErrorMessage="E-mail is Required"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtEmailEdit" CssClass="ErrorMsgBox" 
                    ErrorMessage="E-mail is not valid"></asp:RegularExpressionValidator>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label4" runat="server" Text='<%# Bind("ClientEmail") %>'></asp:Label>
            </ItemTemplate>
            <ItemStyle Width="125px" />
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
    <EditRowStyle CssClass="EditRowStyle" VerticalAlign="Top" />
    <AlternatingRowStyle CssClass="AltRowStyle" /> 
</asp:GridView>

</div>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
    DeleteCommand="DELETE FROM [Clients] WHERE [ClientID] = @original_ClientID" 
    InsertCommand="INSERT INTO [Clients] ([ClientName], [ClientAddress], [ClientPhone], [ClientEmail], [Active]) VALUES (@ClientName, @ClientAddress, @ClientPhone, @ClientEmail, @Active)" 
    OldValuesParameterFormatString="original_{0}" 
    SelectCommand="SELECT [ClientID], [ClientName], [ClientAddress], [ClientPhone], [ClientEmail], [Active] FROM [Clients]" 
    
        UpdateCommand="UPDATE [Clients] SET [ClientName] = @ClientName, [ClientAddress] = @ClientAddress, [ClientPhone] = @ClientPhone, [ClientEmail] = @ClientEmail, [Active] = @Active WHERE [ClientID] = @original_ClientID">
    <DeleteParameters>
        <asp:Parameter Name="original_ClientID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="ClientName" Type="String" />
        <asp:Parameter Name="ClientAddress" Type="String" />
        <asp:Parameter Name="ClientPhone" Type="String" />
        <asp:Parameter Name="ClientEmail" Type="String" />
        <asp:Parameter Name="Active" Type="Boolean" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="ClientName" Type="String" />
        <asp:Parameter Name="ClientAddress" Type="String" />
        <asp:Parameter Name="ClientPhone" Type="String" />
        <asp:Parameter Name="ClientEmail" Type="String" />
        <asp:Parameter Name="Active" Type="Boolean" />
        <asp:Parameter Name="original_ClientID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>

  
  
  
  
<asp:Label ID="ShowInfoMessage" runat="server" Text="Label" 
        CssClass="InfoMsgBox" Enabled="False" Visible="False"></asp:Label>

  
  
  
  
</asp:Content>

