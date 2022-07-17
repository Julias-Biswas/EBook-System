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
<%@page isELIgnored="false" %>

<%
    User user = (User) session.getAttribute("userObj");


%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EBook - All New Books</title>

        <%@include file="link/all_links.jsp" %>

        <style>
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

            /*  SnackBar / Toast Message Design Start  */
/*            #snackbar {
                visibility: hidden;
                min-width: 250px;
                margin-left: -125px;
                background-color: #333;
                color: #fff;
                text-align: center;
                border-radius: 2px;
                padding: 16px;
                position: fixed;
                z-index: 1;
                left: 50%;
                bottom: 30px;
                font-size: 17px;
            }

            #snackbar.show {
                visibility: visible;
                -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
                animation: fadein 0.5s, fadeout 0.5s 2.5s;
            }

            @-webkit-keyframes fadein {
                from {bottom: 0; opacity: 0;} 
                to {bottom: 30px; opacity: 1;}
            }

            @keyframes fadein {
                from {bottom: 0; opacity: 0;}
                to {bottom: 30px; opacity: 1;}
            }

            @-webkit-keyframes fadeout {
                from {bottom: 30px; opacity: 1;} 
                to {bottom: 0; opacity: 0;}
            }

            @keyframes fadeout {
                from {bottom: 30px; opacity: 1;}
                to {bottom: 0; opacity: 0;}
            }*/
            /*  SnackBar / Toast Message Design End  */

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
            <div id="snackbar">${successMsg}</div>

            <script>
                myFunction();
                function myFunction() {
                    var x = document.getElementById("snackbar");
                    x.className = "show";
                    setTimeout(function () {
                        x.className = x.className.replace("show", "");
                    }, 3000);
                }
            </script>

            <%
                session.removeAttribute("successMsg");
            %>
        </c:if>
        <!--  Using JSDL for Success Message End  -->

        <!--  Using JSDL for Error Message Start  -->
        <c:if test="${not empty errMsg}">
            <div id="snackbar">${errMsg}</div>

            <script>
                myFunction();
                function myFunction() {
                    var x = document.getElementById("snackbar");
                    x.className = "show";
                    setTimeout(function () {
                        x.className = x.className.replace("show", "");
                    }, 3000);
                }
            </script>

            <%
                session.removeAttribute("errMsg");
            %>
        </c:if>
        <!--  Using JSDL for Error Message End  -->


        <!--  View All Categories New Books Start  -->
        <div class="container-fluid">
            <h3 class="text-center my-3">All New Books</h3>
            <div class="row p-3">

                <%
                    BookDaoClass bookDaoClass = new BookDaoClass(DBConnect.getConnection());

                    List<BookDetails> list = bookDaoClass.getAllNewBooks();

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
        </div>
        <!--  View All Categories New Books End  -->

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