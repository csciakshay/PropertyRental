<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="propertyReport.aspx.vb" Inherits="propertyReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="sample-text-area">
<div class="container">
            <h1>PROPERTY REPORT</h1>       
<div class="section-top-border">
<div class="row">
<div class="col-lg-2 col-md-2"></div>
<div class="col-lg-6 col-md-6">
<asp:TextBox ID="TextBox9" runat="server" placeholder="Search" class="single-input"></asp:TextBox>
</div>
<div class="col-lg-2 col-md-2">
<asp:Button ID="Button5" runat="server" Text="Search" class="primary-btn mt-20" CausesValidation ="false"/>
</div>
<div class="col-lg-2 col-md-2"></div>
</div>
<div class="row">
<div class="col-lg-12 col-md-12">
<asp:Button ID="btnExport" runat="server" Text="Export" OnClick = "ExportExcel" class="primary-btn mt-20"/><br />
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" 
        ForeColor="#333333" GridLines="None" OnPageIndexChanging="OnPageIndexChanging">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" 
            SortExpression="id" />
        <asp:BoundField DataField="ptype" HeaderText="ptype" SortExpression="ptype" />
        <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
        <asp:BoundField DataField="description" HeaderText="description" 
            SortExpression="description" />
        <asp:BoundField DataField="address" HeaderText="address" 
            SortExpression="address" />
        <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
        <asp:BoundField DataField="state" HeaderText="state" SortExpression="state" />
        <asp:BoundField DataField="location" HeaderText="location" 
            SortExpression="location" />
        <asp:BoundField DataField="pincode" HeaderText="pincode" 
            SortExpression="pincode" />
        <asp:BoundField DataField="psold" HeaderText="psold" SortExpression="psold" />
        <asp:BoundField DataField="aminities" HeaderText="aminities" 
            SortExpression="aminities" />
        <asp:BoundField DataField="readytomove" HeaderText="readytomove" 
            SortExpression="readytomove" />
        <asp:BoundField DataField="createdate" HeaderText="createdate" 
            SortExpression="createdate" />
        <asp:BoundField DataField="carpatarea" HeaderText="carpatarea" 
            SortExpression="carpatarea" />
        <asp:BoundField DataField="builtuparea" HeaderText="builtuparea" 
            SortExpression="builtuparea" />
        <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
        <asp:BoundField DataField="registerby" HeaderText="registerby" 
            SortExpression="registerby" />
        <asp:BoundField DataField="pricenego" HeaderText="pricenego" 
            SortExpression="pricenego" />
        <asp:BoundField DataField="uomba" HeaderText="uomba" SortExpression="uomba" />
        <asp:BoundField DataField="uomca" HeaderText="uomca" SortExpression="uomca" />
        <asp:BoundField DataField="views" HeaderText="views" SortExpression="views" />
    </Columns>
    <EditRowStyle BackColor="#7C6F57" />
    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#E3EAEB" />
    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#F8FAFA" />
    <SortedAscendingHeaderStyle BackColor="#246B61" />
    <SortedDescendingCellStyle BackColor="#D4DFE1" />
    <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    
</div>

</div>
</div>
</div>
</section>
</asp:Content>

