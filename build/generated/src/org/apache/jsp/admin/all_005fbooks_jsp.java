package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.entity.User;
import com.db.DBConnect;
import com.dao.BookDaoClass;

public final class all_005fbooks_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(3);
    _jspx_dependants.add("/admin/../admin/link/all_links.jsp");
    _jspx_dependants.add("/admin/../admin/navbar.jsp");
    _jspx_dependants.add("/admin/../footer.jsp");
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
      			null, true, 8192, true);
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
 
    User user = (User) session.getAttribute("userObj");
    
    if( user == null )
    {
        response.sendRedirect("signin.jsp");
    }

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>EBook System - All Books</title>\n");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("<!--  Bootstrap 4 CSS  -->\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css\" integrity=\"sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm\" crossorigin=\"anonymous\">\n");
      out.write("\n");
      out.write("\n");
      out.write("<!--  Manual CSS  -->\n");
      out.write("<link href=\"../css/style.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
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
      out.write("        \n");
      out.write("        <style>\n");
      out.write("            body\n");
      out.write("            {\n");
      out.write("                background: url('../img/all-book-bg-img.jpg');\n");
      out.write("                background-size: cover;\n");
      out.write("                background-attachment: fixed;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <!--  For Navbar Start  -->\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<div class=\"container-fluid\" style=\"height: 10px; background-color: #303f9f;\">\n");
      out.write("    \n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<div class=\"container-fluid p-3 bg-light\">\n");
      out.write("    <div class=\"row\">\n");
      out.write("        <div class=\"col-md-4 col-sm-4 col-xs-4 text-success\">\n");
      out.write("            <a href=\"../index.jsp\" style=\"text-decoration: none;\"><h3 class=\"text-success\"><i class=\"fa-solid fa-book\"></i> EBook</h3></a>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-md-5 col-sm-5 col-xs-5\">\n");
      out.write("            <form class=\"form-inline my-2 my-lg-0\">\n");
      out.write("                <input class=\"form-control mr-sm-2\" type=\"search\" placeholder=\"Search\" aria-label=\"Search\">\n");
      out.write("                <button class=\"btn btn-primary my-2 my-sm-0\" type=\"submit\">Search</button>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-md-3 col-sm-3 col-xs-3 text-right\">\n");
      out.write("            <a href=\"#!\" class=\"btn btn-primary\"><i class=\"fa-solid fa-arrow-right-from-bracket\"></i> Logout </a>\n");
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
      out.write("                <a class=\"nav-link\" href=\"../admin/profile.jsp\"><i class=\"fa-solid fa-user\"></i> Admin Profile <span class=\"sr-only\">(current)</span></a>\n");
      out.write("            </li>\n");
      out.write("        </ul>\n");
      out.write("        <form class=\"form-inline my-2 my-lg-0\">\n");
      out.write("            <button class=\"btn btn-light my-2 my-sm-0\"><i class=\"fa-solid fa-gear\"></i> Setting</button>\n");
      out.write("            <button class=\"btn btn-light my-2 my-sm-0 ml-1\"><i class=\"fa-solid fa-phone\"></i> Contact Us</button>\n");
      out.write("        </form>\n");
      out.write("    </div>\n");
      out.write("</nav>\n");
      out.write("\n");
      out.write("        <!--  For Navbar End  -->\n");
      out.write("\n");
      out.write("\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"row mt-3 mb-3\">\n");
      out.write("                <div class=\"col-md-6 offset-md-3\">\n");
      out.write("                    <h3 class=\"text-center text-white\">Welcome ");
      out.print( user.getName() );
      out.write("</h3>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("\n");
      out.write("        <table class=\"table table-striped table-hover table-bordered\">\n");
      out.write("            <thead class=\"bg-success text-white\">\n");
      out.write("                <tr>\n");
      out.write("                    <th scope=\"col\">Book Image</th>\n");
      out.write("                    <th scope=\"col\">Book Name</th>\n");
      out.write("                    <th scope=\"col\">Author Name</th>\n");
      out.write("                    <th scope=\"col\">Price</th>\n");
      out.write("                    <th scope=\"col\">Book Categories</th>\n");
      out.write("                    <th scope=\"col\">Book Status</th>\n");
      out.write("                    <th scope=\"col\">Book Action</th>\n");
      out.write("                </tr>\n");
      out.write("            </thead>\n");
      out.write("            <tbody class=\"text-white\">\n");
      out.write("                \n");
      out.write("                ");

                    BookDaoClass bookDaoClass = new BookDaoClass(DBConnect.getConnection());
                    
                    
                
      out.write("\n");
      out.write("                \n");
      out.write("                <tr>\n");
      out.write("                    <th scope=\"row\">1</th>\n");
      out.write("                    <td>Jacob</td>\n");
      out.write("                    <td>Thornton</td>\n");
      out.write("                    <td>@fat</td>\n");
      out.write("                    <td>Mark</td>\n");
      out.write("                    <td>Otto</td>\n");
      out.write("                    <td>\n");
      out.write("                        <a href=\"#\" class=\"btn btn-sm btn-primary\">Edit</a>\n");
      out.write("                        <a href=\"#\" class=\"btn btn-sm btn-danger\">Delete</a>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("            </tbody>\n");
      out.write("        </table>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <br><br><br>\n");
      out.write("\n");
      out.write("        <!--  Footer Part Start  -->\n");
      out.write("        <div style=\"margin-top: 375px;\">\n");
      out.write("            ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<div class=\"container-fluid text-center text-white bg-custom p-3 mt-2\">\n");
      out.write("    <h5>Design and Developed by CodeWith Julias</h5>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("        <!--  Footer Part End  -->\n");
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
