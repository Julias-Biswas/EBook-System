/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.entity.BookOrder;
import java.util.List;

/**
 *
 * @author julia
 */
public interface OrderDao 
{
    
    /*  Save User Order into a Database Method Start  */
    public boolean saveOrder(List<BookOrder> bookOrder);
    /*  Save User Order into a Database Method End  */
    
    
    /*  Get Perticular User All Order Books Method Start  */
    public List<BookOrder> getPerticularUserAllBooks(String userEmail);
    /*  Get Perticular User All Order Books Method End  */
    
    
    /*  Get Perticular Admin All User Order Books Method Start  */
    public List<BookOrder> getPerticularAdminAllBooks(int bookId);
    /*  Get Perticular Admin All User Order Books Method End  */
    
}
