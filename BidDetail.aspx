<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="BidDetail.aspx.vb" Inherits="BidDetail" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<h2>Bid Detail</h2>
  
  <div class="rnd_box"> <b class="rnd_top"><b class="rnd_b1"></b><b class="rnd_b2"></b><b class="rnd_b3"></b><b class="rnd_b4"></b></b> <div class="rnd_content">
  <div class="linespace">   </div>

  
      <asp:DetailsView ID="DtvInsert" runat="server" Height="94px" Width="403px" 
          AutoGenerateRows="False" DataKeyNames="BidID" 
        DataSourceID="SqlDsBidMaster" GridLines="None">
          <Fields>
              <asp:TemplateField HeaderText="Bid Starting :" SortExpression="BidStarting">
                  <EditItemTemplate>
                      <asp:TextBox ID="txtStartingEdit" runat="server" 
                          Text='<%# Bind("BidStarting", "{0:dd-MMM-yy}") %>' ReadOnly="True"></asp:TextBox>
                      *<asp:RequiredFieldValidator ID="rfvStarting" runat="server" 
                          ControlToValidate="txtStartingEdit" CssClass="ErrorMsgBox" 
                          ErrorMessage="Start Date is Required"></asp:RequiredFieldValidator>
                      <asp:CalendarExtender ID="CalendarExtender4" runat="server" Format="dd-MMM-yy" 
                          TargetControlID="txtStartingEdit">
                      </asp:CalendarExtender>
                  </EditItemTemplate>
                  <InsertItemTemplate>
                      <asp:TextBox ID="txtStartingInsert" runat="server" 
                          Text='<%# Bind("BidStarting") %>'></asp:TextBox>
                      *<asp:RequiredFieldValidator ID="rfvInserStarting" runat="server" 
                          ControlToValidate="txtStartingInsert" CssClass="ErrorMsgBox" 
                          ErrorMessage="Start Date is Required"></asp:RequiredFieldValidator>

                      <asp:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd-MMM-yy" 
                          TargetControlID="txtStartingInsert">
                      </asp:CalendarExtender>

                  </InsertItemTemplate>
                  <ItemTemplate>
                      <asp:Label ID="Label1" runat="server" Text='<%# Bind("BidStarting") %>'></asp:Label>
                  </ItemTemplate>
                  <HeaderStyle ForeColor="#B5C83C" Wrap="False" VerticalAlign="Top" />
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Bid Ending :" SortExpression="BidEnding">
                  <EditItemTemplate>
                      <asp:TextBox ID="txtEndingEding" runat="server" 
                          Text='<%# Bind("BidEnding", "{0:dd-MMM-yy}") %>' ReadOnly="True"></asp:TextBox>
                      *<asp:RequiredFieldValidator ID="rfvEnding" runat="server" 
                          ControlToValidate="txtEndingEding" CssClass="ErrorMsgBox" 
                          ErrorMessage="End Date is Required"></asp:RequiredFieldValidator>
                      <asp:CalendarExtender ID="CalendarExtender3" runat="server" Format="dd-MMM-yy" 
                          TargetControlID="txtEndingEding">
                      </asp:CalendarExtender>
                  </EditItemTemplate>
                  <InsertItemTemplate>
                      <asp:TextBox ID="txtEndingInsert" runat="server" 
                          Text='<%# Bind("BidEnding") %>'></asp:TextBox>
                      *<asp:RequiredFieldValidator ID="rfvInserEnding" runat="server" 
                          ControlToValidate="txtEndingInsert" CssClass="ErrorMsgBox" 
                          ErrorMessage="End Date is Required"></asp:RequiredFieldValidator>
                      <asp:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd-MMM-yy" 
                          TargetControlID="txtEndingInsert">
                      </asp:CalendarExtender>
                  </InsertItemTemplate>
                  <ItemTemplate>
                      <asp:Label ID="Label2" runat="server" Text='<%# Bind("BidEnding") %>'></asp:Label>
                  </ItemTemplate>
                  <HeaderStyle ForeColor="#B5C83C" Wrap="False" VerticalAlign="Top" />
              </asp:TemplateField>
              <asp:CommandField ButtonType="Button" ShowEditButton="True" 
                  ShowInsertButton="True" />
          </Fields>
          <HeaderStyle Wrap="False" />
      </asp:DetailsView>
  
  
  
  <asp:Label ID="ShowInfoMessage" runat="server" Text="Label" 
        CssClass="InfoMsgBox" Enabled="False" Visible="False"></asp:Label>
  </div><b class="rnd_bottom"><b class="rnd_b4"></b><b class="rnd_b3"></b><b class="rnd_b2"></b><b class="rnd_b1"></b></b> </div>



