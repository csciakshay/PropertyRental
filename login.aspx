<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="sample-text-area">
<div class="container">
            <h1>LOGIN</h1>       
<div class="section-top-border">
<div class="row">
<div class="col-lg-2 col-md-2"></div>
<div class="col-lg-8 col-md-8">
<asp:Label ID="Label1" runat="server" Text="User Name" ></asp:Label>
<asp:TextBox ID="TextBox1" runat="server" class="single-input"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter UserName" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
</div>
<div class="col-lg-2 col-md-2"></div>
<div class="col-lg-2 col-md-2"></div>
<div class="col-lg-8 col-md-8">
<asp:Label ID="Label2" runat="server" Text="Password" ></asp:Label>
<asp:TextBox ID="TextBox2" runat="server" class="single-input" TextMode ="Password"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Password" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
</div>
<div class="col-lg-2 col-md-2"></div>
<div class="col-lg-2 col-md-2"></div>
<div class="col-lg-8 col-md-8">
<asp:Button ID="Button1" runat="server" Text="Login" class="primary-btn mt-1"></asp:Button>
<asp:Button ID="Button2" runat="server" Text="Cancle" class="primary-btn mt-1" CausesValidation ="false"></asp:Button>
</div>
</div>
<div class="row">
<div class="col-lg-2 col-md-2"></div>
<div class="col-lg-6 col-md-6"><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/userreg.aspx">Register!</asp:HyperLink></div>
<div class="col-lg-4 col-md-4">
<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/forgetpass.aspx">Forget Password!</asp:HyperLink>
</div>

</div>
</div>
</section>

</asp:Content>

