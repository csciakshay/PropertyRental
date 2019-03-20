<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="forgetpass.aspx.vb" Inherits="forgetpass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<section class="sample-text-area">
		<div class="container">
            <h1>FORGET PASSWORD</h1>       
        <div class="section-top-border">
          <div class="row">
           <div class="col-lg-2 col-md-2"></div>
           <div class="col-lg-8 col-md-8">
                <asp:Label ID="Label1" runat="server" Text="User Name"></asp:Label> 
                <asp:TextBox ID="TextBox1" runat="server" class="single-input"></asp:TextBox>
                <br />
                <asp:Label ID="Label2" runat="server" Text="Registered Email"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server" class="single-input"></asp:TextBox>
                <br />
                <asp:Button ID="Button1" runat="server" Text="Send" class="primary-btn mt-20"  />
                
            </div> 
            <div class="col-lg-2 col-md-2"></div>
           </div>
        </div>
    </div>
    </section> 
</asp:Content>

