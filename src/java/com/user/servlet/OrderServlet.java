/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.user.servlet;

import com.dao.CartDaoClass;
import com.dao.OrderDaoClass;
import com.db.DBConnect;
import com.entity.BookOrder;
import com.entity.Cart;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author julia
 */
public class OrderServlet extends HttpServlet {

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
            out.println("<title>Servlet OrderServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            */
            
            
            try
            {
                /*  Get All Date from My Cart (User Filled up form)  */
                int userId = Integer.parseInt(request.getParameter("userId1"));
                String userName = request.getParameter("userName1");
                String userEmail = request.getParameter("userEmail1");
                String userPhoneNo = request.getParameter("userPhoneNo1");
                String userAlternativePhoneNo = request.getParameter("userAlternativePhoneNo1");
                String userAddress = request.getParameter("userAddress1");
                String userCityOrDistictOrTown = request.getParameter("userCityOrDistictOrTown1");
                String userLandmark = request.getParameter("userLandmark1");
                String userState = request.getParameter("userState1");
                String userPinCode = request.getParameter("userPinCode1");
                String userPaymentType = request.getParameter("userPaymentType1");
                String userDeliveryAddressType = request.getParameter("userDeliveryAddressType1");
                
                
                //out.print(userId+", "+userName+", "+userEmail+", "+userPhoneNo+", "+userAlternativePhoneNo+", "+userAddress+", "+userCityOrDistictOrTown+", "+userLandmark+", "+userState+", "+userPinCode+", "+userPaymentType+", "+userDeliveryAddressType);
                
                
                HttpSession session = request.getSession();
                
                
                /*  Get All Books Details from Perticular User Cart  */
                CartDaoClass cartDaoClass = new CartDaoClass(DBConnect.getConnection());
                
                List<Cart> cartList = cartDaoClass.getBookByUser(userEmail);
                
                if( cartList.isEmpty() )
                {
                    session.setAttribute("successMsg", "Please Select Atleast One Item in the Cart...");
                    response.sendRedirect("my_cart.jsp");
                }
                else
                {
                    OrderDaoClass orderDaoClass = new OrderDaoClass(DBConnect.getConnection());
                    
                    BookOrder bookOrder = null;

                    ArrayList<BookOrder> orderList = new ArrayList<BookOrder>();

                    Random random = new Random();

                    for( Cart cartBookList : cartList )
                    {
                        bookOrder = new BookOrder();

                        //out.print(cartBookList.getcId()+", "+cartBookList.getBookId()+", "+cartBookList.getUserEmail()+", "+cartBookList.getBookName()+", "+cartBookList.getAuthor()+", "+cartBookList.getBookCategory()+", "+cartBookList.getBookPhoto()+", "+cartBookList.getPrice()+", "+cartBookList.getTotalPrice());

                        bookOrder.setOrderId("BOOK-ORD-000"+random.nextInt(2147483647));
                        bookOrder.setUserName(userName);
                        bookOrder.setUserEmail(userEmail);
                        bookOrder.setUserPhno(userPhoneNo);
                        bookOrder.setUserAlternativePhno(userAlternativePhoneNo);
                        bookOrder.setAddress(userAddress);
                        bookOrder.setCityDistictTown(userCityOrDistictOrTown);
                        bookOrder.setLandmark(userLandmark);
                        bookOrder.setState(userState);
                        bookOrder.setPinCode(userPinCode);
                        bookOrder.setCartId(cartBookList.getcId());
                        bookOrder.setBookId(cartBookList.getBookId());
                        bookOrder.setBookName(cartBookList.getBookName());
                        bookOrder.setAuthor(cartBookList.getAuthor());
                        bookOrder.setPrice(cartBookList.getPrice());
                        bookOrder.setBookPhoto(cartBookList.getBookPhoto());
                        bookOrder.setBookCategory(cartBookList.getBookCategory());
                        bookOrder.setPayment(userPaymentType);
                        bookOrder.setDeliveryAddressType(userDeliveryAddressType);
                        bookOrder.setTotalAmount(cartBookList.getTotalPrice());

                        orderList.add(bookOrder);
                        
                        /*  For Delete Perticular Cart Items Method Called from cart Table in Database  */
                        if( userPaymentType != null && userDeliveryAddressType != null && userState != null )
                        {
                            cartDaoClass.deleteBookFromCart(cartBookList.getBookId(), userEmail, cartBookList.getAuthor(), cartBookList.getBookCategory(), cartBookList.getcId());
                        }
                        
                    }
                    
                    
                    /*
                    *   User don't select any payment type then it will provide error
                    *   otherwise it will run properly.
                    */
                    if( userPaymentType == null )
                    {
                        session.setAttribute("successMsg", "Please Select Payment Type...");
                        response.sendRedirect("my_cart.jsp");
                    }
                    else if(userDeliveryAddressType == null )
                    {
                        session.setAttribute("successMsg", "Please Select Delivery Location...");
                        response.sendRedirect("my_cart.jsp");
                    }
                    else if( userState == null )
                    {
                        session.setAttribute("successMsg", "Please Select Your State...");
                        response.sendRedirect("my_cart.jsp");
                    }
                    else
                    {
                        boolean status = orderDaoClass.saveOrder(orderList);

                        if( status == true )
                        {
                            //out.print("Order Successfully...");
                            
                            response.sendRedirect("order_successfully.jsp");
                        }
                        else
                        {
                            //out.print("Order Failed...");
                            
                            session.setAttribute("errMsg", "Your Order is Failed...");
                            response.sendRedirect("my_cart.jsp");
                        }
                    }
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
