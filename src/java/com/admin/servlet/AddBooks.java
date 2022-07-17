/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.servlet;

import com.dao.BookDao;
import com.dao.BookDaoClass;
import com.db.DBConnect;
import com.entity.BookDetails;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author julia
 */
@MultipartConfig
public class AddBooks extends HttpServlet {

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
            out.println("<title>Servlet AddBooks</title>");            
            out.println("</head>");
            out.println("<body>");
            */
            
            
            try
            {
                /*  Get All data from Add Books Form  */
                String bookName = request.getParameter("bookName1");
                String authorName = request.getParameter("authorName1");
                Double price = Double.parseDouble(request.getParameter("price1"));
                String bookCategories = request.getParameter("bookCategories1");
                String bookStatus = request.getParameter("bookStatus1");
                Part part = request.getPart("bookPic1");
                String fileName = part.getSubmittedFileName();
                
                String userEmail = request.getParameter("userEmail1");
                
                
                BookDetails bookDetails = new BookDetails(bookName, authorName, price, bookCategories, bookStatus, fileName, userEmail);
                
                //out.print(bookDetails);
                
                BookDao bookDao = new BookDaoClass(DBConnect.getConnection());
                
                boolean status = bookDao.addBooks(bookDetails);
                
                HttpSession session = request.getSession();
                
                if( status == true )
                {
                    String path = getServletContext().getRealPath("")+"/books";
                    
                    //out.print(path);
                    
                    File file = new File(path);
                    part.write(path + File.separator + fileName);
                    
                    
                    //session.setAttribute("successMsg", "Book Added Successfully...");
                    //response.sendRedirect("admin/add_books.jsp");
                    
                    out.print("Book Added Successfully...");
                }
                else
                {
                    //session.setAttribute("errMsg", "Something went Wrong! Book Added Failed...");
                    //response.sendRedirect("admin/add_books.jsp");
                    
                    out.print("Book Added Failed...");
                }
                
            }
            catch(NumberFormatException | IOException | ServletException e)
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
