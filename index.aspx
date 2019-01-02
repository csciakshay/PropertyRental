<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="index.aspx.vb" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

       
    

    <div class="rnd_box"> <b class="rnd_top"><b class="rnd_b1"></b><b class="rnd_b2"></b><b class="rnd_b3"></b><b class="rnd_b4"></b></b> <div class="rnd_content">
          
    <table>
    <tr>
      
      <td style="color: #b5c83c;">Property Type :</td>
      <td>
          <asp:RadioButtonList ID="RadioButton_PropertyType" runat="server" Width="221px" 
              RepeatDirection="Horizontal" DataSourceID="PropertyTypeSqlDataSource1" 
              DataTextField="TypeName" DataValueField="TypeID">
          </asp:RadioButtonList>
          
        </td>
    <td style="color: #b5c83c; padding-left: 40px; padding-top: 20px;" rowspan="7"> 
        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/searchimage2.jpg" />
        </td>
    </tr>
    <tr>
      <td style="color: #b5c83c;">Property Mode :</td>
      <td>
          <asp:RadioButtonList ID="RadioButton_PropertyMode" runat="server" 
              DataSourceID="PropertyModeSqlDataSource1" DataTextField="ModeName" 
              DataValueField="ModeID" RepeatDirection="Horizontal" Width="221px">
          </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
      <td style="color: #b5c83c;">Category :</td>
      <td>
          <asp:DropDownList ID="ddlCatg" runat="server" 
              DataSourceID="PropertyCategorySqlDataSource1" DataTextField="CategoryName" 
              DataValueField="CategoryID" Width="150px">
          </asp:DropDownList>
        </td>
    </tr>
    <tr>
      <td style="color: #b5c83c;">Area :</td>
      <td>
          <asp:DropDownList ID="ddlArea" runat="server" 
              DataSourceID="AreaLocSqlDataSource1" DataTextField="AreaLocName" 
              DataValueField="AreaLocID" Width="150px">
          </asp:DropDownList>
        </td>
    </tr>
    <tr>
      <td style="color: #b5c83c;">City :</td>
      <td>
          <asp:DropDownList ID="ddlCity" runat="server" DataSourceID="CitySqlDataSource1" 
              DataTextField="CityName" DataValueField="CityID" Width="150px">
          </asp:DropDownList>
        </td>
    </tr>
    <tr>
      <td style="color: #b5c83c;">State</td>
      <td>
          <asp:DropDownList ID="ddlState" runat="server" 
              DataSourceID="StateSqlDataSource1" DataTextField="StateName" 
              DataValueField="StateID" Width="150px">
          </asp:DropDownList>
        </td>
    </tr>
    <tr>
     <td></td>
     <td>
         <asp:Button ID="BtnSearch" runat="server" Text="Search" />
        </td>
        
    </tr>
    </table>


   </div> <b class="rnd_bottom"><b class="rnd_b4"></b><b class="rnd_b3"></b><b class="rnd_b2"></b><b class="rnd_b1"></b></b> </div>

    <asp:SqlDataSource ID="PropertyTypeSqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
                        SelectCommand="SELECT [TypeID], [TypeName], [Active] FROM [PropertyType]
                        WHERE Active = 1 "></asp:SqlDataSource>

     
    <asp:SqlDataSource ID="PropertyModeSqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
                        
        SelectCommand="SELECT ModeID, ModeName, Active FROM PropertyMode WHERE (Active = 1) AND (ModeName &lt;&gt; 'Buy')">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="PropertyCategorySqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
                        SelectCommand="SELECT [CategoryID], [CategoryName], [Active] FROM [PropertyCatgeory]
WHERE Active = 1 "></asp:SqlDataSource>
    <asp:SqlDataSource ID="AreaLocSqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
                        SelectCommand="SELECT [AreaLocID], [AreaLocName], [Active], [CityID] FROM [AreaLocation]
WHERE Active = 1 
"></asp:SqlDataSource>
    <asp:SqlDataSource ID="CitySqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
                        SelectCommand="SELECT [CityID], [CityName], [Active] FROM [City]
WHERE Active = 1 "></asp:SqlDataSource>
    <asp:SqlDataSource ID="StateSqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
                        SelectCommand="SELECT [StateID], [StateName], [CountryID], [Active] FROM [State]
