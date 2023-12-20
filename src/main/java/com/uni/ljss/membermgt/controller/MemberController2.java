package com.uni.ljss.membermgt.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.uni.ljss.common.Pagination;
import com.uni.ljss.membermgt.model.dto.Member2;
import com.uni.ljss.membermgt.model.dto.PageInfo;
import com.uni.ljss.membermgt.model.service.MemberService2;

@Controller
public class MemberController2 {
	
	@Autowired
	public MemberService2 memberService;
	
	//페이징
//	@RequestMapping("listMember")
//	public String selectList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model ) {
//		
//		int listCount = memberService.selectListCount();
//		System.out.println(listCount);
//		
//		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
//		
//		ArrayList<Member2> list = memberService.selectList(pi);
//		
//		model.addAttribute("list", list);
//		model.addAttribute("pi", pi);
//		return "Member/adminMember";
//	}
	
	//회원관리로 페이지 이동
	@RequestMapping("adminMember")
	public String adminMember(Model model) {
		ArrayList<Member2> list = memberService.selectList2();
		model.addAttribute("list", list);
		//admin폴더에 있는 adminMember파일
		return "admin/adminMember";
	}
	
	//회원관리>상세보기
	@RequestMapping("memDetail")
	public String memDetail(@RequestParam Integer mno,Model model) {
		System.out.println("=======================================");
		Member2 m = memberService.selectMember2(mno);
		model.addAttribute("m", m);
		return "admin/memDetail";
	}
	
	@RequestMapping("deleteMember2")
	public String deleteMember2(@RequestParam int mno) throws Exception {
		
		memberService.deleteMember2(mno);
		
		return "redirect:adminMember"+"\"&message=update_success";
	}
	
	@RequestMapping("updateMember2")
	public String updateMember2(@ModelAttribute Member2 member) throws Exception {
		System.out.println("=============================");
		System.out.println(member);
		memberService.update(member);
		return "redirect:memDetail?mno="+member.getMemCode()+"&message=update_success";
	}
	
}
