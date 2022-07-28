<%-- 
    Document   : index
    Created on : 9 Jun, 2022, 11:11:23 AM
    Author     : julia
--%>

<%@page import="com.entity.BookOrder"%>
<%@page import="com.dao.OrderDaoClass"%>
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

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EBook - My Orders</title>

        <%@include file="link/all_links.jsp" %>

        <style>
            .back-img
            {
                background-image: url('img/all-order-bg-img.jpg');
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

            /*  Anchor Tag Design Start  */
            .anchor
            {
                color: #000000;
                font-size: 22px;
                font-weight: 600;
                text-decoration: none;
            }
            .anchor:hover
            {
                color: #3333ff;
                text-decoration: none;
            }
            /*  Anchor Tag Design End  */
            
            /*  Total Amount, Price Design Start  */
            .total-price
            {
                font-size: 18px;
                font-weight: 500;
            }
            /*  Total Amount, Price Design End  */
            
            /*  Setting Card Anchor Start  */
            a
            {
                color: #000000;
                text-decoration: none;
            }
            a:hover
            {
                color: #000000;
                text-decoration: none;
            }
            /*  Setting Card Anchor End  */

            /*  Check Box and Check Text design Start  */
            /* The container */
            .container {
                display: block;
                position: relative;
                padding-left: 35px;
                margin-bottom: 12px;
                cursor: pointer;
                font-size: 22px;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
            }

            /* Hide the browser's default checkbox */
            .container input {
                position: absolute;
                opacity: 0;
                cursor: pointer;
                height: 0;
                width: 0;
            }

            /* Create a custom checkbox */
            .checkmark {
                position: absolute;
                top: 0;
                left: 0;
                height: 25px;
                width: 25px;
                background-color: #eee;
            }

            /* On mouse-over, add a grey background color */
            .container:hover input ~ .checkmark {
                background-color: #ccc;
            }

            /* When the checkbox is checked, add a blue background */
            .container input:checked ~ .checkmark {
                background-color: #2196F3;
            }

            /* Create the checkmark/indicator (hidden when not checked) */
            .checkmark:after {
                content: "";
                position: absolute;
                display: none;
            }

            /* Show the checkmark when checked */
            .container input:checked ~ .checkmark:after {
                display: block;
            }

            /* Style the checkmark/indicator */
            .container .checkmark:after {
                left: 9px;
                top: 5px;
                width: 5px;
                height: 10px;
                border: solid white;
                border-width: 0 3px 3px 0;
                -webkit-transform: rotate(45deg);
                -ms-transform: rotate(45deg);
                transform: rotate(45deg);
            }
            /*  Check Box and Check Text design End  */

        </style>

    </head>
    <body style="background-color: #f0f1f2;">

        <!--  Scroll Button Start  -->
        <i onclick="topFunction()" id="myBtn" title="Go to Top" class="fa-solid fa-arrow-up"></i>
        <!--  Scroll Button End  -->
        
        
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
        
        
        <!--  View User Orders Start  -->
        <div class="container-fluid">
            <div class="row mt-5">
                <div class="col-md-3">
                    <div class="card mb-2">
                        <div class="card-body">
                            <h4>Filters</h4>
                            <hr>
                            <h6 class="mt-3 mb-3">ORDER STATUS</h6>
                            <label class="container">On the way
                                <input type="checkbox">
                                <span class="checkmark"></span>
                            </label>
                            <label class="container">Delivered
                                <input type="checkbox">
                                <span class="checkmark"></span>
                            </label>
                            <label class="container">Cancelled
                                <input type="checkbox">
                                <span class="checkmark"></span>
                            </label>
                            <label class="container">Returned
                                <input type="checkbox">
                                <span class="checkmark"></span>
                            </label>


                            <h6 class="mt-3 mb-3">ORDER TIME</h6>
                            <label class="container">Last 30 days
                                <input type="checkbox">
                                <span class="checkmark"></span>
                            </label>
                            <label class="container">2022
                                <input type="checkbox">
                                <span class="checkmark"></span>
                            </label>
                            <label class="container">2021
                                <input type="checkbox">
                                <span class="checkmark"></span>
                            </label>
                            <label class="container">2020
                                <input type="checkbox">
                                <span class="checkmark"></span>
                            </label>
                            <label class="container">Older
                                <input type="checkbox">
                                <span class="checkmark"></span>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-md-9">

                    <!--  For Search Your Order Here Start  -->
                    <div class="form-inline">
                        <input class="form-control mr-sm-2" style="width: 80%;" type="search" placeholder="Search your orders here" aria-label="Search">
                        <button class="btn btn-primary my-2 mt-2 my-sm-0" style="float: right;" type="submit"><i class="fa-solid fa-magnifying-glass"></i> Search Orders</button>
                    </div>
                    <!--  For Search Your Order Here Start  -->


                    <%
                        OrderDaoClass orderDaoClass = new OrderDaoClass(DBConnect.getConnection());

                        List<BookOrder> bookList = orderDaoClass.getPerticularUserAllBooks(user.getEmail());

                        if (bookList.isEmpty()) {
                    %>

                    <div class="card mt-2">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <i class="fa-solid fa-face-sad-cry fa-3x"></i>
                                    <h4>Your Order is empty!</h4>
                                    <h6>It's a good day to buy the items you saved for later!</h6>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%
                    } else {
                        for (BookOrder bookOrder : bookList) {

                            /*  For get Posted Book User Name Start  */
                            BookDaoClass bookDaoClass = new BookDaoClass(DBConnect.getConnection());

                            BookDetails bookDetails = bookDaoClass.editBookDetails(bookOrder.getBookId(), bookOrder.getAuthor(), bookOrder.getBookCategory());

                            String userEmail = bookDetails.getUserEmail();

                            UserDaoClass userDaoClass = new UserDaoClass(DBConnect.getConnection());

                            User userDetails = userDaoClass.getUserModule(userEmail);
                            /*  For get Posted Book User Name End  */
                    %>

                    <div class="card mt-2">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-2">
                                    <a href="view_books.jsp?v=<%= bookOrder.getBookId()%>&list=<%= bookOrder.getAuthor()%>&index=<%= bookOrder.getBookCategory()%>" target="_blank">
                                        <img class="card-img-top mb-3" src="books/<%= bookOrder.getBookPhoto()%>" alt="Card image cap" style="width: 100%; height: 170px;" />
                                    </a>
                                    <br>
                                    <span style="color: #b2b0b0;">14 Days Return Policy</span>
                                </div>
                                <div class="col-md-6">
                                    <a href="view_books.jsp?v=<%= bookOrder.getBookId()%>&list=<%= bookOrder.getAuthor()%>&index=<%= bookOrder.getBookCategory()%>" class="anchor" target="_blank"><h3 class="card-subtitle mb-2 mt-2"><%= bookOrder.getBookName()%></h3></a>
                                    <h6><%= bookOrder.getAuthor()%>, <%= bookOrder.getBookCategory()%></h6>
                                    <h6 class="mt-1">Seller : <%= userDetails.getName()%></h6>
                                    <h6 class="mt-1">Payment : <%= bookOrder.getPayment()%></h6>
                                    <h4 class="card-text mt-3"><i class="fa-solid fa-indian-rupee-sign"></i> <%= bookOrder.getPrice()%></h4>
                                </div>
                                <div class="col-md-4">
                                    <h5 class="mt-3">Delivery Address</h5>
                                    <h6 class="mt-3"><%= bookOrder.getUserName()%></h6>
                                    <span>

                                        <%
                                            if (bookOrder.getLandmark().equals("")) {
                                        %>

                                        <%= bookOrder.getAddress()%>, <%= bookOrder.getCityDistictTown()%> - <%= bookOrder.getPinCode()%>, <%= bookOrder.getState()%>

                                        <%
                                        } else {
                                        %>

                                        <%= bookOrder.getAddress()%>, <%= bookOrder.getLandmark()%>, <%= bookOrder.getCityDistictTown()%> - <%= bookOrder.getPinCode()%>, <%= bookOrder.getState()%>

                                        <%
                                            }
                                        %>

                                    </span>
                                    <h6 class="mt-3">Phone number</h6>
                                    <span>
                                        <%
                                            if (bookOrder.getUserAlternativePhno().equals("")) {
                                        %>

                                        <%= bookOrder.getUserPhno()%>

                                        <%
                                        } else {
                                        %>

                                        <%= bookOrder.getUserPhno()%>, <%= bookOrder.getUserAlternativePhno()%>

                                        <%
                                            }
                                        %>

                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%                                    }
                        }

                    %>

                </div>
            </div>
        </div>
        <!--  View User Orders End  -->


        <br><br>


        <!--  For Footer Start  -->
        <%@include file="footer.jsp" %>
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
