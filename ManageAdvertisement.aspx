<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ManageAdvertisement.aspx.vb" Inherits="ManageAdvertisement" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h2>Manage Advertisement</h2>
    <asp:ScriptManager ID="ScriptManager2" runat="server">
    </asp:ScriptManager>
<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDsClients" 
    DataTextField="ClientName" DataValueField="ClientID" Width="200px" 
    AutoPostBack="True">
</asp:DropDownList>
<asp:SqlDataSource ID="SqlDsClients" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
    
        SelectCommand="SELECT ClientID, ClientName, ClientAddress, ClientPhone, ClientEmail, Active FROM Clients WHERE (ClientID IN (SELECT DISTINCT ClientID FROM Advertisement))">
</asp:SqlDataSource>

<table> 
<tr>
<td>

<asp:DetailsView ID="DetailsView1" runat="server" Height="400px" Width="358px" 
    AllowPaging="True" AutoGenerateRows="False" DataKeyNames="AdvertisementID" 
    DataSourceID="SqlDsAdd" GridLines="None" DefaultMode="Edit">
    <Fields>
        <asp:BoundField DataField="AdvertisementID" HeaderText="AdvertisementID" 
            InsertVisible="False" ReadOnly="True" SortExpression="AdvertisementID" 
            Visible="False" />
        <asp:BoundField DataField="AdvertisementTitle" HeaderText="Title :" 
            SortExpression="AdvertisementTitle" >
        <ControlStyle Width="250px" />
<ControlStyle Width="250px"></ControlStyle>

        <HeaderStyle ForeColor="#B5C83C" />
        </asp:BoundField>
        <asp:TemplateField HeaderText="Details :" SortExpression="AdvertisementDetail">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("AdvertisementDetail") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Height="150px" 
                    Text='<%# Bind("AdvertisementDetail") %>' TextMode="MultiLine" Width="250px"></asp:TextBox>
                *<br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox1" CssClass="ErrorMsgBox" 
                    ErrorMessage="Details are Required"></asp:RequiredFieldValidator>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" 
                    Text='<%# Bind("AdvertisementDetail") %>'></asp:TextBox>
            </InsertItemTemplate>
            <HeaderStyle ForeColor="#B5C83C" VerticalAlign="Top" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Valid From :" SortExpression="ValidFrom">
            <EditItemTemplate>
                

                <table>
                    <tr>
                    <td> 
                        <asp:TextBox ID="txtValidfromEdit" runat="server" 
                            Text='<%# Bind("ValidFrom" , "{0:dd-MMM-yy}") %>' Width="100px"></asp:TextBox></td>
                    <td width="130" nowrap="nowrap">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txtValidfromEdit" CssClass="ErrorMsgBox" 
                            ErrorMessage="Date is required"></asp:RequiredFieldValidator>
                        </td>
                    <td> 
                        <asp:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd-MMM-yy" 
                            TargetControlID="txtValidfromEdit">
                        </asp:CalendarExtender>
                    </td>
                    </tr>
                    </table>



            </EditItemTemplate>
            <InsertItemTemplate>
                            
            <table>
                    <tr>
                    <td> <asp:TextBox ID="txtValidfromInsert" runat="server" 
                            Text='<%# Bind("ValidFrom") %>' Width="100px"></asp:TextBox></td>
                    <td width="80" nowrap="nowrap">DD/MM/YY</td>
                    <td> <asp:CompareValidator ID="CompareValidator3" runat="server" 
                        ControlToValidate="txtValidfromInsert" ErrorMessage="Invalid Date" ForeColor="#FF3300" 
                        Operator="DataTypeCheck" Type="Date"></asp:CompareValidator> </td>
                    </tr>
                    </table>

            
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" 
                    Text='<%# Bind("ValidFrom") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle ForeColor="#B5C83C" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Valid To :" SortExpression="ValidTo">
            <EditItemTemplate>
                
            
            <table>
                    <tr>
                    <td> 
                        <asp:TextBox ID="txtValidToEdit" runat="server" Text='<%# Bind("ValidTo" , "{0:dd-MMM-yy}") %>' 
                            Width="100px"></asp:TextBox></td>
                    <td width="130" nowrap="nowrap">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="txtValidToEdit" CssClass="ErrorMsgBox" 
                            ErrorMessage="Date is Required"></asp:RequiredFieldValidator>
                        </td>
                    <td> 
                        <asp:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd-MMM-yy" 
                            TargetControlID="txtValidToEdit">
                        </asp:CalendarExtender>
                    </td>
                    </tr>
                    </table>
 
            
            
            
            </EditItemTemplate>
            <InsertItemTemplate>
            
            <table>
                    <tr>
                    <td> <asp:TextBox ID="txtValidToInsert" runat="server" 
                            Text='<%# Bind("ValidTo") %>' Width="100px"></asp:TextBox></td>
                    <td width="80" nowrap="nowrap">DD/MM/YY</td>
                    <td> <asp:CompareValidator ID="CompareValidator4" runat="server" 
                        ControlToValidate="txtValidToInsert" ErrorMessage="Invalid Date" ForeColor="#FF3300" 
                        Operator="DataTypeCheck" Type="Date"></asp:CompareValidator> </td>
                    </tr>
                    </table>
 
            
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" 
                    Text='<%# Bind("ValidTo") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle ForeColor="#B5C83C" />
        </asp:TemplateField>
        <asp:BoundField DataField="AdvertisementType" 
            HeaderText="Type" SortExpression="AdvertisementType" Visible="False" />
        <asp:CheckBoxField DataField="Active" HeaderText="Active :" 
            SortExpression="Active" >
        <HeaderStyle ForeColor="#B5C83C" />
        </asp:CheckBoxField>
        <asp:BoundField DataField="ClientID" HeaderText="ClientID" 
            SortExpression="ClientID" Visible="False" />
        <asp:CommandField ButtonType="Button" ShowEditButton="True" 
            ShowInsertButton="True" />
    </Fields>
