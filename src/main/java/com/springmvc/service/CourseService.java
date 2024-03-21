package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.Course;
import com.springmvc.domain.CourseInfo;
import com.springmvc.domain.LatLng;
import com.springmvc.domain.Schedule;

public interface CourseService {
	public void createNewCourse(String sessionId, Course course);
	public void deleteCourse(String sessionId, String courseNumber);
	
	public int getCourseCountById(String sessionId);
	public Course getCourseByCourseNum(String num, String sessionId);
	
	public List<Course> getCourseList(String sessionId);
	public List<LatLng> getOneCategoryAddrList(String category, String areaName);
	public List<CourseInfo> getInterCourseInfo(String[] contentSeqArray);
	public CourseInfo getOneCourseInfo(String[] contentSeqArray);
	
	public List<Schedule> getScheduleListByContentSeqList(String[] contentSeqArray);
}
