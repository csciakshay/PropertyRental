﻿<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ManageProperty1.aspx.vb" Inherits="ManageProperty1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>    

<h2>Manage Property</h2>
  <div class="insertbtn"> 
      <asp:Button ID="btnBid" runat="server" Text="Bid Details" Width="150" PostBackUrl="~/BidDetail.aspx" />
      <asp:Button ID="BbtnImage" runat="server" 
          Text="Add/Edit Image" Width="150px" PostBackUrl="~/ManageImages.aspx" />  
                </div>    
      
    
    <asp:DetailsView ID="DetailsView1" runat="server" Height="550px" 
    Width="523px" AutoGenerateRows="False" DataKeyNames="PropertyID" 
    DataSourceID="SqlDataSource1" DefaultMode="Edit" GridLines="None" 
        AllowPaging="True">
        <EditRowStyle VerticalAlign="Top" />
        <Fields>
            <asp:TemplateField HeaderText="Property Type :" SortExpression="TypeID">
                <EditItemTemplate>
                    <asp:RadioButtonList ID="RadioButton_PropertyType" runat="server" 
                        DataSourceID="PropertyTypeSqlDataSource1" DataTextField="TypeName" 
                        DataValueField="TypeID" RepeatDirection="Horizontal" 
                        SelectedValue='<%# Bind("TypeID") %>' Width="221px">
                    </asp:RadioButtonList>
                    <asp:SqlDataSource ID="PropertyTypeSqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnOres %>" SelectCommand="SELECT [TypeID], [TypeName], [Active] FROM [PropertyType]
WHERE Active = 1 "></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("TypeID") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle ForeColor="#B5C83C" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mode of Property :" SortExpression="ModeID">
                <EditItemTemplate>
                    <asp:RadioButtonList ID="RadioButton_PropertyMode" runat="server" 
                        DataSourceID="PropertyModeSqlDataSource1" DataTextField="ModeName" 
                        DataValueField="ModeID" RepeatDirection="Horizontal" 
                        SelectedValue='<%# Bind("ModeID") %>'>
                    </asp:RadioButtonList>
                    <asp:SqlDataSource ID="PropertyModeSqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
                        SelectCommand="SELECT ModeID, ModeName, Active FROM PropertyMode WHERE (Active = 1) AND (ModeName &lt;&gt; 'Buy')">
                    </asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ModeID") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle ForeColor="#B5C83C" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Property Category :" SortExpression="CategoryID">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="PropertyCategorySqlDataSource1" DataTextField="CategoryName" 
                        DataValueField="CategoryID" SelectedValue='<%# Bind("CategoryID") %>' 
                        Width="150px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="PropertyCategorySqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnOres %>" SelectCommand="SELECT [CategoryID], [CategoryName], [Active] FROM [PropertyCatgeory]
