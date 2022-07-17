<%-- 
    Document   : index
    Created on : 9 Jun, 2022, 11:11:23 AM
    Author     : julia
--%>

<%@page import="com.dao.UserDaoClass"%>
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


%>

<%    int bookId = Integer.parseInt(request.getParameter("v"));
    String authorName = request.getParameter("list");
    String bookCategory = request.getParameter("index");

    //out.print(bookId+"\n"+authorName+"\n"+bookCategory);
    BookDaoClass bookDaoClass = new BookDaoClass(DBConnect.getConnection());

    BookDetails bookDetails = bookDaoClass.editBookDetails(bookId, authorName, bookCategory);

    String userEmail = bookDetails.getUserEmail();

    //out.print(userEmail);
    UserDaoClass userDaoClass = new UserDaoClass(DBConnect.getConnection());

    User userDetails = userDaoClass.getUserModule(userEmail);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EBook - <%= bookDetails.getBookName()%></title>

        <%@include file="link/all_links.jsp" %>

        <style>
            /*  Show Book Image in Modal Start  */
            .div-header
            {
                cursor: pointer;
            }
            /*  Show Book Image in Modal End  */

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
    <body style="background-color: #ffffff;">

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
        

        <!--  View Perticular Books by using Book Id , Author Name and Book Category Start  -->
        <div class="container-fluid p-3">
            <div class="row p-3">
                <div class="col-md-5">
                    <div class="div-header border">
                        <!--<span class="rounded-circle fa-2x text-dark text-right" style=""><i class="fa-solid fa-heart"></i></span>-->
                        <img data-toggle="modal" data-target=".bd-example-modal-lg" class="card-img-top border-0 p-3" src="books/<%= bookDetails.getPhoto()%>" alt="Card image cap" width="100%" height="500px" />
                    </div>
                    <div class="container text-center p-3">

                        <%
                            if ("Old Book".equals(bookDetails.getBookCategory())) {
                        %>

                        <a data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-warning btn-lg text-white"><i class="fa-solid fa-phone"></i> CONTACT TO SELLER</a>
                        <a href="index.jsp" class="btn btn-info btn-lg text-white"><i class="fa-solid fa-cart-shopping"></i> CONTINUE SHOPPING</a>

                        <%
                        } else {

                            if (user == null ? user == null : user.equals("null")) {
                        %>

                        <a href="signin.jsp" class="btn btn-warning btn-lg text-white"><i class="fa-solid fa-cart-plus"></i> ADD TO CARD</a>
                        <a href="signin.jsp" class="btn btn-info btn-lg text-white"><i class="fa-solid fa-bolt-lightning"></i> BUY NOW</a>

                        <%
                        } else {
                        %>

                        <a href="CardServlet?v=<%= bookDetails.getBookId()%>&list=<%= bookDetails.getAuthor()%>&link=<%= bookDetails.getBookCategory()%>&ratio=<%= user.getId()%>" class="btn btn-warning btn-lg text-white"><i class="fa-solid fa-cart-plus"></i> ADD TO CARD</a>
                        <a href="CardServlet?v=<%= bookDetails.getBookId()%>&list=<%= bookDetails.getAuthor()%>&link=<%= bookDetails.getBookCategory()%>&ratio=<%= user.getId()%>" class="btn btn-info btn-lg text-white"><i class="fa-solid fa-bolt-lightning"></i> BUY NOW</a>

                        <%
                                }
                            }
                        %>

                    </div>
                </div>
                <div class="col-md-7">
                    <h2><%= bookDetails.getBookName()%></h2>
                    <h4>Author Name : <span class="text-success"><%= bookDetails.getAuthor()%></span></h4>
                    <h4>Book Category : <span class="text-success"><%= bookDetails.getBookCategory()%></span></h4>
                    <h2><i class="fa-solid fa-indian-rupee-sign"></i> <%= bookDetails.getPrice()%></h2>

                    <br>

                    <span style="color: #999999;"> <h5>Available offers</h5></span>
                    <h5><i class="fa-solid fa-tag text-success"></i> Cash On Delivery</h5>
                    <h5><i class="fa-solid fa-tag text-success"></i> No Cost EMI</h5>
                    <h5><i class="fa-solid fa-tag text-success"></i> 14 Days Return Policy</h5>
                    <h5><i class="fa-solid fa-tag text-success"></i> 7 Days Seller Replacement Policy</h5>
                    <h5><i class="fa-solid fa-tag text-success"></i> GST Invoice Available</h5>
                    <h5><i class="fa-solid fa-tag text-success"></i> Free Delivery Available</h5>

                    <br>

                    <span style="color: #999999;"><h5>Seller Details</h5></span>
                    <h5>Name : <%= userDetails.getName()%></h5>
                    <h5>Email : <%= bookDetails.getUserEmail()%> </h5>
                    <h5>Phone No : <%= userDetails.getPhno()%></h5>

                    <br><br>

                    <span style="color: #999999;"><h5>Extra Information</h5></span>
                    <div class="row">
                        <div class="col-md-4 text-primary text-center p-2">
                            <i class="fa-solid fa-money-bill-1-wave fa-3x"></i>
                            <b><p>Cash On Delivery</p></b>
                        </div>
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fa-solid fa-arrow-rotate-left fa-3x"></i>
                            <b><p>Return Available</p></b>
                        </div>
                        <div class="col-md-4 text-success text-center p-2">
                            <i class="fa-solid fa-truck fa-3x"></i>
                            <b><p>Free Delivery</p></b>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--  View Perticular Books by using Book Id , Author Name and Book Category End  -->


        <!--  Contact To Seller Modal Start  -->
        <!-- Modal -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white">
                        <h5 class="modal-title" id="exampleModalLongTitle">CONTACT TO SELLER</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h5>Name : <span class="text-success"><%= userDetails.getName()%></span></h5>
                        <h5>Email : <span class="text-success"><%= bookDetails.getUserEmail()%></span></h5>
                        <h5>Phone No : <span class="text-success"><%= userDetails.getPhno()%></span></h5>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Ok</button>
                    </div>
                </div>
            </div>
        </div>
        <!--  Contact To Seller Modal End  -->


        <!--  Image Zoom Modal Start  -->
        <!-- Large modal -->
        <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <img class="card-img-top border-0 p-3" src="books/<%= bookDetails.getPhoto()%>" alt="Card image cap" width="100%" height="700px" />
                </div>
            </div>
        </div>
        <!--  Image Zoom Modal End  -->

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
