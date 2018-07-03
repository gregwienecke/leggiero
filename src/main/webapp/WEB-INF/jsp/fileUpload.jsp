<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload A File</title>
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
            <a clas"nav-link" href="calendar">Calendar</a>
            <a class="nav-link" href="logout">Logout</a>
            <c:if test="${currentUser.getIsTeacher() == true}">
           		<a class="nav-link" href="students">Students</a>
            </c:if>
            <c:if test="${currentUser.getIsTeacher() == false}">
           		<a class="nav-link" href="lessons">Lessons</a>
            </c:if>                
	        <a class="nav-link" href="messaging">Messaging</a>
	        <a class="nav-link active" href="sheetMusic">Sheet Music</a>
          </nav>
        </div>
      </header>

      <main role="main">
        <h1>Upload A File</h1>
        <br>
		<form action="fileUpload" method="post" enctype="multipart/form-data">
			<input type="file" name="file">
			<br>
			<button type="submit" class="btn btn-secondary darkButton">Upload</button>
		</form>
      </main>


    </div>
</body>
</html>