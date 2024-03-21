package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Review;

public class ReviewRowMapper implements RowMapper<Review>
{
	public Review mapRow(ResultSet rs, int rowNum) throws SQLException
	{
		Review review = new Review();
		review.setNum(rs.getString(1));
		review.setContentSeq(rs.getString(2));
		review.setStar(rs.getString(3));
		review.setText(rs.getString(4));
		review.setMem_id(rs.getString(5));
		review.setMem_nickname(rs.getString(6));
		review.setRev_date(rs.getString(7));
		return review;
	}
}
