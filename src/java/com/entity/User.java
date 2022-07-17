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
public class User 
{
    private int id;
    private String name;
    private String email;
    private String phno;
    private String password;
    private String address;
    private String landmark;
    private String state;
    private String city;
    private String pinCode;
    private String userModule;

    public User() 
    {
        
    }

    public User(int id, String name, String email, String phno, String password, String address, String landmark, String state, String city, String pinCode) 
    {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phno = phno;
        this.password = password;
        this.address = address;
        this.landmark = landmark;
        this.state = state;
        this.city = city;
        this.pinCode = pinCode;
    }

    public User(int id, String name, String email, String phno, String password, String address, String landmark, String state, String city, String pinCode, String userModule) 
    {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phno = phno;
        this.password = password;
        this.address = address;
        this.landmark = landmark;
        this.state = state;
        this.city = city;
        this.pinCode = pinCode;
        this.userModule = userModule;
    }
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhno() {
        return phno;
    }

    public void setPhno(String phno) {
        this.phno = phno;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPinCode() {
        return pinCode;
    }

    public void setPinCode(String pinCode) {
        this.pinCode = pinCode;
    }

    public String getUserModule() {
        return userModule;
    }

    public void setUserModule(String userModule) {
        this.userModule = userModule;
    }

    @Override
    public String toString() 
    {
        return "User{" + "id=" + id + ", name=" + name + ", email=" + email + ", phno=" + phno + ", password=" + password + ", address=" + address + ", landmark=" + landmark + ", state=" + state + ", city=" + city + ", pinCode=" + pinCode + '}';
    }
    
}
