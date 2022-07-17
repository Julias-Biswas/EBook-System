/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.entity.Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author julia
 */
public class CartDaoClass implements CartDao
{
    private final Connection con;

    public CartDaoClass(Connection con)
    {
        this.con = con;
    }
    
    
    /*  Books Add Cart Method Start  */
    @Override
    public boolean addCart(Cart cart) 
    {
        boolean status = false;
        
        try
        {
            String query = "INSERT INTO cart(bookId,userEmail,bookName,author,bookCategory,bookPhoto,price,totalPrice) VALUES(?,?,?,?,?,?,?,?)";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setInt(1, cart.getBookId());
            ps.setString(2, cart.getUserEmail());
            ps.setString(3, cart.getBookName());
            ps.setString(4, cart.getAuthor());
            ps.setString(5, cart.getBookCategory());
            ps.setString(6, cart.getBookPhoto());
            ps.setDouble(7, cart.getPrice());
            ps.setDouble(8, cart.getTotalPrice());
            
            int rowCount = ps.executeUpdate();
            
            if( rowCount > 0 )
            {
                status = true;
            }
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return status;
    }
    /*  Books Add Cart Method Start  */

    
    /*  Get All Books by User in Cart Method Start  */
    @Override
    public List<Cart> getBookByUser(String userEmail)
    {
        List<Cart> list = new ArrayList<Cart>();
        
        Cart cart = null;
        
        double totalPrice = 0;
        
        try
        {
            String query = "SELECT * FROM cart WHERE userEmail=? ORDER BY cId DESC";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, userEmail);
            
            ResultSet rs = ps.executeQuery();
            
            while( rs.next() )
            {
                cart = new Cart();
                
                cart.setcId(rs.getInt("cId"));
                cart.setBookId(rs.getInt("bookId"));
                cart.setUserEmail(rs.getString("userEmail"));
                cart.setBookName(rs.getString("bookName"));
                cart.setAuthor(rs.getString("author"));
                cart.setBookCategory(rs.getString("bookCategory"));
                cart.setBookPhoto(rs.getString("bookPhoto"));
                cart.setPrice(rs.getDouble("price"));
                
                totalPrice = totalPrice + rs.getDouble("totalPrice");
                
                cart.setTotalPrice(totalPrice);
                
                list.add(cart);
                
            }
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
    }
    /*  Get All Books by User in Cart Method End  */

    
    /*  Delete Cart Book According to Book Id, Author Name and Book Category Method Start  */
    @Override
    public boolean deleteBookFromCart(int bookId, String userEmail, String authorName, String bookCategory, int cId)
    {
        boolean status = false;
        
        try
        {
            String query = "DELETE FROM cart WHERE bookId=? AND userEmail=? AND author=? AND bookCategory=? AND cId=?";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setInt(1, bookId);
            ps.setString(2, userEmail);
            ps.setString(3, authorName);
            ps.setString(4, bookCategory);
            ps.setInt(5, cId);
            
            int rowCount = ps.executeUpdate();
            
            if( rowCount > 0 )
            {
                status = true;
            }
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return status;
    }
    /*  Delete Cart Book According to Book Id, Author Name and Book Category Method End  */
    
}
