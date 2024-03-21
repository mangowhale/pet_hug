package com.springmvc.repository;

import java.util.List;
import com.springmvc.domain.Review;

public interface ReviewRepository 
{
	List<Review> getAllReviewList(String contentSeq);
	
	void setNewReview(Review review, String contentSeq, String sessionId); //리뷰추가용
	

	int getCountReviewByIdAndContentSeq(String sessionId, String contentSeq);
	Review getReviewByIdAndSeq(String sessionId, String contentSeq);
	int updateReview(Review review);
	
	void deleteReview(String num);
	
}
