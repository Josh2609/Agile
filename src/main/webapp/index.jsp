<%-- 
    Document   : index
    Created on : 14-Feb-2017, 22:18:16
    Author     : Josh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QuizWhiz</title>
        <script src="js/createQuiz.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" content= "text/css" href="${pageContext.request.contextPath}/style.css">
        <link rel="shortcut icon" href="https://s-media-cache-ak0.pinimg.com/originals/04/38/35/0438350175391a71727f8dac6e7be433.png">
    </head>
    
    <body>
        
    <%@ include file="header.jsp" %>
    <% String msg = (String)request.getAttribute("Message");
               if(msg != null) { %>
               <div class="container"><div class="alert alert-warning"><strong>Error: </strong> <%= msg %></div></div>
            <% } %>
         <div>
            <div class="homeDes">
            <div style="text-align:center; color:#ffffff">
                <h1> Welcome to <div style="font-family: 'Faster One', cursive; font-size: 200%;">QuizWhiz</div></h1>
            <br>
            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/8/83/University_of_Dundee_logo.svg/1200px-University_of_Dundee_logo.svg.png" alt="Dundee University Logo" style="width: 200px; height: 250px; display:inline;">
            </div>
            </div>
            
            <!--<div class="container">
               <div style="text-align: center;">
               <div style="display: inline-block; text-align: left">
                   
               <p>Quizwhiz is a website designed to help students pass their exams. 
               Here you’ll find quizzes created to test you on the content of all the modules you study at the University of Dundee. 
               Based around the topics you’ll study in class, your lecturer has created these quizzes to test you on what you’ve learned.<p><br>
         <br>
             <p>You’re free to take each quiz as many times as you like but be careful, your lecturer can see all your scores and how many times you’ve completed a quiz. 
                 To create an account, you’ll need your matriculation number. Good Luck!<p><br>
         <br>
         <br>
         </div></div>
        <div style="text-align:center">
		<input type="submit" class="btn btn-success" value="Log In" onclick=window.location="${pageContext.request.contextPath}/Login";>
		<input type="submit" class="btn btn-success" value="Sign Up"onclick=window.location="${pageContext.request.contextPath}/SignUp";>
		</div>
	</div>-->
     </body>
 </html>

