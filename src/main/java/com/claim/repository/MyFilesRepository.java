package com.claim.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.claim.entity.MyFiles;
import com.claim.entity.User;

@Repository
public interface MyFilesRepository extends JpaRepository<MyFiles, String>{

	@Query("select F from MyFiles F")
	public ArrayList<MyFiles> getAllFiles();

}
