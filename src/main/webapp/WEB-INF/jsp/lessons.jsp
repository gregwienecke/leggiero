<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lessons</title>
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
               		<a class="nav-link active" href="students">Students</a>
                </c:if>
                <c:if test="${currentUser.getIsTeacher() == false}">
               		<a class="nav-link active" href="lessons">Lessons</a>
                </c:if>            	
                <a class="nav-link" href="messaging">Messaging</a>
            	<a class="nav-link" href="sheetMusic">Sheet Music</a>
            </c:if>
           
          </nav>
        </div>
      </header>
      <main>
      	<h1>Lessons</h1>
		
		<div class="row">
			<div class="col-md-10">
				<c:if test="${currentUser.getIsTeacher() == true}">
               		<h4> ${studentName} </h4>
                </c:if>
                <c:if test="${currentUser.getIsTeacher() == false}">
               		<h4> ${currentUser.firstName} </h4>
                </c:if>          				
                <table class="table">
					<thead>
						<th>Date</th>
						<th style="width:80px">Time</th>
						<th style="width:81px">Length</th>
						<th>Type</th>
						<th>Notes</th>
					</thead>
					<c:forEach var="lesson" items="${studentsLessons}">
						<tr>
	      					<td> ${lesson.date} </td>    
	      					<td> ${lesson.time} ${lesson.ampm}</td> 
	      					<c:if test="${lesson.length.equals('halfHour')}"> 	
	      						<td> Half hour </td>
	      					</c:if>
	      					<c:if test="${lesson.length.equals('hour')}">
	      						<td> Hour </td>	      					
	      					</c:if>      				
	      					<td> ${lesson.lessonType} </td>      				
	      					<td> ${lesson.notes} </td>   
      					</tr>   				      								
      				</c:forEach>
				</table>
			</div>
		</div>
		<br><br>
		
      	<c:if test="${currentUser.getIsTeacher() == true}">
	      	<h4 class="calendarHeadingWithMargin">Add New Lesson</h4><br>
	      	<form:form action="addLesson" method="post" modelAttribute="lesson">
	      	<form:hidden path="studentEmail" value="${studentEmail }"/>
	      		<strong>DATE:</strong><br>
	      		<form:input path="date" placeholder="mm/dd/yy"/>
	      		<br><br>
	      		
	      		<strong>TIME:</strong><br>
	      		<form:select path="time">
	      			<form:option value="1">1</form:option>
	      			<form:option value="1:30">1:30</form:option>
	      			
	      			<form:option value="2">2</form:option>
	      			<form:option value="2:30">2:30</form:option>
	
	      			<form:option value="3">3</form:option>
	      			<form:option value="3:30">3:30</form:option>
	      			
	      			<form:option value="4">4</form:option>
	      			<form:option value="4:30">4:30</form:option>
	      			
	      			<form:option value="5">5</form:option>
	      			<form:option value="5:30">5:30</form:option>
	      			
	      			<form:option value="6">6</form:option>
	      			<form:option value="6:30">6:30</form:option>
	      			
	      			<form:option value="7">7</form:option>
	      			<form:option value="7:30">7:30</form:option>
	      			
	      			<form:option value="8">8</form:option>
	      			<form:option value="8:30">8:30</form:option>
	      			
	      			<form:option value="9">9</form:option>
	      			<form:option value="9:30">9:30</form:option>
	      			
	      			<form:option value="10">10</form:option>
	      			<form:option value="10:30">10:30</form:option>
	      			
	      			<form:option value="11">11</form:option>
	      			<form:option value="11:30">11:30</form:option>
	      			
	      			<form:option value="12">12</form:option>    	
	      			<form:option value="12:30">12:30</form:option>      					
	      		</form:select>
	      		
	      		<form:select path="ampm">
	      			<form:option value="am">AM</form:option>
	      			<form:option value="pm">PM</form:option>
	      		</form:select>
	      		<br><br>
	      		
	      		<strong>LENGTH:</strong><br>
	      		<span class="sub"></span><form:radiobutton path="length" value="halfHour"/> Half Hour </span><br>
	      		<span class="sub"></span><form:radiobutton path="length" value="hour"/> Hour </span> 
	      		<br><br>
	      		
	      		<strong>LESSON TYPE:</strong><br>
	      		<span class="sub"><form:radiobutton path="lessonType" value="Regular"/> Regular </span><br>
	      		<span class="sub"><form:radiobutton path="lessonType" value="Makeup"/> Makeup </span>
	      		<br><br>
	      		
	      		<strong>NOTES:</strong><br>
	      		<form:textarea path="notes" style="width:480px;height:190px" placeholder="Songs and techniques covered / homework etc."/>
	      		<br><br>
	      		
	      		<input type="submit"/>
	      		<br><br>
	      	</form:form>
      	</c:if>
      	<br><br>
      	
      </main>
     </div>
</body>
</html>