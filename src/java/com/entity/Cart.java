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
public class Cart 
{
    private int cId;
    private int bookId;
    private String userEmail;
    private String bookName;
    private String author;
    private String bookCategory;
    private String bookPhoto;
    private Double price;
    private Double totalPrice;

    public Cart() 
    {
        
    }

    public Cart(int cId, int bookId, String userEmail, String bookName, String author, String bookCategory, String bookPhoto, Double price, Double totalPrice) 
    {
        this.cId = cId;
        this.bookId = bookId;
        this.userEmail = userEmail;
        this.bookName = bookName;
        this.author = author;
        this.bookCategory = bookCategory;
        this.bookPhoto = bookPhoto;
        this.price = price;
        this.totalPrice = totalPrice;
    }
    

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
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

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getBookCategory() {
        return bookCategory;
    }

    public void setBookCategory(String bookCategory) {
        this.bookCategory = bookCategory;
    }

    public String getBookPhoto() {
        return bookPhoto;
    }

    public void setBookPhoto(String bookPhoto) {
        this.bookPhoto = bookPhoto;
    }
    
    
    @Override
    public String toString() {
        return "Cart{" + "cId=" + cId + ", bookId=" + bookId + ", userEmail=" + userEmail + ", bookName=" + bookName + ", author=" + author + ", price=" + price + ", totalPrice=" + totalPrice + '}';
    }
    
}