WHERE Active = 1 "></asp:SqlDataSource>

     
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="PropertyID" DataSourceID="SqlDsPropertyList" AllowPaging="True" 
            AllowSorting="True" GridLines="None">
        <Columns>
            <asp:TemplateField><ItemTemplate>
                 
             <table cellpadding="0" cellspacing="0" style="border-style: none;"> 
                <tr> 
                 <td colspan="4" 
                        style="border-style: none; color: #b5c83c; background-color: #333333;"> 
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("TitleHeading") %>'></asp:Label>
                 </td>
                </tr>
                
                              
                <tr> 
                 <td rowspan="7" style="border-style: none; background-color: #121212" width="150"> 
                  <asp:Image ID="Image1" runat="server" Height="145" 
                         ImageUrl='<%# Eval("PropertyID", "~/ShowPicture.aspx?pPropertyID={0}") %>' 
                         Width="145" />
                  </td>
                 
                 <td rowspan="7" valign="top" style="background-color: #121212" width="400"> 
                    
                 <asp:Label ID="Label4" runat="server" Text='<%# Bind("PropertyDescription") %>'></asp:Label>
                     <asp:HyperLink ID="HyperLink1" runat="server" 
                         NavigateUrl='<%# Eval("PropertyID", "PropertyDetail.aspx?ID={0}") %>' 
                         Text="View Details"></asp:HyperLink>
                     
                 </td> 
                </tr>

               
                <tr> 
                 <td style="border-style: none; color: #b5c83c; background-color: #121212;"> Added:  </td> 
                 <td style="border-style: none; background-color: #121212;" nowrap="nowrap">  
                 <asp:Label ID="Label3" runat="server" Text='<%# Bind("DateAdded") %>'></asp:Label>
                 </td>
                </tr>
                
                <tr> 
                 <td style="border-style: none; color: #b5c83c; background-color: #121212;"> Mode:  </td> 
                 <td style="border-style: none; background-color: #121212;">  
                 <asp:Label ID="Label8" runat="server" Text='<%# Bind("ModeName") %>'></asp:Label>
                 </td>
                </tr>
                
                <tr>
                 <td style="border-style: none; color: #b5c83c; background-color: #121212;"> Price:  </td> 
                 <td style="border-style: none; background-color: #121212;" nowrap="nowrap">  
                 <asp:Label ID="Label2" runat="server" Text='<%# Bind("PropertyPrice") %>'></asp:Label> /=
                 </td> 
                </tr>
                
                <tr>
                 <td style="border-style: none; color: #b5c83c; background-color: #121212;"> Size:  </td> 
                 <td style="border-style: none; background-color: #121212;">  
                 <asp:Label ID="Label5" runat="server" Text='<%# Bind("SizeofProperty") %>'></asp:Label> 
                     <asp:Label ID="Label9" runat="server" 
                         Text='<%# Bind("UnitName") %>'></asp:Label>
                 </td> 
                </tr>
                
                <tr>
                 <td style="border-style: none; color: #b5c83c; background-color: #121212;"> City:  </td> 
                 <td style="border-style: none; background-color: #121212;">  
                 <asp:Label ID="Label6" runat="server" Text='<%# Bind("CityName") %>'></asp:Label>
                 </td> 
                </tr>

                <tr>
                 <td style="border-style: none; color: #b5c83c; background-color: #121212;"> Area:  </td> 
                 <td style="border-style: none; background-color: #121212;" nowrap="nowrap">  
                 <asp:Label ID="Label7" runat="server" Text='<%# Bind("AreaLocName") %>'></asp:Label>
                 </td> 
                </tr>
              
               
                </table> 
                   
                   
                 
                
</ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="PropertyID" HeaderText="PropertyID" 
                InsertVisible="False" ReadOnly="True" SortExpression="PropertyID" 
                Visible="False" />
        </Columns>
        <RowStyle CssClass="RowStyle" />
            <EmptyDataRowStyle CssClass="EmptyRowStyle" />
            <EmptyDataTemplate>
                <div class="heading1">OOps! No Property Lsitings Found. Please Select Different Choice.</div>
        </EmptyDataTemplate>
            <PagerStyle CssClass="PagerStyle" />
            <SelectedRowStyle CssClass="SelectedRowStyle" />
            
            <EditRowStyle CssClass="EditRowStyle" />
            <AlternatingRowStyle CssClass="AltRowStyle" /> 
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDsPropertyList" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
        
        
        SelectCommand="SELECT Property.PropertyID, Property.PropertyDescription, Property.PropertyPrice, CONVERT (VARCHAR(11), Property.DateAdded, 106) AS DateAdded, Property.TitleHeading, Property.SizeofProperty, City.CityName, AreaLocation.AreaLocName, PropertyMode.ModeName, Units.UnitName FROM Property INNER JOIN City ON Property.CityId = City.CityID INNER JOIN PropertyMode ON Property.ModeID = PropertyMode.ModeID INNER JOIN Units ON Property.UnitID = Units.UnitID INNER JOIN AreaLocation ON Property.AreaLocID = AreaLocation.AreaLocID WHERE (Property.Active = 1) AND (AreaLocation.Active = 1) AND (PropertyMode.Active = 1) AND (Units.Active = 1) AND (Property.IsCancelled = 0)">
    </asp:SqlDataSource>
     
    <asp:SqlDataSource ID="sqldsSearch" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
        
        
        SelectCommand="SELECT Property.PropertyID, Property.PropertyDescription, Property.PropertyPrice, CONVERT (VARCHAR(11), Property.DateAdded, 106) AS DateAdded, Property.TitleHeading, Property.SizeofProperty, City.CityName, AreaLocation.AreaLocName, PropertyMode.ModeName, Units.UnitName FROM Property INNER JOIN City ON Property.CityId = City.CityID INNER JOIN PropertyMode ON Property.ModeID = PropertyMode.ModeID INNER JOIN Units ON Property.UnitID = Units.UnitID INNER JOIN AreaLocation ON Property.AreaLocID = AreaLocation.AreaLocID LEFT OUTER JOIN State ON Property.StateID = State.StateID LEFT OUTER JOIN PropertyCatgeory ON Property.CategoryID = PropertyCatgeory.CategoryID LEFT OUTER JOIN PropertyType ON Property.TypeID = PropertyType.TypeID WHERE (Property.Active = 1) AND (AreaLocation.Active = 1) AND (PropertyMode.Active = 1) AND (Units.Active = 1) AND (City.CityID = @CityID) AND (PropertyMode.ModeID = @ModeID) AND (AreaLocation.AreaLocID = @AreaLocID) AND (PropertyType.TypeID = @TypeID) AND (PropertyCatgeory.CategoryID = @CategoryID) AND (State.StateID = @StateID) AND (Property.IsCancelled = 0)">
        <SelectParameters>
            <asp:Parameter Name="CityID" />
            <asp:Parameter Name="ModeID" />
            <asp:Parameter Name="AreaLocID" />
            <asp:Parameter Name="TypeID" />
            <asp:Parameter Name="CategoryID" />
            <asp:Parameter Name="StateID" />
        </SelectParameters>
    </asp:SqlDataSource>
     


       
</asp:Content>

