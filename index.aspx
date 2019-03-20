<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="index.aspx.vb" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="sample-text-area">
<div class="container">
            <h1>PROPERTYS FOR SALES</h1>       
<div class="section-top-border">
<div class="row">
     <div class="col-lg-2 col-md-2">
     </div>
     <div class="col-lg-2 col-md-2">
      <asp:Label ID="Label1" runat="server" Text="Property Type"></asp:Label>
     <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem Value="" Text ="">- Select Property Type-</asp:ListItem>
                        <asp:ListItem Value="Tenament" Text ="Tenament"></asp:ListItem>
                        <asp:ListItem Value="Flat" Text ="Flat"></asp:ListItem>
                        <asp:ListItem Value="Room" Text ="Room"></asp:ListItem>
                        </asp:DropDownList>
                        </div>
                        <div class="col-lg-2 col-md-2">
                        <asp:Label ID="Label2" runat="server" Text="City"></asp:Label>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" 
                                DataTextField="cityName" DataValueField="cityId">
                        
                        </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                                SelectCommand="SELECT * FROM [cityMaster]"></asp:SqlDataSource>
                        </div>
                        <div class="col-lg-2 col-md-2">
                        <asp:Label ID="Label3" runat="server" Text="Price"></asp:Label>
                         <asp:DropDownList ID="DropDownList3" runat="server">
                        <asp:ListItem Value="" Text ="">- Select Price Range -</asp:ListItem>
                        <asp:ListItem Value="1000~5000" Text ="1000~5000"></asp:ListItem>
                        <asp:ListItem Value="5001~10000" Text ="5001~10000"></asp:ListItem>
                        <asp:ListItem Value="10000 above" Text ="10000 above"></asp:ListItem>
                        </asp:DropDownList>
                        </div>
                        <div class="col-lg-2 col-md-2">
                         <asp:Button ID="Button3" runat="server" Text="Search" class="primary-btn mt-1"></asp:Button>
                    </div>
     </div>
     <br />
    <div class="row">
     <div class="col-lg-12 col-md-12">
      <asp:DataList ID="DataList1" runat="server" CellPadding="4" DataKeyField="id" 
                            DataSourceID="SqlDataSource1" ForeColor="#333333" 
                            RepeatDirection="Horizontal" BorderColor="Blue" RepeatColumns="4" 
                            GridLines="Both">
    <AlternatingItemStyle BackColor="White" />
    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    <ItemStyle BackColor="#E3EAEB" />
    <ItemTemplate>
         <%--id:
        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
        <br />--%>
        <asp:Image ID="imageLabel" runat="server" 
            ImageUrl ='<%# Eval("images") %>' Width ="100px" Height="100px" />
        <br />
         <b>Type:</b>
         <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("ptype") %>' />
        <br />
        <b> Title:</b> <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
         <br />
        <b> Description:</b>
        <asp:Label ID="descriptionLabel" runat="server" 
             Text='<%# Eval("description") %>' />
        <br />
        <b> Address:</b>
        <asp:Label ID="addressLabel" runat="server" 
            Text='<%# Eval("address") %>' />
        <br />
        <b> City:</b>
        <asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>' />
         <br />
        <b> State:</b>
        <asp:Label ID="Label4" runat="server" Text='<%# Eval("state") %>' />
        <br />
        <b> Size:</b>
        <asp:Label ID="sizeLabel" runat="server" Text='<%# Eval("location") %>' />
        <br />
        <b> Price:</b>
        <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
        <br />
       <b>  Property Added on:</b>
        <asp:Label ID="createDateLabel" runat="server" 
             Text='<%# Eval("createDate") %>' />
        <br />
         
        
        <asp:LinkButton ID="LinkButton1" href='<%# Eval("id", "PropertyDtl.aspx?ID={0}") %>' runat="server" class="primary-btn mt-1">View Detail</asp:LinkButton>
        <asp:LinkButton ID="LinkButton2" href='<%# Eval("registerby", "UserDtl.aspx?ID={0}") %>' runat="server" class="primary-btn mt-1">Contact Detail</asp:LinkButton>
        <asp:LinkButton ID="LinkButton3" href='<%# Eval("id", "FavProperty.aspx?ID={0}") %>' runat="server" class="primary-btn mt-1">Favorite</asp:LinkButton>
         <br />
    </ItemTemplate>
    <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        </asp:DataList>
                    
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                            
                            SelectCommand="SELECT        a.id, a.ptype, a.title, a.description, a.address, (select cityname from dbo.getCity(a.city)) as city, (select stateName from dbo.getState(a.state)) as state, a.location, a.pincode, a.psold, a.aminities, a.readytomove, SUBSTRING(CAST(a.createdate AS VARCHAR(20)), 1, 10) AS createDate, a.carpatarea, a.builtuparea, a.price, a.registerby, a.pricenego, a.uomba, a.uomca, 
                         (SELECT        TOP (1) images
                               FROM            propertyPhotoes
                               WHERE        (a.id = pid)) AS images

