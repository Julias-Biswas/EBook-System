package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.entity.BookDetails;
import java.util.List;
import com.dao.BookDaoClass;
import com.entity.User;
import java.sql.Connection;
import com.db.DBConnect;
import com.entity.User;

public final class view_005fbooks_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(4);
    _jspx_dependants.add("/link/all_links.jsp");
    _jspx_dependants.add("/navbar.jsp");
    _jspx_dependants.add("/admin/index_navbar.jsp");
    _jspx_dependants.add("/footer.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			"error.jsp", true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    User user = (User) session.getAttribute("userObj");



      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>EBook - </title>\n");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("<!--  Bootstrap 4 CSS  -->\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css\" integrity=\"sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm\" crossorigin=\"anonymous\">\n");
      out.write("\n");
      out.write("\n");
      out.write("<!--  Manual CSS  -->\n");
      out.write("<link href=\"css/style.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("\n");
      out.write("\n");
      out.write("<!--  Font Awesome CDN  -->\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css\" integrity=\"sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==\" crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\" />\n");
      out.write("\n");
      out.write("\n");
      out.write("<!--  Bootstrap 4 JavaScript  -->\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.6.0.min.js\" integrity=\"sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=\" crossorigin=\"anonymous\"></script>\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.2.1.slim.min.js\" integrity=\"sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN\" crossorigin=\"anonymous\"></script>\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js\" integrity=\"sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q\" crossorigin=\"anonymous\"></script>\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js\" integrity=\"sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl\" crossorigin=\"anonymous\"></script>\n");
      out.write("\n");
      out.write("\n");
      out.write("<!--  Manual JavaScript  -->\n");
      out.write("<script src=\"js/myjs.js\" type=\"text/javascript\"></script>\n");
      out.write("\n");
      out.write("<!--  Sweet Alert  -->\n");
      out.write("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js\" integrity=\"sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==\" crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\"></script>");
      out.write("\n");
      out.write("\n");
      out.write("        <style>\n");
      out.write("            .back-img\n");
      out.write("            {\n");
      out.write("                height: 80vh;\n");
      out.write("                background-repeat: no-repeat;\n");
      out.write("                background-size: cover;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            video\n");
      out.write("            {\n");
      out.write("                width: 100%;\n");
      out.write("                object-fit: cover;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .index-banner-design\n");
      out.write("            {\n");
      out.write("                clip-path: polygon(0 0, 100% 0, 100% 100%, 75% 95%, 46% 100%, 23% 95%, 0 100%);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .crd-ho:hover\n");
      out.write("            {\n");
      out.write("                background-color: #f7f7f7;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /*  Zoom image if user is going to image Start  */\n");
      out.write("            .card-header\n");
      out.write("            {\n");
      out.write("                width: 100%;\n");
      out.write("                height: 270px;\n");
      out.write("                overflow: hidden;\n");
      out.write("                margin: 0 auto;\n");
      out.write("            }\n");
      out.write("            .card-header img\n");
      out.write("            {\n");
      out.write("                width: 100%;\n");
      out.write("                transition: 1s all ease-in-out;\n");
      out.write("            }\n");
      out.write("            .card-header:hover img\n");
      out.write("            {\n");
      out.write("                transform: scale(1.5);\n");
      out.write("            }\n");
      out.write("            /*  Zoom image if user is going to image End  */\n");
      out.write("\n");
      out.write("            /*  Scroll Button Design Start  */\n");
      out.write("            #myBtn \n");
      out.write("            {\n");
      out.write("                display: none;\n");
      out.write("                position: fixed;\n");
      out.write("                bottom: 20px;\n");
      out.write("                right: 25px;\n");
      out.write("                z-index: 99;\n");
      out.write("                font-size: 24px;\n");
      out.write("                font-weight: 800;\n");
      out.write("                border: none;\n");
      out.write("                outline: none;\n");
      out.write("                background-color: #3333ff;\n");
      out.write("                color: white;\n");
      out.write("                cursor: pointer;\n");
      out.write("                padding: 15px;\n");
      out.write("                border-radius: 50%;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            #myBtn:hover \n");
      out.write("            {\n");
      out.write("                background-color: #0000ff;\n");
      out.write("            }\n");
      out.write("            /*  Scroll Button Design End  */\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body style=\"background-color: #ffffff;\">\n");
      out.write("\n");
      out.write("        <!--  Scroll Button Start  -->\n");
      out.write("        <i onclick=\"topFunction()\" id=\"myBtn\" title=\"Go to Top\" class=\"fa-solid fa-arrow-up\"></i>\n");
      out.write("        <!--  Scroll Button End  -->\n");
      out.write("\n");
      out.write("        <!--  For Navbar Start  -->\n");
      out.write("        ");
      out.write("\n");
      out.write("        <!--  For Navbar End  -->\n");
      out.write("\n");
      out.write("        ");
            if (user == null ? user == null : user.equals("null")) {
        
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<div class=\"container-fluid\" style=\"height: 10px; background-color: #303f9f;\">\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<div class=\"container-fluid p-3 bg-light\">\n");
      out.write("    <div class=\"row\">\n");
      out.write("        <div class=\"col-md-2 col-sm-2 col-xs-2 text-success\">\n");
      out.write("            <a href=\"index.jsp\" style=\"text-decoration: none;\"><h3 class=\"text-success\"><i class=\"fa-solid fa-book\"></i> EBook</h3></a>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-md-7 col-sm-7 col-xs-7\">\n");
      out.write("            <form style=\"margin-left: 25%;\">\n");
      out.write("                <div class=\"form-row align-items-center\">\n");
      out.write("                    <div class=\"col-auto\">\n");
      out.write("                        <input class=\"form-control mr-sm-2\" style=\"width: 400px;\" type=\"search\" placeholder=\"Search Books or Enter Books Name\" aria-label=\"Search\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-auto\">\n");
      out.write("                        <button class=\"btn btn-primary my-2 my-sm-0\" type=\"submit\">Search</button>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-md-3 col-sm-3 col-xs-3 text-right\">\n");
      out.write("            <a href=\"signin.jsp\" class=\"btn btn-success\"><i class=\"fa-solid fa-right-to-bracket\"></i> Sign In </a>\n");
      out.write("            <a href=\"signup.jsp\" class=\"btn btn-primary\"><i class=\"fa-solid fa-user-plus\"></i> Sign Up </a>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<nav class=\"navbar navbar-expand-lg navbar-dark bg-custom\">\n");
      out.write("    <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarSupportedContent\" aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n");
      out.write("        <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("    </button>\n");
      out.write("\n");
      out.write("    <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\n");
      out.write("        <ul class=\"navbar-nav mr-auto\">\n");
      out.write("            <li class=\"nav-item active\">\n");
      out.write("                <a class=\"nav-link\" href=\"index.jsp\"><i class=\"fa-solid fa-house-chimney\"></i> Home <span class=\"sr-only\">(current)</span></a>\n");
      out.write("            </li>\n");
      out.write("            <li class=\"nav-item active\">\n");
      out.write("                <a class=\"nav-link\" href=\"all_recent_books.jsp\"><i class=\"fa-solid fa-book-open\"></i> Recent Book</a>\n");
      out.write("            </li>\n");
      out.write("            <li class=\"nav-item active\">\n");
      out.write("                <a class=\"nav-link\" href=\"all_new_books.jsp\"><i class=\"fa-solid fa-book-open\"></i> New Book</a>\n");
      out.write("            </li>\n");
      out.write("            <li class=\"nav-item active\">\n");
      out.write("                <a class=\"nav-link\" href=\"all_old_books.jsp\"><i class=\"fa-solid fa-book-open\"></i> Old Book</a>\n");
      out.write("            </li>\n");
      out.write("        </ul>\n");
      out.write("        <form class=\"form-inline my-2 my-lg-0\">\n");
      out.write("            <button class=\"btn btn-light my-2 my-sm-0\"><i class=\"fa-solid fa-gear\"></i> Setting</button>\n");
      out.write("            <button class=\"btn btn-light my-2 my-sm-0 ml-1\"><i class=\"fa-solid fa-phone\"></i> Contact Us</button>\n");
      out.write("        </form>\n");
      out.write("    </div>\n");
      out.write("</nav>\n");
      out.write("\n");
      out.write("        ");

        } else {
        
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    User user1 = (User) session.getAttribute("userObj");

    if (user1 == null) {
        response.sendRedirect("../signin.jsp");
    }

      out.write("\n");
      out.write("\n");
      out.write("<div class=\"container-fluid\" style=\"height: 10px; background-color: #303f9f;\">\n");
      out.write("    \n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<div class=\"container-fluid p-3 bg-light\">\n");
      out.write("    <div class=\"row\">\n");
      out.write("        <div class=\"col-md-2 col-sm-2 col-xs-2 text-success\">\n");
      out.write("            <a href=\"../index.jsp\" style=\"text-decoration: none;\"><h3 class=\"text-success\"><i class=\"fa-solid fa-book\"></i> EBook</h3></a>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-md-7 col-sm-7 col-xs-7\">\n");
      out.write("            <form style=\"margin-left: 25%;\">\n");
      out.write("                <div class=\"form-row align-items-center\">\n");
      out.write("                    <div class=\"col-auto\">\n");
      out.write("                        <input class=\"form-control mr-sm-2\" style=\"width: 400px;\" type=\"search\" placeholder=\"Search Books or Enter Books Name\" aria-label=\"Search\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-auto\">\n");
      out.write("                        <button class=\"btn btn-primary my-2 my-sm-0\" type=\"submit\">Search</button>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-md-3 col-sm-3 col-xs-3 text-right\">\n");
      out.write("            \n");
      out.write("            ");
 
                if( user1 == null ? user1 == null : user1.equals("null") )
                {
                    
      out.write("\n");
      out.write("                        <a href=\"signin.jsp\" class=\"btn btn-success\"><i class=\"fa-solid fa-right-to-bracket\"></i> Sign In </a>\n");
      out.write("                        <a href=\"signup.jsp\" class=\"btn btn-primary\"><i class=\"fa-solid fa-user-plus\"></i> Sign Up </a>\n");
      out.write("                    ");

                }
                else
                {
                    
      out.write("\n");
      out.write("                        <a href=\"admin/profile.jsp\">\n");
      out.write("                            <button class=\"btn btn-outline-success\"><i class=\"fa-solid fa-user\"></i> ");
      out.print( user1.getName() );
      out.write("</button>\n");
      out.write("                        </a>\n");
      out.write("                        <a data-toggle=\"modal\" data-target=\"#exampleModal\" class=\"btn btn-primary text-white\"><i class=\"fa-solid fa-arrow-right-from-bracket\"></i> Logout </a>\n");
      out.write("                    ");

                }
            
      out.write("\n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("            \n");
      out.write("            \n");
      out.write("<!--  Logout Modal Start  -->\n");
      out.write("<!-- Modal -->\n");
      out.write("<div class=\"modal fade\" id=\"exampleModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\n");
      out.write("  <div class=\"modal-dialog\" role=\"document\">\n");
      out.write("    <div class=\"modal-content\">\n");
      out.write("      <div class=\"modal-header primary-background\">\n");
      out.write("        <h5 class=\"modal-title text-white\" id=\"exampleModalLabel\">Logout Now</h5>\n");
      out.write("        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\n");
      out.write("          <span aria-hidden=\"true\">&times;</span>\n");
      out.write("        </button>\n");
      out.write("      </div>\n");
      out.write("      <div class=\"modal-body\">\n");
      out.write("          <div>\n");
      out.write("              <strong class=\"text-dark\" style=\"font-size: 30px;\"><span>Do You want to Logout ?</span></strong>\n");
      out.write("          </div>\n");
      out.write("      </div>\n");
      out.write("      <div class=\"modal-footer\">\n");
      out.write("        <button type=\"button\" class=\"btn btn-primary\" data-dismiss=\"modal\"><i class=\"fa-solid fa-xmark\"></i> No</button>\n");
      out.write("        <a href=\"LogoutServlet\" type=\"button\" class=\"btn btn-danger\"><i class=\"fa-solid fa-arrow-right-from-bracket\"></i> Logout</a>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("<!--  Logout Modal End  -->\n");
      out.write("            \n");
      out.write("\n");
      out.write("<nav class=\"navbar navbar-expand-lg navbar-dark bg-custom\">\n");
      out.write("    <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarSupportedContent\" aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n");
      out.write("        <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("    </button>\n");
      out.write("\n");
      out.write("    <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\n");
      out.write("        <ul class=\"navbar-nav mr-auto\">\n");
      out.write("            <li class=\"nav-item active\">\n");
      out.write("                <a class=\"nav-link\" href=\"admin/profile.jsp\"><i class=\"fa-solid fa-user\"></i> Admin Profile <span class=\"sr-only\">(current)</span></a>\n");
      out.write("            </li>\n");
      out.write("            <li class=\"nav-item active\">\n");
      out.write("                <a class=\"nav-link\" href=\"admin/add_books.jsp\"><i class=\"fa-solid fa-file-circle-plus\"></i> Add Books</a>\n");
      out.write("            </li>\n");
      out.write("            <li class=\"nav-item active\">\n");
      out.write("                <a class=\"nav-link\" href=\"admin/all_books.jsp\"><i class=\"fa-solid fa-book-open\"></i> All Books</a>\n");
      out.write("            </li>\n");
      out.write("            <li class=\"nav-item active\">\n");
      out.write("                <a class=\"nav-link\" href=\"admin/orders.jsp\"><i class=\"fa-solid fa-box-open\"></i> All Orders</a>\n");
      out.write("            </li>\n");
      out.write("        </ul>\n");
      out.write("        <form class=\"form-inline my-2 my-lg-0\">\n");
      out.write("            <button class=\"btn btn-light my-2 my-sm-0\"><i class=\"fa-solid fa-gear\"></i> Setting</button>\n");
      out.write("            <button class=\"btn btn-light my-2 my-sm-0 ml-1\"><i class=\"fa-solid fa-phone\"></i> Contact Us</button>\n");
      out.write("        </form>\n");
      out.write("    </div>\n");
      out.write("</nav>\n");
      out.write("\n");
      out.write("        ");
            }
        
      out.write("\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <!--  View All Categories Recent Books Start  -->\n");
      out.write("        <div class=\"container-fluid p-3\">\n");
      out.write("            <div class=\"row p-3\">\n");
      out.write("                <div class=\"col-md-5\">\n");
      out.write("                    <div class=\"border\">\n");
      out.write("                        <!--<span class=\"rounded-circle fa-2x text-dark text-right\" style=\"\"><i class=\"fa-solid fa-heart\"></i></span>-->\n");
      out.write("                        <img class=\"card-img-top border-0 p-3\" src=\"books/c_books.jpg\" alt=\"Card image cap\" width=\"100%\" height=\"500px\" />\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"container text-center p-3\">\n");
      out.write("                        <a class=\"btn btn-warning btn-lg text-white\"><i class=\"fa-solid fa-cart-plus\"></i> ADD TO CARD</a>\n");
      out.write("                        <a class=\"btn btn-info btn-lg text-white\"><i class=\"fa-solid fa-indian-rupee-sign\"></i> PRICE</a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-md-7\">\n");
      out.write("                    <h2>Book Name : Java Programming Language</h2>\n");
      out.write("                    <h5>Author Name : Herbert</h5>\n");
      out.write("                    <h5>Book Category : New Book</h5>\n");
      out.write("                    <h2><i class=\"fa-solid fa-indian-rupee-sign\"></i> Price</h2>\n");
      out.write("                    <br>\n");
      out.write("                    <span style=\"color: #999999;\"> <h5>Available offers</h5></span>\n");
      out.write("                    <h5><i class=\"fa-solid fa-tag text-success\"></i> Cash On Delivery</h5>\n");
      out.write("                    <h5><i class=\"fa-solid fa-tag text-success\"></i> No Cost EMI</h5>\n");
      out.write("                    <h5><i class=\"fa-solid fa-tag text-success\"></i> 7 Day Seller Replacement Policy</h5>\n");
      out.write("                    <h5><i class=\"fa-solid fa-tag text-success\"></i> GST Invoice Available</h5>\n");
      out.write("                    \n");
      out.write("                    <br>\n");
      out.write("                    \n");
      out.write("                    <span style=\"color: #999999;\"><h5>Seller Details</h5></span>\n");
      out.write("                    <h5>Name <!--(<i class=\"fa-solid fa-user-check text-success\"></i>)--> : Julias Biswas</h5>\n");
      out.write("                    <h5>Email <!--(<i class=\"fa-solid fa-envelope-circle-check text-success\"></i>)--> : juliasbiswas0001@gmail.com </h5>\n");
      out.write("                    <h5>Phone No <!--(<i class=\"fa-solid fa-phone text-success\"></i>)--> : 6294160823</h5>\n");
      out.write("                    \n");
      out.write("                    <br><br>\n");
      out.write("                    \n");
      out.write("                    <span style=\"color: #999999;\"><h5>Extra Information</h5></span>\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"col-md-4 text-primary text-center p-2\">\n");
      out.write("                            <i class=\"fa-solid fa-money-bill-1-wave fa-3x\"></i>\n");
      out.write("                            <b><p>Cash On Delivery</p></b>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-md-4 text-danger text-center p-2\">\n");
      out.write("                            <i class=\"fa-solid fa-arrow-rotate-left fa-3x\"></i>\n");
      out.write("                            <b><p>Return Available</p></b>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-md-4 text-success text-center p-2\">\n");
      out.write("                            <i class=\"fa-solid fa-truck fa-3x\"></i>\n");
      out.write("                            <b><p>Free Delivery</p></b>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("                    <!--<div class=\"container text-center p-3\">\n");
      out.write("                        <a class=\"btn btn-warning btn-lg text-white\"><i class=\"fa-solid fa-cart-plus\"></i> ADD TO CARD</a>\n");
      out.write("                        <a class=\"btn btn-info btn-lg text-white\"><i class=\"fa-solid fa-indian-rupee-sign\"></i> PRICE</a>\n");
      out.write("                    </div>-->\n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <!--  View All Categories Recent Books End  -->\n");
      out.write("        \n");
      out.write("\n");
      out.write("        <br><br>\n");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<div class=\"container-fluid text-center text-white bg-custom p-3 mt-2\">\n");
      out.write("    <h5>Design and Developed by CodeWith Julias</h5>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!--  JavaScript Code Start  -->\n");
      out.write("\n");
      out.write("        <!--  Go To Top in the Page Start  -->\n");
      out.write("        <script>\n");
      out.write("            //Get the button\n");
      out.write("            var mybutton = document.getElementById(\"myBtn\");\n");
      out.write("\n");
      out.write("            // When the user scrolls down 20px from the top of the document, show the button\n");
      out.write("            window.onscroll = function () {\n");
      out.write("                scrollFunction()\n");
      out.write("            };\n");
      out.write("\n");
      out.write("            function scrollFunction() {\n");
      out.write("                if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {\n");
      out.write("                    mybutton.style.display = \"block\";\n");
      out.write("                } else {\n");
      out.write("                    mybutton.style.display = \"none\";\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            // When the user clicks on the button, scroll to the top of the document\n");
      out.write("            function topFunction() {\n");
      out.write("                document.body.scrollTop = 0;\n");
      out.write("                document.documentElement.scrollTop = 0;\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("        <!--  Go To Top in the Page End  -->\n");
      out.write("\n");
      out.write("        <!--  JavaScript Code End  -->\n");
      out.write("\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
