<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.columbia.dao.TeacherDB" %>
<%@ page import="com.columbia.dao.BatchDB" %>
<%@ page import="com.columbia.dao.StudentDB" %>
<%@ page import="com.columbia.model.Teacher" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>

<script>
function openForm() {
	  document.getElementById("myForm").style.display = "block";
	}

	function closeForm() {
	  document.getElementById("myForm").style.display = "none";
	}
function DeleteRow(id){
	document.getElementById("delete").style.display = "none";
}

</script>

<link rel="stylesheet" href="common.css">
<title>Batch|University Of Columbia</title>
<meta charset="ISO-8859-1">
</head>

<body style="background-color:black; background-repeat: no-repeat; background-size: cover;">
<div class = "Main">
		<div class = "first">
			
			<div style = "grid-area:div3; text-align: left;">
			<label for="Students" style="color:white; text-align: left;"><b>Batches</b></label>
			</div >
			<div style = "grid-area:div4; text-align: right;">
			<button type="submit" class = "open-button" onclick="openForm()">Filter</button>
			<button type="submit" class = "open-button" onclick="openForm()">Add New Batch</button>
			</div>
		</div>
		<div class = "second">
			<sql:setDataSource
        	var="project"
        	driver="com.mysql.cj.jdbc.Driver"
        	url="jdbc:mysql://localhost/finalproject"
        	user="root" password=""  
    		/>
    		
    <sql:query var="listUsers"   dataSource="${project}">
        SELECT b.id, b.name, b.year, b.fee, COUNT(*) as 'NoOfStudent', b.TeacherId, b.TeacherName from batch b INNER join studentandbatch sb on b.id = sb.batchid INNER JOIN student s on sb.studentid = s.id GROUP BY b.id;
    </sql:query>
     <sql:query var="listTeacher" dataSource="${project}">
    	select id, name from teacher;
    </sql:query>
    
    <div align="center" style="color:white;">
        <table border="1"  cellspacing="0" cellpadding="30" width="100%">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Year</th>
                <th>Fee</th>
                <th>Number Of Students</th>
                <th>Teacher Name</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="batch" items="${listUsers.rows}">
                <tr>
                    <td><c:out value="${batch.id}" /></td>
                    <td><c:out value="${batch.name}" /></td>
                    <td><c:out value="${batch.year}" /></td>
                    <td><c:out value="${batch.fee}" /></td>
                    <td><c:out value="${batch.NoOfStudent}" /></td>
                    <td><c:out value="${batch.TeacherName}" /></td>
              		<td><button type="submit" class = "action-button" onclick="login.jsp" name ="updateId" value="${batch.id}" >Update</button>
						<button type="submit" class = "action-button" onclick="login.jsp" name = "deleteId" value="${batch.id}" id = "myButton">Delete</button></td>
				    
				    			<script type="text/javascript">
    								document.getElementById("myButton").onclick = function () {
        							location.href = "deleteId.jsp";
    								};
								</script> 
                </tr>
            </c:forEach>
        </table>
    </div>
    </div>
    		
		
	<div class="form-popup" id="myForm">
	<form class="form-container" action="newBatch" method="post">
    <h2 style="color:white; font-family: 'Montserrat', sans-serif;">New Teacher</h2>
    <div class="wrapper">	
	<div class="left">
	<input type="text" placeholder="Batch Id" name="txtID" required/>
    <input type="text" placeholder="Name" name="txtName" required/>
	<input type="text" placeholder="Year" name="txtYear" required/>
	<!-- <input type="text" placeholder="Designation" name="txtDesignation" required/>
    <input type="text" placeholder="Department" name="txtDepartment" required/> -->
	<center><button type="submit" class="btn">Login</button> </center>
	    
    </div>
    
	<div class="right">    
 	<input type="text" placeholder="Number of Students" name="txtNo" required/>
    <input type="text" placeholder="Fee" name="txtFee" required/>
    <input list="teacher" placeholder="Teacher" name="txtTeacher" required>
			<datalist id="teacher">
			<c:forEach var="teacher" items="${listTeacher.rows}">
			<option value="${teacher.name}">
			</c:forEach>
			</datalist>
    <center><button type="reset" class="cancel" onClick="closeForm()">Cancel</button> </center>
   	</div>
    </div>
  	</form>
  	</div>
  	</div>
</body>
</html>