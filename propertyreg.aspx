<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="propertyreg.aspx.vb" Inherits="propertyreg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<section class="sample-text-area">
<div class="container">
            <h1>PROPERTY REGISTRATION</h1>       
<div class="section-top-border">
<div class="row">
<div class="col-lg-2 col-md-2"></div>
<div class="col-lg-6 col-md-6">
<asp:DropDownList ID="DropDownList6" runat="server" class="single-input"></asp:DropDownList>
<%--<asp:TextBox ID="TextBox9" runat="server" placeholder="Search" class="single-input"></asp:TextBox>--%>
</div>
<div class="col-lg-2 col-md-2">
<asp:Button ID="Button5" runat="server" Text="Search" class="primary-btn mt-20" CausesValidation ="false"/>
</div>
<div class="col-lg-2 col-md-2"></div>
</div><hr />
        <div class="row">
            <div class="col-lg-4 col-md-4">
            <asp:Label ID="Label1" Font-Size ="Medium"  runat="server" Text="Property Type"></asp:Label>
                                 <asp:DropDownList ID="DropDownList1" runat="server">
                                     <asp:ListItem>Select Type</asp:ListItem>
                                     <asp:ListItem>Apartment</asp:ListItem>
                                     <asp:ListItem>Villa</asp:ListItem>
                                     <asp:ListItem>Ploats</asp:ListItem>
                                     <asp:ListItem>Builder Floors</asp:ListItem>
                </asp:DropDownList>
								 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="DropDownList1" ErrorMessage="Provide property type" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </div>
            <div class="col-lg-4 col-md-4">
                <asp:Label ID="Label2" Font-Size ="Medium"  runat="server" Text="Property Title"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" class="single-input"></asp:TextBox>
                <asp:TextBox ID="TextBox10" runat="server" class="single-input" Visible="False"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="TextBox1" ErrorMessage="Enter Title" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </div>
            <div class="col-lg-4 col-md-4">
                <asp:Label ID="Label3" Font-Size ="Medium"  runat="server" Text="Property Details"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server" class="single-input" Rows="2"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                        ControlToValidate="TextBox2" ErrorMessage="Enter Details" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </div>
            <div class="col-lg-4 col-md-4">
                <asp:Label ID="Label4" Font-Size ="Medium"  runat="server" Text="Property Address"></asp:Label>
                <asp:TextBox ID="TextBox3" runat="server" class="single-input" Rows="2"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                        ControlToValidate="TextBox3" ErrorMessage="Enter Address" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </div>
            <div class="col-lg-4 col-md-4">
                <asp:Label ID="Label5" Font-Size ="Medium" runat="server" Text="City"></asp:Label>
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" 
                                       DataTextField="cityName" DataValueField="cityId"></asp:DropDownList>
                                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                       ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                                       SelectCommand="SELECT * FROM [cityMaster]"></asp:SqlDataSource>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                        ControlToValidate="DropDownList2" ErrorMessage="Enter city name" 
                                    ForeColor="#FF3300"></asp:RequiredFieldValidator> 
            </div>
            <div class="col-lg-4 col-md-4">
                <asp:Label ID="Label6" Font-Size ="Medium" runat="server" Text="State"></asp:Label>
                
                 <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" 
                                    DataTextField="stateName" DataValueField="stateId"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                                    SelectCommand="SELECT * FROM [stateMaster]"></asp:SqlDataSource>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                        ControlToValidate="DropDownList3" ErrorMessage="Enter State name" 
                                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </div>
            <div class="col-lg-4 col-md-4">
                <asp:Label ID="Label7" Font-Size ="Medium"  runat="server" Text="Property Location"></asp:Label>
                <asp:TextBox ID="TextBox4" runat="server" class="single-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                        ControlToValidate="TextBox4" ErrorMessage="Enter Location" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </div>
            <div class="col-lg-4 col-md-4">
                <asp:Label ID="Label8" Font-Size ="Medium"  runat="server" Text="Pincode"></asp:Label>
                <asp:TextBox ID="TextBox5" runat="server" class="single-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                        ControlToValidate="TextBox5" ErrorMessage="Enter pincode" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </div>
            <div class="col-lg-2 col-md-2">
                <asp:Label ID="Label9" Font-Size ="Medium"  runat="server" Text="Buildup Area"></asp:Label>
                <asp:TextBox ID="TextBox6" runat="server" class="single-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                        ControlToValidate="TextBox6" ErrorMessage="Enter Buildup Area" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </div>
                <div class="col-lg-2 col-md-2">
                <asp:DropDownList ID="DropDownList5" runat="server">
                    <asp:ListItem>Sqr.Ft</asp:ListItem>
                    <asp:ListItem>Meter</asp:ListItem>
                    <asp:ListItem>Feet</asp:ListItem>
                    <asp:ListItem>Sqr.meter</asp:ListItem>
                </asp:DropDownList>
                
            </div>
            <div class="col-lg-2 col-md-2">
                <asp:Label ID="Label10" Font-Size ="Medium"  runat="server" Text="Carpat Area"></asp:Label>
                <asp:TextBox ID="TextBox7" runat="server" class="single-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                        ControlToValidate="TextBox7" ErrorMessage="Enter Carpat Area" ForeColor="#FF3300"></asp:RequiredFieldValidator>
             </div>
             <div class="col-lg-2 col-md-2">
                <asp:DropDownList ID="DropDownList4" runat="server" class="single-input">
                    <asp:ListItem>Sqr.Ft</asp:ListItem>
                    <asp:ListItem>Meter</asp:ListItem>
                    <asp:ListItem>Feet</asp:ListItem>
                    <asp:ListItem>Sqr.meter</asp:ListItem>
                </asp:DropDownList>
                
            </div>
            <div class="col-lg-4 col-md-4">
                <asp:Label ID="Label11" Font-Size ="Medium"  runat="server" Text="Price"></asp:Label>
                <asp:TextBox ID="TextBox8" runat="server" class="single-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                        ControlToValidate="TextBox8" ErrorMessage="Enter price" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </div>
            <div class="col-lg-4 col-md-4">
            <asp:Label ID="Label12" Font-Size ="Medium"  runat="server" Text="Aminities"></asp:Label><br />
                <asp:CheckBox ID="CheckBox3" runat="server" Text ="Lifts"></asp:CheckBox>
                <asp:CheckBox ID="CheckBox4" runat="server" Text ="Park"></asp:CheckBox>
                <asp:CheckBox ID="CheckBox5" runat="server" Text ="Visitor Parking"></asp:CheckBox>
                <asp:CheckBox ID="CheckBox6" runat="server" Text ="Inter Com"></asp:CheckBox>
                <asp:CheckBox ID="CheckBox7" runat="server" Text ="Water Storage"></asp:CheckBox>
                <asp:CheckBox ID="CheckBox8" runat="server" Text ="Security"></asp:CheckBox>
                <asp:CheckBox ID="CheckBox9" runat="server" Text ="Fire Aleram"></asp:CheckBox>
            </div>
             <div class="col-lg-4 col-md-4">
                <asp:CheckBox ID="CheckBox1" runat="server" Text ="Price Negotiable"></asp:CheckBox>
                <asp:CheckBox ID="CheckBox2" runat="server" Text ="Sold Out"></asp:CheckBox>
             </div>
             <div class="col-lg-4 col-md-4">
                <asp:CheckBox ID="CheckBox10" runat="server" Text ="Ready to Move"></asp:CheckBox>
              </div>
              <div class="col-lg-4 col-md-4">
                    <asp:FileUpload ID="FileUpload1" runat="server" accept="image/png image/jpeg image/gif" AllowMultiple="true"></asp:FileUpload>
                    <asp:Image ID="Image1" runat="server" Width="50" Height="50"></asp:Image>
              </div>
        </div>
    <div class="row">
        <div class="col-lg-2 col-md-2"> </div>
		<div class="col-lg-8 col-md-8">
            <asp:Button ID="Button1" runat="server" Text="Submit" class="primary-btn mt-20" />
            <asp:Button ID="Button2" runat="server" Text="Update" class="primary-btn mt-20"/>
            <asp:Button ID="Button3" runat="server" Text="Reset" class="primary-btn mt-20" CausesValidation="false"/>
                                
        </div>
        <div class="col-lg-2 col-md-2"></div>
     </div>
</div>
</div>
</section>
</asp:Content>

