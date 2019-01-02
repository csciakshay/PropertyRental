<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ManageImages.aspx.vb" Inherits="AddImages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
<h2>Add Images</h2>
           
         <asp:DetailsView ID="DtvImage" runat="server" Height="50px" Width="500px" 
             AutoGenerateRows="False" DataKeyNames="PropertyID,ImageID" 
             DataSourceID="SqlDsImage" GridLines="None">
             <Fields>
                 <asp:BoundField DataField="PropertyID" HeaderText="PropertyID" 
                     SortExpression="PropertyID" ReadOnly="True" Visible="False" />
                 <asp:BoundField DataField="Title" HeaderText="Title :" 
                     SortExpression="Title" >
                 <HeaderStyle ForeColor="#B5C83C" Width="50px" />
                 </asp:BoundField>
                 <asp:BoundField DataField="ImageID" HeaderText="ImageID" ReadOnly="True" 
                     SortExpression="ImageID" InsertVisible="False" Visible="False" />
                 <asp:TemplateField>
                     <EditItemTemplate>
                         &nbsp;<br />
                     </EditItemTemplate>
                     <InsertItemTemplate>
                         <asp:FileUpload ID="UploadedFile" runat="server" Width="221px" />
                     </InsertItemTemplate>
                     <ItemTemplate>
                         <asp:Image ID="Image1" runat="server" Height="300px" 
                             ImageUrl='<%# Eval("PropertyID", "~/ShowPicture.aspx?pPropertyID={0}") %>' 
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
        DeleteCommand="DELETE FROM [PropertyImage] WHERE [PropertyID] = @PropertyID AND [ImageID] = @ImageID" 
        InsertCommand="INSERT INTO [PropertyImage] ([PropertyID], [Title],[MIMEType], [ImageData]) VALUES (@PropertyID, @Title, @MIMEType, @ImageData)" 
        
        SelectCommand="SELECT [PropertyID], [Title], [ImageID] FROM [PropertyImage] WHERE ([PropertyID] = @PropertyID)">
        <DeleteParameters>
            <asp:Parameter Name="PropertyID" Type="Int32" />
            <asp:Parameter Name="ImageID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="PropertyID" Type="Int32" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="MIMEType" />
            <asp:Parameter Name="ImageData" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="PropertyID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
           
    
     <asp:Label ID="ErrorMessage" runat="server" EnableViewState="False" 
        Visible="False" CssClass="ErrorMsgBox"></asp:Label>
           
    
     <br />
    
</asp:Content>

