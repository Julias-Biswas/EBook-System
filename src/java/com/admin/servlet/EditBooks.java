/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.servlet;

import com.dao.BookDaoClass;
import com.db.DBConnect;
import com.entity.BookDetails;
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
public class EditBooks extends HttpServlet {

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
            /*
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditBooks</title>");            
            out.println("</head>");
            out.println("<body>");
            */
            
            
            try
            {
                /*  Get All data from Edit Books Form  */
                int bookId = Integer.parseInt(request.getParameter("bookId1"));
                String userEmail = request.getParameter("userEmail1");
                String bookName = request.getParameter("bookName1");
                String authorName = request.getParameter("authorName1");
                Double price = Double.parseDouble(request.getParameter("price1"));
                String bookStatus = request.getParameter("bookStatus1");
                
                
                //out.print(bookId+" "+userEmail+" "+bookName+" "+authorName+" "+price+" "+bookStatus);
                
                BookDetails bookDetails = new BookDetails();
                
                bookDetails.setBookId(bookId);
                bookDetails.setUserEmail(userEmail);
                bookDetails.setBookName(bookName);
                bookDetails.setAuthor(authorName);
                bookDetails.setPrice(price);
                bookDetails.setBookStatus(bookStatus);
                
                
                BookDaoClass bookDaoClass = new BookDaoClass(DBConnect.getConnection());
                
                boolean status = bookDaoClass.updateEditBooks(bookDetails);
                
                
                HttpSession session = request.getSession();
                
                if( status == true )
                {
                    session.setAttribute("successMsg", "Book Updated Successfully...!!!");
                    response.sendRedirect("admin/all_books.jsp");
                    
                    //out.print("Book Updated Successfully...");
                }
                else
                {
                    session.setAttribute("errMsg", "Book Updated Failed...!!!");
                    response.sendRedirect("admin/all_books.jsp");
                    
                    //out.print("Book Updated Failed...");
                }
                
            }
            catch(NumberFormatException | IOException e)
            {
                e.printStackTrace();
            }
            
            
            /*
            out.println("</body>");
            out.println("</html>");
            */
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
