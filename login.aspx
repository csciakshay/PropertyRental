<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      
 	
<h2>Members Login Here</h2>
    <asp:Login ID="Login1" runat="server" Height="140px" Width="300px" TitleText="" 
        DestinationPageUrl="~/index.aspx">
        <LayoutTemplate>
            <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                <tr>
                    <td>
                        <table cellpadding="0" style="height:140px;width:300px;">
                            <tr>
                                <td align="left">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" 
                                        ForeColor="#B5C83C">User Name:</asp:Label>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                        ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                        ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" 
                                        ForeColor="#B5C83C">Password:</asp:Label>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                        ControlToValidate="Password" ErrorMessage="Password is required." 
                                        ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2">
                                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" 
                                        ValidationGroup="Login1" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:Login>    
    <asp:HyperLink ID="HyperLink1" runat="server" Text="Lost Your Password" 
        NavigateUrl="~/PasswordRecovery.aspx"></asp:HyperLink>
    |
    <asp:HyperLink ID="HyperLink2" runat="server" Text="If not a Member Signup" 
        NavigateUrl="~/Register.aspx"></asp:HyperLink>

    
  
  <!-- Validation summary control -->
  <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Login1"
       HeaderText="Please Provide following information:" ForeColor="#FF3300" />
  <!-- Validation summary control -->

  


</asp:Content>

