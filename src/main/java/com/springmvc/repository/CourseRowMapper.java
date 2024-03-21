package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Course;

public class CourseRowMapper implements RowMapper<Course>{

	@Override
	public Course mapRow(ResultSet rs, int rowNum) throws SQLException {
		Course course = new Course();
		course.setCourseNum(rs.getString(1));
		course.setCourseName(rs.getString(2));
		course.setMem_id(rs.getString(3));
		course.setCourse1(rs.getString(4));
		course.setCourse2(rs.getString(5));
		course.setCourse3(rs.getString(6));
		course.setCreateDate(rs.getString(7));
		return course;
	}
	
}
