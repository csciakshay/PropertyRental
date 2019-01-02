<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ContactUs.aspx.vb" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Contant us</h2>
    OnlineRealEstate.com would love to hear from you. To contact us, simply
    fill out following from.
    
    
    <table style="border-style: none;">
    <tr> <td rowspan="4">
    
    

    <asp:DetailsView ID="dtvContactUs" runat="server" Height="450px" 
    Width="400px" AutoGenerateRows="False" DataKeyNames="ContactID" 
    DataSourceID="SqlDsContactUs" DefaultMode="Insert" GridLines="None" 
            CellPadding="3">
        <Fields>
            <asp:BoundField DataField="ContactID" HeaderText="ContactID" 
                InsertVisible="False" ReadOnly="True" SortExpression="ContactID" />
            <asp:TemplateField HeaderText="Name :" SortExpression="Name">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="txtname" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>*
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" CssClass="ErrorMsgBox" 
                        ErrorMessage="Name is Required" ControlToValidate="txtname" 
                        Visible="True"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <HeaderStyle ForeColor="#B5C83C" />
            </asp:TemplateField>
            <asp:BoundField DataField="Phone" HeaderText="Phone :" SortExpression="Phone">
            <HeaderStyle ForeColor="#B5C83C" />
            </asp:BoundField>
            <asp:BoundField DataField="Mobile" HeaderText="Mobile :" 
                SortExpression="Mobile">
            <HeaderStyle ForeColor="#B5C83C" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Country :" SortExpression="CountryID">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("CountryID") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CountryID") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="CountrySqlDataSource1" DataTextField="CountryName" 
                        DataValueField="CountryID" SelectedValue='<%# Bind("CountryID") %>' 
                        Width="150px">
                    </asp:DropDownList>
                </InsertItemTemplate>
                <HeaderStyle ForeColor="#B5C83C" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="State :" SortExpression="StateID">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("StateID") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("StateID") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" 
                        DataSourceID="StateSqlDataSource1" DataTextField="StateName" 
                        DataValueField="StateID" SelectedValue='<%# Bind("StateID") %>' Width="150px">
                    </asp:DropDownList>
                </InsertItemTemplate>
                <HeaderStyle ForeColor="#B5C83C" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City :" SortExpression="CityID">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("CityID") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("CityID") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" 
                        DataSourceID="CitySqlDataSource1" DataTextField="CityName" 
                        DataValueField="CityID" SelectedValue='<%# Bind("CityID") %>' Width="150px">
                    </asp:DropDownList>
                </InsertItemTemplate>
                <HeaderStyle ForeColor="#B5C83C" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="E Mail :" SortExpression="EMail">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("EMail") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    
                     
                          <asp:TextBox ID="TextBox2" runat="server" 
                          Text='<%# Bind("EMail") %>'></asp:TextBox>* 
                           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="TextBox2" CssClass="ErrorMsgBox" 
                        ErrorMessage="Invalid E-Mail Id" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                          <br />
                     
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="E-Mail Id is Required" ControlToValidate="TextBox2" 
                        CssClass="ErrorMsgBox" Visible="True"></asp:RequiredFieldValidator>
                     
                       
                        
                        
                        
                    
                    
                    
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("EMail") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle ForeColor="#B5C83C" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Details :" SortExpression="Details">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Details") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Details") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Height="100px" MaxLength="500" 
                        Text='<%# Bind("Details") %>' TextMode="MultiLine" Width="250px"></asp:TextBox>*
                    
                    
                    <br />
                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="TextBox1" CssClass="ErrorMsgBox" 
                        ErrorMessage="Details are Required" Visible="True"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <HeaderStyle ForeColor="#B5C83C" />
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" InsertText="Submit" 
                ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>


    </td> </tr>

    <tr > 
     <td valign="top"> 
     <div class ="heading1"> Email </div> <br />
     Email and contact form is the fastest way to contacting with OnlineRealEstate.com 
     please fill form or e-mail us at xyz@gamil.com
    
    </td></tr>
    
    <tr>
     <td valign="top"> 
      <div class ="heading1"> Telephone </div> <br />
      Support is also available via phone and fax. <br /><br />
      Tel : +92-21-353-88151-4<br />
      Fax : +92-21-358-84303
     </td>
    </tr> 
    
    <tr>
      <td valign="top"> 
      <div class ="heading1"> Post </div> <br />
      If you need to mail any document,literature then
      please use following address.<br /><br />
      Head Office<br />
      208-C, 3rd Floor Khayaban -e- Ittehad,<br />
      Phase II Ext. DHA Lahore, Pakistan.
      </td>
    </tr> 
    </table>
    
       <asp:Label ID="ShowInfoMessage" runat="server" Text="Label" 
        CssClass="InfoMsgBox" Enabled="False" Visible="False"></asp:Label>
  
    <asp:SqlDataSource ID="SqlDsContactUs" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
    DeleteCommand="DELETE FROM [ContactUs] WHERE [ContactID] = @ContactID" 
    InsertCommand="INSERT INTO ContactUs(Name, Phone, Mobile, CountryID, StateID, CityID, EMail, Details, UserId) VALUES (@Name, @Phone, @Mobile, @CountryID, @StateID, @CityID, @EMail, @Details, @UserId)" 
    SelectCommand="SELECT [ContactID], [Name], [Phone], [Mobile], [CountryID], [StateID], [CityID], [EMail], [Details], [Date], [UserId] FROM [ContactUs]" 
    
        UpdateCommand="UPDATE [ContactUs] SET [Name] = @Name, [Phone] = @Phone, [Mobile] = @Mobile, [CountryID] = @CountryID, [StateID] = @StateID, [CityID] = @CityID, [EMail] = @EMail, [Details] = @Details, [Date] = @Date, [UserId] = @UserId WHERE [ContactID] = @ContactID">
    <DeleteParameters>
        <asp:Parameter Name="ContactID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Phone" Type="String" />
        <asp:Parameter Name="Mobile" Type="String" />
        <asp:Parameter Name="CountryID" Type="Int32" />
        <asp:Parameter Name="StateID" Type="Int32" />
        <asp:Parameter Name="CityID" Type="Int32" />
        <asp:Parameter Name="EMail" Type="String" />
        <asp:Parameter Name="Details" Type="String" />
        <asp:Parameter Name="UserId" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Phone" Type="String" />
        <asp:Parameter Name="Mobile" Type="String" />
        <asp:Parameter Name="CountryID" Type="Int32" />
        <asp:Parameter Name="StateID" Type="Int32" />
        <asp:Parameter Name="CityID" Type="Int32" />
        <asp:Parameter Name="EMail" Type="String" />
        <asp:Parameter Name="Details" Type="String" />
        <asp:Parameter DbType="Date" Name="Date" />
        <asp:Parameter Name="UserId" Type="Object" />
        <asp:Parameter Name="ContactID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
    <asp:SqlDataSource ID="CitySqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
                        SelectCommand="SELECT [CityID], [CityName], [Active] FROM [City]
WHERE Active = 1 "></asp:SqlDataSource>
    <asp:SqlDataSource ID="StateSqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
                        SelectCommand="SELECT [StateID], [StateName], [CountryID], [Active] FROM [State]
WHERE Active = 1 "></asp:SqlDataSource>
    <asp:SqlDataSource ID="CountrySqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
                        SelectCommand="SELECT [CountryID], [CountryName], [Active] FROM [Country]
WHERE Active = 1 "></asp:SqlDataSource>

</asp:Content>

