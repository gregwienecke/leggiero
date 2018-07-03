package com.claim.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.claim.entity.Lesson;
import com.claim.entity.User;

@Repository
public interface LessonRepository extends JpaRepository<Lesson, Integer>{
	@Query("select L from Lesson L where studentEmail=:sEmail")
	public ArrayList<Lesson> getAllByStudentEmail(@Param("sEmail")String sEmail);
}
