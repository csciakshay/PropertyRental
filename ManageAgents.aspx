<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ManageAgents.aspx.vb" Inherits="ManageAgents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 122px;
        }
        .style3
        {
            width: 249px;
        }
        .style4
        {
            width: 91px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h2>Manage Agents</h2>
        
         <div class="insertbtn"> <asp:Button ID="Button1" runat="server" 
                 Text="Insert New Record" Visible="False" />  </div>
    
    <!-- insert window/panel --> 
    <asp:Panel ID="Panelnsert" runat="server">
    
      
       <div class="rnd_box">
         <b class="rnd_top"><b class="rnd_b1"></b><b class="rnd_b2"></b><b class="rnd_b3"></b><b class="rnd_b4"></b></b>
           <div class="rnd_content">
               <div class="linespace">   </div>
               
               <table style="width: 494px"> 
                  <tr style="background-color: #333333; color: #FFFFFF;"> <td align="center" 
                          colspan="2" style="font-weight: bold"> Agent Details</td> </tr>
                  <tr> <td align="left" style="color: #b5c83c" class="style4" valign="top"> Agent Name:</td> 
                      <td class="style3" valign="top" nowrap="nowrap"> <asp:TextBox ID="tboxAgentName" runat="server"></asp:TextBox> 
                          *<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                              ControlToValidate="tboxAgentName" CssClass="ErrorMsgBox" 
                              ErrorMessage="Name is Required" Width="127px"></asp:RequiredFieldValidator>
                          <br />
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator12" 
                              runat="server" ControlToValidate="tboxAgentName" CssClass="ErrorMsgBox" 
                              ErrorMessage="Only Characters" ValidationExpression="[a-zA-Z]*"></asp:RegularExpressionValidator>
                      </td>   </tr>
                                   <tr> <td align="left" style="color: #b5c83c" class="style4"> Area Location:</td> 
                                       <td class="style3"> <asp:DropDownList ID="ddlAreaLoc" runat="server" 
                                           Width="130px" DataSourceID="SqlDsArea" DataTextField="AreaLocName" 
                                           DataValueField="AreaLocID">  </asp:DropDownList> </td> </tr> 
                                   <tr> <td align="left" style="color: #b5c83c" class="style4"> Client Name:</td> 
                                       <td class="style3"> <asp:DropDownList ID="ddlClient" runat="server" 
                                           Width="130px" DataSourceID="SqlDsClients" DataTextField="ClientName" 
                                           DataValueField="ClientID">  </asp:DropDownList> </td> </tr> 
                                 <tr> 
                                      <td align="left" class="style4" style="color: #b5c83c"> Role:&nbsp; </td>
                                      <td class="style3"> <asp:DropDownList ID="ddlRoles" runat="server" DataSourceID="SqlDsRoles" 
                                              DataTextField="RoleName" DataValueField="RoleId" Width="129px"> </asp:DropDownList> 
                                          <asp:SqlDataSource ID="SqlDsRoles" runat="server" 
                                              ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
                                              
                                              SelectCommand="SELECT RoleId, RoleName FROM vw_aspnet_Roles WHERE (RoleName = 'Agent')">
                                          </asp:SqlDataSource>
                                       </td>
                                   </tr>
               
               
               </table> 

                              
               <asp:CreateUserWizard ID="CreateUserWizardAgent" runat="server" 
                   CancelDestinationPageUrl="~/index.aspx" 
                   FinishDestinationPageUrl="~/login.aspx" 
                   ContinueDestinationPageUrl="~/index.aspx">
                   <WizardSteps>
                       <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                           <ContentTemplate>
                               <table>
                                   <tr style="background-color: #333333; color: #FFFFFF;"> 
                                       <td align="center" colspan="2" style="font-weight: bold">
                                           Agent Account Details</td>
                                   </tr>
                                                                     
                                   
                                   <tr>
                                       <td align="left">
                                           <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" 
                                               ForeColor="#B5C83C">User Name:</asp:Label>
                                       </td>
                                       <td>
                                           <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                               ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                               ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td align="left">
                                           <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" 
                                               ForeColor="#B5C83C">Password:</asp:Label>
                                       </td>
                                       <td>
                                           <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                               ControlToValidate="Password" ErrorMessage="Password is required." 
                                               ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td align="left">
                                           <asp:Label ID="ConfirmPasswordLabel" runat="server" 
                                               AssociatedControlID="ConfirmPassword" ForeColor="#B5C83C">Confirm Password:</asp:Label>
                                       </td>
                                       <td>
                                           <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                               ControlToValidate="ConfirmPassword" 
                                               ErrorMessage="Confirm Password is required." 
                                               ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td align="left">
                                           <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email" 
                                               ForeColor="#B5C83C">E-mail:</asp:Label>
                                       </td>
                                       <td>
                                           <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                               ControlToValidate="Email" ErrorMessage="E-mail is required." 
                                               ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                               ControlToValidate="Email" CssClass="ErrorMsgBox" ErrorMessage="Invalid E-Mail" 
                                               ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td align="left">
                                           <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question" 
                                               ForeColor="#B5C83C">Security Question:</asp:Label>
                                       </td>
                                       <td>
                                           <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" 
                                               ControlToValidate="Question" ErrorMessage="Security question is required." 
                                               ToolTip="Security question is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td align="left">
                                           <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer" 
                                               ForeColor="#B5C83C">Security Answer:</asp:Label>
                                       </td>
                                       <td>
                                           <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" 
                                               ControlToValidate="Answer" ErrorMessage="Security answer is required." 
                                               ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                       </td>
                                   </tr>
                                   
                                   
                                   
                                   <tr>
                                       <td align="center" colspan="2">
                                           <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                               ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                               Display="Dynamic" 
                                               ErrorMessage="The Password and Confirmation Password must match." 
                                               ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td align="center" colspan="2" style="color:Red;">
                                           <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                       </td>
                                   </tr>
                               </table>
                           </ContentTemplate>
                       </asp:CreateUserWizardStep>
                       <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                           <ContentTemplate>
                               <table>
                                   <tr>
                                       <td align="center" colspan="2">
                                           Complete</td>
                                   </tr>
                                   <tr>
                                       <td>
                                           Your account has been successfully created.</td>
                                   </tr>
                                   <tr>
                                       <td align="right" colspan="2">
                                           <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" 
                                               CommandName="Continue" Text="Continue" ValidationGroup="CreateUserWizard1" />
                                       </td>
                                   </tr>
                               </table>
                           </ContentTemplate>
                       </asp:CompleteWizardStep>
                   </WizardSteps>
               </asp:CreateUserWizard>
               <asp:SqlDataSource ID="SqlDsArea" runat="server" 
                   ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
                   SelectCommand="SELECT AreaLocID, AreaLocName FROM AreaLocation WHERE (Active = 1)"></asp:SqlDataSource>
               <asp:SqlDataSource ID="SqlDsClients" runat="server" 
                   ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
                   SelectCommand="SELECT ClientID, ClientName FROM Clients WHERE (Active = 1)"></asp:SqlDataSource>
           </div>
         <b class="rnd_bottom"><b class="rnd_b4"></b><b class="rnd_b3"></b><b class="rnd_b2"></b><b class="rnd_b1"></b></b>
       </div>
              
</asp:Panel>

  
  
  <asp:Label ID="ShowInfoMessage" runat="server" Text="Label" 
        CssClass="InfoMsgBox" Enabled="False" Visible="False"></asp:Label>
  
<!-- Gridview --> 
<div class="linespace">   </div>
<div class ="scroll">
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AllowSorting="True" AutoGenerateColumns="False" 
    DataSourceID="SqlDataSource1">
    <Columns>
        <asp:BoundField DataField="AgentName" HeaderText="Agent Name" 
            SortExpression="AgentName" >
        <HeaderStyle Wrap="False" />
        <ItemStyle Wrap="False" />
        </asp:BoundField>
        <asp:BoundField DataField="ClientName" HeaderText="Client" 
            SortExpression="ClientName">
        <ItemStyle Wrap="False" />
        </asp:BoundField>
        <asp:BoundField DataField="AreaLocName" HeaderText="Area" 
            SortExpression="AreaLocName">
        <ItemStyle Wrap="False" />
        </asp:BoundField>
        <asp:BoundField DataField="UserName" HeaderText="User Name"  
            SortExpression="UserName" >  

        <HeaderStyle Wrap="False" />

        </asp:BoundField>

        <asp:BoundField DataField="RoleName" HeaderText="Role Name" 
            SortExpression="RoleName" >
        <HeaderStyle Wrap="False" />
        </asp:BoundField>
        <asp:BoundField DataField="UserId" HeaderText="User Id" 
            SortExpression="UserId" >
        <ItemStyle Wrap="False" />
        </asp:BoundField>
    </Columns>
    <RowStyle CssClass="RowStyle" />
    <EmptyDataRowStyle CssClass="EmptyRowStyle" />
    <PagerStyle CssClass="PagerStyle" />
    <SelectedRowStyle CssClass="SelectedRowStyle" />
    <HeaderStyle CssClass="HeaderStyle" />
    <EditRowStyle CssClass="EditRowStyle" />
    <AlternatingRowStyle CssClass="AltRowStyle" /> 
</asp:GridView>
</div>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
    OldValuesParameterFormatString="original_{0}" 
    
        
        
        SelectCommand="SELECT aspnet_Users.UserId, aspnet_Users.UserName, aspnet_Roles.RoleName, Agents.AgentName, Clients.ClientName, AreaLocation.AreaLocName FROM aspnet_Users INNER JOIN aspnet_UsersInRoles ON aspnet_Users.UserId = aspnet_UsersInRoles.UserId INNER JOIN aspnet_Roles ON aspnet_UsersInRoles.RoleId = aspnet_Roles.RoleId INNER JOIN Agents ON aspnet_Users.UserId = Agents.UserId LEFT OUTER JOIN AreaLocation ON Agents.AreaLocID = AreaLocation.AreaLocID LEFT OUTER JOIN Clients ON Agents.ClientID = Clients.ClientID WHERE (aspnet_Roles.RoleName = 'Agent')">
</asp:SqlDataSource>

</asp:Content>

