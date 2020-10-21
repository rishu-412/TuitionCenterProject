<%@ page import="com.columbia.dao.TeacherDB" %>
<%@ page import="com.columbia.dao.BatchDB" %>
<%@ page import="com.columbia.dao.StudentDB" %>
<%@ page import="com.columbia.model.Teacher" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login| University Of Columbia</title>
<link rel="stylesheet" type="text/css" href="login_style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>

</head>
<body class="body">

<div class="login-page">
  <div class="form">

    <form method="post">
      <input type="email" placeholder="&#xf007;  username" name = "txtEmail"/>
      <input type="password" placeholder="&#xf023;  password" name = "txtPassword"/>
      <input type="submit" value = "Login" style = "background: #ffffff;"/>
      <input type="reset" />
      <p class="message"></p>
    </form>

  </div>
</div>

	<!-- Checking the Login Authentication -->
	<%
		TeacherDB db = new TeacherDB();
		db.createConnection();
		Teacher teacher = new Teacher();	
		teacher.email = request.getParameter("txtEmail");
		teacher.password = request.getParameter("txtPassword");
		
		boolean status = db.Authenticate(teacher);
		if(status){
		 	RequestDispatcher dispatcher = request.getRequestDispatcher("dashBoard.jsp");
			dispatcher.forward(request, response);
		}
		else{
			System.out.println(" NT found ");
		}

	 	db.closeConnection();
	%>
</body>
</html>