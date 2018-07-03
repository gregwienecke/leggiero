<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Home</title>
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
            <a class="nav-link active" href="#">Home</a>
            <c:if test="${not loggedIn}">
            	<a class="nav-link" href="register">Register</a>
            </c:if>
            <c:if test="${loggedIn}">
            	<a clas"nav-link" href="calendar">Calendar</a>
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

      <main role="main" style="text-align:center">
        <h1 class="cover-heading"><span class="boldHeader">Leggiero </span>Music Lessons</h1>
        <p class="lead">An app for music teachers, students, parents, and their schools to keep track of their lesson schedule, what was covered in each lesson, assign homework, schedule make-up lessons, as well as <br>share sheet music and messages.</p>
        <c:if test="${loggedIn}">
        	<h4 id="greeting">Hi ${currentUser.firstName}!</h4>
        </c:if>
        <br><br>
        <p class="lead">
        	<c:if test="${not loggedIn}">
          		<a href="login" class="btn btn-lg btn-secondary darkButton">Login</a>
          	</c:if>
          	<c:if test="${loggedIn}">
          		<a href="logout" class="btn btn-lg btn-secondary darkButton">Logout</a>          	
          	</c:if>
        </p>
        
	      <footer class="mastfoot mt-auto" style="text-align:center">
	        <div class="inner">
	          <p>Design by <a href="https://twitter.com/gregwienecke" target="_blank">@gregwienecke</a></p>
	        </div>
	      </footer>
      </main>


    </div>

	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
</body>
</html>