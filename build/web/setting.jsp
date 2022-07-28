<%-- 
    Document   : index
    Created on : 9 Jun, 2022, 11:11:23 AM
    Author     : julia
--%>

<%@page import="com.dao.UserDaoClass"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.dao.CartDaoClass"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookDaoClass"%>
<%@page import="com.entity.User"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.db.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>

<%
    User user = (User) session.getAttribute("userObj");

    if (user == null) {
        response.sendRedirect("signin.jsp");
    }

%>

<%
    UserDaoClass userDaoClass = new UserDaoClass(DBConnect.getConnection());
    
    User userDetails = userDaoClass.getUserModule(user.getEmail());
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EBook - My Profile</title>

        <%@include file="link/all_links.jsp" %>

        <style>
            body
            {
                background-image: url('img/setting-bg-img.jpg');
                background-repeat: no-repeat;
                background-size: cover;
            }

            /*  Scroll Button Design Start  */
            #myBtn 
            {
                display: none;
                position: fixed;
                bottom: 20px;
                right: 25px;
                z-index: 99;
                font-size: 24px;
                font-weight: 800;
                border: none;
                outline: none;
                background-color: #3333ff;
                color: white;
                cursor: pointer;
                padding: 15px;
                border-radius: 50%;
            }

            #myBtn:hover 
            {
                background-color: #0000ff;
            }
            /*  Scroll Button Design End  */

            /*  Setting Card Anchor Start  */
            a
            {
                color: #000000;
                text-decoration: none;
            }
            a:hover
            {
                color: #0000ff;
                text-decoration: none;
            }
            /*  Setting Card Anchor End  */

        </style>

    </head>
    <body style="background-color: #f0f1f2;">

        <!--  Scroll Button Start  -->
        <i onclick="topFunction()" id="myBtn" title="Go to Top" class="fa-solid fa-arrow-up"></i>
        <!--  Scroll Button End  -->

        <!--  For Navbar Start  -->
        <%            if (user == null ? user == null : user.equals("null")) {
        %>
        <%@include file="navbar.jsp" %>
        <%        } else {

            if (user.getUserModule().equals("Admin")) {
        %>

        <%@include file="admin/index_navbar.jsp" %>

        <%                } else {
        %>

        <%@include file="navbar.jsp" %>

        <%                        }
            }
        %>
        <!--  For Navbar End  -->


        <!--  User Setting / Profile Design Start  -->
        <div class="container">
            <h3 class="text-center p-3">Hello, <%= userDetails.getName()%></h3>
            <div class="row p-3">
                <div class="col-md-4">
                    <a href="sell_book.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <span class="text-primary"><i class="fa-solid fa-book-open fa-3x"></i></span>
                                <h3 class="text-primary">Sell Old Book</h3>
                                <span>Sell Now</span>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="see_old_books.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <span class="text-info"><i class="fa-solid fa-book fa-3x"></i></span>
                                <h3 class="text-info">See Old Books</h3>
                                <span>See Your Posted All Old Books</span>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="edit_profile.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <span class="text-success"><i class="fa-solid fa-id-card fa-3x"></i></span>
                                <h3 class="text-success">Login & Security</h3>
                                <span>Edit Profile</span>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="row p-3">
                <div class="col-md-4">
                    <a href="user_address.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <span class="text-warning"><i class="fa-solid fa-location-dot fa-3x"></i></span>
                                <h3 class="text-warning">Your Location</h3>
                                <span>Edit Address</span>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="user_order.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <span class="text-danger"><i class="fa-solid fa-box-open fa-3x"></i></span>
                                <h3 class="text-danger">My Order</h3>
                                <span>Track Your Order</span>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="contact.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <span class="text-info"><i class="fa-solid fa-circle-user fa-3x"></i></span>
                                <h3 class="text-info">Help Center</h3>
                                <span>24*7 Hours Service</span>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <!--  User Setting / Profile Design End  -->


        <br><br>

        <!--  For Footer Start  -->
        <div style="margin-top: 91px;">
            <%@include file="footer.jsp" %>
        </div>
        <!--  For Footer End  -->


        <!--  JavaScript Code Start  -->

        <!--  Go To Top in the Page Start  -->
        <script>
            //Get the button
            var mybutton = document.getElementById("myBtn");

            // When the user scrolls down 20px from the top of the document, show the button
            window.onscroll = function () {
                scrollFunction();
            };

            function scrollFunction() {
                if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                    mybutton.style.display = "block";
                } else {
                    mybutton.style.display = "none";
                }
            }

            // When the user clicks on the button, scroll to the top of the document
            function topFunction() {
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            }
        </script>
        <!--  Go To Top in the Page End  -->

        <!--  View Source Page Disable Start  --> 
        <SCRIPT language=JavaScript>

            <!-- http://www.spacegun.co.uk -->

            var message = "                                          We are Sorry!"
                    +"\n"+"                              View Page Source are Disable";

            function rtclickcheck(keyp) {
                if (navigator.appName === "Netscape" && keyp.which === 3) {
                    alert(message);
                    return false;
                }

                if (navigator.appVersion.indexOf("MSIE") !== -1 && event.button === 2) {
                    alert(message);
                    return false;
                }
            }

            document.onmousedown = rtclickcheck;

        </SCRIPT>
        <!--  View Source Page Disable End  --> 
        
        <!--  JavaScript Code End  -->


    </body>
</html>