</asp:DetailsView>

</td>
<td width="350" align="right" valign="top" style="margin-left: 10px">

<!-- show image cell -->
           
         <asp:DetailsView ID="DtvImage" runat="server" Height="50px" Width="95px" 
             AutoGenerateRows="False" DataKeyNames="AdvertisementID,ImageID" 
             DataSourceID="SqlDsImage" GridLines="None">
             <Fields>
                 <asp:BoundField DataField="AdvertisementID" HeaderText="AdvertisementID" 
                     SortExpression="AdvertisementID" ReadOnly="True" Visible="False" />
                 <asp:BoundField DataField="Title" HeaderText="Title :" 
                     SortExpression="Title" >
                 <HeaderStyle HorizontalAlign="Left" ForeColor="#B5C83C" />
                 <ItemStyle HorizontalAlign="Left" />
                 </asp:BoundField>
                 <asp:BoundField DataField="ImageID" HeaderText="ImageID" ReadOnly="True" 
                     SortExpression="ImageID" InsertVisible="False" Visible="False" />
                 <asp:TemplateField HeaderText="ImageData" ShowHeader="False">
                     <EditItemTemplate>
                         &nbsp;<br />
                     </EditItemTemplate>
                     <InsertItemTemplate>
                         <asp:FileUpload ID="UploadedFile" runat="server" Width="221px" />
                     </InsertItemTemplate>
                     <ItemTemplate>
                         <asp:Image ID="Image1" runat="server" Height="200px" 
                             ImageUrl='<%# Eval("AdvertisementID", "~/ShowAddPicture.aspx?pAdvertisementID={0}") %>' 
                             Width="300px" />
                         <br />
                     </ItemTemplate>
                 </asp:TemplateField>
             </Fields>
         </asp:DetailsView>     
           
  </td>
</tr>  

