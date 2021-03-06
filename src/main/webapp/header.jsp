<%@page import="uk.ac.dundee.computing.team7.agilequiz.stores.*"%>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" content= "text/css" href="${pageContext.request.contextPath}/style.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Faster+One" rel="stylesheet">
</head>
<nav class="navbar navbar-default">
        <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/"><img src="https://upload.wikimedia.org/wikipedia/en/thumb/8/83/University_of_Dundee_logo.svg/1200px-University_of_Dundee_logo.svg.png" alt="Dundee University Logo" style="width: 25px; height: 30px; display:inline;">
                        <div style="display:inline; font-family: 'Faster One', cursive;  font-weight: 400;">QuizWhiz</div>
                    </a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                         <%
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if (lg != null) 
                        {       
                            if (lg.getloggedIn()) 
                            { %>
                        <li><a href="${pageContext.request.contextPath}/ViewQuiz">Quizzes</a></li>
                        <% if ((boolean) session.getAttribute("Staff"))
                        {%>
                            <li><a href="${pageContext.request.contextPath}/CreateQuiz">Create Quiz</a></li>
                            <li><a href="${pageContext.request.contextPath}/StaffQuizList?page=1">Your Quizzes</a></li>
                            <li><a href="${pageContext.request.contextPath}/AddModule">Add Module</a></li>
                        <% }else{%>
                            <li><a href="${pageContext.request.contextPath}/ViewResults?page=1">View Results</a></li>
                            <%}%>
                        <%}
                        }%>
                   </ul>
                        <ul class="nav navbar-nav navbar-right">

                            <%
                            if (lg != null) {
                                if (lg.getloggedIn()) {%>
                                    <li><a href="${pageContext.request.contextPath}/Profile"><span></span><%if(lg.getStaff()==false){%>
                                                                                                                <%=lg.getMatric()%>
                                                                                                            <%}else{%>
                                                                                                                <%=lg.getStaffID()%>
                                                                                                            <%}%></a></li>
                                    <li><a href="${pageContext.request.contextPath}/Logout"><span></span>Logout</a></li>
                                <%}
                            } else {%>
                                <li><a href="#register" data-toggle="modal" data-target="#logModal" class="modal-toggle"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                                <li><a href="#login" data-toggle="modal" data-target="#logModal" class="modal-toggle"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                            <%}%>
                        </ul>
                   </ul>
                    <!--Search bar, if wanted <form class="navbar-form navbar-left">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search">
                        </div>
                        <button type="submit" class="btn btn-success">Submit</button>
                    </form> -->
               </div>
        </div>
</nav>


  <!-- Modal -->
  <div class="modal fade" id="logModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <ul class="nav nav-tabs">
            <li><a data-toggle="tab" href="#login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
            <li><a data-toggle="tab" href="#Stafflogin"><span class="glyphicon glyphicon-log-in"></span> Staff Login</a></li>
            <li><a data-toggle="tab" href="#register"><span class="glyphicon glyphicon-user"></span>Sign Up</a></li>
            <li><a data-toggle="tab" href="#Staffregister"><span class="glyphicon glyphicon-user"></span>Staff Sign Up</a></li>
          </ul>
          <!--<h4 class="modal-title">Login</h4>-->
        </div>
        <div class="modal-body">
        <div class="tab-content">
            <div id="login" class="tab-pane">
                <form method="POST"  action="Login">	
                    <div style="text-align:center;">
                        <input id="msg" type="text" class="inputDesign" name="matric" placeholder="Matriculation Number"><br>
                            <br>
                        <input id="msg" type="password" class="inputDesign" name="password" placeholder="Password"><br>
                        <br><br><br>
                    </div>
                    <div class="span12" style="text-align:center">
                        <div class="STYLE">
                            <input type="submit" class="btn btn-success" value="Login">
                        </div>
                    </div>
                    <br>
		</form>
            </div>
            
            <div id="Stafflogin" class="tab-pane">
                <form method="POST"  action="StaffLogin">	
                    <div style="text-align:center;">
                        <input id="msg" type="text" class="inputDesign" name="staffid" placeholder="Staff ID"><br>
                            <br>
                        <input id="msg" type="password" class="inputDesign" name="password" placeholder="Password"><br>
                        <br><br><br>
                    </div>
                    <div class="span12" style="text-align:center">
                        <div class="STYLE">
                            <input type="submit" class="btn btn-success" value="Login">
                        </div>
                    </div>
                    <br>
		</form>
            </div>
            
            
            
            <div id="register" class="tab-pane fade">
                <form method="POST"  action="StudentSignup">
                    <div style="text-align:center;">
                        <input id="msg" type="text" class="inputDesign" name="matric" placeholder="Matriculation Number"><br>
                            <br>
                        <input id="msg" type="text" class="inputDesign" name="fname" placeholder="First Name"><br>
                            <br>
                        <input id="msg" type="text" class="inputDesign" name="sname" placeholder="Surname"><br>
                            <br>
                        <input id="msg" type="password" class="inputDesign" name="password" placeholder="Password"><br>
                            <br>
                        <input id="msg" type="password" class="inputDesign" name="repeatPassword" placeholder="Confirm Password"><br>
                        <br>
                    </div>    
                    <br><br>
                <div class="span12" style="text-align:center">
                    <div class="STYLE">
                        <input type="submit" class="btn btn-success" value="Sign Up">
                    </div>
                </div> 
                <br><br>
                </form>
            </div>
            
            
            
            <div id="Staffregister" class="tab-pane fade">
                <form method="POST"  action="StaffSignup">
                    <div style="text-align:center;">
                        <input id="msg" type="text" class="inputDesign" name="staffid" placeholder="Staff ID"><br>
                            <br>
                        <input id="msg" type="text" class="inputDesign" name="fname" placeholder="First Name"><br>
                            <br>
                        <input id="msg" type="text" class="inputDesign" name="sname" placeholder="Surname"><br>
                            <br>
                        <input id="msg" type="password" class="inputDesign" name="password" placeholder="Password"><br>
                            <br>
                        <input id="msg" type="password" class="inputDesign" name="repeatPassword" placeholder="Confirm Password"><br>
                        <br>
                    </div>    
                    <br><br>
                <div class="span12" style="text-align:center">
                    <div class="STYLE">
                        <input type="submit" class="btn btn-success" value="Sign Up">
                    </div>
                </div> 
                <br><br>
                </form>
            </div>
            
        </div>
        </div>
      </div>
      
    </div>
  </div>
                    
<script>       
        $(document).ready(function() {
	// get current URL path and assign 'active' class
	var pathname = window.location.pathname;
	$('.nav > li > a[href="'+pathname+'"]').parent().addClass('active');
});

$('.modal-toggle').click(function (e) {
    var tab = e.target.hash;
    $('li > a[href="' + tab + '"]').tab("show");
});
</script>