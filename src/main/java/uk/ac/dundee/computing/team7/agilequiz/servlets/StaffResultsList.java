/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.team7.agilequiz.servlets;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uk.ac.dundee.computing.team7.agilequiz.models.Quiz;
import uk.ac.dundee.computing.team7.agilequiz.models.Results;
import uk.ac.dundee.computing.team7.agilequiz.stores.LoggedIn;
import uk.ac.dundee.computing.team7.agilequiz.stores.QuestionBean;

/**
 *
 * @author joshcorps
 */
@WebServlet(urlPatterns = {
    "/StaffResultsList", 
})
public class StaffResultsList extends HttpServlet 
{  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException { 
        System.out.println("get");
        HttpSession session = request.getSession();
        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
        if (lg == null) 
        {    
            response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/"));
        } else {

            int cPage = 1;
            String sortBy = "Quiz_ID";
            if (request.getParameter("page") != null)
            {
                cPage = Integer.parseInt(request.getParameter("page"));
            }
            int quizID = Integer.parseInt(request.getParameter("quizid"));
            if (request.getParameter("sortby") != null)
            {
                sortBy = request.getParameter("sortby");
            }
            Quiz quiz = new Quiz();
            ArrayList<QuestionBean> questions = quiz.getQuestions(quizID);
            Results results = new Results();
            ArrayList<String[]> quizList = results.getStaffQuizResults(quizID, sortBy, cPage);
            int numQuestions = questions.size();
            System.out.println("testbefore "+numQuestions);
            RequestDispatcher rd = request.getRequestDispatcher("/staffresultslist.jsp");          
            request.setAttribute("quizList", quizList);
            request.setAttribute("currentPage", cPage);
            request.setAttribute("numQuestions", numQuestions);
            rd.forward(request, response);  
        }
    }
    
}
