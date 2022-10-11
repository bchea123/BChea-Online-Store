<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Template.Master" CodeBehind="Category.aspx.vb" Inherits="BChea_Online_Store.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="server">
    <!--=====================================
                BANNER PART START
    =======================================-->
    <section class="inner-section single-banner" style="background: no-repeat center;">
        <div class="container">
            <h2>
                <asp:Label ID="lblProductType" runat="server" Text=""></asp:Label>
            </h2>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href=""><asp:Label ID="lblBCMainCategory" runat="server" Text=""></asp:Label></a></li>
                <li class="breadcrumb-item active" aria-current="page"><asp:Label ID="lblBCSubCategory" runat="server" Text=""></asp:Label></li>
            </ol>
        </div>
    </section>
    <!--=====================================
                BANNER PART END
    =======================================-->

    
    <!--=====================================
                SHOP PART START
    =======================================-->
    <section class="inner-section shop-part">
        <div class="container">
            <div class="row content-reverse">
                <div class="col-lg-3">
                    <div class="shop-widget">
                        <h6 class="shop-widget-title">
                            <asp:Label ID="lblMainCategoryName" runat="server" Text=""></asp:Label>
                        </h6>
                        <form>
                            <ul class="shop-widget-list">
                                <asp:SqlDataSource ID="sqlDSSubCategory" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringOnlineStore %>"></asp:SqlDataSource>
                                <asp:Repeater ID="rpSubCategory" runat="server" DataSourceID="sqlDSSubCategory">
                                    <ItemTemplate>
                                        <li>
                                            <div class="shop-widget-content">
                                                <h2 class="shop-widget-number"><a href="Category.aspx?MainCategoryID=<% = Request.QueryString("MainCategoryID") %>&MainCategoryName=<% = Request.QueryString("MainCategoryName") %>&SubCategoryID=<%# Eval("ID") %>&SubCategoryName=<%# Eval("CategoryName") %>"><%# Eval("CategoryName") %></a></h2>
                                            </div>
                                            <span class="shop-widget-number">(13)</span>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                            <button class="shop-widget-btn">
                                <i class="far fa-trash-alt"></i>
                                <span>clear filter</span>
                            </button>
                        </form>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="row row-cols-2 row-cols-md-3 row-cols-lg-3 row-cols-xl-3">
                        <asp:SqlDataSource ID="sqlDSProducts" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringOnlineStore %>"></asp:SqlDataSource>
                        <asp:Repeater ID="rpProducts" runat="server" DataSourceID="sqlDSProducts">
                            <ItemTemplate>
                                <div class="col">
                                    <div class="product-card">
                                        <div class="product-media">
                                            <div class="product-label">
                                                <label class="label-text new">new</label>
                                            </div>
                                            <a class="product-image" href ="ProductDetail.aspx?ProductID=<%# Eval("ID") %>">>
                                                <img src="\images\product\<%# Trim(Eval("ProductID")) %>.png" alt="<%# Eval("ProductName") %>">
                                            </a>
                                            <div class="product-widget">
                                                <a title="Product View" href="ProductDetail.aspx?ProductID=<%# Eval("ID") %>" class="fas fa-eye" data-bs-toggle="modal" data-bs-target="#product-view"></a>
                                            </div>
                                        </div>
                                        <div class="product-content">
                                            <div class="product-rating">
                                                <span><%# Eval("ProductRating") %>⭐</span>
                                            </div>
                                            <h6 class="product-name">
                                                <a href="ProductDetail.aspx?ProductID=<%# Eval("ID") %>"><%# Eval("ProductName") %></a>
                                            </h6>
                                            <h6 class="product-price">
                                                <span>$<%# Eval("Price") %></span>
                                            </h6>
                                            <button class="product-add" title="Add to Cart">
                                                <i class="fas fa-shopping-basket"></i>
                                                <span>add</span>
                                            </button>
                                            <div class="product-action">
                                                <button class="action-minus" title="Quantity Minus"><i class="icofont-minus"></i></button>
                                                <input class="action-input" title="Quantity Number" type="text" name="quantity" value="1">
                                                <button class="action-plus" title="Quantity Plus"><i class="icofont-plus"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=====================================
                SHOP PART END
    =======================================-->
</asp:Content>
