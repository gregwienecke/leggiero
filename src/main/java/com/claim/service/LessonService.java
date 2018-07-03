package com.claim.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.claim.entity.Lesson;
import com.claim.entity.User;
import com.claim.repository.LessonRepository;
import com.claim.repository.UserRepository;

@Service
public class LessonService {

	@Autowired
	private LessonRepository lessonRepository;
	
	// Save the object to the repository
	public void saveLesson(Lesson lesson) {
		lessonRepository.save(lesson);
	}
	
	public ArrayList<Lesson> findLessons(String sEmail){
		return lessonRepository.getAllByStudentEmail(sEmail);
	}
}
