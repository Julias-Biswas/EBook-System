<%-- 
    Document   : error
    Created on : 3 Jul, 2022, 9:44:30 AM
    Author     : julia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry ! Something went wrong...</title>
        
        <%@include file="link/all_links.jsp" %>
        
    </head>
    <body>
        <div class="container text-center">
            <img src="img/error_icon.png" alt="Error Icon" class="img-fluid"/>
            <h3 class="display-3">Sorry ! Something went wrong...</h3>
            <%= exception %> <br>
            <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3"><i class="fa-solid fa-house"></i> Home</a>
        </div>
    </body>
</html>
