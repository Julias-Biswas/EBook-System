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

<%    UserDaoClass userDaoClass1 = new UserDaoClass(DBConnect.getConnection());

    User userAllDetails = userDaoClass1.getUserModule(user.getEmail());

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EBook - Shopping Cart</title>

        <%@include file="link/all_links.jsp" %>

        <style>
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

            /*  Anchor Tag Design Start  */
            .anchor
            {
                color: #000000;
                font-size: 22px;
                font-weight: 600;
                text-decoration: none;
            }
            .anchor:hover
            {
                color: #3333ff;
                text-decoration: none;
            }
            /*  Anchor Tag Design End  */

            /*  Plus Minus Icon Design Start  */
            .plus-minus-design
            {
                color: #000000;
                font-size: 18px; 
                border: 1px solid #cccccc; 
                border-radius: 50%;
            }
            /*  Plus Minus Icon Design End  */

            /*  Total Amount, Price Design Start  */
            .total-price
            {
                font-size: 18px;
                font-weight: 500;
            }
            /*  Total Amount, Price Design End  */

            /*  SnackBar / Toast Message Design Start  */
            #snackbar {
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
            }
            /*  SnackBar / Toast Message Design End  */

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


        <jsp:declaration>
            int totalUserCartItems;
            Double totalPrice;
        </jsp:declaration>


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


        <!--  User All Items Add To Cart, Total Amount & User Details Start  -->
        <div class="container-fluid">
            <div class="row p-4">
                <div class="col-md-6">
                    <div style="width: 100%;">
                        <h3 class="card p-3 bg-white">My Cart</h3>

                        <%
                            CartDaoClass cartDaoClass = new CartDaoClass(DBConnect.getConnection());

                            List<Cart> list = cartDaoClass.getBookByUser(user.getEmail());

                            if (list.isEmpty()) {
                                
                                totalUserCartItems = 0;
                                totalPrice = 0.00;
                        %>

                        <div class="card mt-1">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12 text-center">
                                        <i class="fa-solid fa-face-sad-cry fa-3x"></i>
                                        <h4>Your cart is empty!</h4>
                                        <h6>It's a good day to buy the items you saved for later!</h6>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%
                        } else {

                            totalUserCartItems = 0;
                            totalPrice = 0.00;

                            for (Cart cart : list) {

                                totalPrice = cart.getTotalPrice();

                                /*  For get Posted Book User Name Start  */
                                BookDaoClass bookDaoClass = new BookDaoClass(DBConnect.getConnection());

                                BookDetails bookDetails = bookDaoClass.editBookDetails(cart.getBookId(), cart.getAuthor(), cart.getBookCategory());

                                String userEmail = bookDetails.getUserEmail();

                                UserDaoClass userDaoClass = new UserDaoClass(DBConnect.getConnection());

                                User userDetails = userDaoClass.getUserModule(userEmail);
                                /*  For get Posted Book User Name End  */
                        %>

                        <div class="card mt-1">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-3">
                                        <a href="view_books.jsp?v=<%= cart.getBookId()%>&list=<%= cart.getAuthor()%>&index=<%= cart.getBookCategory()%>" target="_blank">
                                            <img class="card-img-top" src="books/<%= cart.getBookPhoto()%>" alt="Card image cap" style="width: 100%; height: 170px;" />
                                        </a>

                                        <br><br>

                                        <center>
                                            <a href="" class="plus-minus-design p-2"><i class="fa-solid fa-minus"></i></a>
                                            <b><span class="p-2" style="font-size: 18px; border: 1px solid #666666; border-radius: 5px;">&nbsp;&nbsp; 1 &nbsp;&nbsp;</span></b>
                                            <a href="" class="plus-minus-design p-2"><i class="fa-solid fa-plus"></i></a>
                                        </center>

                                    </div>
                                    <div class="col-md-9">
                                        <a href="view_books.jsp?v=<%= cart.getBookId()%>&list=<%= cart.getAuthor()%>&index=<%= cart.getBookCategory()%>" class="anchor" target="_blank"><h3 class="card-subtitle mb-2 mt-2"><%= cart.getBookName()%></h3></a>
                                        <h6><%= cart.getAuthor()%>, <%= cart.getBookCategory()%></h6>
                                        <h6>Seller : <%= userDetails.getName()%></h6>
                                        <h3 class="card-text"><i class="fa-solid fa-indian-rupee-sign"></i> <%= cart.getPrice()%></h3>

                                        <br>

                                        <!--<a href="" class="anchor ml-3"><span>SAVE FOR LATER</span></a>-->
                                        <a href="RemoveBookCartServlet?v=<%= cart.getBookId()%>&ratio=<%= cart.getUserEmail()%>&list=<%= cart.getAuthor()%>&link=<%= cart.getBookCategory()%>&unicode=<%= cart.getcId()%>" class="btn anchor"><span>REMOVE</span></a>
                                    </div>
                                </div>
                                
                            </div>
                        </div>

                        <%
                                    totalUserCartItems++;
                                }
                            }
                        %>

                        <br>

                    </div>
                </div>
                <div class="col-md-6">

                    <div class="card mt-1">
                        <div class="card-body">
                            <h5 class="card-title p-1 bg-white" style="color: #666666;">PRICE DETAILS</h5>
                            <hr>
                            <p><span class="total-price">Price (<%= totalUserCartItems%> items) </span> <span class="total-price" style="float: right;"><i class="fa-solid fa-indian-rupee-sign"></i> <%= totalPrice%></span></p>
                            <p><span class="total-price">Discount  </span> <span class="text-success total-price" style="float: right;"><i class="fa-solid fa-minus"></i> <i class="fa-solid fa-indian-rupee-sign"></i> 0.0</span></p>
                            <p><span class="total-price">Delivery Charges  </span> <span class="text-success total-price" style="float: right;">FREE</span></p>
                            <hr>
                            <h4 class="card-title p-1 bg-white">Total Amount <span class="total-price" style="float: right;"><i class="fa-solid fa-indian-rupee-sign"></i> <%= totalPrice%></span></h4>
                        </div>
                    </div>

                    <br>

                    <div class="card" style="width: 100%;">

                        <div class="card-body">
                            <h3 class="card-title text-success text-center">Your Details for Order</h3>

                            <br>

                            <form action="OrderServlet" method="POST">
                                <div class="form-row">
                                    <input type="number" name="userId1" class="form-control" id="inputEmail4" value="<%= userAllDetails.getId()%>" required="" style="display: none;">
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Name<span class="text-danger">*</span></label>
                                        <input type="text" name="userName1" class="form-control" id="inputEmail4" value="<%= userAllDetails.getName()%>" required="" >
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Email<span class="text-danger">*</span></label>
                                        <input type="email" name="userEmail1" class="form-control" id="inputPassword4" value="<%= userAllDetails.getEmail()%>" required="" readonly="">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Mobile No<span class="text-danger">*</span></label>
                                        <input type="number" name="userPhoneNo1" class="form-control" id="inputEmail4" value="<%= userAllDetails.getPhno()%>" required="" >
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Alternative Phone (Optional)</label>
                                        <input type="number" name="userAlternativePhoneNo1" class="form-control" id="inputPassword4" placeholder="" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputAddress">Address (Area and Street)<span class="text-danger">*</span></label>
                                    <%
                                        if (userAllDetails.getAddress() == null) {
                                    %>
                                    <textarea type="text" name="userAddress1" class="form-control" style="height: 70px; resize: none;" id="inputAddress" required=""></textarea>
                                    <%
                                    } else {
                                    %>
                                    <textarea type="text" name="userAddress1" class="form-control" style="height: 70px; resize: none;" id="inputAddress" required=""><%= userAllDetails.getAddress()%></textarea>
                                    <%
                                        }
                                    %>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">City/District/Town<span class="text-danger">*</span></label>
                                        <%
                                            if (userAllDetails.getCity() == null) {
                                        %>
                                        <input type="text" name="userCityOrDistictOrTown1" class="form-control" id="inputEmail4" value="" required="">
                                        <%
                                        } else {
                                        %>
                                        <input type="text" name="userCityOrDistictOrTown1" class="form-control" id="inputEmail4" value="<%= userAllDetails.getCity()%>" required="">
                                        <%
                                            }
                                        %>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Landmark (Optional)</label>
                                        <%
                                            if (userAllDetails.getLandmark() == null) {
                                        %>
                                        <input type="text" name="userLandmark1" class="form-control" value="" id="inputPassword4">
                                        <%
                                        } else {
                                        %>
                                        <input type="text" name="userLandmark1" class="form-control" value="<%= userAllDetails.getLandmark()%>" id="inputPassword4">
                                        <%
                                            }
                                        %>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputState">State<span class="text-danger">*</span></label>
                                        <%
                                            if (userAllDetails.getState() == null) {
                                        %>
                                        <select id="inputState" name="userState1" class="form-control" required="">
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
                                        <select id="inputState" name="userState1" class="form-control" required="">
                                            <option selected=""><%= userAllDetails.getState()%></option>
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
                                            if (userAllDetails.getPinCode() == null) {
                                        %>
                                        <input type="number" name="userPinCode1" class="form-control" id="inputZip" value="" required="">
                                        <%
                                        } else {
                                        %>
                                        <input type="number" name="userPinCode1" class="form-control" id="inputZip" value="<%= userAllDetails.getPinCode()%>" required="">
                                        <%
                                            }
                                        %>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="inputState">Select Payment Type<span class="text-danger">*</span></label>
                                        <select id="inputState" name="userPaymentType1" class="form-control">
                                            <option value="No Select" selected="" disabled="">---Select Payment Type---</option>
                                            <option value="Cash On Delivery"> Cash On Delivery </option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="userDeliveryAddressType1" id="inlineRadio1" value="Home (All day delivery)">
                                    <label class="form-check-label" for="inlineRadio1">Home (All day delivery)</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="userDeliveryAddressType1" id="inlineRadio2" value="Work (Delivery between 10 AM - 5 PM)">
                                    <label class="form-check-label" for="inlineRadio2">Work (Delivery between 10 AM - 5 PM)</label>
                                </div>
                                <div class="container text-center mt-3 p-3">
                                    <button type="submit" class="btn btn-warning text-white">ORDER NOW</button>
                                    <a href="index.jsp" class="btn btn-success text-white">CONTINUE SHOPPING</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--  User All Items Add To Cart, Total Amount & User Details End  -->


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
