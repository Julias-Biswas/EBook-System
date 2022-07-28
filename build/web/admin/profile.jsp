<%-- 
    Document   : profile
    Created on : 30 Jun, 2022, 10:05:19 AM
    Author     : julia
--%>

<%@page import="com.entity.User"%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@page errorPage="error.jsp" %>

<%
    User user = (User) session.getAttribute("userObj");

    if (user == null) {
        response.sendRedirect("../signin.jsp");
    }
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EBook System - <%= user.getName()%></title>

        <%@include file="../admin/link/all_links.jsp" %>

        <style>
            body
            {
                background: url('../img/admin-profile-bg-img.jpg');
                background-size: cover;
                background-attachment: fixed;
            }

            a
            {
                text-decoration: none;
                color: #000000;
            }
            a:hover
            {
                text-decoration: none;
                color: #000000;
            }
        </style>

    </head>
    <body>

        <!--  Using JSDL for Success Message Start  -->
<!--        <c:if test="${empty userObj}">
            <c:redirect url="../signin.jsp" />
        </c:if>-->
        <!--  Using JSDL for Success Message End  -->
        
        
        <!--  For Navbar Start  -->
        <%@include file="../admin/navbar.jsp" %>
        <!--  For Navbar End  -->
        

        <div class="container">
            <div class="row mt-3 mb-3">
                <div class="col-md-6 offset-md-3">
                    <h3 class="text-center text-white">Welcome <%= user.getName()%></h3>
                </div>
            </div>
        </div>


        <div class="container">
            <div class="row p-5">
                <div class="col-md-3 mb-3">
                    <a href="add_books.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-square-plus fa-3x text-primary"></i> <br>
                                <h4>Add Books</h4>
                                <h2>-----</h2>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-3 mb-3">
                    <a href="all_books.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-book-open fa-3x text-success"></i> <br>
                                <h4>All Books</h4>
                                <h2>-----</h2>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-3 mb-3">
                    <a href="orders.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-box-open fa-3x text-warning"></i> <br>
                                <h4>Orders</h4>
                                <h2>-----</h2>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-3 mb-3">
                    <a data-toggle="modal" data-target="#exampleModal" href="">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-right-from-bracket fa-3x text-danger"></i> <br>
                                <h4>Logout</h4>
                                <h2>-----</h2>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>


        <!--  Footer Part Start  -->
        <div style="margin-top: 245px;">
            <%@include file="../footer.jsp" %>
        </div>
        <!--  Footer Part End  -->

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
        
    </body>
</html>
