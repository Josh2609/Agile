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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import uk.ac.dundee.computing.team7.agilequiz.lib.dbconnect;

/**
 *
 * @author joshcorps
 */
public class Results {
    
    public ArrayList<String[]> getStudentsQuizResults(int currentPage, int studentID)
    {
        ArrayList<String[]> studentQuizResults = new ArrayList<>();
        
        dbconnect dbCon = new dbconnect();
	Connection con = dbCon.mysqlConnect();
	PreparedStatement stmt;
        String sql = "SELECT *"
                + " FROM quizcompletedquizmodule WHERE User_ID=?"
                + " LIMIT ? OFFSET ?";
        
        int limit = currentPage*25;
        int offset = (currentPage*25)-24;
        if (currentPage == 1)
        {
            offset = 0;
        }
        
        try {
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, studentID);
            stmt.setInt(2, limit);
            stmt.setInt(3, offset);
	    ResultSet rs=stmt.executeQuery();       

            while(rs.next())
            {   //refactor to bean
                String[] tempArr = new String[9];
                tempArr[0] = Integer.toString(rs.getInt("Completed_Quiz_ID"));
                tempArr[1] = Integer.toString(rs.getInt("Quiz_ID"));
                tempArr[2] = rs.getString("Score");
                tempArr[3] = Integer.toString(rs.getInt("Attempt"));
                tempArr[4] = rs.getString("Quiz_Name");
                tempArr[5] = rs.getString("Module_Code");
                tempArr[6] = rs.getString("Module_Name");
                tempArr[7] = rs.getString("Quiz_Description");
                tempArr[8] = rs.getString("Time_Submitted");
                studentQuizResults.add(tempArr);
                
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Quiz.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return studentQuizResults;
    }
    
    public ArrayList<String[]> getStaffQuizResults(int quizID, String sortBy, int currentPage)
    {
        ArrayList<String[]> resultsList = new ArrayList<>();
        
        dbconnect dbCon = new dbconnect();
	Connection con = dbCon.mysqlConnect();
	PreparedStatement stmt;
        String sql = "SELECT *"
                + " FROM quizcompletedquizmodule WHERE Quiz_ID=?"
                + " LIMIT ? OFFSET ?";
        
        int limit = currentPage*25;
        int offset = (currentPage*25)-24;
        if (currentPage == 1)
        {
            offset = 0;
        }
        try {
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, quizID);
            stmt.setInt(2, limit);
            stmt.setInt(3, offset);
	    ResultSet rs=stmt.executeQuery();       

            while(rs.next())
            {   //refactor to bean
                String[] tempArr = new String[11];
                tempArr[0] = Integer.toString(rs.getInt("Completed_Quiz_ID"));
                tempArr[1] = Integer.toString(rs.getInt("Quiz_ID"));
                tempArr[2] = rs.getString("Score");
                tempArr[3] = Integer.toString(rs.getInt("Attempt"));
                tempArr[4] = rs.getString("Quiz_Name");
                tempArr[5] = rs.getString("Module_Code");
                tempArr[6] = rs.getString("Module_Name");
                tempArr[7] = rs.getString("Quiz_Description");
                tempArr[7] = rs.getString("First_Name");
                tempArr[8] = rs.getString("Surname");
                tempArr[9] = rs.getString("Matric_Number");
                tempArr[10] = rs.getString("Time_Submitted");
                resultsList.add(tempArr);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Quiz.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return resultsList;
    }
}
