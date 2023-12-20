package com.uni.ljss.event.controller;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.uni.ljss.common.CommException;
import com.uni.ljss.event.model.dto.Event;
import com.uni.ljss.event.model.service.EventService;

@Controller
public class EventController {
	
	@Autowired
	public EventService eventService;
	
	//이벤트페이지
	@RequestMapping("selectEvent")
	public String event(Model model) {
		ArrayList<Event> list = eventService.selectList();
		model.addAttribute("list", list);
		return"event/event";
	}
	
	//이벤트관리로 페이지 이동
	@RequestMapping("adminEvent")
	public String adminEvent(Model model) {
		ArrayList<Event> list = eventService.selectList();
		model.addAttribute("list", list);
		//admin폴더에 있는 adminEvent파일
		return "admin/adminEvent";
	}

	//이벤트등록페이지로 이동
	@RequestMapping("eventInsertForm")
	public String eventInsertForm() {
		return "admin/eventInsertForm";
	}
	
	//이벤트추가
	@RequestMapping("insertEvent")
	public String insertEvent(Event event , HttpServletRequest request , @RequestParam(name = "uploadFile", required =false) MultipartFile file) throws IOException {

		System.out.println("=================================================================================");
		System.out.println(event);
		System.out.println(file.getOriginalFilename());
		
		if (file != null && !file.isEmpty()) {
            try {
                String changeName = saveFile(file, request);
                
                event.setEventPhoto(changeName);
                
            } catch (IllegalStateException e) {
            	
                e.printStackTrace();
                throw new CommException("File Upload Error");
            }
	    }

		System.out.println(event);
		eventService.insertEvent(event);
		
		
		return "redirect:adminEvent";
	}

	//전달받은 파일을 업로드시키고 수정된 파일명을 리턴
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources +"\\upload_files\\";
		
		
		String originName = file.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int lastIndexOfDot = originName.lastIndexOf(".");

		String ext = originName.substring(lastIndexOfDot);
		String fileNameWithoutExtension = lastIndexOfDot != -1 ? originName.substring(0, lastIndexOfDot) : originName;
		
		
		String changeName = fileNameWithoutExtension + currentTime + ext;
		System.out.println("originName : " + originName);
		System.out.println("changeName : " + changeName);
		
		
		try {
			File directory = new File(savePath);
		    if (!directory.exists()) {
		        directory.mkdirs(); // 경로가 없으면 생성
		    }
		    
			file.transferTo(new File(savePath+changeName));
			
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new CommException("file Upload Error");
		}
		return changeName;
	}
	
	@RequestMapping("detailEvent")
	public String selectEvent(@RequestParam Integer eno,Model mv) {
		System.out.println("======================");
		Event e = eventService.selectEvent(eno);
		mv.addAttribute("e", e);
		return "admin/eventDetail";
	}
	
	
	@RequestMapping("updateFormEvent")
	public ModelAndView updateForm(int eno, ModelAndView mv) {
		mv.addObject("e", eventService.selectEvent(eno))
		.setViewName("event/eventUpdateForm");
		return mv;
	}

	@RequestMapping("updateEvent")
	public ModelAndView updateEvent(Event e , ModelAndView mv, HttpServletRequest request,
	@RequestParam(name = "reUploadFile", required=false) MultipartFile file, RedirectAttributes redirectAttributes) {
		
		System.out.println("=================================================================================");
		System.out.println(e);
		System.out.println(file.getOriginalFilename());
		
		
		String orgChangeName = e.getEventPhoto();
		
		if(!file.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(file, request);
			
			e.setEventPhoto(changeName);
		}
		
		eventService.updateEvent(e);
		
		if(orgChangeName != null) {
			deleteFile(orgChangeName, request);
		}
		
	
		redirectAttributes.addFlashAttribute("success",  "이벤트 수정 완료");
		mv.setViewName("redirect:adminEvent");
		return mv ;
	}

	private void deleteFile(String orgChangeName, HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources +"\\upload_files\\";
		
		File deleteFile = new File(savePath + orgChangeName);
		
		deleteFile.delete();
	}
	
	@RequestMapping("deleteEvent")
	private ModelAndView deleteEvent(int eno, String fileName , HttpServletRequest request, ModelAndView mv, RedirectAttributes redirectAttributes) throws Exception {
		
		eventService.deleteEvent(eno);
		
		if(!fileName.equals("")) {
			deleteFile(fileName, request);
			
		}
		redirectAttributes.addFlashAttribute("success",  "이벤트 삭제 완료");
		mv.setViewName("redirect:adminEvent");
		return mv;
	}
	
}
