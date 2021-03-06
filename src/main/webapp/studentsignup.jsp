<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>

	<head>
	<%@ include file="header.jsp" %>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
                <link rel="stylesheet" type= "text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="shortcut icon" href="https://s-media-cache-ak0.pinimg.com/originals/04/38/35/0438350175391a71727f8dac6e7be433.png">
		<title>Sign Up</title>
	</head>
	<body>
	
	<div class="container">
    <div class="col-sm-9">
	<h1 style="text-align:center">Student Sign Up</h1><br>
        
	<% String msg = (String)request.getAttribute("Message");
               if(msg != null) { %>
            <p id="flash_message"><%= msg %></p>
            <% } %>
	<form method="POST" action="StudentSignup">	
                <ul>
                    <div class="input-group">
                        <span class="input-group-addon">Matriculation Number</span>
                        <input type="text" class="form-control" name="matric" placeholder="Enter your matriculation number here"
                               <%if(request.getAttribute("matric") != null){%> value=<%=request.getAttribute("matric")%><%}%>>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;Password</span>
                        <input type="password" class="form-control" name="password" placeholder="Enter your password here">
                    </div>
					 <div class="input-group">
                        <span class="input-group-addon">&emsp;&nbsp;&nbsp;Confirm password</span>
                        <input type="password" class="form-control" name="repeatPassword" placeholder="Enter your password again">
                    </div>
                </ul>
                <br/>
                <div class="span12" style="text-align:center">
                    <div class="STYLE">
                        <input type="submit" class="btn btn-success" value="Sign Up">
                    </div>
                </div> 
		
	</form>
	</div>
	</div>
	
	</body>
	
</html>