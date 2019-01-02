<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ShowAddDetail.aspx.vb" Inherits="ShowAddDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    


    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="700px" 
        AutoGenerateRows="False" DataSourceID="SqlDsAddDetail" GridLines="None">
        <Fields>
            <asp:BoundField DataField="AdvertisementTitle" HeaderText="Title :" 
                SortExpression="AdvertisementTitle" ShowHeader="False" >
            <ItemStyle CssClass="heading1" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Detail :" ShowHeader="False" 
                SortExpression="AdvertisementDetail">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" 
                        Text='<%# Bind("AdvertisementDetail") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" 
                        Text='<%# Bind("AdvertisementDetail") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                <table>
                <tr> <td valign="top">
                     <asp:Label ID="Label1" runat="server" Text='<%# Bind("AdvertisementDetail") %>' 
                         CssClass="justfytext"></asp:Label></td>
                <td valign="top">
                      <asp:Image ID="Image1" runat="server" Height="300px" 
                             ImageUrl='<%# Eval("AdvertisementID", "~/ShowAddPicture.aspx?pAdvertisementID={0}") %>' 
                             Width="400px" />
                </td></tr>
                </table>

                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>



    <asp:SqlDataSource ID="SqlDsAddDetail" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
        
        SelectCommand="SELECT AdvertisementTitle, AdvertisementDetail, AdvertisementID FROM Advertisement WHERE (AdvertisementID = @AdvertisementID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="AdvertisementID" 
                QueryStringField="AdvertisementID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

