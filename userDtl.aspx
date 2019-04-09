<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="userDtl.aspx.vb" Inherits="userDtl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<section class="sample-text-area">
<div class="container">
            <h1>CONTACT DETAILS</h1>       
<div class="section-top-border">
<div class="row">
<asp:DetailsView ID="DetailsView1" runat="server" Width="767px" Height="50px" CellPadding="4" 
                                ForeColor="#333333" GridLines="None" 
        AutoGenerateRows="False">
    <AlternatingRowStyle BackColor="White" />
    <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
    <EditRowStyle BackColor="#7C6F57" />
    <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
    <Fields>
        <asp:ImageField DataImageUrlField="imagepath" HeaderText="Photo">
            <ControlStyle Height="50px" Width="50px" />
        </asp:ImageField>
        <asp:BoundField DataField="name" HeaderText="Name" />
        <asp:BoundField DataField="gender" HeaderText="Gender" />
        <asp:BoundField DataField="address" HeaderText="Address" />
        <asp:BoundField DataField="city" HeaderText="City" />
        <asp:BoundField DataField="state" HeaderText="State" />
        <asp:BoundField DataField="pincode" HeaderText="PinCode" />
        <asp:BoundField DataField="email" HeaderText="Email" />
        <asp:BoundField DataField="mobileno" HeaderText="Mobile No" />
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

