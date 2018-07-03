<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Calendar</title>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body id="calendarPage">
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
           				<a class="nav-link active" href="calendar">Calendar</a>
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
		                </c:if> 
		            	<a class="nav-link" href="messaging">Messaging</a>
		            	<a class="nav-link" href="sheetMusic">Sheet Music</a>
           	 		</c:if>
          		</nav>
        	</div>
		</header>
		<main>
			<iframe src="https://calendar.google.com/calendar/embed?src=p7kricbn9kqh64fpbpn6okp6ck%40group.calendar.google.com&ctz=America%2FChicago" style="border: 0" width="800" height="600" frameborder="0" scrolling="no"></iframe>		
		</main>
	</div>
</body>
</html>