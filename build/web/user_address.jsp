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

<%
    UserDaoClass userDaoClass = new UserDaoClass(DBConnect.getConnection());
    
    User userDetails = userDaoClass.getUserModule(user.getEmail());
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EBook - Your Address</title>

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


        <!--  Add User Address Form Start  -->
        <div class="container">
            <div class="row mt-5">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center bg-primary text-white">
                            <i class="fa-solid fa-location-dot fa-3x"></i>
                            <%
                                if (userDetails.getAddress() == null) {
                            %>
                            <h3>Add Your Address</h3>
                            <%
                            } else {
                            %>
                            <h3>Update Your Address</h3>
                            <%
                                }
                            %>
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
                            <form id="add-user-address-form" action="AddOrUpdateUserAdderssServlet" method="POST">
                                <div class="form-row">
                                    <input type="number" name="userId1" class="form-control" id="inputEmail4" value="<%= userDetails.getId()%>" required="" style="display: none;">
                                </div>
                                <div class="form-row">
                                    <input type="text" name="userEmail1" class="form-control" id="inputEmail4" value="<%= userDetails.getEmail()%>" required="" style="display: none;">
                                </div>
                                <div class="form-group">
                                    <label for="inputAddress">Address (Area and Street)<span class="text-danger">*</span></label>
                                    <%
                                        if (userDetails.getAddress() == null) {
                                    %>
                                    <textarea type="text" name="userAddress1" class="form-control" style="height: 70px; resize: none;" id="inputAddress" required=""></textarea>
                                    <%
                                    } else {
                                    %>
                                    <textarea type="text" name="userAddress1" class="form-control" style="height: 70px; resize: none;" id="inputAddress" required=""><%= userDetails.getAddress()%></textarea>
                                    <%
                                        }
                                    %>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">City/District/Town<span class="text-danger">*</span></label>
                                        <%
                                            if (userDetails.getCity() == null) {
                                        %>
                                        <input type="text" name="userCity1" class="form-control" id="inputEmail4" value="" required="">
                                        <%
                                        } else {
                                        %>
                                        <input type="text" name="userCity1" class="form-control" id="inputEmail4" value="<%= userDetails.getCity()%>" required="">
                                        <%
                                            }
                                        %>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Landmark (Optional)</label>
                                        <%
                                            if (userDetails.getLandmark() == null) {
                                        %>
                                        <input type="text" name="userLandmark1" class="form-control" value="" id="inputPassword4">
                                        <%
                                        } else {
                                        %>
                                        <input type="text" name="userLandmark1" class="form-control" value="<%= userDetails.getLandmark()%>" id="inputPassword4">
                                        <%
                                            }
                                        %>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputState">State<span class="text-danger">*</span></label>
                                        <%
                                            if (userDetails.getState() == null) {
                                        %>
                                        <select id="inputState" name="userState1" class="form-control">
                                            <option selected="" disabled="">---Select State---</option>
                                            <option value="Andhra Pradesh"> Andhra Pradesh </option>
                                            <option value="Arunachal Pradesh"> Arunachal Pradesh </option>
                                            <option value="Assam"> Assam </option>
                                            <option value="Bihar"> Bihar </option>
                                            <option value="Chhattisgarh"> Chhattisgarh </option>
                                            <option value="Goa"> Goa </option>
                                            <option value="Gujarat"> Gujarat </option>
                                            <option value="Haryana"> Haryana </option>
                                            <option value="Himachal Pradesh"> Himachal Pradesh </option>
                                            <option value="Jharkhand"> Jharkhand </option>
                                            <option value="Karnataka"> Karnataka </option>
                                            <option value="Kerala"> Kerala </option>
                                            <option value="Madhya Pradesh"> Madhya Pradesh </option>
                                            <option value="Maharashtra"> Maharashtra </option>
                                            <option value="Manipur"> Manipur </option>
                                            <option value="Meghalaya"> Meghalaya </option>
                                            <option value="Mizoram"> Mizoram </option>
                                            <option value="Nagaland"> Nagaland </option>
                                            <option value="Odisha"> Odisha </option>
                                            <option value="Punjab"> Punjab </option>
                                            <option value="Rajasthan"> Rajasthan </option>
                                            <option value="Sikkim"> Sikkim </option>
                                            <option value="Tamil Nadu"> Tamil Nadu </option>
                                            <option value="Telangana"> Telangana </option>
                                            <option value="Tripura"> Tripura </option>
                                            <option value="Uttar Pradesh"> Uttar Pradesh </option>
                                            <option value="Uttarakhand"> Uttarakhand </option>
                                            <option value="West Bengal"> West Bengal </option>
                                        </select>
                                        <%
                                        } else {
                                        %>
                                        <select id="inputState" name="userState1" class="form-control">
                                            <option selected=""><%= userDetails.getState()%></option>
                                            <option value="Andhra Pradesh"> Andhra Pradesh </option>
                                            <option value="Arunachal Pradesh"> Arunachal Pradesh </option>
                                            <option value="Assam"> Assam </option>
                                            <option value="Bihar"> Bihar </option>
                                            <option value="Chhattisgarh"> Chhattisgarh </option>
                                            <option value="Goa"> Goa </option>
                                            <option value="Gujarat"> Gujarat </option>
                                            <option value="Haryana"> Haryana </option>
                                            <option value="Himachal Pradesh"> Himachal Pradesh </option>
                                            <option value="Jharkhand"> Jharkhand </option>
                                            <option value="Karnataka"> Karnataka </option>
                                            <option value="Kerala"> Kerala </option>
                                            <option value="Madhya Pradesh"> Madhya Pradesh </option>
                                            <option value="Maharashtra"> Maharashtra </option>
                                            <option value="Manipur"> Manipur </option>
                                            <option value="Meghalaya"> Meghalaya </option>
                                            <option value="Mizoram"> Mizoram </option>
                                            <option value="Nagaland"> Nagaland </option>
                                            <option value="Odisha"> Odisha </option>
                                            <option value="Punjab"> Punjab </option>
                                            <option value="Rajasthan"> Rajasthan </option>
                                            <option value="Sikkim"> Sikkim </option>
                                            <option value="Tamil Nadu"> Tamil Nadu </option>
                                            <option value="Telangana"> Telangana </option>
                                            <option value="Tripura"> Tripura </option>
                                            <option value="Uttar Pradesh"> Uttar Pradesh </option>
                                            <option value="Uttarakhand"> Uttarakhand </option>
                                            <option value="West Bengal"> West Bengal </option>
                                        </select>
                                        <%
                                            }
                                        %>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputZip">Zip<span class="text-danger">*</span></label>
                                        <%
                                            if (userDetails.getPinCode() == null) {
                                        %>
                                        <input type="number" name="userPinCode1" class="form-control" value="" id="inputZip" required="">
                                        <%
                                        } else {
                                        %>
                                        <input type="number" name="userPinCode1" class="form-control" value="<%= userDetails.getPinCode()%>" id="inputZip" required="">
                                        <%
                                            }
                                        %>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label for="exampleFormControlInput1">Password<span class="text-danger">*</span></label>
                                        <input type="password" name="userPassword1" class="form-control" id="exampleFormControlInput1" required="">
                                    </div>
                                </div>
                                <div class="container text-center" id="loader" style="display: none;">
                                    <span class="fa fa-refresh fa-spin fa-2x"></span>
                                    <h5>Please wait...</h5>
                                </div>
                                <div class="container text-center mt-3">
                                    <%
                                        if (userDetails.getAddress() == null) {
                                    %>
                                    <button id="submit-btn" type="submit" class="btn btn-primary text-white">Add Address</button>
                                    <%
                                    } else {
                                    %>
                                    <button id="submit-btn" type="submit" class="btn btn-primary text-white">Update Address</button>
                                    <%
                                        }
                                    %>
                                </div>
                            </form>
                        </div>
                        <div class="card-footer">

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--  Add User Address Form End  -->


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
