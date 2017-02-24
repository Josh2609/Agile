<%-- 
    Document   : editquiz
    Created on : 21-Feb-2017, 19:24:30
    Author     : joshcorps
--%>

<%@page import="uk.ac.dundee.computing.team7.agilequiz.stores.AnswerBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="uk.ac.dundee.computing.team7.agilequiz.stores.QuestionBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Quiz</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <%
            java.util.ArrayList<QuestionBean> questions = (java.util.ArrayList<QuestionBean>) request.getAttribute("questions");
            java.util.ArrayList<AnswerBean> answers = (java.util.ArrayList<AnswerBean>) request.getAttribute("answers");
            if (questions == null) {
        %>
        <p>No Questions found</p>
        <%
        } else {
        %>
        <form class="questions" method="POST"  action="EditQuiz">
            <input type="text" name="oldQuizID" value="<%=request.getAttribute("quizID")%>">
        <%
            Iterator<QuestionBean> iterator;
            iterator = questions.iterator();
            int questionNum = 1;
            while (iterator.hasNext()) 
            {
                QuestionBean qb = (QuestionBean) iterator.next();
                System.out.println(qb.getQuestionText());


        %>
        <br>Question&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="question_<%=qb.getQuestionID()%>" value="<%=qb.getQuestionText()%>"><br>Answer(s)
        <%
                Iterator<AnswerBean> iterator2;
                iterator2 = answers.iterator();
                int answerNum = 1;
                while (iterator2.hasNext()) 
                {
                    AnswerBean ab = (AnswerBean) iterator2.next();

                    if (ab.getQuestionID() == qb.getQuestionID() )
                    {
                        %>
                        <input type="text" name="<%=qb.getQuestionID()%>_answer_<%=ab.getAnswerID()%>" value="<%=ab.getAnswerText()%>">
                        <%
                        answerNum++;
                    }
                }  
                %>
                <input type="text" name="<%=qb.getQuestionID()%>_numAnswers" value="<%=answerNum%>" hidden>
                <%
                questionNum++;
            }
            %>
            <input type="text" name="numQuestions" value="<%=questionNum%>" hidden>
            <br><br><input type="submit" value="Edit">
        </form>
            <%
        }
        %>
    </body>
</html>
