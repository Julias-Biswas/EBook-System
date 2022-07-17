/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.entity.BookDetails;
import java.util.List;

/**
 *
 * @author julia
 */
public interface BookDao 
{
    /*  Add Books into Database method Start  */
    public boolean addBooks(BookDetails bookDetails);
    /*  Add Books into Database method End  */
    
    
    /*  Get All Books according to User Email Start  */
    public List<BookDetails> getAllBooks(String userEmail);
    /*  Get All Books according to User Email End  */
    
    
    /*  Edit Perticular Book Method Start   */
    public BookDetails editBookDetails(int id, String authorName, String bookCategory);
    /*  Edit Perticular Book Method End   */
    
    
    /*  Update Edit Book Method Start  */
    public boolean updateEditBooks(BookDetails bookDetails);
    /*  Update Edit Book Method End  */
    
    
    /*  Delete Books Method Start  */
    public boolean deleteBooks(int bookId, String authorName, String bookCategory);
    /*  Delete Books Method End  */
    
    
    /*  Get All New Books Method Start  */
    public List<BookDetails> getNewBooks();
    /*  Get All New Books Method End  */
    
    
    /*  Get All Recent Books (New Book and Old Books) Method Start  */
    public List<BookDetails> getRecentBooks();
    /*  Get All Recent Books (New Book and Old Books) Method End  */
    
    
    /*  Get All Old Books Method Start  */
    public List<BookDetails> getOldBooks();
    /*  Get All Old Books Method End  */
    
    
    /*  Get All New Books Method which are persent in Database Start  */
    public List<BookDetails> getAllNewBooks();
    /*  Get All New Books Method which are persent in Database End  */
    
    
    /*  Get All Recent Books Method which are persent in Database Start  */
    public List<BookDetails> getAllRecentBooks();
    /*  Get All Recent Books Method which are persent in Database End  */
    
    
    /*  Get All Old Books Method which are persent in Database Start  */
    public List<BookDetails> getAllOldBooks();
    /*  Get All Old Books Method which are persent in Database End  */
    
    
    /*  Search Book Using Book Name, Author Name Method Start  */
    public List<BookDetails> getBookBySearch(String searchBooks);
    /*  Search Book Using Book Name, Author Name Method End  */
    
}
