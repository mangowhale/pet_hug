package com.springmvc.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.springmvc.domain.Review;

@Service
public interface ReviewService 
{
	List<Review> getAllReviewList(String contentSeq);
	
	void setNewReview(Review review, String contentSeq, String sessionId); //리뷰추가용
	
	public int updateReview(Review review);
	
	int getCountReviewByIdAndContentSeq(String sessionId, String contentSeq);
	
	public Review getReviewByIdAndContentSeq(String sessionId, String contentSeq);
	
	void deleteReview(String num);
}