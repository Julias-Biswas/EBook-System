<%-- 
    Document   : index
    Created on : 9 Jun, 2022, 11:11:23 AM
    Author     : julia
--%>

<%@page import="com.dao.UserDaoClass"%>
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

<%
    UserDaoClass userDaoClass = new UserDaoClass(DBConnect.getConnection());
    
    User userDetails = userDaoClass.getUserModule(user.getEmail());
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EBook - Edit Profile</title>

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
        
        
        <!--  Edit User Profile Form Start  -->
        <div class="container">
            <div class="row mt-5">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center primary-background text-white">
                            <i class="fa-solid fa-user-pen fa-3x"></i>
                            <h3>Edit Profile</h3>
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
                            <form id="edit-profile-form" action="EditUserProfileServlet" method="POST">
                                <div class="form-group">
                                    <input type="number" name="userId1" class="form-control" value="<%= userDetails.getId() %>" style="display: none;"/>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1" class="text-success">Name<span class="text-danger">*</span></label>
                                    <input type="text" name="userName1" class="form-control" id="exampleFormControlNameInput1" value="<%= userDetails.getName() %>" required="">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1" class="text-success">Email<span class="text-danger">*</span></label>
                                    <input type="text" name="userEmail1" class="form-control" id="exampleFormControlEmailInput1"value="<%= userDetails.getEmail() %>" readonly="" required="">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1" class="text-success">Phone No<span class="text-danger">*</span></label>
                                    <input type="number" name="userPhoneNo1" class="form-control" id="exampleFormControlPhoneInput1" value="<%= userDetails.getPhno() %>" required="">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlInput1" class="text-success">Password<span class="text-danger">*</span></label>
                                    <input type="password" name="userPassword1" class="form-control" id="exampleFormControlPasswordInput1" required="">
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
        <!--  Edit User Profile Form End  -->
        

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