<tr><td>



  <asp:Label ID="ShowInfoMessage" runat="server" Text="Label" 
        CssClass="InfoMsgBox" Enabled="False" Visible="False"></asp:Label>
  


    </td>
<td align="right">
<div align="right">  <asp:Button ID="BbtnImage" runat="server" 
          Text="Add/Edit Image" Width="150px" 
    PostBackUrl="~/ManageAddImages.aspx" />  
  </div>  

</td></tr>
    </table>




<asp:SqlDataSource ID="SqlDsAdd" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
    DeleteCommand="DELETE FROM [Advertisement] WHERE [AdvertisementID] = @AdvertisementID" 
    InsertCommand="INSERT INTO [Advertisement] ([AdvertisementTitle], [AdvertisementDetail], [AdvertisementImage], [ValidFrom], [ValidTo], [AdvertisementType], [Active], [ClientID]) VALUES (@AdvertisementTitle, @AdvertisementDetail, @AdvertisementImage, @ValidFrom, @ValidTo, @AdvertisementType, @Active, @ClientID)" 
    SelectCommand="SELECT AdvertisementID, AdvertisementTitle, AdvertisementDetail, ValidFrom, ValidTo, AdvertisementType, Active, ClientID FROM Advertisement WHERE (ClientID = @ClientID)" 
    
    
        
        
        
        UpdateCommand="UPDATE Advertisement SET AdvertisementTitle = @AdvertisementTitle, AdvertisementDetail = @AdvertisementDetail, ValidFrom = @ValidFrom, ValidTo = @ValidTo, AdvertisementType = @AdvertisementType, Active = @Active, ClientID = @ClientID WHERE (AdvertisementID = @AdvertisementID)">
    <DeleteParameters>
        <asp:Parameter Name="AdvertisementID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="AdvertisementTitle" Type="String" />
        <asp:Parameter Name="AdvertisementDetail" Type="String" />
        <asp:Parameter Name="AdvertisementImage" Type="Object" />
        <asp:Parameter DbType="Date" Name="ValidFrom" />
        <asp:Parameter DbType="Date" Name="ValidTo" />
        <asp:Parameter Name="AdvertisementType" Type="String" />
        <asp:Parameter Name="Active" Type="Boolean" />
        <asp:ControlParameter ControlID="DropDownList1" Name="ClientID" 
            PropertyName="SelectedValue" Type="Int32" />
    </InsertParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="DropDownList1" Name="ClientID" 
            PropertyName="SelectedValue" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="AdvertisementTitle" Type="String" />
        <asp:Parameter Name="AdvertisementDetail" Type="String" />
        <asp:Parameter DbType="Date" Name="ValidFrom" />
        <asp:Parameter DbType="Date" Name="ValidTo" />
        <asp:Parameter Name="AdvertisementType" Type="String" />
        <asp:Parameter Name="Active" Type="Boolean" />
        <asp:ControlParameter ControlID="DropDownList1" Name="ClientID" 
            PropertyName="SelectedValue" Type="Int32" />
        <asp:Parameter Name="AdvertisementID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>

    
    <asp:SqlDataSource ID="SqlDsImage" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
        DeleteCommand="DELETE FROM [AddImage] WHERE [AdvertisementID] = @AdvertisementID AND [ImageID] = @ImageID" 
        InsertCommand="INSERT INTO [AddImage] ([AdvertisementID], [Title],[MIMEType], [ImageData]) VALUES (@AdvertisementID, @Title, @MIMEType, @ImageData)" 
        
        
        SelectCommand="SELECT [AdvertisementID], [Title], [ImageID] FROM [AddImage] WHERE ([AdvertisementID] = @AdvertisementID)">
        <DeleteParameters>
            <asp:Parameter Name="AdvertisementID" Type="Int32" />
            <asp:Parameter Name="ImageID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="MIMEType" />
            <asp:Parameter Name="ImageData" />
            <asp:Parameter Name="AdvertisementID" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DetailsView1" Name="AdvertisementID" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
           
    
     </asp:Content>

