<%-- 
    Document   : all_books
    Created on : 30 Jun, 2022, 3:54:26 PM
    Author     : julia
--%>

<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.BookDaoClass"%>
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
        <title>EBook System - All Books</title>

        <%@include file="../admin/link/all_links.jsp" %>


        <style>
            body
            {
                background: url('../img/all-book-bg-img.jpg');
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
            <div class="row mt-3">
                <div class="col-md-6 offset-md-3">
                    <h3 class="text-center text-white">Hello, <%= user.getName()%></h3>
                </div>
            </div>
        </div>
        
        
        <!--  Using JSDL for Success Message Start  -->
        <c:if test="${not empty successMsg}">
            <h5 class="text-center text-warning p-2">${successMsg}</h5>
            <%
                session.removeAttribute("successMsg");
            %>
        </c:if>
        <!--  Using JSDL for Success Message End  -->

        <!--  Using JSDL for Error Message Start  -->
        <c:if test="${not empty errMsg}">
            <h5 class="text-center text-danger p-2">${errMsg}</h5>
            <%
                session.removeAttribute("errMsg");
            %>
        </c:if>
        <!--  Using JSDL for Error Message End  -->
        
        
        <table class="table table-striped table-hover table-bordered">
            <thead class="bg-success text-white">
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Book Image</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author Name</th>
                    <th scope="col">Price</th>
                    <th scope="col">Book Categories</th>
                    <th scope="col">Book Status</th>
                    <th scope="col">Book Action</th>
                </tr>
            </thead>
            <tbody class="text-white">

                <%
                    BookDaoClass bookDaoClass = new BookDaoClass(DBConnect.getConnection());

                    List<BookDetails> list = bookDaoClass.getAllBooks(user.getEmail());

                    for (BookDetails bookDetails : list) {
                %>

                <tr>
                    <th scope="row"><%= bookDetails.getBookId()%></th>
                    <td class="text-center"><img src="../books/<%= bookDetails.getPhoto()%>" height="70" width="70" style="background: #ffffff; border: 0.5px solid #ffffff; border-radius: 5px;" /></td>
                    <td><%= bookDetails.getBookName()%></td>
                    <td><%= bookDetails.getAuthor()%></td>
                    <td><%= bookDetails.getPrice()%></td>
                    <td><%= bookDetails.getBookCategory()%></td>
                    <td><%= bookDetails.getBookStatus()%></td>
                    <td>
                        <a href="edit_books.jsp?v=<%= bookDetails.getBookId()%>&start_radio=<%= bookDetails.getAuthor()%>&link=<%= bookDetails.getBookCategory()%>" class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i> Edit</a>
                        <a href="../DeleteBooks?v=<%= bookDetails.getBookId()%>&start_radio=<%= bookDetails.getAuthor()%>&link=<%= bookDetails.getBookCategory()%>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i> Delete</a>
                    </td>
                </tr>

                <%
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
