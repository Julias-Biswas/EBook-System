/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.entity.User;

/**
 *
 * @author julia
 */
public interface UserDao 
{
    /*  Sign Up All User method Start  */
    public boolean userRegister(User user);
    /*  Sign Up All User method End  */
    
    
    /*  Sign In All User method Start  */
    /**
     *
     * @param email
     * @param password
     * @return
     */
    public User userSignIn(String email, String password);
    /*  Sign In All User method End  */
    
    
    /*  Get User Module Method Start  */
    public User getUserModule(String email);
    /*  Get User Module Method End  */
    
    
    /*  Get User All Details by Using User Id Method Start  */
    public User getUserDetailsByUsingUserId(int id);
    /*  Get User All Details by Using User Id Method End  */
    
    
    /*  Check User Id, Email & Password For Identify Correct User Or Not Method Start  */
    public boolean checkEmailAndPassword(int userId, String userEmail, String userPassword);
    /*  Check User Id, Email & Password For Identify Correct User Or Not Method End  */
    
    
    /*  Update User Details Method Start  */
    public boolean updateUserProfile(User user);
    /*  Update User Details Method End  */
    
    
    /*  Add or Update User Location Method Start  */
    public boolean userAddOrUpdateLocation(User user);
    /*  Add or Update User Location Method End  */
    
}
