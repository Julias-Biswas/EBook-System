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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author julia
 */
//@WebServlet("/reg")
@MultipartConfig
public class SignUpServlet extends HttpServlet {

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
            out.println("<title>Servlet SignUpServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            */
            
            
            /*  Get All date from Sign Up Form  */
            String userName = request.getParameter("userName1");
            String userEmail = request.getParameter("userEmail1");
            String userPhone = request.getParameter("userPhone1");
            String userPassword1 = request.getParameter("userPassword1");
            String userType = request.getParameter("userType1");
            String userCheck1 = request.getParameter("userCheck1");
            
            
            //out.print(userName+" "+userEmail+" "+userPhone+" "+userPassword1+" "+userCheck1);
            
            
            /*  Set All data in User Class by using getter and setter method  */
            User user = new User();
            
            user.setName(userName);
            user.setEmail(userEmail);
            user.setPhno(userPhone);
            user.setPassword(userPassword1);
            user.setUserModule(userType);
            
            
            HttpSession session = request.getSession();
            
            
            /*  User click Check Box or not  */
            /*  If click then `on` otherwise `null` */
            if( userCheck1 != null && userType != null )
            {
                UserDaoClass dao = new UserDaoClass(DBConnect.getConnection());
            
                boolean status = dao.userRegister(user);

                if( status == true )
                {
                    //session.setAttribute("successMsg", "Sign Up Success!, Please Sign In Now...");
                    //response.sendRedirect("signin.jsp");
                    
                    out.print("Done...");
                }
                else
                {
                    //session.setAttribute("errMsg", "Invalid Details, Please Enter Correct Details...");
                    //response.sendRedirect("signup.jsp");
                    
                    out.print("Already Register...");
                }
            }
            else if( userCheck1 == null )
            {
                //session.setAttribute("errMsg", "Please Agree Terms & Conditions");
                //response.sendRedirect("signup.jsp");
                
                out.print(userCheck1);
            }
            else if( userType == null )
            {
                out.print("User Type Empty...");
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
