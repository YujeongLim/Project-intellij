package com.uni.ljss.member.controller;


import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.uni.ljss.member.model.dto.Member;
import com.uni.ljss.member.model.service.MemberService;
//import com.uni.ljss.member.model.service.MemberServiceImpl2;


@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
//	@Autowired
//	private MemberServiceImpl2 memberServiceImpl2;
	
//	@Autowired
//	private BCryptPasswordEncoder bCryptPasswordEncoder; // 비번암호화
	 
	//로그아웃 변경 (@SessionAttributes)
		@RequestMapping("logout")
		public String logout(SessionStatus status) {
			status.setComplete(); //현재 SessionAttributes 에 의해 저장된 오브젝트를 제거
			return "redirect:/";
		}
		
		@RequestMapping("loginMember")
		public String login() {
			return"member/memberLogin";
		}


		@RequestMapping("enrollForm")
		public String enrollForm() {
			return "member/memberEnrollForm";
	
		}
		
		@RequestMapping("forgetidpage")
		public String forgetIdpage() {
			return "member/forgetid";
	
		}
		
		@RequestMapping("forgetpwdpage")
		public String forgetPwdpage() {
			return "member/forgetpwd";
	
		}
		
	
		
		@RequestMapping("insertMember")
		public String insertMember(@ModelAttribute Member m, @RequestParam("post") String post,
				@RequestParam("address1") String address1, @RequestParam("address2") String address2 , HttpSession session) {
			
				
			m.setMemAdrr(post+"/"+address1+"/"+ address2);

			memberService.insertMember(m);
			
			session.setAttribute("msg", "WELCOME TO LJSS,PLEASE LOGIN!");
			
			
			return "member/memberLogin";
		}
		
		
		
		
		
		
		@RequestMapping(value="loginMember" , method=RequestMethod.POST)
		public String  loginMember(Member m , Model model) throws Exception {
				
		
				Member loginUser = memberService.loginMember( m);
				model.addAttribute("loginUser", loginUser);
				return "redirect:/"; 
		
		}
		
		@RequestMapping(value="forgetId",method=RequestMethod.POST)
		public String forgetId(Member m,HttpSession session) throws Exception  {
			
			Member retrievedMember = memberService.forgetId(m);
			
			if (retrievedMember != null) {
		        
		        String memId = retrievedMember.getMemId();
		        
		      
		        session.setAttribute("message", "YOUR ID : " +  memId);
		    } 
			return "member/memberLogin";
		}
		
		@RequestMapping(value="forgetPwd",method=RequestMethod.POST)
		public String forgetPwd(Member m,HttpSession session) throws Exception  {
			
            Member retrievedMember1 = memberService.forgetPwd(m);
			
			if (retrievedMember1 != null) {
		        
		        String memPwd = retrievedMember1.getMemPwd();
		        
		      
		        session.setAttribute("message", "YOUR PASSWORD:"+memPwd);

	       
			
		    }
			return "member/memberLogin";
		}
		
		@ResponseBody
		@RequestMapping("idCheck")
		public String idCheck(String memId) {
			
			int count = memberService.idCheck(memId);
			
			return String.valueOf(count);
		}
			
		

//		@RequestMapping("myPage")
//		public String myPage() {
//			return "member/myPage";
//		}
//		
//		@RequestMapping("updateMember")
//		public String updateMember(@ModelAttribute Member m, @RequestParam("post") String post,
//				@RequestParam("address1") String address1, @RequestParam("address2") String address2, Model model) throws Exception {
//			
//			
//			m.setMemAdrr(post+"/"+address1+"/"+ address2);
//			Member userInfo = memberService.updateMember(m);
//			//Member userInfo = memberServiceImpl2.updateMember(m);
//			
//			model.addAttribute("loginUser", userInfo);
//			
//			return "member/myPage";
//		}
//		
//		@RequestMapping("updatePwd")
//		public String updatePwd(@RequestParam("originPwd") String originPwd,
//								@RequestParam("updatePwd") String updatePwd,
//								Model model, HttpSession session) throws Exception {
//
//			Member loginUser = (Member) session.getAttribute("loginUser");
//			
//			System.out.println(loginUser.getMemPwd());
//			System.out.println(originPwd);
//			
//			if(!bCryptPasswordEncoder.matches(originPwd, loginUser.getMemPwd())) {
//				
//				session.setAttribute("message", "암호가 틀립니다.");
//				return "redirect:myPage";
//				
//			} else {
//
//				String encPwd = bCryptPasswordEncoder.encode(updatePwd);
//				loginUser.setMemPwd(encPwd);
//
//				memberService.updatePwd(loginUser);
//
//			}
//			return "redirect:/";
//		}
//		
//		@RequestMapping("deleteMember")
//		public String deleteMember(String memId) throws Exception {
//			
//			memberService.deleteMember(memId);
//			return "redirect:logout.do";
//		}
		
		

}
