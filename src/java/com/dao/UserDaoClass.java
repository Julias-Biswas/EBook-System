/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author julia
 */
public class UserDaoClass implements UserDao
{
    private final Connection con;

    public UserDaoClass(Connection con) 
    {
        this.con = con;
    }

    /*  Sign Up All User and store data into Database Start  */
    @Override
    public boolean userRegister(User user) 
    {
        boolean status = false;
        
        try
        {
            String query = "INSERT INTO user(name,email,phno,password,userModule) VALUES(?,?,?,?,?)";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPhno());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getUserModule());
            
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
    /*  Sign Up All User and store data into Database End  */

    
    /*  Sign In All User into Database Start  */
    @Override
    public User userSignIn(String email, String password) 
    {
        User user = null;
        
        try
        {
            String query = "SELECT * FROM user WHERE email=? AND password=?";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, email);
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();
            
            if( rs.next() )
            {
                user = new User();
                
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPhno(rs.getString("phno"));
                user.setPassword(rs.getString("password"));
                user.setAddress(rs.getString("address"));
                user.setLandmark(rs.getString("landmark"));
                user.setState(rs.getString("state"));
                user.setCity(rs.getString("city"));
                user.setPinCode(rs.getString("pincode"));
                user.setUserModule(rs.getString("userModule"));
            }
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return user;
    }
    /*  Sign In All User into Database Start  */

    
    /*  Get User Module Method Start  */
    @Override
    public User getUserModule(String email) 
    {
        User user = null;
        
        try
        {
            String query = "SELECT * FROM user WHERE email=?";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, email);
            
            ResultSet rs = ps.executeQuery();
            
            if( rs.next() )
            {
                user = new User();
                
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPhno(rs.getString("phno"));
                user.setPassword(rs.getString("password"));
                user.setAddress(rs.getString("address"));
                user.setLandmark(rs.getString("landmark"));
                user.setState(rs.getString("state"));
                user.setCity(rs.getString("city"));
                user.setPinCode(rs.getString("pincode"));
                user.setUserModule(rs.getString("userModule"));
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return user;
    }
    /*  Get User Module Method End  */
    
    
    /*  Get User All Details by Using User Id Method Start  */
    @Override
    public User getUserDetailsByUsingUserId(int id)
    {
        User user = null;
        
        try
        {
            String query = "SELECT * FROM user WHERE id=?";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setInt(1, id);
            
            ResultSet rs = ps.executeQuery();
            
            if( rs.next() )
            {
                user = new User();
                
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPhno(rs.getString("phno"));
                user.setPassword(rs.getString("password"));
                user.setAddress(rs.getString("address"));
                user.setLandmark(rs.getString("landmark"));
                user.setState(rs.getString("state"));
                user.setCity(rs.getString("city"));
                user.setPinCode(rs.getString("pincode"));
                user.setUserModule(rs.getString("userModule"));
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return user;
    }
    /*  Get User All Details by Using User Id Method End  */

    
    /*  Check User Id, Email & Password For Identify Correct User Or Not Method Start  */
    @Override
    public boolean checkEmailAndPassword(int userId, String userEmail, String userPassword) 
    {
        boolean status = false;
        
        try
        {
            String query = "SELECT * FROM user WHERE id=? AND email=? AND password=?";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setInt(1, userId);
            ps.setString(2, userEmail);
            ps.setString(3, userPassword);
            
            ResultSet rs = ps.executeQuery();
            
            while( rs.next() )
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
    /*  Check User Id, Email & Password For Identify Correct User Or Not Method End  */

    
    /*  Update User Details Method Start  */
    @Override
    public boolean updateUserProfile(User user) 
    {
        boolean status = false;
        
        try
        {
            String query = "UPDATE user SET name=?, phno=? WHERE id=? AND email=?";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, user.getName());
            ps.setString(2, user.getPhno());
            ps.setInt(3, user.getId());
            ps.setString(4, user.getEmail());
            
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
    /*  Update User Details Method End  */

    
    /*  Add or Update User Location Method Start  */
    @Override
    public boolean userAddOrUpdateLocation(User user) 
    {
        boolean status = false;
        
        try
        {
            String query = "UPDATE user SET address=?, landmark=?, state=?, city=?, pincode=? WHERE id=? AND email=?";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, user.getAddress());
            ps.setString(2, user.getLandmark());
            ps.setString(3, user.getState());
            ps.setString(4, user.getCity());
            ps.setString(5, user.getPinCode());
            ps.setInt(6, user.getId());
            ps.setString(7, user.getEmail());
            
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
    /*  Add or Update User Location Method End  */
    
}
