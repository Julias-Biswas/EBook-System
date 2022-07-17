/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entity;

import java.sql.Timestamp;

/**
 *
 * @author julia
 */
public class BookOrder 
{
    private int id;
    private String orderId;
    private String userName;
    private String userEmail;
    private String userPhno;
    private String userAlternativePhno;
    private String address;
    private String cityDistictTown;
    private String landmark;
    private String state;
    private String pinCode;
    private int cartId;
    private int bookId;
    private String bookName;
    private String author;
    private Double price;
    private String bookPhoto;
    private String bookCategory;
    private String payment;
    private String deliveryAddressType;
    private Timestamp bookOrderTime;
    private Double totalAmount;

    
    public BookOrder() 
    {
        
    }

    public BookOrder(int id, String orderId, String userName, String userEmail, String userPhno, String userAlternativePhno, String address, String cityDistictTown, String landmark, String state, String pinCode, int cartId, int bookId, String bookName, String author, Double price, String bookPhoto, String bookCategory, String payment, String deliveryAddressType, Timestamp bookOrderTime, Double totalAmount)
    {
        this.id = id;
        this.orderId = orderId;
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPhno = userPhno;
        this.userAlternativePhno = userAlternativePhno;
        this.address = address;
        this.cityDistictTown = cityDistictTown;
        this.landmark = landmark;
        this.state = state;
        this.pinCode = pinCode;
        this.cartId = cartId;
        this.bookId = bookId;
        this.bookName = bookName;
        this.author = author;
        this.price = price;
        this.bookPhoto = bookPhoto;
        this.bookCategory = bookCategory;
        this.payment = payment;
        this.deliveryAddressType = deliveryAddressType;
        this.bookOrderTime = bookOrderTime;
        this.totalAmount = totalAmount;
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPhno() {
        return userPhno;
    }

    public void setUserPhno(String userPhno) {
        this.userPhno = userPhno;
    }

    public String getUserAlternativePhno() {
        return userAlternativePhno;
    }

    public void setUserAlternativePhno(String userAlternativePhno) {
        this.userAlternativePhno = userAlternativePhno;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCityDistictTown() {
        return cityDistictTown;
    }

    public void setCityDistictTown(String cityDistictTown) {
        this.cityDistictTown = cityDistictTown;
    }

    public String getLandmark() {
        return landmark;
    }

    public void setLandmark(String landmark) {
        this.landmark = landmark;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getPinCode() {
        return pinCode;
    }

    public void setPinCode(String pinCode) {
        this.pinCode = pinCode;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
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

    public String getBookPhoto() {
        return bookPhoto;
    }

    public void setBookPhoto(String bookPhoto) {
        this.bookPhoto = bookPhoto;
    }

    public String getBookCategory() {
        return bookCategory;
    }

    public void setBookCategory(String bookCategory) {
        this.bookCategory = bookCategory;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getDeliveryAddressType() {
        return deliveryAddressType;
    }

    public void setDeliveryAddressType(String deliveryAddressType) {
        this.deliveryAddressType = deliveryAddressType;
    }

    public Timestamp getBookOrderTime() {
        return bookOrderTime;
    }

    public void setBookOrderTime(Timestamp bookOrderTime) {
        this.bookOrderTime = bookOrderTime;
    }

    public Double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Double totalAmount) {
        this.totalAmount = totalAmount;
    }

    
    @Override
    public String toString() {
        return "BookOrder{" + "id=" + id + ", orderId=" + orderId + ", userName=" + userName + ", userEmail=" + userEmail + ", userPhno=" + userPhno + ", userAlternativePhno=" + userAlternativePhno + ", address=" + address + ", cityDistictTown=" + cityDistictTown + ", landmark=" + landmark + ", state=" + state + ", pinCode=" + pinCode + ", cartId=" + cartId + ", bookId=" + bookId + ", bookName=" + bookName + ", author=" + author + ", price=" + price + ", bookPhoto=" + bookPhoto + ", bookCategory=" + bookCategory + ", payment=" + payment + ", deliveryAddressType=" + deliveryAddressType + ", bookOrderTime=" + bookOrderTime + ", totalAmount=" + totalAmount + '}';
    }
    
}
