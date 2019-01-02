<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ManageAddImages.aspx.vb" Inherits="AddImages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h2>Add Images</h2>
           
         <asp:DetailsView ID="DtvImage" runat="server" Height="67px" Width="125px" 
             AutoGenerateRows="False" DataKeyNames="AdvertisementID,ImageID" 
             DataSourceID="SqlDsImage" GridLines="None">
             <Fields>
                 <asp:BoundField DataField="AdvertisementID" HeaderText="AdvertisementID" 
                     SortExpression="AdvertisementID" ReadOnly="True" Visible="False" />
                 <asp:BoundField DataField="Title" HeaderText="Title" 
                     SortExpression="Title" />
                 <asp:BoundField DataField="ImageID" HeaderText="ImageID" ReadOnly="True" 
                     SortExpression="ImageID" InsertVisible="False" Visible="False" />
                 <asp:TemplateField>
                     <EditItemTemplate>
                         &nbsp;<br />
                     </EditItemTemplate>
                     <InsertItemTemplate>
                         <asp:FileUpload ID="UploadedFile" runat="server" Width="221px" />
                         
                         <br />
                         
                     </InsertItemTemplate>
                     <ItemTemplate>
                         <asp:Image ID="Image1" runat="server" Height="300px" 
                             ImageUrl='<%# Eval("AdvertisementID", "~/ShowAddPicture.aspx?pAdvertisementID={0}") %>' 
                             Width="400px" />
                         <br />
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField ShowHeader="False">
                     <EditItemTemplate>
                         <asp:Button ID="Button1" runat="server" CausesValidation="True" 
                             CommandName="Update" Text="Update" />
                         &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                             CommandName="Cancel" Text="Cancel" />
                     </EditItemTemplate>
                     <InsertItemTemplate>
                         <asp:Button ID="btnInsert" runat="server" CausesValidation="True" 
                             CommandName="Insert" Text="Insert" />
                         &nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" 
                             CommandName="Cancel" Text="Cancel" onclick="btnCancel_Click1" />
                     </InsertItemTemplate>
                     <ItemTemplate>
                         <asp:Button ID="Button3" runat="server" CausesValidation="False" 
                             CommandName="Delete" Text="Delete" />
                         <asp:Button ID="btnCancel1" runat="server" onclick="btnCancel1_Click" 
                             Text="Cancel" />
                         <asp:Button ID="btnBack" runat="server" onclick="btnBack_Click" Text="Back" />
                     </ItemTemplate>
                 </asp:TemplateField>
             </Fields>
         </asp:DetailsView>     
           
    
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
            <asp:Parameter Name="AdvertisementID" />
        </SelectParameters>
    </asp:SqlDataSource>
           
    
     <asp:Label ID="ErrorMessage" runat="server" EnableViewState="False" 
        Visible="False" CssClass="InfoMsgBox"></asp:Label>
           
    
     <br />

</asp:Content>

