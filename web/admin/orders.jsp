<%-- 
    Document   : all_books
    Created on : 30 Jun, 2022, 3:54:26 PM
    Author     : julia
--%>

<%@page import="com.entity.BookOrder"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookDaoClass"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.OrderDaoClass"%>
<%@page import="com.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>EBook System - All Orders</title>

        <%@include file="../admin/link/all_links.jsp" %>

        <style>
            body
            {
                background: url('../img/all-order-bg-img.jpg');
                background-size: cover;
                background-attachment: fixed;
            }
        </style>

    </head>
    <body>
        <!--  For Navbar Start  -->
        <%@include file="../admin/navbar.jsp" %>
        <!--  For Navbar End  -->


        <div class="container">
            <div class="row mt-3 mb-3">
                <div class="col-md-6 offset-md-3">
                    <h3 class="text-center text-white">Hello, <%= user.getName()%></h3>
                </div>
            </div>
        </div>


        <table class="table table-striped table-hover table-bordered">
            <thead class="bg-success text-white">
                <tr>
                    <th scope="col">Order Id</th>
                    <th scope="col">User Name</th>
                    <th scope="col">User Email</th>
                    <th scope="col">User Address</th>
                    <th scope="col">User Phone No</th>
                    <th scope="col">Book Image</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author</th>
                    <th scope="col">Price</th>
                    <th scope="col">Order Time</th>
                    <th scope="col">Payment</th>
                </tr>
            </thead>
            <tbody class="text-white">

                <%
                    BookDaoClass bookDaoClass = new BookDaoClass(DBConnect.getConnection());

                    List<BookDetails> bookDetailsList = bookDaoClass.getAllBooks(user.getEmail());

                    if (bookDetailsList.isEmpty()) {
                        /*  Admin has not posted atleast one book  */
                %>

            <p class="text-center text-white">You haven't posted any book yet...</p>

            <%
            } else {
                for (BookDetails bookDetails : bookDetailsList) {
                    OrderDaoClass orderDaoClass = new OrderDaoClass(DBConnect.getConnection());

                    List<BookOrder> bookOrderList = orderDaoClass.getPerticularAdminAllBooks(bookDetails.getBookId());

                    if (bookOrderList.isEmpty()) {
                        /*  User has not order atleast one book  */
            %>

            <!--<p class="text-center text-white">No user yet ordered any book you posted...</p>-->

            <%
            } else {
                for (BookOrder bookOrder : bookOrderList) {
            %>

            <tr>
                <th scope="row"><%= bookOrder.getOrderId()%></th>
                <td><%= bookOrder.getUserName()%></td>
                <td><%= bookOrder.getUserEmail()%></td>
                <%
                    if (bookOrder.getLandmark().equals("")) {
                %>

                <td><%= bookOrder.getAddress()%>, <%= bookOrder.getCityDistictTown()%> - <%= bookOrder.getPinCode()%>, <%= bookOrder.getState()%></td>

                <%
                } else {
                %>

                <td><%= bookOrder.getAddress()%>, <%= bookOrder.getLandmark()%>, <%= bookOrder.getCityDistictTown()%> - <%= bookOrder.getPinCode()%>, <%= bookOrder.getState()%></td>

                <%
                    }
                %>

                <%
                    if (bookOrder.getUserAlternativePhno().equals("")) {
                %>

                <td><%= bookOrder.getUserPhno()%></td>

                <%
                } else {
                %>

                <td><%= bookOrder.getUserPhno()%>, <%= bookOrder.getUserAlternativePhno()%></td>

                <%
                    }
                %>

                <td class="text-center"><img src="../books/<%= bookDetails.getPhoto()%>" height="70" width="70" style="background: #ffffff; border: 0.5px solid #ffffff; border-radius: 5px;" /></td>
                <td><%= bookOrder.getBookName()%></td>
                <td><%= bookOrder.getAuthor()%></td>
                <td><%= bookOrder.getPrice()%></td>
                <td><%= bookOrder.getBookOrderTime()%></td>
                <td><%= bookOrder.getPayment()%></td>
            </tr>

            <%
                            }
                        }
                    }
                }

            %>

        </tbody>
    </table>


    <br><br><br>

    <!--  Footer Part Start  -->
    <div style="margin-top: 375px;">
        <%@include file="../footer.jsp" %>
    </div>
    <!--  Footer Part End  -->

    </body>
</html>
