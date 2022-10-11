﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="BChea_Online_Store.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <!--=====================================
                    META TAG PART START
        =======================================-->
        <!-- REQUIRE META -->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- AUTHOR META -->
        <meta name="author" content="mironcoder">
        <meta name="email" content="mironcoder@gmail.com">
        <meta name="profile" content="https://themeforest.net/user/mironcoder">

        <!-- TEMPLATE META -->
        <meta name="name" content="Greeny">
        <meta name="title" content="Greeny - eCommerce HTML Template">
        <meta name="keywords" content="organic, food, shop, ecommerce, store, html, bootstrap, template, agriculture, vegetables, webshop, farm, grocery, natural, online store">
        <!--=====================================
                    META-TAG PART END
        =======================================-->

        <!-- WEBPAGE TITLE -->
        <title>Login</title>

        <!--=====================================
                    CSS LINK PART START
        =======================================-->
        <!-- FAVICON -->
        <link rel="icon" href="images/favicon.png">

        <!-- FONTS -->
        <link rel="stylesheet" href="fonts/flaticon/flaticon.css">
        <link rel="stylesheet" href="fonts/icofont/icofont.min.css">
        <link rel="stylesheet" href="fonts/fontawesome/fontawesome.min.css">

        <!-- VENDOR -->
        <link rel="stylesheet" href="vendor/venobox/venobox.min.css">
        <link rel="stylesheet" href="vendor/slickslider/slick.min.css">
        <link rel="stylesheet" href="vendor/niceselect/nice-select.min.css">
        <link rel="stylesheet" href="vendor/bootstrap/bootstrap.min.css">

        <!-- CUSTOM -->
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/user-auth.css">
        <!--=====================================
                    CSS LINK PART END
        =======================================-->
    </head>
    <body>
        <!--=====================================
                    USER FORM PART START
        =======================================-->
        <section class="user-form-part">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12 col-sm-10 col-md-12 col-lg-12 col-xl-10">
                        <div class="user-form-logo">
                            <a href="Default.aspx"><img src="images/logo.jpeg" alt="logo"></a>
                        </div>
                        <div class="user-form-card">
                            <div class="user-form-title">
                                <h2>welcome!</h2>
                                <p>Use your credentials to access your account</p>
                            </div>
                            <div class="user-form-group">
                                <form class="user-form">
                                    <div class="form-group">
                                        <input id="username" type="text" class="form-control" placeholder="Enter your username" runat="server">
                                    </div>
                                    <div class="form-group">
                                        <input id="password" type="password" class="form-control" placeholder="Enter your password" runat="server">
                                    </div>
                                    <div class="form-check mb-3">
                                        <input class="form-check-input" type="checkbox" value="" id="check">
                                        <label class="form-check-label" for="check">Remember Me</label>
                                    </div>
                                    <div class="form-button">
                                        <form id="form1" runat="server">
                                            <asp:Button ID="btnLogin" runat="server" Text="Login" BackColor="#119744" />
                                            <p>Forgot your password?<a href="reset-password.html">reset here</a></p>
                                            <asp:Label ID="lblMessage" runat="server" ForeColor="#CC3300" ></asp:Label>
                                        </form>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="user-form-remind">
                            <p>Don't have any account?<a href="register.html">register here</a></p>
                        </div>
                        <div class="user-form-footer">
                            <p>BChea's Online Store | &COPY; Copyright by <a href="#">BChea Apps</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--=====================================
                    USER FORM PART END
        =======================================-->


        <!--=====================================
                    JS LINK PART START
        =======================================-->
        <!-- VENDOR -->
        <script src="vendor/bootstrap/jquery-1.12.4.min.js"></script>
        <script src="vendor/bootstrap/popper.min.js"></script>
        <script src="vendor/bootstrap/bootstrap.min.js"></script>
        <script src="vendor/countdown/countdown.min.js"></script>
        <script src="vendor/niceselect/nice-select.min.js"></script>
        <script src="vendor/slickslider/slick.min.js"></script>
        <script src="vendor/venobox/venobox.min.js"></script>

        <!-- CUSTOM -->
        <script src="js/nice-select.js"></script>
        <script src="js/countdown.js"></script>
        <script src="js/accordion.js"></script>
        <script src="js/venobox.js"></script>
        <script src="js/slick.js"></script>
        <script src="js/main.js"></script> 
        <!--=====================================
                    JS LINK PART END
        =======================================-->
    </body>
</html>
