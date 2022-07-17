/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.entity.Cart;
import java.util.List;

/**
 *
 * @author julia
 */
public interface CartDao 
{
    /*  Books Add Cart Method Start  */
    public boolean addCart(Cart cart);
    /*  Books Add Cart Method End  */
    
    
    /*  Get All Books by User in Cart Method Start  */
    public List<Cart> getBookByUser(String userEmail);
    /*  Get All Books by User in Cart Method End  */
    
    
    /*  Delete Cart Book According to Book Id, Author Name and Book Category Method Start  */
    public boolean deleteBookFromCart(int bookId, String userEmail, String authorName, String bookCategory, int cId);
    /*  Delete Cart Book According to Book Id, Author Name and Book Category Method End  */
    
}
