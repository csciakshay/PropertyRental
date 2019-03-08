<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="city.aspx.vb" Inherits="city" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <section class="sample-text-area">
		<div class="container">
            <h1>CITY REGISTRATION</h1>       
        <div class="section-top-border">
         <div class="row">
         <div class="col-lg-2 col-md-2"></div>
         <div class="col-lg-6 col-md-6">
          <asp:Label ID="Label3" runat="server" Text="Select City"></asp:Label> 
            <asp:DropDownList ID="DropDownList1" runat="server" class="form-input" 
                 DataSourceID="SqlDataSource1" DataTextField="cityName" DataValueField="cityId"></asp:DropDownList>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                 SelectCommand="SELECT * FROM [cityMaster]"></asp:SqlDataSource>
         </div>
          <div class="col-lg-2 col-md-2">
                <asp:Button ID="Button4" runat="server" Text="Search" class="primary-btn mt-20"  />
         </div>
         <div class="col-lg-2 col-md-2"></div>
         </div>
         <div class="row">
           <div class="col-lg-2 col-md-2"></div>
           <div class="col-lg-8 col-md-8">
                <asp:Label ID="Label1" runat="server" Text="City id"></asp:Label> 
                <asp:TextBox ID="TextBox1" runat="server" class="single-input"></asp:TextBox>
                <br />
                <asp:Label ID="Label2" runat="server" Text="City name"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server" class="single-input"></asp:TextBox>
                <br />
                <asp:Button ID="Button1" runat="server" Text="Save" class="primary-btn mt-20"  />
                <asp:Button ID="Button3" runat="server" Text="Update" class="primary-btn mt-20"  />
                <asp:Button ID="Button2" runat="server" Text="Reset" class="primary-btn mt-20"  />
            </div> 
            <div class="col-lg-2 col-md-2"></div>
           </div>
        </div>
    </div>
    </section>      
</asp:Content>

