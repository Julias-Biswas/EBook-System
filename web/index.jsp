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

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%            if (user == null) {
        %>
        <title>EBook - Home Page</title>
        <%
        } else {
        %>
        <title>EBook - Home Page (<%= user.getName()%>)</title>
        <%
            }
        %>


        <%@include file="link/all_links.jsp" %>

        <style>
            .back-img
            {
                height: 80vh;
                background-repeat: no-repeat;
                background-size: cover;
            }

            video
            {
                width: 100%;
                object-fit: cover;
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

        <%                    }
            }
        %>
        <!--  For Navbar End  -->


        <!--  Set Video in index/home Page Start  -->
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <video class="d-block w-100 back-img" autoplay="" loop="" muted="">
                        <source src="video/slide_video_one.mp4">
                    </video>
                </div>
                <div class="carousel-item">
                    <video class="d-block w-100 back-img" autoplay="" loop="" muted="">
                        <source src="video/slide_video_two.mp4">
                    </video>
                </div>
                <div class="carousel-item">
                    <video class="d-block w-100 back-img" autoplay="" loop="" muted="">
                        <source src="video/slide_video_three.mp4">
                    </video>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <!--  Set Video in index/home Page End  --> 

        <!--  View All Categories Recent Books Start  -->
        <div class="container-fluid">
            <h3 class="text-center my-3">Recent Books</h3>
            <div class="row p-3">

                <%
                    BookDaoClass bookDaoClass2 = new BookDaoClass(DBConnect.getConnection());

                    List<BookDetails> list2 = bookDaoClass2.getRecentBooks();

                    for (BookDetails bookDetails2 : list2) {
                %>

                <div class="col-md-3 d-flex">
                    <div class="card crd-ho" style="width: 18rem;">
                        <div class="card-header text-center">
                            <img class="card-img-top" src="books/<%= bookDetails2.getPhoto()%>" alt="Card image cap" style="width: 100%; height: 250px;" />
                        </div>
                        <div class="card-body text-center" style="color: #000000;">
                            <h5 class="card-title"><%= bookDetails2.getBookName()%></h5>
                            <p class="card-text"><%= bookDetails2.getAuthor()%></p>
                            <p class="card-text text-success">Category : <%= bookDetails2.getBookCategory()%></p>
                        </div>
                        <div class="card-footer text-center">
                            <%
                                if (!bookDetails2.getBookCategory().equals("Old Book")) {

                                    if (user == null ? user == null : user.equals("null")) {
                            %>

                            <a href="signin.jsp" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-plus"></i> Add Card</a>

                            <%
                            } else {
                            %>

                            <a href="CardServlet?v=<%= bookDetails2.getBookId()%>&list=<%= bookDetails2.getAuthor()%>&link=<%= bookDetails2.getBookCategory()%>&ratio=<%= user.getId()%>" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-plus"></i> Add Card</a>

                            <%
                                    }
                                }
                            %>

                            <a href="view_books.jsp?v=<%= bookDetails2.getBookId()%>&list=<%= bookDetails2.getAuthor()%>&index=<%= bookDetails2.getBookCategory()%>" class="btn btn-success btn-sm"><i class="fa-solid fa-eye"></i> View</a>
                            <button class="btn btn-primary btn-sm"><i class="fa-solid fa-indian-rupee-sign"></i> <%= bookDetails2.getPrice()%></button>
                        </div>
                    </div>
                </div>

                <%
                    }
                %>


            </div>
            <div class="text-center my-3">
                <a href="all_recent_books.jsp" class="btn btn-info"><i class="fa-solid fa-eye"></i> View All Books</a>
            </div>
        </div>
        <!--  View All Categories Recent Books End  -->

        <hr>

        <!--  View All Categories New Books Start  -->
        <div class="container-fluid">
            <h3 class="text-center my-3">New Books</h3>
            <div class="row p-3">

                <%
                    BookDaoClass bookDaoClass = new BookDaoClass(DBConnect.getConnection());

                    List<BookDetails> list = bookDaoClass.getNewBooks();

                    for (BookDetails bookDetails : list) {
                %>


                <div class="col-md-3 d-flex">
                    <div class="card crd-ho" style="width: 18rem;">
                        <div class="card-header text-center">
                            <img class="card-img-top" src="books/<%= bookDetails.getPhoto()%>" alt="Card image cap" style="width: 100%; height: 250px;" />
                        </div>
                        <div class="card-body text-center" style="color: #000000;">
                            <h5 class="card-title"><%= bookDetails.getBookName()%></h5>
                            <p class="card-text"><%= bookDetails.getAuthor()%></p>
                            <p class="card-text text-info">Category : <%= bookDetails.getBookCategory()%></p>
                        </div>
                        <div class="card-footer text-center">

                            <%
                                if (user == null ? user == null : user.equals("null")) {
                            %>

                            <a href="signin.jsp" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-plus"></i> Add Card</a>

                            <%
                            } else {
                            %>

                            <a href="CardServlet?v=<%= bookDetails.getBookId()%>&list=<%= bookDetails.getAuthor()%>&link=<%= bookDetails.getBookCategory()%>&ratio=<%= user.getId()%>" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-plus"></i> Add Card</a>

                            <%
                                }
                            %>

                            <a href="view_books.jsp?v=<%= bookDetails.getBookId()%>&list=<%= bookDetails.getAuthor()%>&index=<%= bookDetails.getBookCategory()%>" class="btn btn-success btn-sm"><i class="fa-solid fa-eye"></i> View</a>
                            <button class="btn btn-primary btn-sm"><i class="fa-solid fa-indian-rupee-sign"></i> <%= bookDetails.getPrice()%></button>
                        </div>
                    </div>
                </div>


                <%
                    }
                %>

            </div>
            <div class="text-center my-3">
                <a href="all_new_books.jsp" class="btn btn-info"><i class="fa-solid fa-eye"></i> View All Books</a>
            </div>
        </div>
        <!--  View All Categories New Books End  -->

        <hr>

        <!--  View All Categories Old Books Start  -->
        <div class="container-fluid">
            <h3 class="text-center my-3">Old Books</h3>
            <div class="row p-3">

                <%
                    BookDaoClass bookDaoClass3 = new BookDaoClass(DBConnect.getConnection());

                    List<BookDetails> list3 = bookDaoClass3.getOldBooks();

                    for (BookDetails bookDetails3 : list3) {
                %>

                <div class="col-md-3 d-flex">
                    <div class="card crd-ho" style="width: 18rem;">
                        <div class="card-header text-center">
                            <img class="card-img-top" src="books/<%= bookDetails3.getPhoto()%>" alt="Card image cap" style="width: 100%; height: 250px;" />
                        </div>
                        <div class="card-body text-center" style="color: #000000;">
                            <h5 class="card-title"><%= bookDetails3.getBookName()%></h5>
                            <p class="card-text"><%= bookDetails3.getAuthor()%></p>
                            <p class="card-text text-danger">Category : <%= bookDetails3.getBookCategory()%></p>
                        </div>
                        <div class="card-footer text-center">
                            <a href="view_books.jsp?v=<%= bookDetails3.getBookId()%>&list=<%= bookDetails3.getAuthor()%>&index=<%= bookDetails3.getBookCategory()%>" class="btn btn-success btn-sm"><i class="fa-solid fa-eye"></i> View</a>
                            <button class="btn btn-primary btn-sm"><i class="fa-solid fa-indian-rupee-sign"></i> <%= bookDetails3.getPrice()%></button>
                        </div>
                    </div>
                </div>

                <%
                    }
                %>


            </div>
            <div class="text-center my-3">
                <a href="all_old_books.jsp" class="btn btn-info"><i class="fa-solid fa-eye"></i> View All Books</a>
            </div>
        </div>
        <!--  View All Categories Old Books End  -->

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

        <!--  JavaScript Code End  -->


    </body>
</html>
