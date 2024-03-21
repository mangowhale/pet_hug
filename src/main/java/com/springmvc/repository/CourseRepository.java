package com.springmvc.repository;

import java.net.URL;
import java.util.List;

import com.springmvc.domain.Course;
import com.springmvc.domain.CourseInfo;
import com.springmvc.domain.LatLng;
import com.springmvc.domain.Schedule;

public interface CourseRepository {
	
	public void createNewCourse(String sessionId, Course course);
	public void deleteCourse(String sessionId, String courseNumber);
	
	public int getCourseCountById(String sessionId);
	
	public List<Course> getCourseList(String sessionId);
	
	public Course getCourseByCourseNum(String num, String sessionId);
	
	public List<LatLng> getAddrObjectByCategoryAndAreaName(String category, String areaName);
	public LatLng getAddrObjectByContentSeq(String contentSeq);
	public List<LatLng> getLatLngListByContentSeqArray(String[] contentSeqArray);
	public List<String> convertAddrObjectToAddrArray(List<LatLng> addrObjectList);
	public List<Schedule> getScheduleListByContentSeqList(String[] contentSeqArray);
	
	public String[] convertStringToArray(String string);
	
	public URL getCourseInfoUrl(String startLongitude, String startLatitude, String goalLongitude, String goalLatitude);
	public StringBuffer getStringResponse(URL url);
	public CourseInfo getInfoFromDrivingJSON(StringBuffer urlResponse, CourseInfo courseInfo);
}
