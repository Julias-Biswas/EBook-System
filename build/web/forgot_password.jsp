<%-- 
    Document   : signin
    Created on : 9 Jun, 2022, 11:36:01 PM
    Author     : julia
--%>

<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%--<%@page errorPage="error.jsp" %>--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EBook - Forgot Password</title>
        
        <%@include file="link/all_links.jsp" %>
        
        <style>
            body
            {
                background: url('img/signin_background_image.jpg');
                background-size: cover;
                background-attachment: fixed;
            }
            
        </style>
        
    </head>
    <body>
        
        <!--  For Navbar Start  -->
        <%@include file="navbar.jsp" %>
        <!--  For Navbar End  -->
        
        <!--  Sign In form Start  -->
        <main class="d-flex align-items-center" style="height: 80vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card mt-5">
                            <div class="card-header text-center primary-background text-white">
                                <span class="fa fa-user-times fa-3x"></span>
                                <h1>Forgot Password Here</h1>
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
                                <form>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="name@example.com">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputNewPassword1">New Password</label>
                                        <input type="password" class="form-control" id="exampleInputNewPassword1" placeholder="Enter New Password">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputConfirmPassword1">Confirm Password</label>
                                        <input type="password" class="form-control" id="exampleInputConfirmPassword1" placeholder="Enter Confirm Password">
                                    </div>
                                    <br>
                                    <center> <button type="submit" class="btn btn-primary">Save / Update</button> </center>
                                </form>
                                <br>
                                <p class="text-center">Back To Login Page <a href="signin.jsp">Click Here</a></p>
                            </div>
                            <div class="card-footer">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <!--  Sign In form End  -->

        <br><br>
        
        <!--  For Footer part Start  -->
        <%@include file="footer.jsp" %>
        <!--  For Footer part End  -->
        
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
