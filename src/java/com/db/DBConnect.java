/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author julia
 */
public class DBConnect 
{
    private static Connection con;
    
    public static Connection getConnection()
    {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook_system","root","root");
        
        }
        catch(ClassNotFoundException | SQLException e)
        {
            e.printStackTrace();
        }
        
        return con;
    }
}