<asp:SqlDataSource ID="SqlDsBidMaster" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
        DeleteCommand="DELETE FROM [BidMaster] WHERE [BidID] = @BidID" 
        InsertCommand="INSERT INTO BidMaster(PropertyID, BidStarting, BidEnding) VALUES (@PropertyID, @BidStarting, @BidEnding)" 
        SelectCommand="SELECT [BidID], [PropertyID], [BidStarting], [BidEnding], [Active], [TrancationTime] FROM [BidMaster] WHERE ([PropertyID] = @PropertyID)" 
        
        
            
        UpdateCommand="UPDATE BidMaster SET BidStarting = @BidStarting, BidEnding = @BidEnding WHERE (BidID = @BidID) AND (PropertyID = @PropertyID)">
        <DeleteParameters>
            <asp:Parameter Name="BidID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="BidStarting" DbType="Date" />
            <asp:Parameter DbType="Date" Name="BidEnding" />
            <asp:Parameter Name="PropertyID" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="PropertyID" SessionField="pPropertyID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="BidStarting" />
            <asp:Parameter DbType="Date" Name="BidEnding" />
            <asp:Parameter Name="BidID" />
            <asp:Parameter Name="PropertyID" />
        </UpdateParameters>
    </asp:SqlDataSource>


       
  
           

<div class="linespace">   </div>


    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="BidID,UserId" DataSourceID="SqlDsBindDetail" 
        AllowPaging="True" AllowSorting="True" Width="520px">
        <Columns>
            <asp:BoundField DataField="BidID" HeaderText="Bid ID" ReadOnly="True" 
                SortExpression="BidID" />
            <asp:BoundField DataField="PropertyID" HeaderText="Property ID" 
                SortExpression="PropertyID" />
            <asp:BoundField DataField="Bid" HeaderText="Bid" SortExpression="Bid" />
            <asp:BoundField DataField="Date" HeaderText="Dated" SortExpression="Date" 
                DataFormatString="{0:dd-MMM-yy}" />
            <asp:CheckBoxField DataField="Active" HeaderText="Active" 
                SortExpression="Active" Visible="False" />
            <asp:CheckBoxField DataField="BidWinStatus" HeaderText="Bid Win Status" 
                SortExpression="Bid Win Status" />
        </Columns>
         <RowStyle CssClass="RowStyle" />
         <EmptyDataRowStyle CssClass="EmptyRowStyle" />
         <PagerStyle CssClass="PagerStyle" />
         <SelectedRowStyle CssClass="SelectedRowStyle" />
         <HeaderStyle CssClass="HeaderStyle" />
         <EditRowStyle CssClass="EditRowStyle" />
         <AlternatingRowStyle CssClass="AltRowStyle" /> 
    </asp:GridView>



    <asp:SqlDataSource ID="SqlDsBindDetail" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnOres %>" 
        SelectCommand="SELECT [BidID], [PropertyID], [UserId], [Bid], [Date], [Active], [BidWinStatus] FROM [PropertyBid] WHERE (([PropertyID] = @PropertyID) AND ([BidID] = @BidID))">
        <SelectParameters>
            <asp:SessionParameter Name="PropertyID" SessionField="pPropertyID" 
                Type="Int32" />
            <asp:ControlParameter ControlID="DtvInsert" Name="BidID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>



</asp:Content>

