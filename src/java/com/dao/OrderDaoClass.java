/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.entity.BookOrder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author julia
 */
public class OrderDaoClass implements OrderDao
{

    private final Connection con;

    public OrderDaoClass(Connection con) 
    {
        this.con = con;
    }
    
    
    /*  Save User Order into a Database Method Start  */
    @Override
    public boolean saveOrder(List<BookOrder> bookOrder)
    {
        boolean status = false;
        
        try
        {
            String query = "INSERT INTO book_order(orderId, userName, userEmail, userPhno, userAlternativePhno, address, cityDistictTown, landmark, state, pinCode, cartId, bookId, bookName, author, price, bookPhoto, bookCategory, payment, deliveryAddressType, totalAmount) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            
            con.setAutoCommit(false);
            
            PreparedStatement ps = con.prepareStatement(query);
            
            for( BookOrder bookList : bookOrder )
            {
                ps.setString(1, bookList.getOrderId());
                ps.setString(2, bookList.getUserName());
                ps.setString(3, bookList.getUserEmail());
                ps.setString(4, bookList.getUserPhno());
                ps.setString(5, bookList.getUserAlternativePhno());
                ps.setString(6, bookList.getAddress());
                ps.setString(7, bookList.getCityDistictTown());
                ps.setString(8, bookList.getLandmark());
                ps.setString(9, bookList.getState());
                ps.setString(10, bookList.getPinCode());
                ps.setInt(11, bookList.getCartId());
                ps.setInt(12, bookList.getBookId());
                ps.setString(13, bookList.getBookName());
                ps.setString(14, bookList.getAuthor());
                ps.setDouble(15, bookList.getPrice());
                ps.setString(16, bookList.getBookPhoto());
                ps.setString(17, bookList.getBookCategory());
                ps.setString(18, bookList.getPayment());
                ps.setString(19, bookList.getDeliveryAddressType());
                ps.setDouble(20, bookList.getTotalAmount());
                
                ps.addBatch();
                
            }
            
            int []rowCount = ps.executeBatch();
            
            con.commit();
            
            status = true;
            
            con.setAutoCommit(true);
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return status;
    }
    /*  Save User Order into a Database Method End  */

    
    /*  Get Perticular User All Order Books Method Start  */
    @Override
    public List<BookOrder> getPerticularUserAllBooks(String userEmail)
    {
        List<BookOrder> list = new ArrayList<BookOrder>();
        
        BookOrder bookOrder = null;
        
        try
        {
            String query = "SELECT * FROM book_order WHERE userEmail=? ORDER BY id DESC";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, userEmail);
            
            ResultSet rs = ps.executeQuery();
            
            while( rs.next() )
            {
                bookOrder = new BookOrder();
                
                bookOrder.setId(rs.getInt("id"));
                bookOrder.setOrderId(rs.getString("orderId"));
                bookOrder.setUserName(rs.getString("userName"));
                bookOrder.setUserEmail(rs.getString("userEmail"));
                bookOrder.setUserPhno(rs.getString("userPhno"));
                bookOrder.setUserAlternativePhno(rs.getString("userAlternativePhno"));
                bookOrder.setAddress(rs.getString("address"));
                bookOrder.setCityDistictTown(rs.getString("cityDistictTown"));
                bookOrder.setLandmark(rs.getString("landmark"));
                bookOrder.setState(rs.getString("state"));
                bookOrder.setPinCode(rs.getString("pinCode"));
                bookOrder.setCartId(rs.getInt("cartId"));
                bookOrder.setBookId(rs.getInt("bookId"));
                bookOrder.setBookName(rs.getString("bookName"));
                bookOrder.setAuthor(rs.getString("author"));
                bookOrder.setPrice(rs.getDouble("price"));
                bookOrder.setBookPhoto(rs.getString("bookPhoto"));
                bookOrder.setBookCategory(rs.getString("bookCategory"));
                bookOrder.setPayment(rs.getString("payment"));
                bookOrder.setDeliveryAddressType(rs.getString("deliveryAddressType"));
                bookOrder.setBookOrderTime(rs.getTimestamp("bookOrderTime"));
                bookOrder.setTotalAmount(rs.getDouble("totalAmount"));
                
                list.add(bookOrder);
            }
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
    }
    /*  Get Perticular User All Order Books Method End  */

    
    /*  Get Perticular Admin All User Order Books Method Start  */
    @Override
    public List<BookOrder> getPerticularAdminAllBooks(int bookId)
    {
        List<BookOrder> list = new ArrayList<BookOrder>();
        
        BookOrder bookOrder = null;
        
        try
        {
            String query = "SELECT * FROM book_order WHERE bookId=? ORDER BY id DESC";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setInt(1, bookId);
            
            ResultSet rs = ps.executeQuery();
            
            while( rs.next() )
            {
                bookOrder = new BookOrder();
                
                bookOrder.setId(rs.getInt("id"));
                bookOrder.setOrderId(rs.getString("orderId"));
                bookOrder.setUserName(rs.getString("userName"));
                bookOrder.setUserEmail(rs.getString("userEmail"));
                bookOrder.setUserPhno(rs.getString("userPhno"));
                bookOrder.setUserAlternativePhno(rs.getString("userAlternativePhno"));
                bookOrder.setAddress(rs.getString("address"));
                bookOrder.setCityDistictTown(rs.getString("cityDistictTown"));
                bookOrder.setLandmark(rs.getString("landmark"));
                bookOrder.setState(rs.getString("state"));
                bookOrder.setPinCode(rs.getString("pinCode"));
                bookOrder.setCartId(rs.getInt("cartId"));
                bookOrder.setBookId(rs.getInt("bookId"));
                bookOrder.setBookName(rs.getString("bookName"));
                bookOrder.setAuthor(rs.getString("author"));
                bookOrder.setPrice(rs.getDouble("price"));
                bookOrder.setBookPhoto(rs.getString("bookPhoto"));
                bookOrder.setBookCategory(rs.getString("bookCategory"));
                bookOrder.setPayment(rs.getString("payment"));
                bookOrder.setDeliveryAddressType(rs.getString("deliveryAddressType"));
                bookOrder.setBookOrderTime(rs.getTimestamp("bookOrderTime"));
                bookOrder.setTotalAmount(rs.getDouble("totalAmount"));
                
                list.add(bookOrder);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
    }
    /*  Get Perticular Admin All User Order Books Method End  */
    
}
