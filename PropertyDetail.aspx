<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="PropertyDetail.aspx.vb" Inherits="PropertyDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 230px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Property Detail</h2>

    <asp:DetailsView ID="DetailsView1" runat="server" Height="525px" Width="600px" 
        AutoGenerateRows="False" DataKeyNames="PropertyID" 
        DataSourceID="SqlDsPropertyDetail" GridLines="None" 
        style="margin-right: 0px">
        <Fields>
            <asp:BoundField DataField="PropertyID" HeaderText="PropertyID" 
                InsertVisible="False" ReadOnly="True" SortExpression="PropertyID" 
                Visible="False" />
            <asp:BoundField DataField="TitleHeading" HeaderText="Title :" 
                SortExpression="TitleHeading" >
            <HeaderStyle ForeColor="#B5C83C" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Image" ShowHeader="False">
                <ItemTemplate>
                    <table>
                     <tr><td rowspan="12" width="410">
                       <asp:Image ID="Image1" runat="server" Height="300px" 
                             ImageUrl='<%# Eval("PropertyID", "~/ShowPicture.aspx?pPropertyID={0}") %>' 
                             Width="400px" />
                     </td></tr>
                     <tr><td style="color: #b5c83c" nowrap="nowrap">Added :</td><td nowrap="nowrap"><asp:Label ID="Label17" runat="server" Text='<%# Bind("DateAdded") %>'></asp:Label></td></tr> 
                     <tr><td style="color: #b5c83c" nowrap="nowrap">Type :</td><td nowrap="nowrap"><asp:Label ID="Label15" runat="server" Text='<%# Bind("TypeName") %>'></asp:Label></td></tr> 
                     <tr><td style="color: #b5c83c" nowrap="nowrap">Mode :</td><td nowrap="nowrap"><asp:Label ID="Label14" runat="server" Text='<%# Bind("ModeName") %>'></asp:Label></td></tr> 
                     <tr><td style="color: #b5c83c" nowrap="nowrap">Category :</td> <td nowrap="nowrap"><asp:Label ID="Label16" runat="server" Text='<%# Bind("CategoryName") %>'></asp:Label></td></tr> 
                     <tr><td style="color: #b5c83c" nowrap="nowrap">Price :</td><td nowrap="nowrap"><asp:Label ID="Label11" runat="server" Text='<%# Bind("PropertyPrice") %>'></asp:Label></td></tr> 
                     <tr><td style="color: #b5c83c" nowrap="nowrap">Is Negotiable :</td><td nowrap="nowrap"><asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsNegotiable") %>' Enabled="false" /></td></tr> 
                     
                     <tr><td style="color: #b5c83c" nowrap="nowrap">Size :</td><td nowrap="nowrap"><asp:Label ID="Label12" runat="server" Text='<%# Bind("SizeofProperty") %>'></asp:Label><asp:Label ID="Label13" runat="server" Text='<%# Bind("UnitName") %>'></asp:Label></td></tr>  
                     <tr style="line-height: 10px"><td></td><td></td></tr>

                     <tr><td style="color: #b5c83c" nowrap="nowrap"> Area :</td><td nowrap="nowrap"><asp:Label ID="Label4" runat="server" Text='<%# Bind("AreaLocName") %>'></asp:Label></td></tr>
                     <tr><td style="color: #b5c83c" nowrap="nowrap">City :</td><td nowrap="nowrap"><asp:Label ID="Label3" runat="server" Text='<%# Bind("CityName") %>'></asp:Label></td></tr>
                     <tr><td style="color: #b5c83c" nowrap="nowrap">State :</td><td nowrap="nowrap"><asp:Label ID="Label2" runat="server" Text='<%# Bind("StateName") %>'></asp:Label></td></tr>

                    </table>
                    
                  
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="PropertyDescription" 
                HeaderText="Description :" SortExpression="PropertyDescription" 
                ShowHeader="False">
            <HeaderStyle ForeColor="#B5C83C" />
            </asp:BoundField>
            <asp:BoundField DataField="AdditionalInfo" HeaderText="Additional Info :" 
                SortExpression="AdditionalInfo" ShowHeader="False" >
            <HeaderStyle ForeColor="#B5C83C" />
            </asp:BoundField>
            <asp:BoundField DataField="PropertyAddress" HeaderText="Address :" 
                SortExpression="PropertyAddress">
            <HeaderStyle ForeColor="#B5C83C" />
            </asp:BoundField>
        </Fields>
    </asp:DetailsView>
 
   <div class="heading1">Added By :</div>
   
   
        <asp:DetailsView ID="dtvCustomerDetail" runat="server" Height="50px" 
            Width="454px" AutoGenerateRows="False" 
            DataSourceID="SqlDsCustomerDetail" BorderColor="Gray" 
        BorderStyle="Solid" BorderWidth="1px" CellPadding="3" CellSpacing="3" 
        GridLines="None">
            <Fields>
                <asp:BoundField DataField="Name" HeaderText="Name :" SortExpression="Name" >
                <HeaderStyle ForeColor="#B5C83C" Wrap="False" />
                <ItemStyle Width="150px" Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="PhoneNo" HeaderText="Phone No :" 
                    SortExpression="PhoneNo" >
                <HeaderStyle ForeColor="#B5C83C" Wrap="False" />
                <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="MobileNo" HeaderText="Mobile No :" 
                    SortExpression="MobileNo" >
                <HeaderStyle ForeColor="#B5C83C" Wrap="False" />
                <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="Address1" HeaderText="Address1 :" 
                    SortExpression="Address1" >
                <HeaderStyle ForeColor="#B5C83C" VerticalAlign="Top" Wrap="False" />
                <ItemStyle Width="300px" />
                </asp:BoundField>
                <asp:BoundField DataField="Address2" HeaderText="Address2 :" 
                    SortExpression="Address2" >
                <HeaderStyle ForeColor="#B5C83C" VerticalAlign="Top" Wrap="False" />
                <ItemStyle Width="300px" />
                </asp:BoundField>
            </Fields>
        </asp:DetailsView>
   
   
        <asp:SqlDataSource ID="SqlDsCustomerDetail" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
            
        SelectCommand="SELECT Name, PhoneNo, MobileNo, Address1, Address2 FROM Customer WHERE (UserId = @UserId)">
            <SelectParameters>
                <asp:Parameter Name="UserId" />
            </SelectParameters>
        </asp:SqlDataSource>
   
   
   <asp:Panel ID="panelBidding" runat="server">
   
         <table>
         <tr> 
             <td align="center" bgcolor="#CCCCCC" 
                 style="color: #000080" class="style2">Your Bid</td> <td bgcolor="#CCCCCC"></td> </tr>
         <tr>
         
         <td valign="top" class="style2">  
         <asp:DetailsView ID="vDtvBid" runat="server" Height="50px" Width="229px" 
                 AutoGenerateRows="False" DataKeyNames="BidID" DataSourceID="SqlDsBid" 
                 style="margin-right: 0px">
                 <Fields>
                     <asp:BoundField DataField="PropertyID" HeaderText="PropertyID" 
                         SortExpression="PropertyID" Visible="False" />
                     <asp:BoundField DataField="UserId" HeaderText="UserId" 
                         SortExpression="UserId" Visible="False" />
                     <asp:TemplateField HeaderText="Bid :" SortExpression="Bid">
                         <ItemTemplate>
                             <asp:Label ID="Label2" runat="server" 
                                 Text='<%# Bind("Bid") %>'></asp:Label>
                         </ItemTemplate>
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Bid") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <InsertItemTemplate>
                             <asp:TextBox ID="txtbidprice" runat="server" Text='<%# Bind("Bid") %>' 
                                 Height="19px" Width="74px"></asp:TextBox>
                             *<asp:CompareValidator ID="CompareValidator1" runat="server" 
                                 CssClass="ErrorMsgBox" ErrorMessage="Allowed: Numbers &gt; 0 " 
                                 Type="Integer" Operator="GreaterThan" ValueToCompare="0" 
                                 ControlToValidate="txtbidprice"></asp:CompareValidator>
                             <br />
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                 CssClass="ErrorMsgBox" ErrorMessage="Bid Price is Required" 
                                 ControlToValidate="txtbidprice"></asp:RequiredFieldValidator>
                         </InsertItemTemplate>
                         <HeaderStyle ForeColor="#BCC83C" VerticalAlign="Top" Wrap="False" />
                         <ItemStyle Wrap="False" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Date :" SortExpression="Date" 
                         InsertVisible="False">
                         <ItemTemplate>
                             <asp:Label ID="Label1" runat="server" 
                                 Text='<%# Bind("Date", "{0:dd-MMM-yyyy}") %>'></asp:Label>
                         </ItemTemplate>
                         <EditItemTemplate>
                             <asp:Label ID="Label1" runat="server" 
                                 Text='<%# Eval("Date", "{0:dd-MMM-yyyy}") %>'></asp:Label>
                         </EditItemTemplate>
                         <HeaderStyle ForeColor="#BCC83C" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Active :" InsertVisible="False" 
                         SortExpression="Active">
                         <HeaderStyle ForeColor="#BC583C" />
                         <ItemTemplate>
                             <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("Active") %>' 
                                 Enabled="False" />
                         </ItemTemplate>
                         <EditItemTemplate>
                             <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("Active") %>' />
                         </EditItemTemplate>
                         <InsertItemTemplate>
                             <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("Active") %>' />
                         </InsertItemTemplate>
                         <HeaderStyle ForeColor="#BCC83C" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Bid Win Status :" InsertVisible="False" 
                         SortExpression="BidWinStatus">
                         <ItemTemplate>
                             <asp:CheckBox ID="CheckBox5" runat="server" 
                                 Checked='<%# Bind("BidWinStatus") %>' Enabled="false" />
                         </ItemTemplate>
                         <HeaderStyle ForeColor="#BCC83C" />
                     </asp:TemplateField>
                     <asp:BoundField DataField="BidID" HeaderText="BidID" ReadOnly="True" 
                         SortExpression="BidID" Visible="False" />
                     <asp:TemplateField HeaderText="Command Buttons" ShowHeader="False">
                         <InsertItemTemplate>
                             <asp:Button ID="Button1" runat="server" CausesValidation="True" 
                                 CommandName="Insert" Text="Insert" />
                         </InsertItemTemplate>
                     </asp:TemplateField>
                 </Fields>
             </asp:DetailsView>
             
         </td>
         
         <td valign="top">
             

             <asp:DetailsView ID="dtvBidMaster" runat="server" AutoGenerateRows="False" 
                 DataKeyNames="BidID" DataSourceID="SqlDsBidMaster" Height="50px" Width="214px">
                 <Fields>
                     <asp:BoundField DataField="BidID" HeaderText="BidID" InsertVisible="False" 
                         ReadOnly="True" SortExpression="BidID" Visible="False" />
                     <asp:BoundField DataField="PropertyID" HeaderText="PropertyID" 
                         SortExpression="PropertyID" Visible="False" />
                     <asp:BoundField DataField="BidStarting" DataFormatString="{0:dd-MMM-yyyy}" 
                         HeaderText="Bid Starting :" SortExpression="BidStarting">
                     <HeaderStyle ForeColor="#BCC83C" />
                     </asp:BoundField>
                     <asp:BoundField DataField="BidEnding" DataFormatString="{0:dd-MMM-yyyy}" 
                         HeaderText="Bid Ending :" SortExpression="BidEnding">
                     <HeaderStyle ForeColor="#BCC83C" />
                     </asp:BoundField>
                 </Fields>
             </asp:DetailsView>

         </td>
         </tr>
         </table>
         </asp:Panel>

    <asp:Label ID="ShowInfoMessage" runat="server" Text="Label" 
        CssClass="InfoMsgBox" Visible="False"></asp:Label>
    <br />

        <asp:SqlDataSource ID="SqlDsBidMaster" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
        SelectCommand="SELECT BidID, PropertyID, BidStarting, BidEnding FROM BidMaster WHERE (Active = 1) AND (PropertyID = @PropertyID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DetailsView1" DefaultValue="" 
                    Name="PropertyID" PropertyName="SelectedValue" />
            </SelectParameters>
    </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDsBid" runat="server" 
             ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
             DeleteCommand="DELETE FROM [PropertyBid] WHERE [BidID] = @BidID" 
             InsertCommand="INSERT INTO PropertyBid(PropertyID, UserId, Bid, BidWinStatus, BidID) VALUES (@PropertyID, @UserId, @Bid, @BidWinStatus, @BidID)" 
             SelectCommand="SELECT PropertyID, UserId, Bid, Date, Active, BidWinStatus, BidID FROM PropertyBid WHERE (PropertyID = @PropertyID) AND (UserId = @UserId) AND (BidID = @BidID)" 
             
        
        
        UpdateCommand="UPDATE PropertyBid SET PropertyID = @PropertyID, UserId = @UserId, Bid = @Bid, Date = @Date, Active = @Active, BidWinStatus = @BidWinStatus WHERE (BidID = @BidID)">
             <DeleteParameters>
                 <asp:Parameter Name="BidID" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="UserId" />
                 <asp:Parameter Name="Bid" Type="Int32" />
                 <asp:Parameter Name="BidWinStatus" Type="Boolean" />
                 <asp:ControlParameter ControlID="DetailsView1" Name="PropertyID" 
                     PropertyName="SelectedValue" />
                 <asp:ControlParameter ControlID="dtvBidMaster" Name="BidID" 
                     PropertyName="SelectedValue" />
             </InsertParameters>
             <SelectParameters>
                 <asp:Parameter Name="UserId" />
                 <asp:Parameter Name="PropertyID" />
                 <asp:Parameter Name="BidID" />
             </SelectParameters>
             <UpdateParameters>
                 <asp:Parameter Name="PropertyID" Type="Int32" />
                 <asp:Parameter Name="UserId" />
                 <asp:Parameter Name="Bid" Type="Int32" />
                 <asp:Parameter DbType="Date" Name="Date" />
                 <asp:Parameter Name="Active" Type="Boolean" />
                 <asp:Parameter Name="BidWinStatus" Type="Boolean" />
                 <asp:Parameter Name="BidID" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>
   
    <asp:SqlDataSource ID="SqlDsPropertyDetail" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
        
        SelectCommand="SELECT Property.PropertyID, Property.PropertyDescription, Property.PropertyPrice,  CONVERT (VARCHAR(11), Property.DateAdded, 106) AS DateAdded, Property.TitleHeading, Property.SizeofProperty, City.CityName, AreaLocation.AreaLocName, PropertyMode.ModeName, Units.UnitName, Property.AdditionalInfo, Property.PropertyAddress, Property.IsNegotiable, Property.Image, State.StateName, PropertyImage.ImageData, PropertyType.TypeName, PropertyCatgeory.CategoryName FROM Property LEFT OUTER JOIN PropertyImage ON Property.PropertyID = PropertyImage.PropertyID LEFT OUTER JOIN State ON Property.StateID = State.StateID LEFT OUTER JOIN PropertyCatgeory ON Property.CategoryID = PropertyCatgeory.CategoryID LEFT OUTER JOIN AreaLocation ON Property.AreaLocID = AreaLocation.AreaLocID LEFT OUTER JOIN PropertyType ON Property.TypeID = PropertyType.TypeID LEFT OUTER JOIN PropertyMode ON Property.ModeID = PropertyMode.ModeID LEFT OUTER JOIN City ON Property.CityId = City.CityID LEFT OUTER JOIN Units ON Property.UnitID = Units.UnitID WHERE (Property.Active = 1) AND (AreaLocation.Active = 1) AND (PropertyMode.Active = 1) AND (Units.Active = 1) AND (Property.PropertyID = @PropertyID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="PropertyID" QueryStringField="ID" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    

    
    </asp:Content>

