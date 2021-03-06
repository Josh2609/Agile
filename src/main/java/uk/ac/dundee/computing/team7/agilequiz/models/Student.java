/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.team7.agilequiz.models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.mindrot.jbcrypt.BCrypt;
import uk.ac.dundee.computing.team7.agilequiz.lib.dbconnect;
import uk.ac.dundee.computing.team7.agilequiz.stores.ProfileBean;

/**
 *
 * @author Josh Corps
 */
public class Student 
{
 
    public boolean checkDetails(String matric, String password)
    {
	dbconnect dbCon = new dbconnect();
	Connection con = dbCon.mysqlConnect();
        boolean passwordMatch = false;
	PreparedStatement stmt;
	try {
	    String sql = "SELECT Matric_Number, User_Password FROM student WHERE Matric_Number=?";
	    stmt = con.prepareStatement(sql);
	    stmt.setString(1, matric);
	    ResultSet rs=stmt.executeQuery();  
            
            while(rs.next())
            {
                passwordMatch = BCrypt.checkpw(password, rs.getString("User_Password"));
            }
            con.close();
	    return passwordMatch;

	} catch (SQLException e)
	{
	    	e.printStackTrace();
	}
	return false;
    }
    
    // TODO
    private String hashPassword(String password)
    {
	String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
	return hashedPassword;
    }
    
    public boolean createStudent(String matric, String fname, String sname, String password)
    {
        int numAffectedRows = 0;
        dbconnect dbCon = new dbconnect();
	Connection con = dbCon.mysqlConnect();
	PreparedStatement stmt;
        String hashedPassword = hashPassword(password);
	try {
	    String sql = "INSERT INTO student (User_ID, Matric_Number, User_Password, First_Name, Surname) VALUES (NULL, ?, ?, ?, ?)";
	    stmt = con.prepareStatement(sql);
	    stmt.setString(1, matric);
	    stmt.setString(2, hashedPassword);
            stmt.setString(3, fname);
            stmt.setString(4, sname);
	    numAffectedRows = stmt.executeUpdate();
            con.close();
            return numAffectedRows > 0;
        } 
        catch (SQLException e)
	{
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean removeStudent(String matric)
    {
        int numAffectedRows = 0;
        dbconnect dbCon = new dbconnect();
	Connection con = dbCon.mysqlConnect();
	PreparedStatement stmt;
	try {
            String sql = "DELETE FROM student WHERE Matric_Number=?";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, matric);
            numAffectedRows = stmt.executeUpdate();
            con.close();
            return numAffectedRows > 0;
        } 
        catch (SQLException e)
	{
            e.printStackTrace();
        }
        return false;
    }
    
    public int getStudentIDFromMatric(String matric)
    {
        int studentID = 0;
        dbconnect dbCon = new dbconnect();
	Connection con = dbCon.mysqlConnect();
	PreparedStatement stmt;
	try {
	    String sql = "SELECT User_ID FROM student WHERE Matric_Number=?";
	    stmt = con.prepareStatement(sql);
	    stmt.setString(1, matric);
	    ResultSet rs=stmt.executeQuery();
            while (rs.next()) {
                studentID = rs.getInt("User_ID");
            }
	} catch (SQLException e)
	{
            e.printStackTrace();
        }
        try {
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Student.class.getName()).log(Level.SEVERE, null, ex);
        }
        return studentID;
    }
    
    public ProfileBean getStudentProfile(String matric){
        dbconnect dbCon = new dbconnect();
	Connection con = dbCon.mysqlConnect();
	PreparedStatement stmt;
        ProfileBean profile = new ProfileBean();

	try {
	    String sql = "SELECT * FROM student WHERE Matric_Number=?";
	    stmt = con.prepareStatement(sql);
	    stmt.setString(1, matric);
	    ResultSet rs=stmt.executeQuery();    
            
            while(rs.next()){
                profile.setFirstName(rs.getString("First_Name"));
                profile.setSurname(rs.getString("Surname"));
            }
            profile.setMatric(matric);

	} catch (SQLException e)
	{
	    	e.printStackTrace();
	}
        return profile;
    }
    
    
    
    
    public boolean changePassword(String matric, String newPass)
    {
        int numAffectedRows = 0;
        dbconnect dbCon = new dbconnect();
	Connection con = dbCon.mysqlConnect();
	PreparedStatement stmt;                
        String hashedPassword = hashPassword(newPass);
	try {
	    String sql = "UPDATE student SET User_Password = ? WHERE Matric_Number = ?";
	    stmt = con.prepareStatement(sql);
	    stmt.setString(1, hashedPassword);
	    stmt.setString(2, matric);
	    numAffectedRows = stmt.executeUpdate();
        } 
        catch (SQLException e)
	{
            e.printStackTrace();
        }
        return numAffectedRows > 0;
    }
}
