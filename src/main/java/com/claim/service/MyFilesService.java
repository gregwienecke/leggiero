package com.claim.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.claim.entity.MyFiles;
import com.claim.entity.User;
import com.claim.repository.MyFilesRepository;

@Service
public class MyFilesService {

	@Autowired
	private MyFilesRepository myFilesRepository;
	
	// Save the object to the repository
	public void saveMyFile(MyFiles myFile) {
		myFilesRepository.save(myFile);
	}
	
	public ArrayList<MyFiles> getAllMyFiles(){
		return myFilesRepository.getAllFiles();
	}
}
