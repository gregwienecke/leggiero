package com.claim.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.claim.entity.Lesson;
import com.claim.entity.User;
import com.claim.service.LessonService;
import com.claim.service.UserService;

@Controller
public class HomeController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	LessonService lessonService;
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public ModelAndView register() {
		return  new ModelAndView("register", "user", new User());
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public ModelAndView register(@ModelAttribute("user") User user) {
		userService.saveUser(user);
		return new ModelAndView("login", "user", new User());
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public ModelAndView login() {
		return new ModelAndView("login", "user", new User());
	}
	
	// When user logs in
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("user") User formUser, HttpSession session) {
		
		try {
			User dbUser = userService.findUser(formUser.getEmail());
			if (dbUser != null && formUser.getPassword().equals(dbUser.getPassword())) {
				//System.out.println("Form user: " + formUser);
				//System.out.println("FOUND USER: " + dbUser);
				session.setAttribute("loggedIn", true);
				session.setAttribute("currentUser", dbUser);
				if (dbUser.getIsTeacher()) {
					ArrayList<User> studentsByTeacherEmail = userService.findStudents(dbUser.getEmail());
					session.setAttribute("studentsByTeacherEmail", studentsByTeacherEmail);					
					return new ModelAndView("students", "currentUser", dbUser);
				} else {
					ArrayList<Lesson> studentsLessons = lessonService.findLessons(dbUser.getEmail());
					session.setAttribute("studentsLessons", studentsLessons);						
					return new ModelAndView("lessons", "currentUser", dbUser);
				}
			} 
		} catch (Exception e) {
			System.out.println("Exception in Controller!");				
		}
		return new ModelAndView("login", "user", new User());		
	}
	
	// When student clicks on their lessons nav link ---OR--- teacher clicks on students name from students.jsp
	@RequestMapping(value="/lessons", method=RequestMethod.GET)
	public ModelAndView lessons(HttpSession session, HttpServletRequest request) {
		
		// Get currentUser from the session
		User currentUser = (User)session.getAttribute("currentUser");
		
		// If currentUser is a teacher:
		if (currentUser.getIsTeacher()) {
			String studentEmail = request.getParameter("studentEmail");
			ArrayList<Lesson> studentsLessons = lessonService.findLessons(studentEmail);
			session.setAttribute("studentEmail", studentEmail);
			session.setAttribute("studentsLessons", studentsLessons);						
			return new ModelAndView("lessons", "lesson", new Lesson());
			
		// Else if currentUser is a student:	
		} else {
			ArrayList<Lesson> studentsLessons = lessonService.findLessons(currentUser.getEmail());
			session.setAttribute("studentsLessons", studentsLessons);						
			return new ModelAndView("lessons", "currentUser", currentUser);
		}
	}
	
	@RequestMapping(value="/students", method=RequestMethod.GET)
	public String students(HttpSession session) {
		User user = (User)session.getAttribute("currentUser");
		ArrayList<User> studentsByTeacherEmail = userService.findStudents(user.getEmail());
		session.setAttribute("studentsByTeacherEmail", studentsByTeacherEmail);
		return "students";
	}
	
	@RequestMapping(value="/messaging", method=RequestMethod.GET)
	public String messaging() {
		return "messaging";
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.setAttribute("loggedIn", false);
		return "index";
	}
	
	@RequestMapping(value="/addLesson", method=RequestMethod.POST)
	public ModelAndView addLesson(@ModelAttribute("lesson") Lesson lesson, HttpSession session) {
		System.out.println(lesson);
		lesson.setUser(userService.findUser(lesson.getStudentEmail()));
		lessonService.saveLesson(lesson);
		
		ArrayList<Lesson> studentsLessons = lessonService.findLessons(lesson.getStudentEmail());
		session.setAttribute("studentsLessons", studentsLessons);						
		return new ModelAndView("lessons", "lesson", new Lesson());
	}
	
	@RequestMapping(value="/calendar", method=RequestMethod.GET)
	public String calendar() {
		return "calendar";
	}
		
}
