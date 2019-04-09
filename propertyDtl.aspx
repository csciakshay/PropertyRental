<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="propertyDtl.aspx.vb" Inherits="propertyDtl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="sample-text-area">
<div class="container">
            <h1>PROPERTY DETAILS</h1>       
<div class="section-top-border">
<div class="row">
     <div class="col-lg-12 col-md-12">
 <asp:Label ID="Label1" runat="server" Text="Property images:" Font-Bold="True" 
        ForeColor="#000066"></asp:Label>
                    <asp:DataList ID="DataList1" runat="server" CellPadding="4" 
                             ForeColor="#333333" BorderColor="Aqua" 
                            BorderWidth="1px" GridLines="Vertical" RepeatColumns="4" 
                            RepeatDirection="Horizontal">
                        <AlternatingItemStyle BackColor="White" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <ItemStyle BackColor="#EFF3FB" />
                        <ItemTemplate>
                          
                            <asp:Image ID="imagesLabel" runat="server" ImageUrl ='<%# Eval("images") %>' Width="100" Height="100" />
                            <br />
                            <br />
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        </asp:DataList>
                        </div>
                        </div>
                        <br />
                        <div class="row">
                             <div class="col-lg-12 col-md-12">
<asp:DetailsView ID="DetailsView1" runat="server" Width="767px" Height="50px" CellPadding="4" 
                                ForeColor="#333333" GridLines="None" AutoGenerateRows="False">
    <AlternatingRowStyle BackColor="White" />
    <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
    <EditRowStyle BackColor="#7C6F57" />
    <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
    <Fields>
        <asp:BoundField DataField="id" HeaderText="Property Id" />
        <asp:BoundField DataField="ptype" HeaderText="Propert Type" />
        <asp:BoundField DataField="title" HeaderText="Title" />
        <asp:BoundField DataField="description" HeaderText="Description" />
        <asp:BoundField DataField="address" HeaderText="Address" />
        <asp:BoundField DataField="city" HeaderText="City" />
        <asp:BoundField DataField="state" HeaderText="State" />
        <asp:BoundField DataField="location" HeaderText="Location" />
        <asp:BoundField DataField="pincode" HeaderText="Pin code" />
        <asp:BoundField DataField="aminities" HeaderText="Aminities" />
        <asp:BoundField DataField="readytomove" HeaderText="Ready To Move" />
        <asp:BoundField DataField="createdate" HeaderText="Register on" />
        <asp:BoundField DataField="carpatarea" HeaderText="Carpet Area" />
        <asp:BoundField DataField="builtuparea" HeaderText="Builtup Area" />
        <asp:BoundField DataField="price" HeaderText="Price" />
        <asp:BoundField DataField="name" HeaderText="Register By" />
        <asp:BoundField DataField="pricenego" HeaderText="Price Negociation" />
        <asp:BoundField DataField="views" HeaderText="No of Views" />
    </Fields>
    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#E3EAEB" />
                            </asp:DetailsView>
       <asp:Button ID="Button1" runat="server" Text="Add Favorite" class="primary-btn"></asp:Button>
        
       <asp:Button ID="Button2" runat="server" Text="Book Property" class="primary-btn"></asp:Button>
    <div id="fb-root"></div>
                        <asp:Label ID="Label3" runat="server" Text="Share to others: "></asp:Label>
                         <script language="javascript" type="text/javascript">
                             var pid = window.location.search;
                             pid = pid.replace("?", '');
                             alert(pid);
                             $(".twitter-share-button").attr("data-url", "http://www.propertyfinder.com/PropertyDtl.aspx?"+pid+");
                             $(".fb-share-button").attr("data-href", "http://www.propertyfinder.com/PropertyDtl.aspx?"+pid+");
                         </script>
                          <script>
                              (function (d, s, id) {
                                  var js, fjs = d.getElementsByTagName(s)[0];
                                  if (d.getElementById(id)) return;
                                  js = d.createElement(s); js.id = id;
                                  js.src = "https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.0";
                                  fjs.parentNode.insertBefore(js, fjs);
                              } (document, 'script', 'facebook-jssdk'));
                              
                              
                              </script>

                              <!-- Your share button code -->
                              <div class="fb-share-button" 
                                data-href="http://www.propertyfinder.com/PropertyDtl.aspx?ID=6" 
                                data-layout="button_count">
                              </div> 
                              <%--Twitter share--%>
                        <a href="https://twitter.com/share" class="twitter-share-button"  data-text="Best sutable PG option for you is: " data-size="large" data-count="none">Tweet</a>

                        <script>                            !function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = "//platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs); } } (document, "script", "twitter-wjs");</script>
                        <script>
                            window.onload = function () {
                                twttr.events.bind('tweet', function (event) {
                                    alert("Thanks for sharing on twitter");
                                });

                                twttr.events.bind('click', function (event) {
                                    alert("You are going to share in twitter");
                                });
                            }
                            </script>
                            <%--Linked In Share--%>
                         <script src="//platform.linkedin.com/in.js" type="text/javascript"></script>
                        <script type="IN/Share" data-onsuccess="lnksuccess" data-onerror="error" data-url="http://www.propertyfinder.com/PropertyDtl.aspx"></script>
                         <script>
                             function lnksuccess(url) {
                                 alert("url = " + url + "  shared successfully");
                             }
                             function lnkerror(url) {
                                 alert("something goes wrong in url sharing");
                             }
                        </script>
                        </div>
</div>
</div>
</div>
</section>
</asp:Content>

