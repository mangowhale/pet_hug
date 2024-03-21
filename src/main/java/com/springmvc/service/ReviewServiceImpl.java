package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Review;
import com.springmvc.repository.ReviewRepository;

@Service
public class ReviewServiceImpl implements ReviewService
{
	@Autowired
	private ReviewRepository reviewRepository;

	public List<Review> getAllReviewList(String contentSeq) 
	{
		return reviewRepository.getAllReviewList(contentSeq);
	}

	@Override //숙소추가용
	public void setNewReview(Review review, String contentSeq, String sessionId) 
	{
		System.out.println("reviewService.setNewReview 도착");
		reviewRepository.setNewReview(review, contentSeq, sessionId);
	}

	@Override
	public int updateReview(Review review) {
		System.out.println("reviewService.updateReview() 도착");
		int verify = reviewRepository.updateReview(review);
		return verify;
	}

	@Override
	public int getCountReviewByIdAndContentSeq(String sessionId, String contentSeq) {
		int verify = reviewRepository.getCountReviewByIdAndContentSeq(sessionId, contentSeq);
		return verify;
	}
	
	public Review getReviewByIdAndContentSeq(String sessionId, String contentSeq) {
		Review review = reviewRepository.getReviewByIdAndSeq(sessionId, contentSeq);
		return review;
	}

	@Override
	public void deleteReview(String num) {
		System.out.println("reviewService.deleteReview() 도착");
		reviewRepository.deleteReview(num);
	}
	
}
