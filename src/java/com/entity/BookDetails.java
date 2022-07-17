/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entity;

/**
 *
 * @author julia
 */
public class BookDetails 
{
    private int bookId;
    private String bookName;
    private String author;
    private Double price;
    private String bookCategory;
    private String bookStatus;
    private String photo;
    private String userEmail;

    public BookDetails() 
    {
        
    }

    public BookDetails(String bookName, String author, Double price, String bookCategory, String bookStatus, String photo, String userEmail)
    {
        this.bookName = bookName;
        this.author = author;
        this.price = price;
        this.bookCategory = bookCategory;
        this.bookStatus = bookStatus;
        this.photo = photo;
        this.userEmail = userEmail;
    }

    public BookDetails(int bookId, String bookName, String author, Double price, String bookCategory, String bookStatus, String photo, String userEmail)
    {
        this.bookId = bookId;
        this.bookName = bookName;
        this.author = author;
        this.price = price;
        this.bookCategory = bookCategory;
        this.bookStatus = bookStatus;
        this.photo = photo;
        this.userEmail = userEmail;
    }

    
    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getBookCategory() {
        return bookCategory;
    }

    public void setBookCategory(String bookCategory) {
        this.bookCategory = bookCategory;
    }

    public String getBookStatus() {
        return bookStatus;
    }

    public void setBookStatus(String bookStatus) {
        this.bookStatus = bookStatus;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    
    @Override
    public String toString() 
    {
        return "BookDetails{" + "bookId=" + bookId + ", bookName=" + bookName + ", author=" + author + ", price=" + price + ", bookCategory=" + bookCategory + ", bookStatus=" + bookStatus + ", photo=" + photo + ", userEmail=" + userEmail + '}';
    }
    
}
