<%-- 
    Document   : index
    Created on : 9 Jun, 2022, 11:11:23 AM
    Author     : julia
--%>

<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookDaoClass"%>
<%@page import="com.entity.User"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.db.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User user = (User) session.getAttribute("userObj");


%>

<%    String searchBooks = request.getParameter("searchBooks1");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EBook - Your Search Books Details</title>

        <%@include file="link/all_links.jsp" %>

        <style>
            .back-img
            {
                height: 80vh;
                background-repeat: no-repeat;
                background-size: cover;
            }

            .crd-ho:hover
            {
                background-color: #f7f7f7;
            }

            /*  Zoom image if user is going to image Start  */
            .card-header
            {
                width: 100%;
                height: 270px;
                overflow: hidden;
                margin: 0 auto;
            }
            .card-header img
            {
                width: 100%;
                transition: 1s all ease-in-out;
            }
            .card-header:hover img
            {
                transform: scale(1.5);
            }
            /*  Zoom image if user is going to image End  */

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


        <!--  View All Categories Recent Books Start  -->
        <div class="container-fluid">
            <h3 class="text-center my-3">Your Search Books Details</h3>
            <div class="row p-3">

                <%
                    BookDaoClass bookDaoClass = new BookDaoClass(DBConnect.getConnection());

                    List<BookDetails> list = bookDaoClass.getBookBySearch(searchBooks);

                    if (list.isEmpty()) {
                %>

                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card mt-2">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-12 text-center">
                                            <i class="fa-solid fa-face-sad-cry fa-4x"></i>
                                            <h3>Sorry! There is No Book with this Name in Our Store</h3>
                                            <h6>Please Search with Another Name!</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%
                } else {

                    for (BookDetails bookDetails : list) {
                %>

                <div class="col-md-3 d-flex">
                    <div class="card crd-ho mt-5" style="width: 18rem;">
                        <div class="card-header text-center">
                            <img class="card-img-top" src="books/<%= bookDetails.getPhoto()%>" alt="Card image cap" style="width: 100%; height: 250px;" />
                        </div>
                        <div class="card-body text-center" style="color: #000000;">
                            <h5 class="card-title"><%= bookDetails.getBookName()%></h5>
                            <p class="card-text"><%= bookDetails.getAuthor()%></p>
                            <p class="card-text text-success">Category : <%= bookDetails.getBookCategory()%></p>
                        </div>
                        <div class="card-footer text-center">
                            <%
                                if (!bookDetails.getBookCategory().equals("Old Book")) {

                                    if (user == null ? user == null : user.equals("null")) {
                            %>

                            <a href="signin.jsp" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-plus"></i> Add Card</a>

                            <%
                            } else {
                            %>

                            <a href="CardServlet?v=<%= bookDetails.getBookId()%>&list=<%= bookDetails.getAuthor()%>&link=<%= bookDetails.getBookCategory()%>&ratio=<%= user.getId()%>" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-plus"></i> Add Card</a>

                            <%
                                    }
                                }
                            %>

                            <a href="view_books.jsp?v=<%= bookDetails.getBookId()%>&list=<%= bookDetails.getAuthor()%>&index=<%= bookDetails.getBookCategory()%>" class="btn btn-success btn-sm"><i class="fa-solid fa-eye"></i> View</a>
                            <button class="btn btn-primary btn-sm"><i class="fa-solid fa-indian-rupee-sign"></i> <%= bookDetails.getPrice()%></button>
                        </div>
                    </div>
                </div>

                <%
                        }
                    }
                %>


            </div>
        </div>
        <!--  View All Categories Recent Books End  -->


        <br><br>

        <!--  For Footer Start  -->
        <div style="margin-top: 260px">
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
