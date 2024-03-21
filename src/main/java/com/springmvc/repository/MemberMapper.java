package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Member;

public class MemberMapper implements RowMapper<Member>{

	@Override
	public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
		Member m = new Member();
		m.setMem_id(rs.getString(1));
		m.setMem_pw(rs.getString(2));
		m.setMem_name(rs.getString(3));
		m.setMem_nickname(rs.getString(4));
		m.setMem_phone(rs.getString(5));
		m.setMem_email(rs.getString(6));
		m.setJoin_date(rs.getString(7));
		
		return m;
	}

}
