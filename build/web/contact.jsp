<%-- 
    Document   : index
    Created on : 9 Jun, 2022, 11:11:23 AM
    Author     : julia
--%>

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

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EBook - Customer Care Number</title>

        <%@include file="link/all_links.jsp" %>

        <style>
            body
            {
                /*background-image: url('img/all-order-bg-img.jpg');*/
                background-repeat: no-repeat;
                background-size: cover;
            }

            .crd-ho:hover
            {
                background-color: #f7f7f7;
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


        <!--  Customer Care Service Start  -->
        <div class="container-fluid">
            <div class="row mt-5">
                <div class="col-md-4">
                    <div class="card mt-1">
                        <h6 class="p-3">TYPE OF ISSUE</h6>
                        <div id="list-example" class="list-group">
                            <a class="p-3 group-item list-group-item-action" href="#list-item-1">Help with your issues</a>
                            <a class="p-3 group-item list-group-item-action" href="#list-item-2">Help with your order</a>
                            <a class="p-3 group-item list-group-item-action" href="#list-item-3">Help with other issues</a>
                            <a class="list-item"></a>
                            <h6 class="p-3">HELP TOPICS</h6>
                            <a class="p-3 group-item list-group-item-action" href="#list-item-4">Order</a>
                            <a class="p-3 group-item list-group-item-action" href="#list-item-5">Shopping</a>
                            <a class="p-3 group-item list-group-item-action" href="#list-item-5">Other</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="card mt-1">
                        <h6 class="text-dark">Customer Care Services</h6>
                        <div class="card-body text-center">
                            <span class="text-success"><i class="fa-solid fa-square-phone fa-4x"></i></span>
                            <h2 class="mt-3">24*7 Hours Service</h2>
                            <h3>Helpline Number</h3>
                            <h5>+91 6294160823</h5>
                            <a href="index.jsp" class="btn btn-primary btn-lg mt-3">Home</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--  Customer Care Service End  -->


        <br><br>


        <!--  For Footer Start  -->
        <div style="margin-top: 30px;">
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
