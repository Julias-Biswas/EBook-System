/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.entity.BookDetails;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author julia
 */
public class BookDaoClass implements BookDao
{

    private final Connection con;

    public BookDaoClass(Connection con) {
        this.con = con;
    }
    
    
    /*  Add Books into Database method Start  */
    @Override
    public boolean addBooks(BookDetails bookDetails)
    {
        boolean status = false;
        
        try
        {
            String query = "INSERT INTO book_details(bookName,author,price,bookCategory,bookStatus,photo,userEmail) VALUES(?,?,?,?,?,?,?)";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, bookDetails.getBookName());
            ps.setString(2, bookDetails.getAuthor());
            ps.setDouble(3, bookDetails.getPrice());
            ps.setString(4, bookDetails.getBookCategory());
            ps.setString(5, bookDetails.getBookStatus());
            ps.setString(6, bookDetails.getPhoto());
            ps.setString(7, bookDetails.getUserEmail());
            
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
    /*  Add Books into Database method End  */

    
    /*  Get All Books according to User Email Start  */
    @Override
    public List<BookDetails> getAllBooks(String userEmail) 
    {
        List<BookDetails> list = new ArrayList<BookDetails>();
        
        BookDetails bookDetails = null;
        
        
        try
        {
            String query = "SELECT * FROM book_details WHERE userEmail=? ORDER BY bookId DESC";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, userEmail);
            
            ResultSet rs = ps.executeQuery();
            
            while( rs.next() )
            {
                bookDetails = new BookDetails();
                
                bookDetails.setBookId(rs.getInt("bookId"));
                bookDetails.setBookName(rs.getString("bookName"));
                bookDetails.setAuthor(rs.getString("author"));
                bookDetails.setPrice(rs.getDouble("price"));
                bookDetails.setBookCategory(rs.getString("bookCategory"));
                bookDetails.setBookStatus(rs.getString("bookStatus"));
                bookDetails.setPhoto(rs.getString("photo"));
                bookDetails.setUserEmail(rs.getString("userEmail"));
                
                list.add(bookDetails);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
    }
    /*  Get All Books according to User Email End  */

    
    /*  Edit Perticular Book Method Start   */
    @Override
    public BookDetails editBookDetails(int id, String authorName, String bookCategory) 
    {
        BookDetails bookDetails = null;
        
        try
        {
            String query = "SELECT * FROM book_details WHERE bookId=? AND author=? AND bookCategory=?";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setInt(1, id);
            ps.setString(2, authorName);
            ps.setString(3, bookCategory);
            
            ResultSet rs = ps.executeQuery();
            
            while( rs.next() )
            {
                bookDetails = new BookDetails();
                
                bookDetails.setBookId(rs.getInt("bookId"));
                bookDetails.setBookName(rs.getString("bookName"));
                bookDetails.setAuthor(rs.getString("author"));
                bookDetails.setPrice(rs.getDouble("price"));
                bookDetails.setBookCategory(rs.getString("bookCategory"));
                bookDetails.setBookStatus(rs.getString("bookStatus"));
                bookDetails.setPhoto(rs.getString("photo"));
                bookDetails.setUserEmail(rs.getString("userEmail"));
                
            }
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return bookDetails;
    }
    /*  Edit Perticular Book Method End   */

    
    /*  Update Edit Book Method Start  */
    @Override
    public boolean updateEditBooks(BookDetails bookDetails)
    {
        boolean status = false;
        
        try
        {
            String query = "UPDATE book_details SET bookName=?, author=?, price=?, bookStatus=? WHERE bookId=? AND userEmail=?";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, bookDetails.getBookName());
            ps.setString(2, bookDetails.getAuthor());
            ps.setDouble(3, bookDetails.getPrice());
            ps.setString(4, bookDetails.getBookStatus());
            ps.setInt(5, bookDetails.getBookId());
            ps.setString(6, bookDetails.getUserEmail());
            
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
    /*  Update Edit Book Method End  */

    
    /*  Delete Books Method Start  */
    @Override
    public boolean deleteBooks(int bookId, String authorName, String bookCategory) 
    {
        boolean status = false;
        
        try
        {
            String query = "DELETE FROM book_details WHERE bookId=? AND author=? AND bookCategory=?";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setInt(1, bookId);
            ps.setString(2, authorName);
            ps.setString(3, bookCategory);
            
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
    /*  Delete Books Method End  */

    
    /*  Get All New Books Method Start  */
    @Override
    public List<BookDetails> getNewBooks() 
    {
        List<BookDetails> list = new ArrayList<BookDetails>();
        
        BookDetails bookDetails = null;
        
        try
        {
            String query = "SELECT * FROM book_details WHERE bookCategory=? AND bookStatus=? ORDER BY bookId DESC";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, "New Book");
            ps.setString(2, "Active");
            
            ResultSet rs = ps.executeQuery();
            
            int totalBooks = 1;
            
            while( rs.next() && totalBooks <= 4 )
            {
                bookDetails = new BookDetails();
                
                bookDetails.setBookId(rs.getInt("bookId"));
                bookDetails.setBookName(rs.getString("bookName"));
                bookDetails.setAuthor(rs.getString("author"));
                bookDetails.setPrice(rs.getDouble("price"));
                bookDetails.setBookCategory(rs.getString("bookCategory"));
                bookDetails.setBookStatus(rs.getString("bookStatus"));
                bookDetails.setPhoto(rs.getString("photo"));
                bookDetails.setUserEmail(rs.getString("userEmail"));
                
                list.add(bookDetails);
                
                totalBooks++;
            }
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
    }
    /*  Get All New Books Method End  */

    
    /*  Get All Recent Books (New Book and Old Books) Method Start  */
    @Override
    public List<BookDetails> getRecentBooks() 
    {
        List<BookDetails> list = new ArrayList<BookDetails>();
        
        BookDetails bookDetails = null;
        
        try
        {
            String query = "SELECT * FROM book_details WHERE bookStatus=? ORDER BY bookId DESC";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, "Active");
            
            ResultSet rs = ps.executeQuery();
            
            int totalBooks = 1;
            
            while( rs.next() && totalBooks <= 4 )
            {
                bookDetails = new BookDetails();
                
                bookDetails.setBookId(rs.getInt("bookId"));
                bookDetails.setBookName(rs.getString("bookName"));
                bookDetails.setAuthor(rs.getString("author"));
                bookDetails.setPrice(rs.getDouble("price"));
                bookDetails.setBookCategory(rs.getString("bookCategory"));
                bookDetails.setBookStatus(rs.getString("bookStatus"));
                bookDetails.setPhoto(rs.getString("photo"));
                bookDetails.setUserEmail(rs.getString("userEmail"));
                
                list.add(bookDetails);
                
                totalBooks++;
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
    }
    /*  Get All Recent Books (New Book and Old Books) Method End  */

    
    /*  Get All Old Books Method Start  */
    @Override
    public List<BookDetails> getOldBooks() 
    {
        List<BookDetails> list = new ArrayList<BookDetails>();
        
        BookDetails bookDetails = null;
        
        try
        {
            String query = "SELECT * FROM book_details WHERE bookCategory=? AND bookStatus=? ORDER BY bookId DESC";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, "Old Book");
            ps.setString(2, "Active");
            
            ResultSet rs = ps.executeQuery();
            
            int totalBooks = 1;
            
            while( rs.next() && totalBooks <= 4 )
            {
                bookDetails = new BookDetails();
                
                bookDetails.setBookId(rs.getInt("bookId"));
                bookDetails.setBookName(rs.getString("bookName"));
                bookDetails.setAuthor(rs.getString("author"));
                bookDetails.setPrice(rs.getDouble("price"));
                bookDetails.setBookCategory(rs.getString("bookCategory"));
                bookDetails.setBookStatus(rs.getString("bookStatus"));
                bookDetails.setPhoto(rs.getString("photo"));
                bookDetails.setUserEmail(rs.getString("userEmail"));
                
                list.add(bookDetails);
                
                totalBooks++;
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
    }
    /*  Get All Old Books Method End  */

    
    /*  Get All New Books Method which are persent in Database Start  */
    @Override
    public List<BookDetails> getAllNewBooks()
    {
        List<BookDetails> list = new ArrayList<BookDetails>();
        
        BookDetails bookDetails = null;
        
        try
        {
            String query = "SELECT * FROM book_details WHERE bookCategory=? AND bookStatus=? ORDER BY bookId DESC";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, "New Book");
            ps.setString(2, "Active");
            
            ResultSet rs = ps.executeQuery();
            
            while( rs.next() )
            {
                bookDetails = new BookDetails();
                
                bookDetails.setBookId(rs.getInt("bookId"));
                bookDetails.setBookName(rs.getString("bookName"));
                bookDetails.setAuthor(rs.getString("author"));
                bookDetails.setPrice(rs.getDouble("price"));
                bookDetails.setBookCategory(rs.getString("bookCategory"));
                bookDetails.setBookStatus(rs.getString("bookStatus"));
                bookDetails.setPhoto(rs.getString("photo"));
                bookDetails.setUserEmail(rs.getString("userEmail"));
                
                list.add(bookDetails);
            }
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
    }
    /*  Get All New Books Method which are persent in Database End  */

    
    /*  Get All Recent Books Method which are persent in Database Start  */
    @Override
    public List<BookDetails> getAllRecentBooks() 
    {
        List<BookDetails> list = new ArrayList<BookDetails>();
        
        BookDetails bookDetails = null;
        
        try
        {
            String query = "SELECT * FROM book_details WHERE bookStatus=? ORDER BY bookId DESC";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, "Active");
            
            ResultSet rs = ps.executeQuery();
            
            while( rs.next() )
            {
                bookDetails = new BookDetails();
                
                bookDetails.setBookId(rs.getInt("bookId"));
                bookDetails.setBookName(rs.getString("bookName"));
                bookDetails.setAuthor(rs.getString("author"));
                bookDetails.setPrice(rs.getDouble("price"));
                bookDetails.setBookCategory(rs.getString("bookCategory"));
                bookDetails.setBookStatus(rs.getString("bookStatus"));
                bookDetails.setPhoto(rs.getString("photo"));
                bookDetails.setUserEmail(rs.getString("userEmail"));
                
                list.add(bookDetails);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
    }
    /*  Get All Recent Books Method which are persent in Database End  */

    
    /*  Get All Old Books Method which are persent in Database Start  */
    @Override
    public List<BookDetails> getAllOldBooks() 
    {
        List<BookDetails> list = new ArrayList<BookDetails>();
        
        BookDetails bookDetails = null;
        
        try
        {
            String query = "SELECT * FROM book_details WHERE bookCategory=? AND bookStatus=? ORDER BY bookId DESC";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, "Old Book");
            ps.setString(2, "Active");
            
            ResultSet rs = ps.executeQuery();
            
            while( rs.next() )
            {
                bookDetails = new BookDetails();
                
                bookDetails.setBookId(rs.getInt("bookId"));
                bookDetails.setBookName(rs.getString("bookName"));
                bookDetails.setAuthor(rs.getString("author"));
                bookDetails.setPrice(rs.getDouble("price"));
                bookDetails.setBookCategory(rs.getString("bookCategory"));
                bookDetails.setBookStatus(rs.getString("bookStatus"));
                bookDetails.setPhoto(rs.getString("photo"));
                bookDetails.setUserEmail(rs.getString("userEmail"));
                
                list.add(bookDetails);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
    }
    /*  Get All Old Books Method which are persent in Database End  */

    
    /*  Search Book Using Book Name, Author Name Method Start  */
    @Override
    public List<BookDetails> getBookBySearch(String searchBooks)
    {
        List<BookDetails> list = new ArrayList<BookDetails>();
        
        BookDetails bookDetails = null;
        
        try
        {
            String query = "SELECT * FROM book_details WHERE bookName LIKE ? OR author LIKE ? OR bookCategory LIKE ? AND bookStatus=?";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, "%"+searchBooks+"%");
            ps.setString(2, "%"+searchBooks+"%");
            ps.setString(3, "%"+searchBooks+"%");
            ps.setString(4, "Active");
            
            ResultSet rs = ps.executeQuery();
            
            while( rs.next() )
            {
                bookDetails = new BookDetails();
                
                bookDetails.setBookId(rs.getInt("bookId"));
                bookDetails.setBookName(rs.getString("bookName"));
                bookDetails.setAuthor(rs.getString("author"));
                bookDetails.setPrice(rs.getDouble("price"));
                bookDetails.setBookCategory(rs.getString("bookCategory"));
                bookDetails.setBookStatus(rs.getString("bookStatus"));
                bookDetails.setPhoto(rs.getString("photo"));
                bookDetails.setUserEmail(rs.getString("userEmail"));
                
                list.add(bookDetails);
            }
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
    }
    /*  Search Book Using Book Name, Author Name Method End  */
    
}