FROM            propertyMaster AS a 
WHERE ([psold] = @propertysold)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="N" Name="propertysold" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
     </div>
    </div>
    <br />
    <div class="row">
     <div class="col-lg-12 col-md-12">
     <asp:Label ID="Label5" runat="server" Text="Your Faveriote Property"></asp:Label><br />
      <asp:DataList ID="DataList2" runat="server" CellPadding="4" DataKeyField="id" 
                            DataSourceID="SqlDataSource3" ForeColor="#333333" 
                            RepeatDirection="Horizontal" BorderColor="Blue" RepeatColumns="4" 
                            GridLines="Both">
    <AlternatingItemStyle BackColor="White" />
    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    <ItemStyle BackColor="#E3EAEB" />
    <ItemTemplate>
         <%--id:
        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
        <br />--%>
        <asp:Image ID="imageLabel" runat="server" 
            ImageUrl ='<%# Eval("images") %>' Width ="100px" Height="100px" />
        <br />
         <b>Type:</b>
         <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("ptype") %>' />
        <br />
        <b> Title:</b> <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
         <br />
        <b> Description:</b>
        <asp:Label ID="descriptionLabel" runat="server" 
             Text='<%# Eval("description") %>' />
        <br />
        <b> Address:</b>
        <asp:Label ID="addressLabel" runat="server" 
            Text='<%# Eval("address") %>' />
        <br />
        <b> City:</b>
        <asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>' />
         <br />
        <b> State:</b>
        <asp:Label ID="Label4" runat="server" Text='<%# Eval("state") %>' />
        <br />
        <b> Size:</b>
        <asp:Label ID="sizeLabel" runat="server" Text='<%# Eval("location") %>' />
        <br />
        <b> Price:</b>
        <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
        <br />
       <b>  Property Added on:</b>
        <asp:Label ID="createDateLabel" runat="server" 
             Text='<%# Eval("createDate") %>' />
        <br />
         
        
        <asp:LinkButton ID="LinkButton1" href='<%# Eval("id", "PropertyDtl.aspx?ID={0}") %>' runat="server" class="primary-btn mt-1">View Detail</asp:LinkButton>
        <asp:LinkButton ID="LinkButton2" href='<%# Eval("registerby", "UserDtl.aspx?ID={0}") %>' runat="server" class="primary-btn mt-1">Contact Detail</asp:LinkButton>
        <asp:LinkButton ID="LinkButton3" href='<%# Eval("id", "FavProperty.aspx?ID={0}") %>' runat="server" class="primary-btn mt-1">Favorite</asp:LinkButton>
         <br />
    </ItemTemplate>
    <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        </asp:DataList>
                    
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                            
                            SelectCommand="SELECT        a.id, a.ptype, a.title, a.description, a.address, (select cityname from dbo.getCity(a.city)) as city, (select stateName from dbo.getState(a.state)) as state, a.location, a.pincode, a.psold, a.aminities, a.readytomove, SUBSTRING(CAST(a.createdate AS VARCHAR(20)), 1, 10) AS createDate, a.carpatarea, a.builtuparea, a.price, a.registerby, a.pricenego, a.uomba, a.uomca, 
                         (SELECT        TOP (1) images
                               FROM            propertyPhotoes
                               WHERE        (a.id = pid)) AS images
FROM            propertyMaster AS a JOIN favProperty c on a.id=c.pid and a.registerby=c.uid
WHERE ([psold] = @propertysold)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="N" Name="propertysold" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
     </div>
    </div>
</div>
</div>
</section>
</asp:Content>

