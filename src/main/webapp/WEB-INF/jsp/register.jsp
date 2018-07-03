<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="css/styles.css">

</head>
<body>
    <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
      <header class="masthead mb-auto">
        <div class="inner">
          <nav class="nav nav-masthead justify-content-center">
            <h3 class="masthead-brand" id="headerTitle">Leggiero</h3>
            <a class="nav-link" href="/">Home</a>
    		<c:if test="${not loggedIn}">
   				<a class="nav-link" href="register">Register</a>
   			</c:if>
   			<c:if test="${loggedIn}">
   				<a class="nav-link" href="calendar">Calendar</a>
   			</c:if>
            <c:if test="${not loggedIn}">
            	<a class="nav-link" href="login">Login</a>
            </c:if>
            <c:if test="${loggedIn}">
                <a class="nav-link" href="logout">Logout</a>            
                <c:if test="${currentUser.getIsTeacher() == true}">
               		<a class="nav-link" href="students">Students</a>
                </c:if>
                <c:if test="${currentUser.getIsTeacher() == false}">
               		<a class="nav-link" href="lessons">Lessons</a>
                </c:if> 	            <a class="nav-link" href="messaging">Messaging</a>
	            <a class="nav-link" href="sheetMusic">Sheet Music</a>
            </c:if>
            
            
          </nav>
        </div>
      </header>
      
      <main>
      	<h1>Register</h1>
      	
		<form:form action="register" method="post" modelAttribute="user">
			First Name:<br> <form:input path="firstName"/>
			<br><br>
			Last Name:<br> <form:input path="lastName"/>
			<br><br>
			Email:<br> <form:input path="email"/>	
			<br><br>
			Password:<br> <form:password path="password"/>
			<br><br>
			<form:radiobutton path="isTeacher" value="true" id="isTeacher" /> Teacher<br>
			<form:radiobutton path="isTeacher" value="false" id="isStudent" /> Student/Parent
			<br><br>
			<div id="teacherEmail">
				<span style="font-size:20px;color:salmon">* </span>Teacher's Email: <br> <form:input path="teacherEmail"/>
			</div>
			<br>
			<input type="submit"/>	
			<br><br>
		</form:form>
      	
      </main>
     </div>
     <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
     <script>
	  	$('input[type="radio"]').prop('checked', false);
     	$("#teacherEmail").hide();
     	$("#isStudent").click(function(){
     		$("#teacherEmail").show();
     	});
     	$("#isTeacher").click(function(){
         	$("#teacherEmail").hide();
     	});
     </script>
</body>
</html>