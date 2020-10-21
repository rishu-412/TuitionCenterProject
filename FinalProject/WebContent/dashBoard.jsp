<%@ page import="com.columbia.dao.TeacherDB" %>
<%@ page import="com.columbia.dao.BatchDB" %>
<%@ page import="com.columbia.dao.StudentDB" %>
<%@ page import="com.columbia.model.Teacher" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

.Outer{
		margin:20px;
		display: grid;
        grid-gap: 20px;
        border-width:0 1px 1px 0;
        padding:20px;
		grid-template-areas:
        'div1 div1 div2 div2 div3 div3'
        
}
.inner1{
		grid-area: div1;
        background-color: hsla(0, 100%, 90%, 0.3);
        font-family: 'Oswald', sans-serif;
        font-size: 30px;
        border-radius: 5%;
        text-align: center;
        text-color:red;
}

.inner2{
		grid-area: div2;
		border-radius: 5%;
        background-color: hsla(0, 100%, 90%, 0.3);
        font-family: 'Oswald', sans-serif;
        font-size: 30px;
        text-align: center;
}
.inner3{
		grid-area: div3;
		border-radius: 5%;
        background-color: hsla(0, 100%, 90%, 0.3);
        font-family: 'Oswald', sans-serif;
        font-size: 30px;
        text-align: center;
}

</style>
<meta charset="ISO-8859-1">
<title>Dash Board</title>
</head>
<body style= "background-color:black; background-repeat: no-repeat; background-size: cover;">
		<%
			TeacherDB teacherdb = new TeacherDB();
			teacherdb.createConnection();
			int countstaff= teacherdb.countStaff();
			teacherdb.closeConnection();
			
			BatchDB batchdb = new BatchDB();
			batchdb.createConnection();
			int countbatch = batchdb.countBatch();
			batchdb.closeConnection();
			
			StudentDB studentdb = new StudentDB();
			studentdb.createConnection();
			int countstudent = studentdb.countStudent();
			studentdb.closeConnection();
		%>
		<div class="Outer">
			<div class= "inner1">
				<p><h4><%=countstaff %></h4></p>
				<p>Staff Count</p>
			</div>
			<div class= "inner2">
				<p><h4><%=countbatch %></h4></p>
				<p>Batch Count</p>
			</div>
			<div class="inner3">
				<p><h4><%=countstudent %></h4></p>
				<p>Student Count</p>
			</div>
		</div>
</body>
</html>