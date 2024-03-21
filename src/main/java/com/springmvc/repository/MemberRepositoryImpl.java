package com.springmvc.repository;

import com.springmvc.domain.Member;
import com.springmvc.domain.Pagination;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberRepositoryImpl implements MemberRepository{

	private JdbcTemplate template;
	
	@Autowired
	public void setJdbctemplate(DataSource dataSource) {
		this.template = new JdbcTemplate(dataSource);
	}
	
	@Override
	public void add_new_member(Member m) {
		System.out.println("MemberRepository 도착");
		String SQL = "INSERT INTO user_mem VALUES (?, ?, ?, ?, ?, ?, ?)";
		template.update(SQL, m.getMem_id(), m.getMem_pw(), m.getMem_name(), m.getMem_nickname(), m.getMem_phone(), m.getMem_email(), null);
	}

	@Override
	public int login_check(String mem_id, String mem_pw) {
		String sql = "select count(*) from user_mem where mem_id=? and mem_pw=?";
		int verify = this.template.queryForObject(sql, Integer.class, mem_id, mem_pw);
		return verify;
	}

	@Override
	public Member get_member_info(String sessionId) {
		String sql2 = "select * from user_mem where mem_id = ?";
		Member member = template.queryForObject(sql2, new Object[] {sessionId}, new BeanPropertyRowMapper<>(Member.class));
		System.out.println("member 반환");
		return member;
	}

	@Override
	public void update_member_info(Member member) {
		System.out.println("Repository 도착");
		System.out.println("Member 값: " + member.toString());
		String sql = "UPDATE user_mem SET mem_name = ?, mem_nickname = ?, mem_phone = ?, mem_email = ?, where mem_id = ?;";
		template.update(sql, member.getMem_name(), member.getMem_nickname(), member.getMem_phone(), member.getMem_email(), member.getMem_id());
	}

	@Override
	public int delete_member(String sessionId) {
		System.out.println("memberRepository.delete_member() 도착");
		System.out.println("id: " + sessionId);
		String sql = "DELETE FROM user_mem WHERE mem_id = ?";
		int verify = template.update(sql, sessionId);
		return verify;
	}

	@Override
	public List<Member> all_member_list(Pagination page) {
		String sql = "SELECT * FROM	user_mem LIMIT ?, ?";
		List<Member> member_list = template.query(sql, new MemberMapper(), page.getStartList(), page.getListSize());
		return member_list;
	}

	@Override
	public int checkId(String id) {
		System.out.println("MemberRepository.checkId() 도착");
		
//		Connection conn = null;		
//		ResultSet rs = null;
//		int result = 0;
//		String url = "jdbc:mysql://localhost:3306/pethug";
//		String user = "root";
//		String password = "1234";
//		try {
//			Class.forName("com.mysql.jdbc.Driver");
//			conn = DriverManager.getConnection(url, user, password);
//			PreparedStatement pstmt = null;
//			String SQL = "SELECT COUNT(*) FROM user_mem WHERE mem_id = ?";
//			pstmt = conn.prepareStatement(SQL);
//			pstmt.setString(1, id);
//			rs = pstmt.executeQuery();
//			if(rs.next()) {
//				result=rs.getInt(1);
//			}
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//			
//		return result;
		
		String SQL = "SELECT COUNT(*) FROM user_mem WHERE mem_id = ?";
		int count = template.queryForObject(SQL, Integer.class, id);
		return count;
		
	}
	
	

}
