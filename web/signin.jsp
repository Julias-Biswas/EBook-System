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
        <title>EBook - Sign In</title>
        
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
                                <span class="fa fa-user-circle fa-3x"></span>
                                <h1>Sign In Here</h1>
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
                                <form action="SignInServlet" method="POST">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email<span class="text-danger">*</span></label>
                                        <input type="email" name="userEmail1" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="name@example.com" required="">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password<span class="text-danger">*</span></label>
                                        <input type="password" name="userPassword1" class="form-control" id="exampleInputPassword1" placeholder="Password" required="">
                                    </div>
                                    <div class="form-check text-center">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1" name="rememberMe1">
                                        <label class="form-check-label" for="exampleCheck1">Remember Me</label>
                                    </div>
                                    <div class="container text-center mt-3">
                                        <button type="submit" class="btn btn-primary">Sign In</button>
                                    </div>
                                    <p class="text-center mt-1"><a href="forgot_password.jsp">Forgot Password?</a></p>
                                    <p class="text-center">New User ? <a href="signup.jsp">Sign Up</a></p>
                                </form>
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
