<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="graphsReport.aspx.vb" Inherits="graphsReport" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<section class="sample-text-area">
<div class="container">
            <h1>PROPERTY REPORT</h1>       
<div class="section-top-border">
        <div class="row">
            
            <div class="col-lg-6 col-md-6">
               <asp:Chart ID="Chart1" runat=server DataSourceID="SqlDataSource1" Width="478px"><Series>
                   <asp:Series Name="City" XValueMember="city" YValueMembers="total" 
                       IsValueShownAsLabel="True" Legend="Legend1"></asp:Series></Series><ChartAreas><asp:ChartArea Name="ChartArea1"></asp:ChartArea></ChartAreas>
                   <Legends>
                       <asp:Legend Name="Legend1">
                       </asp:Legend>
                   </Legends>
                   <Titles>
                       <asp:Title Name="Title1" Text="City wise Property">
                       </asp:Title>
                   </Titles>
                </asp:Chart>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                    SelectCommand="select (select cityname from dbo.getCity(PropertyMaster.city)) as city,count(*) total from propertyMaster where psold='N' group by city">
                </asp:SqlDataSource>
            </div>
            <div class="col-lg-6 col-md-6">
               <asp:Chart ID="Chart2" runat=server DataSourceID="SqlDataSource2" Width="491px"><Series>
                   <asp:Series Name="State" XValueMember="state" YValueMembers="total" 
                       IsValueShownAsLabel="True" Legend="Legend1"></asp:Series></Series><ChartAreas><asp:ChartArea Name="ChartArea1"></asp:ChartArea></ChartAreas>
                   <Legends>
                       <asp:Legend Name="Legend1">
                       </asp:Legend>
                   </Legends>
                   <Titles>
                       <asp:Title Name="Title1" Text="State wise Property">
                       </asp:Title>
                   </Titles>
                </asp:Chart>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                    SelectCommand="select (select statename from dbo.getState(PropertyMaster.state)) as state,count(*) total from propertyMaster where psold='N' group by state">
                </asp:SqlDataSource>
            </div>
            
        </div>
</div>
</div>
</section>
</asp:Content>

