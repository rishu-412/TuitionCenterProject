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
<link rel="stylesheet" href="common.css">
<meta charset="ISO-8859-1">
<title>Staff|University Of Columbia</title>

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
</head>

<body style= "background-color:black; background-repeat: no-repeat; background-size: cover;">

	<div class = "Main">
		<div class = "first">
			
			<div style = "grid-area:div3; text-align: left;">
			<label for="Staff Members" style="color:white; text-align: left;"><b>Staff Members</b></label>
			</div >
			<div style = "grid-area:div4; text-align: right;">
			<button type="submit" class = "open-button" onclick="openForm()">Filter</button>
			<button type="submit" class = "open-button" onclick="openForm()">Add New Teacher</button>
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
        SELECT * FROM teacher Order by id;
    </sql:query>
    <div align="center" style="color:white;">
        <table border="1"  cellspacing="0" cellpadding="30" width="100%">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Designation</th>
                <th>Department</th>
                <th>Mobile No.</th>
                <th>Date Of Birth</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="teacher" items="${listUsers.rows}">
                <tr>
                    <td><c:out value="${teacher.id}" /></td>
                    <td><c:out value="${teacher.name}" /></td>
                    <td><c:out value="${teacher.email}" /></td>
                    <td><c:out value="${teacher.designation}" /></td>
                    <td><c:out value="${teacher.department}" /></td>
                    <td><c:out value="${teacher.mobile}" /></td>
                    <td><c:out value="${teacher.dob}" /></td>
              		<td><button type="submit" class = "action-button" onclick="openForm()" name = "deleteId" value="${teacher.id}">Delete</button>
						<button type="submit" class = "action-button" onclick="openForm()" name = "deleteId" value="${teacher.id}">Delete</button></td>		     
                </tr>
            </c:forEach>
        </table>
    </div>
    </div>
    		
		
	<div class="form-popup" id="myForm">
	<form class="form-container" action="newStaff" method="post">
    <h2 style="color:white; font-family: 'Montserrat', sans-serif;">New Teacher</h2>
    <div class="wrapper">	
	<div class="left">
	<input type="text" placeholder="Teaching Id" name="txtID" required/>
    <input type="text" placeholder="Name" name="txtName" required/>
    
	    <input list="Designation" placeholder="Designation" name="txtDesignation" required>
			<datalist id="Designation">	
		  	<option value="Assistant Professor">
		  	<option value="Professor">
		  	<option value="HOD">
		  	<option value="HOS">
		  	<option value="DEAN">
			</datalist>
		<input list="Department" placeholder="Department" name="txtDepartment" required>
			<datalist id="Department">	
		  	<option value="CSE">
		  	<option value="IT">
		  	<option value="ME">
		  	<option value="ECE">
		  	<option value="Medical">
			</datalist>
    <!-- <input type="text" placeholder="Designation" name="txtDesignation" required/>
    <input type="text" placeholder="Department" name="txtDepartment" required/> -->
	<center><button type="submit" class="btn">Login</button> </center>
	    
    </div>
    
	<div class="right">    
 	<input type="text" placeholder="Email" name="txtEmail" required/>
	<input type="password" placeholder="Enter Password" name="txtPassword" required/>
    <input type="text" placeholder="Mobile Number" name="txtMoobile" required/>
    <input type="date" placeholder="Date Of Birth" name="txtdob" required/>
    <center><button type="reset" class="cancel" onClick="closeForm()">Cancel</button> </center>
   	</div>
    </div>
  	</form>
  	</div>
  	</div>   	
</body>
</html>