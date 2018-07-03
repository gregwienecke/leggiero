package com.claim.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class User {
	
	@Column
	private String firstName;
	@Column
	private String lastName;
	@Column
	private String password;
	@Id
	private String email;
	@Column
	private boolean isTeacher;
	@Column
	private String teacherEmail;
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	private List<Lesson> lessonList = new ArrayList<>();	

	
	@Override
	public String toString() {
		return this.firstName + " " + this.lastName + " " + this.password + " " + this.email + " Teacher: " + this.isTeacher;
	}
	
	

	public List<Lesson> getLessonList() {
		return lessonList;
	}
	public void setLessonList(ArrayList<Lesson> lessonList) {
		this.lessonList = lessonList;
	}
	public String getTeacherEmail() {
		return teacherEmail;
	}
	public void setTeacherEmail(String teacherEmail) {
		this.teacherEmail = teacherEmail;
	}
	public void setTeacher(boolean isTeacher) {
		this.isTeacher = isTeacher;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public boolean getIsTeacher() {
		return isTeacher;
	}
	public void setIsTeacher(boolean isTeacher) {
		this.isTeacher = isTeacher;
	}
	
	
}
