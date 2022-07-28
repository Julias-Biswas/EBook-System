<%-- 
    Document   : signup
    Created on : 9 Jun, 2022, 10:38:53 PM
    Author     : julia
--%>

<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@page errorPage="error.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EBook - Sign Up</title>

        <%@include file="link/all_links.jsp" %>

        <style>
            /*  Set Background Image Start  */
            body
            {
                background: url('img/signup_background_image.jpg');
                background-size: cover;
                background-attachment: fixed;
            }
            /*  Set Background Image End  */
            
        </style>
        
    </head>
    <body>

        <!--  For Navbar Start  -->
        <%@include file="navbar.jsp" %>
        <!--  For Navbar End  -->

        <!--  Sign Up form Start  -->
        <main class="d-flex align-items-center" style="height: 110vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card mt-5">
                            <div class="card-header text-center primary-background text-white">
                                <span class="fa fa-user-plus fa-3x"></span>
                                <h1>Sign Up Here</h1>
                            </div>
                            
                            
                            <!--  Using JSDL for Success Message Start  -->
                            <c:if test="${not empty successMsg}">
                                <h5 class="text-center text-danger">${successMsg}</h5>
                                <%
                                    session.removeAttribute("successMsg");
                                %>
                            </c:if>
                            <!--  Using JSDL for Success Message End  -->
                            
                            <!--  Using JSDL for Error Message Start  -->
                            <c:if test="${not empty errMsg}">
                                <h5 class="text-center text-danger">${errMsg}</h5>
                                <%
                                    session.removeAttribute("errMsg");
                                %>
                            </c:if>
                            <!--  Using JSDL for Error Message End  -->
                            
                            
                            <div class="card-body">
                                <form id="reg-form" action="SignUpServlet" method="POST">
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Name<span class="text-danger">*</span></label>
                                        <input type="text" name="userName1" class="form-control" id="exampleInputUserName1" placeholder="Enter Name" required="">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email<span class="text-danger">*</span></label>
                                        <input type="email" name="userEmail1" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="name@example.com" required="">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Phone<span class="text-danger">*</span></label>
                                        <input type="number" name="userPhone1" class="form-control" id="exampleInputPhone1" placeholder="Phone" required="">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password<span class="text-danger">*</span></label>
                                        <input type="password" name="userPassword1" class="form-control" id="exampleInputPassword1" placeholder="Password" required="">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleFormControlSelect2">Type<span class="text-danger">*</span></label>
                                        <select class="form-control" name="userType1" id="exampleFormControlSelect2">
                                            <option selected="" disabled="">---Select User Type---</option>
                                            <option value="Admin">Admin</option>
                                            <option value="Customer / User">Customer / User</option>
                                        </select>
                                    </div>
                                    <div class="form-check text-center">
                                        <input type="checkbox" name="userCheck1" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Agree <a href="#">terms & conditions</a></label>
                                    </div>
                                    <div class="container text-center" id="loader" style="display: none;">
                                        <span class="fa fa-refresh fa-spin fa-2x"></span>
                                        <h5>Please wait...</h5>
                                    </div>
                                    <div class="container text-center my-4">
                                        <button id="submit-btn" type="submit" class="btn btn-primary">Sign Up</button>
                                    </div>
                                </form>
                                <p class="text-center">Already have an account ? <a href="signin.jsp">Sign In</a></p>
                            </div>
                            <div class="card-footer">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <!--  Sign Up form End  -->

        <br><br>
        
        <!--  For Footer part Start  -->
        <%@include file="footer.jsp" %>
        <!--  For Footer part End  -->
        
        
        <!--     Bootstrap 4 JavaScript      -->
        <script
            src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        
        <!--  Successfully Sign Up and Redirect Sign In Page Start  -->
        <script>
            $(document).ready(function () {
                console.log("Loading Page...");
                
                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();
                    
                    let form = new FormData(this);
                    
                    $("#submit-btn").hide();
                    $("#loader").show();
                    
                    /*  Send Request SignUpServlet Page  */
                    $.ajax({
                        url: "SignUpServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            
                            $("#submit-btn").show();
                            $("#loader").hide();
                                                        
                            if( data.trim() === 'Done...' )
                            {
                                swal("Good job!", "Sign Up Successfully! We redirecting to Sign In page.","success").
                                    then((value) =>{
                                        window.location = "signin.jsp";
                                });
                            }
                            else if( data.trim() === "User Type Empty..." )
                            {
                                swal("Something went Wrong!", "Please Select User Type", "error");
                            }
                            else if( data.trim() === 'null' )
                            {
                                swal("Something went Wrong!", "Please Agree Terms & Conditions", "error");
                            }
                            else if( data.trim() === 'Already Register...' )
                            {
                                swal("Something went Wrong!", "Email Id Already Exist in Our Database, Please Sign In...", "error").
                                    then((value) =>{
                                        window.location = "signin.jsp";
                                });
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR);
                            
                            $("#submit-btn").show();
                            $("#loader").hide();
                            
                            swal("Something went Wrong!", "Invalid Details, Please Check Your Details!", "error");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
        <!--  Successfully Sign Up and Redirect Sign In Page End  -->
        
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
