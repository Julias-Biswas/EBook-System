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
public class SignInServlet extends HttpServlet {

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
            out.println("<title>Servlet SignInServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            */
            
            
            try
            {
                UserDaoClass userDao = new UserDaoClass(DBConnect.getConnection());
                
                HttpSession session = request.getSession();
                
                
                /*  Get All date from Sign In Form  */
                String userEmail = request.getParameter("userEmail1");
                String userPassword = request.getParameter("userPassword1");
                String rememberMe = request.getParameter("rememberMe1");
                
                
                //out.printf(userEmail+" "+userPassword+" "+rememberMe);
                
                
                User u = userDao.getUserModule(userEmail);
                
                
                //System.out.println(u);
                
                
                if( u == null )
                {
                    session.setAttribute("errMsg", "Email Id is not Register, Please Sign Up!");
                    response.sendRedirect("signup.jsp");
                }
                else
                {
                    String userModule = u.getUserModule();
                    
                    
                    if( "Admin".equals(userModule) || "admin".equals(userModule) )
                    {
                        User user = userDao.userSignIn(userEmail, userPassword);

                        if( user != null )
                        {
                            session.setAttribute("userObj", user);
                            response.sendRedirect("admin/profile.jsp");
                        }
                        else
                        {
                            session.setAttribute("errMsg", "Email & Password Invalid");
                            response.sendRedirect("signin.jsp");
                        }
                        //out.print("Admin Part...");
                    }
                    else
                    {
                        User user = userDao.userSignIn(userEmail, userPassword);

                        if( user != null )
                        {
                            session.setAttribute("userObj", user);
                            response.sendRedirect("index.jsp");
                        }
                        else
                        {
                            session.setAttribute("errMsg", "Email & Password Invalid");
                            response.sendRedirect("signin.jsp");
                        }
                        //out.print("User Part...");
                    }
                }
            }
            catch(Exception e)
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
