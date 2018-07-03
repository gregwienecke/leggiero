package com.claim.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.claim.entity.MyFiles;
import com.claim.entity.User;
import com.claim.service.MyFilesService;

@Controller
public class FileController {
	
	@Autowired
	MyFilesService myFilesService;

	@RequestMapping(value="/fileUpload", method=RequestMethod.POST)
	public ModelAndView fileUpload(@RequestParam("file") MultipartFile file, Model model, HttpSession session) throws IOException
	{
    if (!file.getOriginalFilename().isEmpty()) {
        BufferedOutputStream outputStream = new BufferedOutputStream(
              new FileOutputStream(
                    new File("C:/Users/Greg/Desktop/capstoneFiles", file.getOriginalFilename())));
        outputStream.write(file.getBytes());
        outputStream.flush();
        outputStream.close();
        
        
        //Save file to database
        MyFiles myFile = new MyFiles(file.getOriginalFilename(), file.getContentType(), file.getBytes());
        myFilesService.saveMyFile(myFile);
    	ArrayList<MyFiles> allsmFiles = myFilesService.getAllMyFiles();
		session.setAttribute("allsmFiles", allsmFiles);
        model.addAttribute("msg", "File uploaded successfully.");
     } else {
        model.addAttribute("msg", "Please select a valid file..");
     }
	return new ModelAndView("sheetMusic");
	}
	
	@RequestMapping(value="/fileUpload", method=RequestMethod.GET)
	public String fileUpload() {
		return "fileUpload";
	}
	
	@RequestMapping(value="/sheetMusic", method=RequestMethod.GET)
	public String sheetMusic(HttpSession session) {
		ArrayList<MyFiles> allsmFiles = myFilesService.getAllMyFiles();
		session.setAttribute("allsmFiles", allsmFiles);		
		return "sheetMusic";
	}
	
//	@RequestMapping(value="/download/{id}", method=RequestMthod.GET)
	
}
