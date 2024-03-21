package com.springmvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springmvc.domain.Member;
import com.springmvc.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private HttpSession session;
	

	
	@GetMapping("/add")
	public String add_member_form(@ModelAttribute("new_member")Member member) {
		System.out.println("add_member_form() 도착");
		return "/member/add_member";
	}
	
	@PostMapping("/add")
	public String submit_add_member(@ModelAttribute("new_member")Member member, BindingResult result, HttpServletRequest request) {
		
		if(result.hasErrors()) {
			return "/member/add_member";
		}else {
			System.out.println("MemberService 호출");
			memberService.add_new_member(member);
		}
		//회원가입 완료 화면
		System.out.println("완료 화면 이동");
		return "member/add_member_complete";
	}
	
	@GetMapping("/login")
	public String member_login_form() {
		System.out.println("member_login_form() 실행");
		return "/member/login";
	}
	
	@PostMapping("/login")
	public String member_login_check(@RequestParam("mem_id") String mem_id, @RequestParam("mem_pw") String mem_pw) {
		System.out.println("member_login_check() 실행");
		int verify = memberService.login_check(mem_id, mem_pw);
		if(verify==1) {
			System.out.println("로그인 성공");
			session.setAttribute("sessionId", mem_id);
			System.out.println("session에 아이디 저장");
			return "redirect:/home";
		}else {
			System.out.println("로그인 실패");
			return "/member/login";
		}
	}
	
	@GetMapping("/info")
	public String get_member_info(Model model) {
		System.out.println("sessionId 취득");
		String sessionId = (String)session.getAttribute("sessionId");
		
		System.out.println("memberService.get_member_info() 호출");
		Member member = memberService.get_member_info(sessionId);
		model.addAttribute("member", member);
		return "/member/member_info";
		
	}
	
	@PostMapping("/update_info")
	public String update_meber_info(@ModelAttribute("member")Member member) {
		System.out.println("update_member_info() 도착");
		
		//업데이트
		System.out.println("memberService.update_member_info() 호출");
		memberService.update_member_info(member);
		
		//불러오기
		return "member/member_info";
	}
	
	@GetMapping("/delete_member")
	public String delete_member() {
		String sessionId = (String)session.getAttribute("sessionId");
		int verify = memberService.delete_member(sessionId);
		if(verify == 1) {
			System.out.println("회원 삭제 성공");
			return "/member/delete_member_complete";
		}else {
			System.out.println("회원 삭제 실패");
			return "/member/member_info";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request)
	{
		 HttpSession session = request.getSession();
	      session.invalidate();
	      return "redirect:/home";
	}
	
	@PostMapping("/checkId")
	@ResponseBody
	public int checkId(String id) {
		System.out.println("MemberController.checkId() 도착");
		System.out.println("id: " + id);
		int result = memberService.checkId(id);
		System.out.println("result: " + result);
		return result;
	}
	
}
