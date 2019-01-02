<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AddAdvertisements.aspx.vb" Inherits="AddAdvertisements" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h2>Add Advertisements</h2>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<asp:DetailsView ID="DetailsView1" runat="server" Height="350px" Width="483px" 
    AutoGenerateRows="False" DataKeyNames="AdvertisementID" 
    DataSourceID="SqlDsAddAdvertisement" DefaultMode="Insert" GridLines="None">
    <Fields>
        <asp:BoundField DataField="AdvertisementID" HeaderText="AdvertisementID" 
            InsertVisible="False" ReadOnly="True" SortExpression="AdvertisementID" />
        <asp:TemplateField HeaderText="Client :" SortExpression="ClientID">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ClientID") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ClientID") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDsClients" 
                    DataTextField="ClientName" DataValueField="ClientID" 
                    SelectedValue='<%# Bind("ClientID") %>' Width="200px">
                </asp:DropDownList>
            </InsertItemTemplate>
            <HeaderStyle ForeColor="#B5C83C" />
        </asp:TemplateField>
        <asp:BoundField DataField="AdvertisementTitle" HeaderText="Title :" 
            SortExpression="AdvertisementTitle" >
        <ControlStyle Width="250px" />
        <HeaderStyle ForeColor="#B5C83C" />
        </asp:BoundField>
        <asp:TemplateField HeaderText="Detail :" SortExpression="AdvertisementDetail">
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("AdvertisementDetail") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" 
                    Text='<%# Bind("AdvertisementDetail") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Height="150px" 
                    Text='<%# Bind("AdvertisementDetail") %>' TextMode="MultiLine" Width="250px"></asp:TextBox>
                *<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox2" CssClass="ErrorMsgBox" 
                    ErrorMessage="Details are Required"></asp:RequiredFieldValidator>
            </InsertItemTemplate>
            <FooterStyle ForeColor="#B5C83C" VerticalAlign="Top" />
            <HeaderStyle ForeColor="#B5C83C" VerticalAlign="Top" />
            <ItemStyle VerticalAlign="Top" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Valid From :" SortExpression="ValidFrom">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ValidFrom") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                
                <table>
                    <tr>
                    <td> 
                        <asp:TextBox ID="txtValidFromInsert" runat="server" 
                            Text='<%# Bind("ValidFrom") %>' Width="100px"></asp:TextBox></td>
                    <td width="130" nowrap="nowrap">*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txtValidFromInsert" CssClass="ErrorMsgBox" 
                            ErrorMessage="Date is Required"></asp:RequiredFieldValidator>
                        </td>
                    <td> 
                        <asp:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd-MMM-yy" 
                            TargetControlID="txtValidFromInsert">
                        </asp:CalendarExtender>
                    </td>
                    </tr>
                    </table>
                
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("ValidFrom") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle ForeColor="#B5C83C" Wrap="False" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Valid To :" SortExpression="ValidTo">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ValidTo") %>'></asp:TextBox>
            </EditItemTemplate>
            <InsertItemTemplate>
                <table>
                    <tr>
                    <td> 
                        <asp:TextBox ID="txtValidToInsert" runat="server" 
                            Text='<%# Bind("ValidTo") %>' Width="100px"></asp:TextBox></td>
                    <td width="130" nowrap="nowrap">
                        *<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="txtValidToInsert" CssClass="ErrorMsgBox" 
                            ErrorMessage="Date is Required"></asp:RequiredFieldValidator>
                        </td>
                    <td> 
                        <asp:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd-MMM-yy" 
                            TargetControlID="txtValidToInsert">
                        </asp:CalendarExtender>
                    </td>
                    </tr>
                    </table>
                
            
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label4" runat="server" Text='<%# Bind("ValidTo") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle ForeColor="#B5C83C" Wrap="False" />
        </asp:TemplateField>
        <asp:BoundField DataField="AdvertisementType" HeaderText="Type" 
            SortExpression="AdvertisementType" Visible="False" />
        <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
    </Fields>
</asp:DetailsView>


<asp:SqlDataSource ID="SqlDsAddAdvertisement" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
    DeleteCommand="DELETE FROM [Advertisement] WHERE [AdvertisementID] = @AdvertisementID" 
    InsertCommand="INSERT INTO Advertisement(AdvertisementTitle, AdvertisementDetail, ValidFrom, ValidTo, AdvertisementType, ClientID) VALUES (@AdvertisementTitle, @AdvertisementDetail, @ValidFrom, @ValidTo, @AdvertisementType, @ClientID)" 
    SelectCommand="SELECT [AdvertisementID], [AdvertisementTitle], [AdvertisementDetail], [AdvertisementImage], [ValidFrom], [ValidTo], [AdvertisementType], [ClientID] FROM [Advertisement]" 
    
        UpdateCommand="UPDATE [Advertisement] SET [AdvertisementTitle] = @AdvertisementTitle, [AdvertisementDetail] = @AdvertisementDetail, [AdvertisementImage] = @AdvertisementImage, [ValidFrom] = @ValidFrom, [ValidTo] = @ValidTo, [AdvertisementType] = @AdvertisementType, [ClientID] = @ClientID WHERE [AdvertisementID] = @AdvertisementID">
    <DeleteParameters>
        <asp:Parameter Name="AdvertisementID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="AdvertisementTitle" Type="String" />
        <asp:Parameter Name="AdvertisementDetail" Type="String" />
        <asp:Parameter DbType="Date" Name="ValidFrom" />
        <asp:Parameter DbType="Date" Name="ValidTo" />
        <asp:Parameter Name="AdvertisementType" Type="String" />
        <asp:Parameter Name="ClientID" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="AdvertisementTitle" Type="String" />
        <asp:Parameter Name="AdvertisementDetail" Type="String" />
        <asp:Parameter Name="AdvertisementImage" Type="Object" />
        <asp:Parameter DbType="Date" Name="ValidFrom" />
        <asp:Parameter DbType="Date" Name="ValidTo" />
        <asp:Parameter Name="AdvertisementType" Type="String" />
        <asp:Parameter Name="ClientID" Type="Int32" />
        <asp:Parameter Name="AdvertisementID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>


<asp:SqlDataSource ID="SqlDsClients" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
    SelectCommand="SELECT [ClientID], [ClientName], [ClientAddress], [ClientPhone], [ClientEmail], [Active] FROM [Clients]">
</asp:SqlDataSource>



  <asp:Label ID="ShowInfoMessage" runat="server" Text="Label" 
        CssClass="InfoMsgBox" Enabled="False" Visible="False"></asp:Label>
  


</asp:Content>

