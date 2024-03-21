package com.springmvc.service;

import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Course;
import com.springmvc.domain.CourseInfo;
import com.springmvc.domain.LatLng;
import com.springmvc.domain.Schedule;
import com.springmvc.repository.CourseRepository;

@Service
public class CourseServiceImpl implements CourseService{

	private List<Course> courseList;
	
	@Autowired
	private CourseRepository courseRepository;
	
	
	@Override
	public void createNewCourse(String sessionId, Course course) {
		System.out.println("courseService.createNewCourse() 도착");
		courseRepository.createNewCourse(sessionId, course);
	}


	@Override
	public void deleteCourse(String sessionId, String courseNumber) {
		System.out.println("courseService.deleteCourse() 도착");
		courseRepository.deleteCourse(sessionId, courseNumber);
	}



	public int getCourseCountById(String sessionId) {
		System.out.println("courseService.getCourseCountById() 도착");
		int count = courseRepository.getCourseCountById(sessionId);
		return count;
	}

	@Override
	public List<Course> getCourseList(String sessionId) {
		System.out.println("courseService.getCourseList() 도착");
		courseList = courseRepository.getCourseList(sessionId);
		return courseList;
	}

	@Override
	public Course getCourseByCourseNum(String num, String sessionId) {
		System.out.println("getCourseByCourseNum() 도착");
		Course course = courseRepository.getCourseByCourseNum(num, sessionId);
		return course;
	}

	@Override
	public List<LatLng> getOneCategoryAddrList(String category, String areaName) {
		System.out.println("courseService.getOneCategoryAddrList() 도착");
		List<LatLng> addrObject = courseRepository.getAddrObjectByCategoryAndAreaName(category, areaName);
		//List<String> addrArray = courseRepository.convertAddrObjectToAddrArray(addrObject);
		//return addrArray;
		return addrObject;
	}
	
	@Override
	public List<CourseInfo> getInterCourseInfo(String[] contentSeqArray) {
		System.out.println("courseService.getInterCourseInfo() 도착");
		List<CourseInfo> courseInfoList = new ArrayList<CourseInfo>();
		//contentSeq 배열로 좌표 배열 구함
		List<LatLng> latLngList = courseRepository.getLatLngListByContentSeqArray(contentSeqArray);
		CourseInfo courseInfo = new CourseInfo();
		String startLongitude;
		String startLatitude;
		String goalLongitude;
		String goalLatitude;
		
		//latLng 안의 위도 경도로 api 연결
		for(int i = 1; i<latLngList.size(); i++) {
			startLongitude = latLngList.get(i - 1).getLng();
			startLatitude = latLngList.get(i - 1).getLat();
			goalLongitude = latLngList.get(i).getLng();
			goalLatitude = latLngList.get(i).getLat();
			courseInfo = getCourseInfoFromAPIByLatLng(startLongitude, startLatitude, goalLongitude, goalLatitude);
			courseInfoList.add(courseInfo);	
		}
		return courseInfoList;
	}
	

	@Override
	public CourseInfo getOneCourseInfo(String[] contentSeqArray) {
		System.out.println("courseService.getOneCourseInfo() 도착");
		List<LatLng> latLngList = courseRepository.getLatLngListByContentSeqArray(contentSeqArray);
		
		String startLongitude = latLngList.get(0).getLng();
		String startLatitude = latLngList.get(0).getLat();
		String goalLongitude = latLngList.get(1).getLng();
		String goalLatitude = latLngList.get(1).getLat();
		CourseInfo courseInfo = getCourseInfoFromAPIByLatLng(startLongitude, startLatitude, goalLongitude, goalLatitude);
		
		return courseInfo;
	}


	public CourseInfo getCourseInfoFromAPIByLatLng(String startLongitude, String startLatitude, String goalLongitude, String goalLatitude) {
		System.out.println("courseService.getCourseInfoFromAPIByLatLng() 도착");
		URL url = courseRepository.getCourseInfoUrl(startLongitude, startLatitude, goalLongitude, goalLatitude);
		CourseInfo courseInfo = new CourseInfo();
		if(url == null) {
			return null;
		}else {
			StringBuffer urlResponse = courseRepository.getStringResponse(url);
			if(urlResponse != null) {
				courseInfo = courseRepository.getInfoFromDrivingJSON(urlResponse, courseInfo);
			}
		}
		return courseInfo;
	}

	@Override
	public List<Schedule> getScheduleListByContentSeqList(String[] contentSeqArray) {
		List<Schedule> scheduleList = courseRepository.getScheduleListByContentSeqList(contentSeqArray);
		return scheduleList;
	}
}
