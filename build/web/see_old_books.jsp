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

    if (user == null) {
        response.sendRedirect("signin.jsp");
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EBook - See Old Book</title>

        <%@include file="link/all_links.jsp" %>

        <style>
            body
            {
                background-image: url('img/all-book-bg-img.jpg');
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

        </style>

    </head>
    <body style="background-color: #f7f7f7;">

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


        <!--  Using JSDL for Success Message Start  -->
        <c:if test="${not empty successMsg}">
            <h5 class="text-center text-warning mt-3">${successMsg}</h5>
            <%
                session.removeAttribute("successMsg");
            %>
        </c:if>
        <!--  Using JSDL for Success Message End  -->

        <!--  Using JSDL for Error Message Start  -->
        <c:if test="${not empty errMsg}">
            <h5 class="text-center text-danger mt-3">${errMsg}</h5>
            <%
                session.removeAttribute("errMsg");
            %>
        </c:if>
        <!--  Using JSDL for Error Message End  -->


        <!--  See Old Book Form Start  -->
        <table class="table table-striped table-hover table-bordered mt-3">
            <thead class="bg-success text-white">
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Book Image</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author Name</th>
                    <th scope="col">Price</th>
                    <th scope="col">Book Category</th>
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
                    <td class="text-center"><img src="books/<%= bookDetails.getPhoto()%>" height="70" width="70" style="background: #ffffff; border: 0.5px solid #ffffff; border-radius: 5px;" /></td>
                    <td><%= bookDetails.getBookName()%></td>
                    <td><%= bookDetails.getAuthor()%></td>
                    <td><%= bookDetails.getPrice()%></td>
                    <td><%= bookDetails.getBookCategory()%></td>
                    <td><%= bookDetails.getBookStatus()%></td>
                    <td>
                        <a href="edit_old_books.jsp?v=<%= bookDetails.getBookId() %>&start_radio=<%= bookDetails.getAuthor() %>&link=<%= bookDetails.getBookCategory() %>" class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i> Edit</a>
                        <a href="DeleteOldBookServlet?v=<%= bookDetails.getBookId()%>&list=<%= bookDetails.getAuthor()%>&link=<%= bookDetails.getBookCategory()%>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i> Delete</a>
                    </td>
                </tr>

                <%
                    }
                %>

            </tbody>
        </table>
        <!--  See Old Book Form End  -->                        


        <br><br>


        <!--  For Footer Start  -->
        <div style="margin-top: 457px;">
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
        
        <!--  JavaScript Code End  -->
        
        
    </body>
</html>
