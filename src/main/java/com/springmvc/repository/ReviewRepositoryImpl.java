package com.springmvc.repository;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.Member;
import com.springmvc.domain.Review;
import com.springmvc.domain.Review;

@Repository
public class ReviewRepositoryImpl implements ReviewRepository
{
private JdbcTemplate template;
	
	@Autowired
	public void setJdbctemplate(DataSource dataSource)
	{
		this.template = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<Review> getAllReviewList(String contentSeq) 
	{		
		// db연동 + ${revire. } 사용
		String SQL = "SELECT * FROM review WHERE contentSeq = " + contentSeq;
		List<Review> listOfReviews = template.query(SQL, new ReviewRowMapper());
		
		if(listOfReviews == null) {
			throw new IllegalArgumentException("작성된 리뷰가 없습니다.");
		}else
		return listOfReviews;
	}
	
	public Review getReviewByNum(String num) 
	{
		Review reviewInfo = null;
		
		
		//db연동
		String SQL = "SELECT count(*) FROM review where num=?";
		int rowCount = template.queryForObject(SQL, Integer.class, num);
		if (rowCount != 0)
		{
			SQL = "SELECT * FROM review where num=?";
			reviewInfo = template.queryForObject(SQL, new Object[] {num}, new ReviewRowMapper());
		}
		
		
		if (reviewInfo == null)
			throw new IllegalArgumentException("리뷰 번호가 " + num + "인 리뷰를 찾을 수 없습니다.");
		return reviewInfo;			
	}
	
	public int getCountReviewByIdAndContentSeq(String sessionId, String contentSeq) {
		System.out.println("reviewRepository.getCountReview() 도착");
		System.out.println("sessionId: " + sessionId);
		System.out.println("contentSeq: " + contentSeq);
		String sql = "SELECT COUNT(*) FROM review WHERE mem_id = ? AND contentSeq = ?";
		int verify = template.queryForObject(sql, Integer.class, sessionId, contentSeq);
		System.out.println("verify: " + verify);
		return verify;
	}
	
	public Review getReviewByIdAndSeq(String sessionId, String contentSeq) {
		System.out.println("reviewRepository.getReview() 도착");
		System.out.println("sessionId: " + sessionId);
		System.out.println("contentSeq: " + contentSeq);
		String sql2 = "select * from review where mem_id = ? AND contentSeq = ?";
		Review review = template.queryForObject(sql2, new Object[] {sessionId, contentSeq}, new BeanPropertyRowMapper<>(Review.class));
		System.out.println("review.mem_id: " + review.getMem_id());
		System.out.println("review.star: " + review.getStar());
		System.out.println("review.text: " + review.getText());
		System.out.println("review.contentSeq: " + review.getContentSeq());
		System.out.println("review.date" + review.getRev_date());
		return review;
	}
	
	
	public void setNewReview(Review review, String contentSeq, String sessionId)
	{
		System.out.println("reviewRepository.setNewReview() 도착");
		System.out.println("sessionId: " + sessionId);
		String nicknameSQL = "SELECT mem_nickname FROM user_mem WHERE mem_id = ?";
		String mem_nickname = template.queryForObject(nicknameSQL, String.class, sessionId);
		String SQL ="INSERT INTO review(contentSeq, star, text, mem_id, mem_nickname) " + "VALUES(?, ?, ?, ?, ?)";
		template.update(SQL, contentSeq, review.getStar(), review.getText(), sessionId, mem_nickname);
	}

	
	

	@Override
	public int updateReview(Review review) {
		System.out.println("reviewRepository.updateReview() 도착");
		String SQL = "UPDATE review SET text = ? WHERE mem_id = ? AND contentSeq = ?";
		int verify = template.update(SQL, review.getText(), review.getMem_id(), review.getContentSeq());
		System.out.println("verify: " + verify);
		return verify;
	}

	@Override
	public void deleteReview(String num) {
		System.out.println("reviewRepository.deleteReview() 도착");
		System.out.println("리뷰 번호: " + num);
		String SQL = "DELETE FROM review WHERE num = ?";
		template.update(SQL, num);
	}
	
	
	
	
	
	
	
}
