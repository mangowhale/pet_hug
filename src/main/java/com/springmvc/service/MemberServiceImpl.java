package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Member;
import com.springmvc.domain.Pagination;
import com.springmvc.repository.MemberRepository;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberRepository memberRepository;

	@Override
	public void add_new_member(Member member) {
		System.out.println("MemberService 도착");
		memberRepository.add_new_member(member);
	}

	@Override
	public int login_check(String mem_id, String mem_pw) {
		System.out.println("service.login_check 도착");
		int verify = memberRepository.login_check(mem_id, mem_pw);
		return verify;
	}

	@Override
	public Member get_member_info(String sessionId) {
		System.out.println("memberRepository.get_member_info() 호출");
		Member member = memberRepository.get_member_info(sessionId);
		return member;
	}

	@Override
	public void update_member_info(Member member) {
		System.out.println("memberRepository.update_member_info() 호출");
		memberRepository.update_member_info(member);
	}

	@Override
	public int delete_member(String sessionId) {
		System.out.println();
		int verify = memberRepository.delete_member(sessionId);
		return verify;
	}

	@Override
	public List<Member> all_member_list(Pagination page) {
		return memberRepository.all_member_list(page);
	}

	@Override
	public int checkId(String id) {
		int verify = memberRepository.checkId(id);
		return verify;
	}

	
	
}
