package com.claim.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.claim.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, String> {
	@Query("select U from User U where teacherEmail=:tEmail")
	public ArrayList<User> getAllByTeacherEmail(@Param("tEmail")String tEmail);
}
