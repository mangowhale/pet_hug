package com.springmvc.service;


import java.util.List;

import com.springmvc.domain.Member;
import com.springmvc.domain.Pagination;

public interface MemberService {
	
	void add_new_member(Member member);
	
	int login_check(String mem_id, String mem_pw);
	
	Member get_member_info(String sessionId);
	
	void update_member_info(Member member);
	
	public int delete_member(String sessionId);
	
	public List<Member> all_member_list(Pagination page);
	public int checkId(String id);
}
