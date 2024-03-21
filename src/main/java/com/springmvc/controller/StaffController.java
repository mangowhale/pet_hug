package com.springmvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springmvc.domain.Member;
import com.springmvc.domain.Pagination;
import com.springmvc.service.MemberService;

@Controller
@RequestMapping("/staff")
public class StaffController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/members")
	public String all_member_list(Model model, Pagination page) {
		System.out.println("StaffController.get_members() 도착");
		List<Member> list = memberService.all_member_list(page);
		model.addAttribute("member_list", list);
		return "/member/staff_members";
	}
	
	
	
	@GetMapping("/members/detail")
	public String staff_member_info(@RequestParam("id") String mem_id, Model model) {
		System.out.println("StaffController.staff_member_info() 도착");
		System.out.println("mem_id: " + mem_id);
		Member member_info = memberService.get_member_info(mem_id);
		model.addAttribute("member", member_info);
		return "/member/staff_member_detail";
	}
	
	@PostMapping("/update_member")
	public String staff_update_member(@ModelAttribute("member")Member member) {
		System.out.println("staff_update_member() 도착");
		
		//업데이트
		System.out.println("memberService.update_member_info() 호출");
		memberService.update_member_info(member);
		
		//불러오기
		return "/member/staff_member_detail";
	}
	
	@GetMapping("/delete_member")
	public String staff_delete_member(@RequestParam("id")String mem_id) {
		System.out.println("StaffController.staff_delete_member() 도착");
		System.out.println("mem_id: " + mem_id);
		int verify = memberService.delete_member(mem_id);
		if(verify == 1) {
			System.out.println("회원 삭제 성공");
			return "redirect:/staff/members";
		}else {
			System.out.println("회원 삭제 실패");
			return "redirect:/staff/members";
		}
	}
}
