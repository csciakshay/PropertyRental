<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="CustomerProfile.aspx.vb" Inherits="CustomerProfile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

<h2>Modify Your Personel Profile</h2>
    <asp:DetailsView ID="CustomerProfile" runat="server" 
    AutoGenerateRows="False" DataKeyNames="UserId" 
    DataSourceID="CustomerProfileDataSource" Height="400px" 
        Width="437px" GridLines="None" DefaultMode="Edit" HeaderStyle-ForeColor="#B5C83C">
        <Fields>
            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>' 
                        MaxLength="150"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="TextBox1" CssClass="ErrorMsgBox" 
                        ErrorMessage="Max 50 Characters" ValidationExpression="([a-zA-Z]*){1,50}$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        CssClass="ErrorMsgBox" ErrorMessage="Max 50 Characters" 
                        ValidationExpression="([a-zA-Z]*){1,50}$"></asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Gender" SortExpression="Gender">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList4" runat="server" 
                        SelectedValue='<%# Bind("Gender") %>' Width="100px">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList5" runat="server" Width="150px" 
                        SelectedValue='<%# Bind("Gender") %>'>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date of Birth" SortExpression="BirthDate">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("BirthDate") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <table>
                    <tr>
                    <td> 
                        <asp:TextBox ID="txtdobEdit" runat="server" 
                            Text='<%# Bind("BirthDate" , "{0:dd-MMM-yy}") %>' ReadOnly="True"></asp:TextBox></td>
                    <td width="50"></td>
                    <td>
                        <asp:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd-MMM-yy" 
                            TargetControlID="txtdobEdit">
                        </asp:CalendarExtender> </td>
                    </tr>
                    </table>
                    
                    
                    
                    
                </EditItemTemplate>
                <InsertItemTemplate>
                    <table>
                    <tr>
                    <td> <asp:TextBox ID="txtdob" runat="server" Text='<%# Bind("BirthDate") %>' 
                            ReadOnly="True"></asp:TextBox></td>
                    <td width="50">&nbsp;</td>
                    <td> 
                       
                        <asp:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd-MMM-yy" 
                            TargetControlID="txtdob">
                        </asp:CalendarExtender>
                       
                    
                    </tr>
                    </table>
                    
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Phone No" SortExpression="PhoneNo">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PhoneNo") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PhoneNo") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("PhoneNo") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="FaxNo" HeaderText="Fax No" SortExpression="FaxNo" />
            <asp:BoundField DataField="MobileNo" HeaderText="Mobile No" 
                SortExpression="MobileNo" />
            <asp:BoundField DataField="Address1" HeaderText="Address 1" 
                SortExpression="Address1" />
            <asp:BoundField DataField="Address2" HeaderText="Address 2" 
                SortExpression="Address2" />
            <asp:TemplateField HeaderText="City" SortExpression="City">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="CitySqlDataSource1" DataTextField="CityName" 
                        DataValueField="CityID" SelectedValue='<%# Bind("CityID") %>' Width="150px">
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CityID") %>'></asp:Label>
                </ItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList6" runat="server" 
                        DataSourceID="CitySqlDataSource1" DataTextField="CityName" 
                        DataValueField="CityID" SelectedValue='<%# Bind("CityID") %>' Width="150px">
                    </asp:DropDownList>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="State" SortExpression="State">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" 
                        DataSourceID="StateSqlDataSource1" DataTextField="StateName" 
                        DataValueField="StateID" SelectedValue='<%# Bind("StateID") %>' Width="150px">
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("StateID") %>'></asp:Label>
                </ItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList7" runat="server" 
                        DataSourceID="StateSqlDataSource1" DataTextField="StateName" 
                        DataValueField="StateID" SelectedValue='<%# Bind("StateID") %>' Width="150px">
                    </asp:DropDownList>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Country" SortExpression="Country">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" 
                        DataSourceID="CountrySqlDataSource1" DataTextField="CountryName" 
                        DataValueField="CountryID" SelectedValue='<%# Bind("CountryID") %>' 
                        Width="150px">
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("CountryID") %>'></asp:Label>
                </ItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList8" runat="server" 
                        DataSourceID="CountrySqlDataSource1" DataTextField="CountryName" 
                        DataValueField="CountryID" SelectedValue='<%# Bind("CountryID") %>' 
                        Width="150px">
                    </asp:DropDownList>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" ButtonType="Button" 
                ShowInsertButton="True" />
        </Fields>

<HeaderStyle ForeColor="#B5C83C"></HeaderStyle>
    </asp:DetailsView>

  
  
  <asp:Label ID="ShowInfoMessage" runat="server" Text="Label" 
        CssClass="InfoMsgBox" Enabled="False" Visible="False"></asp:Label>

<asp:SqlDataSource ID="CustomerProfileDataSource" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
    
        
        
    
        
    SelectCommand="SELECT UserId, Name, PhoneNo, MobileNo, CountryID, StateID, CityID, Address1, Address2, Gender, FaxNo, BirthDate FROM Customer WHERE (UserId = @UserId)

" UpdateCommand="UPDATE Customer 
SET Name = @Name, 
PhoneNo = @PhoneNo, 
MobileNo = @MobileNo, 
CountryID = @CountryID, 
StateID = @StateID, 
CityID = @CityID, 
Address1 = @Address1, 
Address2 = @Address2, 
Gender = @Gender, 
FaxNo = @FaxNo, 
BirthDate = @BirthDate
Where UserID = @UserID" 
        
    InsertCommand="INSERT INTO Customer(UserID, Name, PhoneNo, MobileNo, CountryID, CityID, StateID, Address1, Address2, Gender, FaxNo, BirthDate,UserType,UserName) VALUES (@UserID, @Name, @PhoneNo, @MobileNo, @CountryID, @CityID, @StateID, @Address1, @Address2, @Gender, @FaxNo,@BirthDate,@UserType,@UserName)" 
    ProviderName="<%$ ConnectionStrings:ConnOres.ProviderName %>">
    <InsertParameters>
        <asp:Parameter Name="Name" />
        <asp:Parameter Name="PhoneNo" />
        <asp:Parameter Name="MobileNo" />
        <asp:Parameter Name="Address1" />
        <asp:Parameter Name="Address2" />
        <asp:Parameter Name="Gender" />
        <asp:Parameter Name="FaxNo" />
        <asp:Parameter Name="UserID" />
        <asp:Parameter Name="CountryID" />
        <asp:Parameter Name="CityID" />
        <asp:Parameter Name="StateID" />
        <asp:Parameter Name="UserType" />
        <asp:Parameter Name="UserName" />
        <asp:Parameter Name="BirthDate" />
    </InsertParameters>
    <SelectParameters>
        <asp:Parameter Name="UserId" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="Name" />
        <asp:Parameter Name="PhoneNo" />
        <asp:Parameter Name="MobileNo" />
        <asp:Parameter Name="Address1" />
        <asp:Parameter Name="Address2" />
        <asp:Parameter Name="Gender" />
        <asp:Parameter Name="FaxNo" />
        <asp:Parameter Name="BirthDate" />
        <asp:Parameter Name="UserID" />
        <asp:Parameter Name="CountryID" />
        <asp:Parameter Name="StateID" />
        <asp:Parameter Name="CityID" />
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

