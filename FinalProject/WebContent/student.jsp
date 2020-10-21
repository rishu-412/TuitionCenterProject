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
function DeleteRow(){
	document.getElementById("deleteStudent");
}

</script>

<link rel="stylesheet" href="common.css">
<title>Student|University Of Columbia</title>
<meta charset="ISO-8859-1">
</head>
<body style="background-color:black; background-repeat: no-repeat; background-size: cover;">

<div class = "Main">
		<div class = "first">
			
			<div style = "grid-area:div3; text-align: left;">
			<label for="Students" style="color:white; text-align: left;"><b>Students</b></label>
			</div >
			<div style = "grid-area:div4; text-align: right;">
			<button type="submit" class = "open-button" onclick="openForm()">Filter</button>
			<button type="submit" class = "open-button" onclick="openForm()">Add New Student</button>
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
        SELECT s.id, s.name, s.email, s.mobile, s.rollNumber, s.dob, s.admissionDate, b.name, b.TeacherName from student s INNER JOIN studentandbatch sb on s.id = sb.studentid INNER JOIN batch b on sb.batchid = b.id;
    </sql:query>
    <sql:query var="listBatch" dataSource="${project}">
    	select id, name from batch;
    </sql:query>
    
    <div align="center" style="color:white;">
        <table border="1"  cellspacing="0" cellpadding="30" width="100%">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Roll Number</th>
                <th>Admission Date</th>
                <th>Mobile No.</th>
                <th>Date Of Birth</th>
                <th>Course Name</th>
                <th>Teacher Name</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="student" items="${listUsers.rows}">
                <tr>
                    <td><c:out value="${student.id}" /></td>
                    <td><c:out value="${student.name}" /></td>
                    <td><c:out value="${student.email}" /></td>
                    <td><c:out value="${student.rollNumber}" /></td>
                    <td><c:out value="${student.admissionDate}" /></td>
                    <td><c:out value="${student.mobile}" /></td>
                    <td><c:out value="${student.dob}" /></td>
                    <td><c:out value="${student.name}" /></td>
                    <td><c:out value="${student.TeacherName}" /></td>
              		<td><button type="submit" class = "action-button" onclick="openForm()" name ="updateId" value="${student.id}">Update</button>
						<input type="button" class = "action-button"  name = "deleteId "  value="Delete">
						<input type="hidden" class = "action-button"   name = "deleteId "  value="${student.id}"/></input>
						</td>		     
                </tr>
            </c:forEach>
        </table>
    </div>
    </div>
    		
		
	<div class="form-popup" id="myForm">
	<form class="form-container" action="newStudent" method="post">
    <h2 style="color:white; font-family: 'Montserrat', sans-serif;">New Teacher</h2>
    <div class="wrapper">	
	<div class="left">
	<input type="text" placeholder="Student Id" name="txtID" required/>
    <input type="text" placeholder="Name" name="txtName" required/>
	<input type="date" placeholder="Date Of Admission" name="txtAdmission" required/>
	<input type="text" placeholder="Roll No" name="txtRollNo" required/>
	<input list="Batch" placeholder="Batch" name="txtBatch" required>
			<datalist id="Batch">
			<c:forEach var="batch" items="${listBatch.rows}">
			<option value="${batch.name}">
			</c:forEach>
			</datalist>
    <!-- <input type="text" placeholder="Designation" name="txtDesignation" required/>
    <input type="text" placeholder="Department" name="txtDepartment" required/> -->
	<center><button type="submit" class="btn">Login</button> </center>
	    
    </div>
	<div class="right">    
 	<input type="text" placeholder="Email" name="txtEmail" required/>
	<input type="text" placeholder="Fee" name="txtFee" required/>
    <input type="text" placeholder="Mobile Number" name="txtMoobile" required/>
    <input type="date" placeholder="Date Of Birth" name="txtdob" required/>
    <center><button type="reset" class="cancel" onClick="closeForm()">Cancel</button> </center>
   	</div>
    </div>
  	</form>
  	</div>
  	</div>
  	
  	<div id="deleteStudent">
  	
  	</div>
  	
</body>
</html>