<%-- 
    Document   : add_books
    Created on : 30 Jun, 2022, 3:48:02 PM
    Author     : julia
--%>

<%@page import="com.entity.BookDetails"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.BookDaoClass"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@page errorPage="error.jsp" %>

<%
    User user = (User) session.getAttribute("userObj");

    if (user == null) {
        response.sendRedirect("../signin.jsp");
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
        <title>EBook System - Edit Books</title>

        <%@include file="../admin/link/all_links.jsp" %>

        <style>
            body
            {
                background: url('../img/add-book-bg-img.jpg');
                background-size: cover;
                background-attachment: fixed;
            }
        </style>

    </head>
    <body>
        <!--  For Navbar Start  -->
        <%@include file="../admin/navbar.jsp" %>
        <!--  For Navbar End  -->
        
        
        <!--  For Update New Book Details Start  -->
        <div class="container">
            <div class="row mt-5">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center primary-background text-white">
                            <i class="fa-solid fa-square-pen fa-3x"></i>
                            <h3>Edit Books</h3>
                        </div>
                        <div class="card-body">
                            <form id="edit-book-form" action="../EditBooks" method="POST">
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
        <!--  For Update New Book Details Start  -->
        
        
        <br><br>

        <!--  Footer Part Start  -->
        <%@include file="../footer.jsp" %>
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
