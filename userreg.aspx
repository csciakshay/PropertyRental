<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="userreg.aspx.vb" Inherits="Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
           
<section class="sample-text-area">
<div class="container">
            <h1>USER REGISTRATION</h1>       
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
</div><hr />
        <div class="row">
            <div class="col-lg-4 col-md-4">
					            <asp:Label ID="Label1" Font-Size ="Medium"  runat="server" Text="Name"></asp:Label>
                                 <asp:TextBox ID="TextBox1" runat="server" class="single-input"></asp:TextBox>
								 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="TextBox1" ErrorMessage="Enter name" ForeColor="#FF3300"></asp:RequiredFieldValidator>					
             </div> 
             <div class="col-lg-4 col-md-4">
              <asp:Label ID="Label7" runat="server" Text="Gendre"></asp:Label>
                                <br />
                                    <asp:RadioButton ID="RadioButton1" GroupName = "gender" runat="server" Text="Male" />
                                    <asp:RadioButton ID="RadioButton2" GroupName = "gender" runat="server" Text="Female" />
                 
                 </div>
             <div class="col-lg-4 col-md-4">             
                                <asp:Label ID="Label6" Font-Size ="Medium" runat="server" Text="E-mail"></asp:Label>
                                <asp:TextBox ID="TextBox7" runat="server" class="single-input"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                        ControlToValidate="TextBox7" ErrorMessage="Enter E-mail" 
                                    ForeColor="Red"></asp:RequiredFieldValidator>
             </div>
             <div class="col-lg-4 col-md-4">                      
                                   <asp:Label ID="Label11" Font-Size ="Medium" runat="server" Text="City"></asp:Label>
                 <%--<asp:TextBox ID="TextBox8" runat="server" class="single-input"></asp:TextBox>--%>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" 
                                       DataTextField="cityName" DataValueField="cityId"></asp:DropDownList>
                                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                       ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                                       SelectCommand="SELECT * FROM [cityMaster]"></asp:SqlDataSource>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                        ControlToValidate="DropDownList1" ErrorMessage="Enter city name" 
                                    ForeColor="#FF3300"></asp:RequiredFieldValidator> 
                              
                            </div>
                            <div class="col-lg-4 col-md-4">
					           <asp:Label ID="Label4" Font-Size ="Medium" runat="server" Text="State"></asp:Label>
                 <%--<asp:TextBox ID="TextBox10" runat="server" class="single-input"></asp:TextBox>--%>
                 <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" 
                                    DataTextField="stateName" DataValueField="stateId"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                                    SelectCommand="SELECT * FROM [stateMaster]"></asp:SqlDataSource>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                        ControlToValidate="DropDownList2" ErrorMessage="Enter State name" 
                                    ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                <asp:Label ID="Label5" Font-Size ="Medium" runat="server" Text="Pin-Code"></asp:Label>
                                <asp:TextBox ID="TextBox6" runat="server" class="single-input"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                        ControlToValidate="TextBox6" ErrorMessage="Enter pincode" 
                                    ForeColor="Red"></asp:RequiredFieldValidator>
                              </div>
                              <div class="col-lg-4 col-md-4">
                                <asp:Label ID="Label8" runat="server" Text="Password"></asp:Label>
                                    <asp:TextBox ID="TextBox4" runat="server" class="single-input" 
                                    TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                        ErrorMessage="Enter password" ControlToValidate="TextBox4" 
                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                    
                            </div>
                            <div class="col-lg-4 col-md-4">
					        
                            <asp:Label ID="Label2" Font-Size ="Medium" runat="server" Text="Address"></asp:Label>

                                   <asp:TextBox ID="TextBox2" runat="server" class="single-input"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="TextBox2" ErrorMessage="Enter address" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-lg-4 col-md-4">    
                                <asp:Label ID="Label3" runat="server" Font-Size="Medium" Text="Mobile no"></asp:Label>

                                <asp:TextBox ID="TextBox3" runat="server" class="single-input"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="TextBox3" ErrorMessage="Enter mobileno" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-lg-4 col-md-4">
                                <asp:Label ID="Label9" runat="server" Text="Conform Passwors"></asp:Label>
                                <asp:TextBox ID="TextBox5" runat="server" class="single-input" 
                                    TextMode="Password"></asp:TextBox>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                        ControlToCompare="TextBox5" ControlToValidate="TextBox4" 
                                        ErrorMessage="Valid pass" ForeColor="#FF3300"></asp:CompareValidator>
                            </div>
                            <div class="col-lg-4 col-md-4">
                            <asp:FileUpload ID="FileUpload1" class="genric-btn success-border" runat="server" Width="221px" />
                             <asp:Image ID="Image1" runat="server" Height="50" Width ="50"></asp:Image>
                            </div>
                        </div>
                        <div class="row">
                        <div class="col-lg-2 col-md-2">
					
                            </div>
							<div class="col-lg-8 col-md-8">
                                <asp:Button ID="Button4" runat="server" Text="Submit" class="primary-btn mt-20" />
                                <asp:Button ID="Button6" runat="server" Text="Update" class="primary-btn mt-20"/>
                                <asp:Button ID="Button1" runat="server" Text="Reset" class="primary-btn mt-20"/>
                                
                            </div>
                            
                            <div class="col-lg-2 col-md-2">
					
                            </div>
                        </div>
</div>
                        </div>
                        </section>
</asp:Content>

