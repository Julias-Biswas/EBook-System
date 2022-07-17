/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.user.servlet;

import com.dao.CartDaoClass;
import com.db.DBConnect;
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
public class RemoveBookCartServlet extends HttpServlet {

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
            out.println("<title>Servlet RemoveBookServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            
            int bookId = Integer.parseInt(request.getParameter("v"));
            String userEmail = request.getParameter("ratio");
            String authorName = request.getParameter("list");
            String bookCategory = request.getParameter("link");
            int cId = Integer.parseInt(request.getParameter("unicode"));
            
            
            //out.print(bookId+" "+authorName+" "+bookCategory);
            
            
            CartDaoClass cartDaoClass = new CartDaoClass(DBConnect.getConnection());
            
            boolean status = cartDaoClass.deleteBookFromCart(bookId, userEmail, authorName, bookCategory, cId);
            
            
            HttpSession session = request.getSession();
            
            if( status == true )
            {
                session.setAttribute("successMsg", "Book Remove To Cart Successfully...");
                response.sendRedirect("my_cart.jsp");
                
                //out.print("Book Delete To Cart Successfully...");
            }
            else
            {
                session.setAttribute("errMsg", "Book Remove To Cart Failed...");
                response.sendRedirect("my_cart.jsp");
                
                //out.print("Book Delete To Cart Failed...");
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
