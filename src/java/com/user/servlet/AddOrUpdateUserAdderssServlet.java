/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.user.servlet;

import com.dao.UserDaoClass;
import com.db.DBConnect;
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
public class AddOrUpdateUserAdderssServlet extends HttpServlet {

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
            out.println("<title>Servlet AddOrUpdateUserAdderssServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            
            try
            {
                /*  Get All Date From User Address Form  */
                int userId = Integer.parseInt(request.getParameter("userId1"));
                String userEmail = request.getParameter("userEmail1");
                String userAddress = request.getParameter("userAddress1");
                String userCity = request.getParameter("userCity1");
                String userLandmark = request.getParameter("userLandmark1");
                String userState = request.getParameter("userState1");
                String userPinCode = request.getParameter("userPinCode1");
                String userPassword = request.getParameter("userPassword1");
                
                
                User user = new User();
                
                user.setId(userId);
                user.setEmail(userEmail);
                user.setAddress(userAddress);
                user.setCity(userCity);
                user.setLandmark(userLandmark);
                user.setState(userState);
                user.setPinCode(userPinCode);
                user.setPassword(userPassword);
                
                
                HttpSession session = request.getSession();
                
                
                UserDaoClass userDaoClass = new UserDaoClass(DBConnect.getConnection());
                
                boolean status = userDaoClass.checkEmailAndPassword(userId, userEmail, userPassword);
                
                if( status == true )
                {
                    boolean status2 = userDaoClass.userAddOrUpdateLocation(user);
                
                    if( status2 == true )
                    {
                        session.setAttribute("successMsg", "Location Updated Successfully!");
                        response.sendRedirect("user_address.jsp");
                    }
                    else
                    {
                        session.setAttribute("errMsg", "Location Updated Failed!");
                        response.sendRedirect("user_address.jsp");
                    }
                }
                else
                {
                    session.setAttribute("errMsg", "Your Password is Incorrect!");
                    response.sendRedirect("user_address.jsp");
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