WHERE Active = 1 "></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("CategoryID") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle ForeColor="#B5C83C" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Title Heading :" SortExpression="TitleHeading">
                <EditItemTemplate>
                    <asp:TextBox ID="txtboxTitle" runat="server" Text='<%# Bind("TitleHeading") %>' 
                        Width="250px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtboxTitle" CssClass="ErrorMsgBox" 
                        ErrorMessage="Max 100 Characters" ValidationExpression="^(.|\s){1,100}$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("TitleHeading") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle ForeColor="#B5C83C" />
            </asp:TemplateField>
            <asp:BoundField DataField="PropertyID" HeaderText="PropertyID" 
                InsertVisible="False" ReadOnly="True" SortExpression="PropertyID" 
                Visible="False" />
            <asp:TemplateField HeaderText="Description :" 
                SortExpression="PropertyDescription">
                <EditItemTemplate>
                  <table border="0" cellpadding="0" cellspacing="0">

                    <tr><td rowspan="4">
                        <asp:TextBox ID="txtDescription" runat="server" Height="50px" 
                            Text='<%# Bind("PropertyDescription") %>' TextMode="MultiLine" Width="250px"></asp:TextBox>
                    
                    </td>
                        <tr>
                            <td>
                                *
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                    ControlToValidate="txtDescription" CssClass="ErrorMsgBox" 
                                    ErrorMessage="Max 5000 Characters" 
                                    ValidationExpression="^(.|\s){1,5000}$"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvdesc" runat="server" 
                                    ControlToValidate="txtDescription" CssClass="ErrorMsgBox" 
                                    ErrorMessage="Description is Required"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                      </tr>
                  </table> 
                
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" 
                        Text='<%# Bind("PropertyDescription") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle ForeColor="#B5C83C" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Additional Info :" 
                SortExpression="AdditionalInfo">
                <EditItemTemplate>
                    <asp:TextBox ID="txtboxAdditional" runat="server" Height="50px" 
                        Text='<%# Bind("AdditionalInfo") %>' TextMode="MultiLine" Width="250px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                        ControlToValidate="txtboxAdditional" CssClass="ErrorMsgBox" 
                        ErrorMessage="Max 5000 Characters" 
                        ValidationExpression="^(.|\s){1,5000}$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("AdditionalInfo") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle ForeColor="#B5C83C" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Property Address :" 
                SortExpression="PropertyAddress">
                <EditItemTemplate>

                    <table border="0" cellpadding="0" cellspacing="0">
                    
                   <tr><td rowspan="4">  
                       <asp:TextBox ID="txtAddress" runat="server" Height="50px" 
                           Text='<%# Bind("PropertyAddress") %>' TextMode="MultiLine" Width="250px"></asp:TextBox>
                       </td>
                       <tr>
                           <td>
                               *
                           </td>
                       </tr>
                       <tr>
                           <td>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                                   ControlToValidate="txtAddress" CssClass="ErrorMsgBox" 
                                   ErrorMessage="Max 200 Characters" ValidationExpression="^(.|\s){1,200}$"></asp:RegularExpressionValidator>
                           </td>
                       </tr>
                       <tr>
                           <td>
                               <asp:RequiredFieldValidator ID="rfvAddress" runat="server" 
                                   ControlToValidate="txtAddress" CssClass="ErrorMsgBox" 
                                   ErrorMessage="Address is Required"></asp:RequiredFieldValidator>
                           </td>
                       </tr>
                        </tr>
               </table> 
                
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label13" runat="server" Text='<%# Bind("PropertyAddress") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle ForeColor="#B5C83C" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Area :" SortExpression="AreaLocID">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList5" runat="server" 
                        DataSourceID="AreaLocSqlDataSource1" DataTextField="AreaLocName" 
                        DataValueField="AreaLocID" SelectedValue='<%# Bind("AreaLocID") %>' 
                        Width="150px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="AreaLocSqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnOres %>" SelectCommand="SELECT [AreaLocID], [AreaLocName], [Active], [CityID] FROM [AreaLocation]
WHERE Active = 1 
"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("AreaLocID") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle ForeColor="#B5C83C" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City :" SortExpression="CityId">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList4" runat="server" 
                        DataSourceID="CitySqlDataSource1" DataTextField="CityName" 
                        DataValueField="CityID" SelectedValue='<%# Bind("CityId") %>' Width="150px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="CitySqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnOres %>" SelectCommand="SELECT [CityID], [CityName], [Active] FROM [City]
WHERE Active = 1 "></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("CityId") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle ForeColor="#B5C83C" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="State :" SortExpression="StateID">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" 
                        DataSourceID="StateSqlDataSource1" DataTextField="StateName" 
                        DataValueField="StateID" SelectedValue='<%# Bind("StateID") %>' Width="150px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="StateSqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnOres %>" SelectCommand="SELECT [StateID], [StateName], [CountryID], [Active] FROM [State]
WHERE Active = 1 "></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("StateID") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle ForeColor="#B5C83C" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Country :" SortExpression="CountryID">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" 
                        DataSourceID="CountrySqlDataSource1" DataTextField="CountryName" 
                        DataValueField="CountryID" SelectedValue='<%# Bind("CountryID") %>' 
                        Width="150px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="CountrySqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnOres %>" SelectCommand="SELECT [CountryID], [CountryName], [Active] FROM [Country]
