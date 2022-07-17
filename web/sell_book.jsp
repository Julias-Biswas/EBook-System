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
        <title>EBook - Sell Old Book</title>

        <%@include file="link/all_links.jsp" %>

        <style>
            body
            {
                background-image: url('img/setting-bg-img.jpg');
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
    <body style="background-color: #f0f1f2;">

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
        
        
        <!--  Sell Old Book Form Start  -->
        <div class="container">
            <div class="row mt-5">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center primary-background text-white">
                            <i class="fa-solid fa-book fa-3x"></i>
                            <h3>Sell Old Books</h3>
                        </div>
                        
                        
                        <!--  Using JSDL for Success Message Start  -->
                        <c:if test="${not empty successMsg}">
                            <h5 class="text-center text-success mt-2">${successMsg}</h5>
                            <%
                                session.removeAttribute("successMsg");
                            %>
                        </c:if>
                        <!--  Using JSDL for Success Message End  -->

                        <!--  Using JSDL for Error Message Start  -->
                        <c:if test="${not empty errMsg}">
                            <h5 class="text-center text-danger mt-2">${errMsg}</h5>
                            <%
                                session.removeAttribute("errMsg");
                            %>
                        </c:if>
                        <!--  Using JSDL for Error Message End  -->
                        
                        
                        <div class="card-body">
                            <form id="sell-book-form" action="SellOldBookServlet" method="POST" enctype="multipart/form-data">
                                <div class="form-group">
                                    <input type="text" name="userEmail1" class="form-control" value="<%= user.getEmail() %>" style="display: none;"/>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1" class="text-success">Book Name<span class="text-danger">*</span></label>
                                    <input type="text" name="bookName1" class="form-control" id="exampleFormControlInput1" placeholder="" required="">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1" class="text-success">Author Name<span class="text-danger">*</span></label>
                                    <input type="text" name="authorName1" class="form-control" id="exampleFormControlInput1" placeholder="" required="">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1" class="text-success">Price<span class="text-danger">*</span></label>
                                    <input type="number" name="price1" class="form-control" id="exampleFormControlInput1" placeholder="" required="">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlSelect1" class="text-success">Book Categories<span class="text-danger">*</span></label>
                                    <select class="form-control" name="bookCategories1" id="exampleFormControlSelect1">
                                        <option selected="" disabled="">---Select Book Category---</option>
                                        <option value="Old Book">Old Book</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlSelect2" class="text-success">Book Status<span class="text-danger">*</span></label>
                                    <select class="form-control" name="bookStatus1" id="exampleFormControlSelect2">
                                        <option selected="" disabled="">---Select Book Status---</option>
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPostImage1" class="text-success">Select Book Image<span class="text-danger">*</span></label>
                                    <input type="file" name="bookPic1" class="form-control" required=""/>
                                </div>
                                <div class="container text-center" id="loader" style="display: none;">
                                    <span class="fa fa-refresh fa-spin fa-2x"></span>
                                    <h5>Please wait...</h5>
                                </div>
                                <div class="container text-center mt-3">
                                    <button id="submit-btn" type="submit" class="btn btn-primary">Sell Old Book</button>
                                </div>
                            </form>
                        </div>
                        <div class="card-footer">

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--  Sell Old Book Form End  -->                        
        

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
        
        
        <!--     Bootstrap 4 JavaScript      -->
        <script
            src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        
        
        <!--  Successfully Old Book Added and Redirect to Add Book Page Start  -->
        <script>
            $(document).ready(function () {
                console.log("Loading...");

                $('#sell-book-form').on('submit', function (event) {
                    event.preventDefault();

                    let form = new FormData(this);

                    $("#submit-btn").hide();
                    $("#loader").show();
                    
                    /*  Send Request AddBooks Page  */
                    $.ajax({
                        url: "SellOldBookServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            
                            if( data.trim() === "Old Book Added Successfully..." )
                            {
                                swal("Good job!", "Old Book Added Successfully!","success").
                                    then((value) =>{
                                        window.location = "sell_book.jsp";
                                });
                                
                                $("#submit-btn").show();
                                $("#loader").hide();
                            }
                            else if( data.trim() === "Old Book Added Failed..." )
                            {
                                swal("Something went Wrong!", "Old Book Added Failed!", "error");
                                
                                $("#submit-btn").show();
                                $("#loader").hide();
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR);
                            
                            swal("Something went Wrong!", "Old Book Added Failed!", "error");
                            
                            $("#submit-btn").show();
                            $("#loader").hide();
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
        <!--  Successfully Old Book Added and Redirect to Add Book Page End  -->

        <!--  JavaScript Code End  -->


    </body>
</html>
