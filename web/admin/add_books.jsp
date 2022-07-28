<%-- 
    Document   : add_books
    Created on : 30 Jun, 2022, 3:48:02 PM
    Author     : julia
--%>

<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
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
        <title>EBook System - Add Books</title>

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

        
        <!--  Using JSDL for Success Message Start  -->
        <c:if test="${not empty userObj}">
            
        </c:if>
        <!--  Using JSDL for Success Message End  -->

        <div class="container">
            <div class="row mt-5">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center primary-background text-white">
                            <i class="fa-solid fa-book fa-3x"></i>
                            <h3>Add Books</h3>
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
                            <form id="add-book-form" action="../AddBooks" method="POST" enctype="multipart/form-data">
                                <div class="form-group">
                                    <input type="text" name="userEmail1" class="form-control" value="${userObj.email}" style="display: none;"/>
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
                                        <option value="New Book">New Book</option>
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
                                    <button id="submit-btn" type="submit" class="btn btn-primary">Add Book</button>
                                </div>

                            </form>
                        </div>
                        <div class="card-footer">

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <br><br><br>

        <!--  Footer Part Start  -->
        <%@include file="../footer.jsp" %>
        <!--  Footer Part End  -->


        <!--     Bootstrap 4 JavaScript      -->
        <script
            src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


        <!--  Successfully Book Added and Redirect to Add Book Page Start  -->
        <script>
            $(document).ready(function () {
                console.log("Loading...");

                $('#add-book-form').on('submit', function (event) {
                    event.preventDefault();

                    let form = new FormData(this);

                    $("#submit-btn").hide();
                    $("#loader").show();
                    
                    /*  Send Request AddBooks Page  */
                    $.ajax({
                        url: "../AddBooks",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            
                            if( data.trim() === "Book Added Successfully..." )
                            {
                                swal("Good job!", "Book Added Successfully!","success").
                                    then((value) =>{
                                        window.location = "add_books.jsp";
                                });
                                
                                $("#submit-btn").show();
                                $("#loader").hide();
                            }
                            else if( data.trim() === "Book Added Failed..." )
                            {
                                swal("Something went Wrong!", "Book Added Failed!", "error");
                                
                                $("#submit-btn").show();
                                $("#loader").hide();
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR);
                            
                            swal("Something went Wrong!", "Book Added Failed!", "error");
                            
                            $("#submit-btn").show();
                            $("#loader").hide();
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
        <!--  Successfully Book Added and Redirect to Add Book Page End  -->

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
