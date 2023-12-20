package com.uni.ljss.qna.controller;

import jakarta.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.uni.ljss.qna.model.dto.Qna;
import com.uni.ljss.qna.model.service.QnaService;

@Controller
public class QnaController {
	
	@Autowired
	public QnaService qnaService;

	@RequestMapping("enrollFormQna")
	public String enrollForm() {
		return "qna/qnaEnrollForm";
	}
	@RequestMapping("insertQna")
	public String insertQna(Qna q, HttpServletRequest request, @RequestParam(name="uploadFile", required=false)MultipartFile  file) {

		
		qnaService.insertQna(q);
		
		return "main";
	}
	
}
