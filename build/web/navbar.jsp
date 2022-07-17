<%-- 
    Document   : navbar
    Created on : 9 Jun, 2022, 12:05:08 PM
    Author     : julia
--%>

<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.UserDaoClass"%>
<%@page import="com.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User user1 = (User) session.getAttribute("userObj");


%>

<div class="container-fluid" style="height: 10px; background-color: #303f9f;">

</div>

<div class="container-fluid p-3 bg-light">
    <div class="row">
        <div class="col-md-2 col-sm-2 col-xs-2 text-success">
            <a href="index.jsp" style="text-decoration: none;"><h3 class="text-success"><i class="fa-solid fa-book"></i> EBook</h3></a>
        </div>
        <div class="col-md-6 col-sm-6 col-xs-6">
            <form style="margin-left: 29%;" action="search_books.jsp" method="POST">
                <div class="form-row align-items-center">
                    <div class="col-auto">
                        <input class="form-control mr-sm-2" style="width: 300px;" name="searchBooks1" type="search" placeholder="Search Book or Enter Books Name" title="Enter Books Name or Author Name or Book Category Name" aria-label="Search">
                    </div>
                    <div class="col-auto">
                        <button class="btn btn-primary my-2 my-sm-0" type="submit"><i class="fa-solid fa-magnifying-glass"></i> Search Books</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-md-4 col-sm-4 col-xs-4 text-right">

            <%                if (user1 == null ? user1 == null : user1.equals("null")) {
            %>

            <a href="signin.jsp" class="btn btn-success"><i class="fa-solid fa-right-to-bracket"></i> Sign In </a>
            <a href="signup.jsp" class="btn btn-primary"><i class="fa-solid fa-user-plus"></i> Sign Up </a>

            <%
            } else {
            %>

            <a class="dropdown-toggle btn btn-success" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <%= user1.getName()%>
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="setting.jsp"><i class="fa-solid fa-user text-primary"></i> My Profile</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="user_order.jsp"><i class="fa-solid fa-folder text-primary"></i> Orders</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#"><i class="fa-solid fa-bell text-primary"></i> Notifications</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" style="cursor: pointer;" data-toggle="modal" data-target="#exampleModal"><i class="fa-solid fa-right-from-bracket text-primary"></i> Logout</a>
            </div>

            <a href="my_cart.jsp" class="btn btn-warning text-white"><i class="fa-solid fa-cart-shopping"></i> Cart</a>            
            <a data-toggle="modal" data-target="#exampleModal" class="btn btn-danger text-white"><i class="fa-solid fa-right-from-bracket"></i> Logout </a>

            <%
                }
            %>

        </div>
    </div>
</div>


<!--  Logout Modal Start  -->
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header primary-background">
                <h5 class="modal-title text-white" id="exampleModalLabel">Logout Now</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div>
                    <strong class="text-dark" style="font-size: 30px;"><span>Do You want to Logout ?</span></strong>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa-solid fa-xmark"></i> No</button>
                <a href="LogoutServlet" type="button" class="btn btn-danger"><i class="fa-solid fa-arrow-right-from-bracket"></i> Logout</a>
            </div>
        </div>
    </div>
</div>
<!--  Logout Modal End  -->


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp"><i class="fa-solid fa-house-chimney"></i> Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="all_recent_books.jsp"><i class="fa-solid fa-book-open"></i> Recent Book</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="all_new_books.jsp"><i class="fa-solid fa-book-open"></i> New Book</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="all_old_books.jsp"><i class="fa-solid fa-book-open"></i> Old Book</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <a href="setting.jsp" class="btn btn-light my-2 my-sm-0"><i class="fa-solid fa-gear"></i> Setting</a>
            <a href="contact.jsp" class="btn btn-light my-2 my-sm-0 ml-1"><i class="fa-solid fa-phone"></i> Contact Us</a>
        </form>
    </div>
</nav>
