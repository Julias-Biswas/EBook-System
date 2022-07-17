/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.user.servlet;

import com.dao.BookDaoClass;
import com.dao.CartDaoClass;
import com.dao.UserDaoClass;
import com.db.DBConnect;
import com.entity.BookDetails;
import com.entity.Cart;
import com.entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author julia
 */
public class CardServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CardServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            
            try
            {
                int bookId = Integer.parseInt(request.getParameter("v"));
                String authorName = request.getParameter("list");
                String bookCategory = request.getParameter("link");
                int userId = Integer.parseInt(request.getParameter("ratio"));
                
                BookDaoClass bookDaoClass = new BookDaoClass(DBConnect.getConnection());
                
                BookDetails bookDetails = bookDaoClass.editBookDetails(bookId, authorName, bookCategory);
                
                
                UserDaoClass userDaoClass = new UserDaoClass(DBConnect.getConnection());
                
                User user = userDaoClass.getUserDetailsByUsingUserId(userId);
                
                
                Cart cart = new Cart();
                
                cart.setBookId(bookId);
                cart.setUserEmail(user.getEmail());
                cart.setBookName(bookDetails.getBookName());
                cart.setAuthor(bookDetails.getAuthor());
                cart.setBookCategory(bookDetails.getBookCategory());
                cart.setBookPhoto(bookDetails.getPhoto());
                cart.setPrice(bookDetails.getPrice());
                cart.setTotalPrice(bookDetails.getPrice());
                
                
                CartDaoClass cartDaoClass = new CartDaoClass(DBConnect.getConnection());
                
                boolean status = cartDaoClass.addCart(cart);
                
                
                HttpSession session = request.getSession();
                
                
                if( status == true )
                {
                    session.setAttribute("successMsg", "Book Add To Cart Successfully...");
                    response.sendRedirect("my_cart.jsp");
                    
                    //out.print("Book Add To Cart Successfully...");
                }
                else
                {
                    session.setAttribute("errMsg", "Book Add To Cart Failed...");
                    response.sendRedirect("my_cart.jsp");
                    
                    //out.print("Book Add To Cart Failed...");
                }
                
                
            }
            catch(NumberFormatException | IOException e)
            {
                e.printStackTrace();
            }
            
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