WHERE Active = 1 "></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("CountryID") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle ForeColor="#B5C83C" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Size of Property :" 
                SortExpression="SizeofProperty">
                <EditItemTemplate>
                    <asp:TextBox ID="TxtSizeOfProperty" runat="server" 
                        Text='<%# Bind("SizeofProperty") %>'></asp:TextBox>
                    *<asp:DropDownList ID="DdlUnits" runat="server" DataSourceID="SqlDsUnits" 
                        DataTextField="UnitName" DataValueField="UnitID" 
                        SelectedValue='<%# Bind("UnitID") %>'>
                    </asp:DropDownList>
                    <asp:CompareValidator ID="cvSize" runat="server" 
                        ControlToValidate="TxtSizeOfProperty" CssClass="ErrorMsgBox" 
                        ErrorMessage="Allowed: Numbers &gt; 0 " Operator="GreaterThan" Type="Integer" 
                        ValueToCompare="0"></asp:CompareValidator>
                    <br />
                    <asp:RequiredFieldValidator ID="rfvSize" runat="server" 
                        ControlToValidate="TxtSizeOfProperty" CssClass="ErrorMsgBox" 
                        ErrorMessage="Size is Required"></asp:RequiredFieldValidator>
                    <br />
                    <asp:SqlDataSource ID="SqlDsUnits" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
                        SelectCommand="SELECT [UnitID], [UnitName] FROM [Units]">
                    </asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("SizeofProperty") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle ForeColor="#B5C83C" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price in Whole (Rs.) :" 
                SortExpression="PropertyPrice">
                <EditItemTemplate>
                    <asp:TextBox ID="txtPrice" runat="server" Text='<%# Bind("PropertyPrice") %>'></asp:TextBox>
                    *<asp:CompareValidator ID="cvPrice" runat="server" ControlToValidate="txtPrice" 
                        CssClass="ErrorMsgBox" ErrorMessage="Allowed: Numbers &gt; 0 " 
                        Operator="GreaterThan" Type="Integer" ValueToCompare="0"></asp:CompareValidator>
                    <br />
                    <asp:RequiredFieldValidator ID="rfvPrice" runat="server" 
                        ControlToValidate="txtPrice" CssClass="ErrorMsgBox" 
                        ErrorMessage="Price is Required"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("PropertyPrice") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle ForeColor="#B5C83C" />
            </asp:TemplateField>
            <asp:CheckBoxField DataField="IsNegotiable" HeaderText="Is Price Negotiable :" 
                SortExpression="IsNegotiable" >
            <HeaderStyle ForeColor="#B5C83C" />
            </asp:CheckBoxField>
            <asp:CheckBoxField DataField="IsCancelled" HeaderText="Cancel :" 
                SortExpression="IsCancelled" >
            <HeaderStyle ForeColor="#B5C83C" />
            </asp:CheckBoxField>
            <asp:CheckBoxField DataField="IsFinalized" HeaderText="Is Finalized :" 
                SortExpression="IsFinalized" Visible="False" >
            <ItemStyle ForeColor="#B5C83C" />
            </asp:CheckBoxField>
            <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" 
                Visible="False" />
            <asp:CommandField ButtonType="Button" ShowInsertButton="True" 
                ShowEditButton="True" />
            <asp:TemplateField HeaderText="UnitID" SortExpression="UnitID" Visible="False">
            </asp:TemplateField>
        </Fields>
        <HeaderStyle ForeColor="#B5C83C" />
    </asp:DetailsView>

       <asp:Label ID="ShowInfoMessage" runat="server" Text="Label" 
        CssClass="InfoMsgBox" Enabled="False" Visible="False"></asp:Label>
  
           

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConflictDetection="CompareAllValues" 
    ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
    DeleteCommand="DELETE FROM Property WHERE (PropertyID = @original_PropertyID) AND (PropertyDescription = @original_PropertyDescription OR PropertyDescription IS NULL AND @original_PropertyDescription IS NULL) AND (PropertyPrice = @original_PropertyPrice OR PropertyPrice IS NULL AND @original_PropertyPrice IS NULL) AND (AdditionalInfo = @original_AdditionalInfo OR AdditionalInfo IS NULL AND @original_AdditionalInfo IS NULL) AND (TitleHeading = @original_TitleHeading OR TitleHeading IS NULL AND @original_TitleHeading IS NULL) AND (PropertyAddress = @original_PropertyAddress OR PropertyAddress IS NULL AND @original_PropertyAddress IS NULL) AND (SizeofProperty = @original_SizeofProperty OR SizeofProperty IS NULL AND @original_SizeofProperty IS NULL) AND (AreaLocID = @original_AreaLocID OR AreaLocID IS NULL AND @original_AreaLocID IS NULL) AND (DateAdded = @original_DateAdded OR DateAdded IS NULL AND @original_DateAdded IS NULL) AND (IsNegotiable = @original_IsNegotiable OR IsNegotiable IS NULL AND @original_IsNegotiable IS NULL) AND (IsFinalized = @original_IsFinalized OR IsFinalized IS NULL AND @original_IsFinalized IS NULL) AND (IsCancelled = @original_IsCancelled OR IsCancelled IS NULL AND @original_IsCancelled IS NULL) AND (Active = @original_Active OR Active IS NULL AND @original_Active IS NULL) AND (UserID = @original_UserID OR UserID IS NULL AND @original_UserID IS NULL) AND (CategoryID = @original_CategoryID OR CategoryID IS NULL AND @original_CategoryID IS NULL) AND (CityId = @original_CityId OR CityId IS NULL AND @original_CityId IS NULL) AND (TypeID = @original_TypeID OR TypeID IS NULL AND @original_TypeID IS NULL) AND (ModeID = @original_ModeID OR ModeID IS NULL AND @original_ModeID IS NULL) AND (CountryID = @original_CountryID OR CountryID IS NULL AND @original_CountryID IS NULL) AND (StateID = @original_StateID OR StateID IS NULL AND @original_StateID IS NULL) AND (UnitID = @original_UnitID OR UnitID IS NULL AND @original_UnitID IS NULL)" 
    InsertCommand="INSERT INTO Property(PropertyDescription, PropertyPrice, AdditionalInfo, TitleHeading, PropertyAddress, SizeofProperty, AreaLocID, IsNegotiable, IsFinalized, IsCancelled, UserID, CategoryID, CityId, TypeID, ModeID, CountryID, StateID, UnitID) VALUES (@PropertyDescription, @PropertyPrice, @AdditionalInfo, @TitleHeading, @PropertyAddress, @SizeofProperty, @AreaLocID, @IsNegotiable, @IsFinalized, @IsCancelled, @UserID, @CategoryID, @CityId, @TypeID, @ModeID, @CountryID, @StateID, @UnitID)" 
    OldValuesParameterFormatString="original_{0}" 
    SelectCommand="SELECT PropertyID, PropertyDescription, PropertyPrice, AdditionalInfo, TitleHeading, PropertyAddress, SizeofProperty, AreaLocID, IsNegotiable, IsFinalized, IsCancelled, UserID, CategoryID, CityId, TypeID, ModeID, CountryID, StateID, UnitID FROM Property WHERE (UserID = @UserID) AND (IsCancelled = 0)" 
    UpdateCommand="UPDATE Property SET PropertyDescription = @PropertyDescription, PropertyPrice = @PropertyPrice, AdditionalInfo = @AdditionalInfo, TitleHeading = @TitleHeading, PropertyAddress = @PropertyAddress, SizeofProperty = @SizeofProperty, AreaLocID = @AreaLocID, DateAdded = @DateAdded, IsNegotiable = @IsNegotiable, IsFinalized = @IsFinalized, IsCancelled = @IsCancelled, Active = @Active, UserID = @UserID, CategoryID = @CategoryID, CityId = @CityId, TypeID = @TypeID, ModeID = @ModeID, CountryID = @CountryID, StateID = @StateID, UnitID = @UnitID WHERE (PropertyID = @original_PropertyID)">
    <DeleteParameters>
        <asp:Parameter Name="original_PropertyID" Type="Int32" />
        <asp:Parameter Name="original_PropertyDescription" Type="String" />
        <asp:Parameter Name="original_PropertyPrice" Type="Int32" />
        <asp:Parameter Name="original_AdditionalInfo" Type="String" />
        <asp:Parameter Name="original_TitleHeading" Type="String" />
        <asp:Parameter Name="original_PropertyAddress" Type="String" />
        <asp:Parameter Name="original_SizeofProperty" Type="Int32" />
        <asp:Parameter Name="original_AreaLocID" Type="Int32" />
        <asp:Parameter DbType="Date" Name="original_DateAdded" />
        <asp:Parameter Name="original_IsNegotiable" Type="Boolean" />
        <asp:Parameter Name="original_IsFinalized" Type="Boolean" />
        <asp:Parameter Name="original_IsCancelled" Type="Boolean" />
        <asp:Parameter Name="original_Active" Type="Boolean" />
        <asp:Parameter Name="original_UserID" Type="Object" />
        <asp:Parameter Name="original_CategoryID" Type="Int32" />
        <asp:Parameter Name="original_CityId" Type="Int32" />
        <asp:Parameter Name="original_TypeID" Type="Int32" />
        <asp:Parameter Name="original_ModeID" Type="Int32" />
        <asp:Parameter Name="original_CountryID" Type="Int32" />
        <asp:Parameter Name="original_StateID" Type="Int32" />
        <asp:Parameter Name="original_UnitID" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="PropertyDescription" Type="String" />
        <asp:Parameter Name="PropertyPrice" Type="Int32" />
        <asp:Parameter Name="AdditionalInfo" Type="String" />
        <asp:Parameter Name="TitleHeading" Type="String" />
        <asp:Parameter Name="PropertyAddress" Type="String" />
        <asp:Parameter Name="SizeofProperty" Type="Int32" />
        <asp:Parameter Name="AreaLocID" Type="Int32" />
        <asp:Parameter Name="IsNegotiable" Type="Boolean" />
        <asp:Parameter Name="IsFinalized" Type="Boolean" />
        <asp:Parameter Name="IsCancelled" Type="Boolean" DefaultValue="False" />
        <asp:Parameter Name="UserID" />
        <asp:Parameter Name="CategoryID" Type="Int32" />
        <asp:Parameter Name="CityId" Type="Int32" />
        <asp:Parameter Name="TypeID" Type="Int32" />
        <asp:Parameter Name="ModeID" Type="Int32" />
        <asp:Parameter Name="CountryID" Type="Int32" />
        <asp:Parameter Name="StateID" Type="Int32" />
        <asp:Parameter Name="UnitID" />
    </InsertParameters>
    <SelectParameters>
        <asp:Parameter Name="UserID" Type="Object" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="PropertyDescription" Type="String" />
        <asp:Parameter Name="PropertyPrice" Type="Int32" />
        <asp:Parameter Name="AdditionalInfo" Type="String" />
        <asp:Parameter Name="TitleHeading" Type="String" />
        <asp:Parameter Name="PropertyAddress" Type="String" />
        <asp:Parameter Name="SizeofProperty" Type="Int32" />
        <asp:Parameter Name="AreaLocID" Type="Int32" />
        <asp:Parameter DbType="Date" Name="DateAdded" />
        <asp:Parameter Name="IsNegotiable" Type="Boolean" />
        <asp:Parameter Name="IsFinalized" Type="Boolean" />
        <asp:Parameter Name="IsCancelled" Type="Boolean" />
        <asp:Parameter Name="Active" Type="Boolean" />
        <asp:Parameter Name="UserID" />
        <asp:Parameter Name="CategoryID" Type="Int32" />
        <asp:Parameter Name="CityId" Type="Int32" />
        <asp:Parameter Name="TypeID" Type="Int32" />
        <asp:Parameter Name="ModeID" Type="Int32" />
        <asp:Parameter Name="CountryID" Type="Int32" />
        <asp:Parameter Name="StateID" Type="Int32" />
        <asp:Parameter Name="original_PropertyID" Type="Int32" />
        <asp:Parameter Name="original_PropertyDescription" Type="String" />
        <asp:Parameter Name="original_PropertyPrice" Type="Int32" />
        <asp:Parameter Name="original_AdditionalInfo" Type="String" />
        <asp:Parameter Name="original_TitleHeading" Type="String" />
        <asp:Parameter Name="original_PropertyAddress" Type="String" />
        <asp:Parameter Name="original_SizeofProperty" Type="Int32" />
        <asp:Parameter Name="original_AreaLocID" Type="Int32" />
        <asp:Parameter DbType="Date" Name="original_DateAdded" />
        <asp:Parameter Name="original_IsNegotiable" Type="Boolean" />
        <asp:Parameter Name="original_IsFinalized" Type="Boolean" />
        <asp:Parameter Name="original_IsCancelled" Type="Boolean" />
        <asp:Parameter Name="original_Active" Type="Boolean" />
        <asp:Parameter Name="original_UserID" />
        <asp:Parameter Name="original_CategoryID" Type="Int32" />
        <asp:Parameter Name="original_CityId" Type="Int32" />
        <asp:Parameter Name="original_TypeID" Type="Int32" />
        <asp:Parameter Name="original_ModeID" Type="Int32" />
        <asp:Parameter Name="original_CountryID" Type="Int32" />
        <asp:Parameter Name="original_StateID" Type="Int32" />
        <asp:Parameter Name="UnitID" />
        <asp:Parameter Name="original_UnitID" />
    </UpdateParameters>
</asp:SqlDataSource>



</asp:Content>
