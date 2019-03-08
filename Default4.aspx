<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default4.aspx.vb" Inherits="Default4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <section class="sample-text-area">
				<div class="container">

<div class="section-top-border">

   <div class="row">
    <div class="col-lg-4 col-md-4">
    <asp:Label ID="Label1" runat="server" Text="Property Type"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" class="single-input"></asp:TextBox>
        <br />
    <asp:Label ID="Label2" runat="server" Text="Title"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" class="single-input"></asp:TextBox>
        <br />
    <asp:Label ID="Label3" runat="server" Text="Decrpsetion"></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server" class="single-input"></asp:TextBox>
    </div> 
    
    <div class="col-lg-4 col-md-4">
    <asp:Label ID="Label4" runat="server" Text="Address"></asp:Label>
        <asp:TextBox ID="TextBox4" runat="server" class="single-input"></asp:TextBox>
        <br />
    <asp:Label ID="Label5" runat="server" Text="Location"></asp:Label>
        <asp:TextBox ID="TextBox5" runat="server" class="single-input"></asp:TextBox>
        <br />
    <asp:Label ID="Label6" runat="server" Text="City"></asp:Label>
        <asp:TextBox ID="TextBox6" runat="server" class="single-input"></asp:TextBox>
    </div> 

    <div class="col-lg-4 col-md-4">
    <asp:Label ID="Label7" runat="server" Text="Property Size"></asp:Label>
        <asp:TextBox ID="TextBox7" runat="server" class="single-input"></asp:TextBox>
        <br />
    <asp:Label ID="Label8" runat="server" Text="Prices"></asp:Label>
        <asp:TextBox ID="TextBox8" runat="server" class="single-input"></asp:TextBox>
        <br />
        
        <asp:Label ID="Label9" runat="server" Text="Id"></asp:Label>
        <asp:TextBox ID="TextBox9" runat="server" class="single-input"></asp:TextBox>
        <br />
        <br />
        <br />
    <asp:CheckBox ID="CheckBox1" runat="server" Text="Price check" />
    </div> 
</div>
    <asp:Button ID="Button1" runat="server" Text="Submit" 
        class="primary-btn mt-20"/>
</div>
</section>
</asp:Content>

