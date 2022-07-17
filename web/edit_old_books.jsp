<%-- 
    Document   : add_books
    Created on : 30 Jun, 2022, 3:48:02 PM
    Author     : julia
--%>

<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.BookDaoClass"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>

<%
    User user = (User) session.getAttribute("userObj");

    if (user == null) {
        response.sendRedirect("signin.jsp");
    }
%>

<%
    int bookId = Integer.parseInt(request.getParameter("v"));
    String author = request.getParameter("start_radio");
    String bookCategory = request.getParameter("link");

    //out.print(bookId+"\n"+bookName+"\n"+author+"\n"+bookCategory);
    
    BookDaoClass bookDaoClass = new BookDaoClass(DBConnect.getConnection());

    BookDetails bookDetails = bookDaoClass.editBookDetails(bookId, author, bookCategory);

    //out.print(bookDetails);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EBook System - Edit Old Books</title>

        <%@include file="link/all_links.jsp" %>

        <style>
            body
            {
                background: url('img/add-book-bg-img.jpg');
                background-size: cover;
                background-attachment: fixed;
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
    <body>
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
        
        
        <!--  For Update Old Book Details Start  -->
        <div class="container">
            <div class="row mt-5">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center primary-background text-white">
                            <i class="fa-solid fa-square-pen fa-3x"></i>
                            <h3>Edit Old Books</h3>
                        </div>
                        <div class="card-body">
                            <form id="edit-book-form" action="EditOldBookServlet" method="POST">
                                <div class="form-group">
                                    <input type="number" name="bookId1" class="form-control" value="<%= bookDetails.getBookId() %>" style="display: none;"/>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="userEmail1" class="form-control" value="<%= user.getEmail() %>" style="display: none;"/>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1" class="text-success">Book Name<span class="text-danger">*</span></label>
                                    <input type="text" name="bookName1" class="form-control" id="exampleFormControlInput1" placeholder="" value="<%= bookDetails.getBookName()%>" required="">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1" class="text-success">Author Name<span class="text-danger">*</span></label>
                                    <input type="text" name="authorName1" class="form-control" id="exampleFormControlInput1" placeholder="" value="<%= bookDetails.getAuthor()%>" required="" readonly="">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1" class="text-success">Price<span class="text-danger">*</span></label>
                                    <input type="number" name="price1" class="form-control" id="exampleFormControlInput1" placeholder="" value="<%= bookDetails.getPrice()%>" required="">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlSelect2" class="text-success">Book Status<span class="text-danger">*</span></label>
                                    <select class="form-control" name="bookStatus1" id="exampleFormControlSelect2">
                                        <%
                                            if ("Active".equals(bookDetails.getBookStatus())) {
                                        %>
                                        <option selected="" value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                        <%
                                        } else {
                                        %>
                                        <option value="Active">Active</option>
                                        <option selected="" value="Inactive">Inactive</option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="container text-center" id="loader" style="display: none;">
                                    <span class="fa fa-refresh fa-spin fa-2x"></span>
                                    <h5>Please wait...</h5>
                                </div>
                                <div class="container text-center mt-3">
                                    <button id="submit-btn" type="submit" class="btn btn-primary">Save / Update</button>
                                </div>

                            </form>
                        </div>
                        <div class="card-footer">

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--  For Update Old Book Details End  -->

        <br><br>

        <!--  Footer Part Start  -->
        <%@include file="footer.jsp" %>
        <!--  Footer Part End  -->


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
