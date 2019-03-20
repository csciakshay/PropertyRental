<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="propertyDtl.aspx.vb" Inherits="propertyDtl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="sample-text-area">
<div class="container">
            <h1>PROPERTY DETAILS</h1>       
<div class="section-top-border">
<div class="row">
 <asp:Label ID="Label1" runat="server" Text="Property images:" Font-Bold="True" 
        ForeColor="#000066"></asp:Label>
                    <asp:DataList ID="DataList1" runat="server" CellPadding="4" 
                             ForeColor="#333333" BorderColor="Aqua" 
                            BorderWidth="1px" GridLines="Vertical" RepeatColumns="4" 
                            RepeatDirection="Horizontal">
                        <AlternatingItemStyle BackColor="White" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <ItemStyle BackColor="#EFF3FB" />
                        <ItemTemplate>
                          
                            <asp:Image ID="imagesLabel" runat="server" ImageUrl ='<%# Eval("images") %>' Width="100" Height="100" />
                            <br />
                            <br />
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        </asp:DataList>
                        </div>
                        <br />
                        <div class="row">
<asp:DetailsView ID="DetailsView1" runat="server" Width="767px" Height="50px" CellPadding="4" 
                                ForeColor="#333333" GridLines="None" AutoGenerateRows="False">
    <AlternatingRowStyle BackColor="White" />
    <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
    <EditRowStyle BackColor="#7C6F57" />
    <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
    <Fields>
        <asp:BoundField DataField="id" HeaderText="Property Id" />
        <asp:BoundField DataField="ptype" HeaderText="Propert Type" />
        <asp:BoundField DataField="title" HeaderText="Title" />
        <asp:BoundField DataField="description" HeaderText="Description" />
        <asp:BoundField DataField="address" HeaderText="Address" />
        <asp:BoundField DataField="city" HeaderText="City" />
        <asp:BoundField DataField="state" HeaderText="State" />
        <asp:BoundField DataField="location" HeaderText="Location" />
        <asp:BoundField DataField="pincode" HeaderText="Pin code" />
        <asp:BoundField DataField="aminities" HeaderText="Aminities" />
        <asp:BoundField DataField="readytomove" HeaderText="Ready To Move" />
        <asp:BoundField DataField="createdate" HeaderText="Register on" />
        <asp:BoundField DataField="carpatarea" HeaderText="Carpet Area" />
        <asp:BoundField DataField="builtuparea" HeaderText="Builtup Area" />
        <asp:BoundField DataField="price" HeaderText="Price" />
        <asp:BoundField DataField="name" HeaderText="Register By" />
        <asp:BoundField DataField="pricenego" HeaderText="Price Negociation" />
        <asp:BoundField DataField="views" HeaderText="No of Views" />
    </Fields>
    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#E3EAEB" />
                            </asp:DetailsView>
</div>
</div>
</div>
</section>
</asp:Content>

