package com.claim.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.claim.entity.User;
import com.claim.repository.UserRepository;

@Service
public class UserService {

	// Injects a dependency
	@Autowired
	private UserRepository userRepository;
	
	// Save the object to the repository
	public void saveUser(User user) {
		userRepository.save(user);
	}
	
	public User findUser(String email) {
		return userRepository.getOne(email);
	}
	
	public ArrayList<User> findStudents(String tEmail){
		return userRepository.getAllByTeacherEmail(tEmail);
	}
	
}
