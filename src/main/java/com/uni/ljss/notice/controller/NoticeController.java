package com.uni.ljss.notice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import jakarta.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.uni.ljss.common.CommException;
import com.uni.ljss.common.Pagination;
import com.uni.ljss.notice.model.dto.Notice;
import com.uni.ljss.notice.model.dto.PageInfo1;
import com.uni.ljss.notice.model.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	public NoticeService noticeService;
	
	@RequestMapping("listNotice")
	public String selectList(@RequestParam(value="currentPage", required = false, defaultValue= "1")int currentPage, Model model) {
		int listCount = noticeService.selectListCount();
//		System.out.println(listCount);
		
		PageInfo1 pi = Pagination.getPageInfo1(listCount, currentPage, 10, 5);
		
		ArrayList<Notice> list = noticeService.selectList(pi);
		
		System.out.println(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "notice/noticeListView";
	}
	
	@RequestMapping("enrollFormNotice")
	public String enrollForm() {
		return "notice/noticeEnrollForm";
	}
	
	@RequestMapping("insertNotice")
	public String insertNotice(Notice n, HttpServletRequest request, @RequestParam(name="uploadFile", required=false)MultipartFile  file) {
		System.out.println(n);
//		System.out.println(file.getOriginalFilename());
//		
//		if(!file.getOriginalFilename().equals("")) {
//			String changeName = saveFile(file, request);
//			
//			if(changeName != null) {
//				n.setOriginName(file.getOriginalFilename());
//				n.setChangeName(changeName);
//			}
//		}
		
		noticeService.insertNotice(n);
		
		return "redirect:listNotice";
	}

	private String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\upload_files\\";
		
		String originName = file.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ext;
		System.out.println("changeName : " + changeName);
	
	try {
		file.transferTo(new File(savePath + changeName));
	} catch (IllegalStateException | IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		throw new CommException("file Upload Error");
	}
	return changeName;
	}

	@RequestMapping("detailNotice")
	public ModelAndView selectNotice(int nno, ModelAndView mv) {
		Notice n = noticeService.selectNotice(nno);
		mv.addObject("n", n).setViewName("notice/noticeDetailView");
		return mv;
	}
	
	@RequestMapping("updateFormNotice")
	public ModelAndView updateForm(int nno, ModelAndView mv) {
		
		
		mv.addObject("n", noticeService.selectNotice(nno))
		.setViewName("notice/noticeUpdateForm");
		
		return mv;
	}
	
	@RequestMapping("updateNotice")
	public ModelAndView updateNotice(Notice n, ModelAndView mv, HttpServletRequest request, @RequestParam(name = "reUploadFile", required=false)MultipartFile file) {
		String orgChangeName = n.getChangeName();
		
//		if(!file.getOriginalFilename().equals("")) {
//			String changeName = saveFile(file, request);
//			
//			n.setOriginName(file.getOriginalFilename());
//			n.setChangeName(changeName);
//		}
		
		noticeService.updateNotice(n);
		
		if(orgChangeName != null) {
			deleteFile(orgChangeName, request);
		}
		
		mv.addObject("nno", n.getNoticeNo()).setViewName("redirect:detailNotice");
		return mv;
	}
	
	public void deleteFile(String orgChangeName, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\upload_files\\";
		
		File deleteFile = new File(savePath + orgChangeName);
		
		deleteFile.delete();
	}
	
	@RequestMapping("deleteNotice")
	private String deleteNotice(int nno, String fileName , HttpServletRequest request) {
		
		noticeService.deleteNotice(nno);
		
		
		return "redirect:listNotice";
	}
	
//	@ResponseBody
//	@RequestMapping(value = "rlistNotice", produces= "application/json; charset=utf-8")
//	public String selectReplyList(int bno) {
//		
//		ArrayList<Reply> list = noticeService.selectReplyList(bno);
//		
//		return new GsonBuilder().setDateFormat("yyyy 년 MM 월 dd 일 HH:mm:ss").create().toJson(list);
//	}
//	
//	@ResponseBody
//	@RequestMapping(value = "rinsertNotice")
//	public String insertReply(Reply r) {
//		int result = noticeService.insertReply(r);
//		
//		return String.valueOf(result);
//	}
	
	@ResponseBody
	@RequestMapping(value = "topListNotice", produces= "application/json; charset=utf-8")
	public String selectTopList() {
		
		ArrayList<Notice> list = noticeService.selectTopList();
		
		return new GsonBuilder().setDateFormat("yyyy 년 MM 월 dd 일 HH:mm:ss").create().toJson(list);
	}
}
