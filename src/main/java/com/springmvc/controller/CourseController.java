package com.springmvc.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springmvc.domain.Course;
import com.springmvc.domain.CourseInfo;
import com.springmvc.domain.LatLng;
import com.springmvc.domain.Schedule;
import com.springmvc.service.CourseService;

@Controller
@RequestMapping("/courses")
public class CourseController {

	@Autowired
	private CourseService courseService;
	@Autowired
	private HttpSession session;
	
	private List<Course> courseList = new ArrayList<Course>();

	List<LatLng> hotelAddrArray = new ArrayList<LatLng>();
	List<LatLng> spotAddrArray = new ArrayList<LatLng>();
	List<LatLng> cafeAddrArray = new ArrayList<LatLng>();
	List<LatLng> expAddrArray = new ArrayList<LatLng>();
	
	@GetMapping("/getMap")
	public String accessMapPage(Model model) {
		System.out.println("CourseController.accessMapPage() 도착");
		String sessionId = (String)session.getAttribute("sessionId");
		int courseCount = courseService.getCourseCountById(sessionId);
		model.addAttribute("courseCount", courseCount);
		return "/course/map";
	}

	
	@PostMapping("/getAddrArray")
	@ResponseBody
	public List<List<LatLng>> getAddrArray(@RequestBody Map<String, String> requestBody) {
		System.out.println("CourseController.getAddrArray() 도착");
		String areaName = requestBody.get("areaName");
		String category = requestBody.get("category");
		System.out.println("areaName: " + areaName);
		System.out.println("category: " + category);
		
		if(category.equals("숙박")) {
			hotelAddrArray = courseService.getOneCategoryAddrList(category, areaName);
		}else if(category.equals("관광지")) {
			spotAddrArray = courseService.getOneCategoryAddrList(category, areaName);
		}else if(category.equals("식음료")) {
			cafeAddrArray = courseService.getOneCategoryAddrList(category, areaName);
		}else if(category.equals("체험")) {
			expAddrArray = courseService.getOneCategoryAddrList(category, areaName);
		}else if(category.equals("전체")) {
			hotelAddrArray = courseService.getOneCategoryAddrList("숙박", areaName);
			spotAddrArray = courseService.getOneCategoryAddrList("관광지", areaName);
			cafeAddrArray = courseService.getOneCategoryAddrList("식음료", areaName);
			expAddrArray = courseService.getOneCategoryAddrList("체험", areaName);
		}
	
		List<List<LatLng>> bigAddrArray = new ArrayList<List<LatLng>>();
		bigAddrArray.add(hotelAddrArray);
		bigAddrArray.add(spotAddrArray);
		bigAddrArray.add(cafeAddrArray);
		bigAddrArray.add(expAddrArray);
		
		return bigAddrArray;
	}
	
	@PostMapping("/map/courseInfo")
	@ResponseBody
	public CourseInfo getCourseInfoForMap(@RequestBody Map<String, String[]> requestBody){
		System.out.println("CourseController.getLatLngList() 도착");
		String[] contentSeqArray = requestBody.get("contentSeqArray");
		System.out.println("contentSeqArray[0]: " + contentSeqArray[0]);
		CourseInfo courseInfo = courseService.getOneCourseInfo(contentSeqArray);
		return courseInfo;
	}
	
	@GetMapping("/myCourses")
	public String getCourseList(Model model){
		System.out.println("CourseController.getCourseList() 도착");
		
		String sessionId = (String)session.getAttribute("sessionId");
		
		courseList = courseService.getCourseList(sessionId);
		int courseCount = courseService.getCourseCountById(sessionId);
		
		model.addAttribute("courseList", courseList);
		model.addAttribute("courseCount", courseCount);
		return "/course/myCourses";
	}
	
	@GetMapping("/myCourse")
	public String getCourseByCourseNum(@RequestParam("courseNum") String courseNum, Model model) {
		System.out.println("CourseController.getCourseByCourseNum() 도착");
		System.out.println("courseNum: " + courseNum);
		//코스 가져옴
		String sessionId = (String)session.getAttribute("sessionId");
		Course course = courseService.getCourseByCourseNum(courseNum, sessionId);
		model.addAttribute(course);
		List<Schedule> scheduleList1 = courseService.getScheduleListByContentSeqList(course.getCourse1Array());
		List<Schedule> scheduleList2 = courseService.getScheduleListByContentSeqList(course.getCourse2Array());
		List<Schedule> scheduleList3 = courseService.getScheduleListByContentSeqList(course.getCourse3Array());
		model.addAttribute("scheduleList1", scheduleList1);
		model.addAttribute("scheduleList2", scheduleList2);
		model.addAttribute("scheduleList3", scheduleList3);

		List<CourseInfo> interCourseInfoList1 = courseService.getInterCourseInfo(course.getCourse1Array());
		List<CourseInfo> interCourseInfoList2 = courseService.getInterCourseInfo(course.getCourse2Array());
		List<CourseInfo> interCourseInfoList3 = courseService.getInterCourseInfo(course.getCourse3Array());
		model.addAttribute("interCourseInfoList1", interCourseInfoList1);
		model.addAttribute("interCourseInfoList2", interCourseInfoList2);
		model.addAttribute("interCourseInfoList3", interCourseInfoList3);
		
		return "/course/myCourse";
	}

	@PostMapping("/submitCourse")
	@ResponseBody
	public void submitCourse(@RequestBody Map<String, String[]> requestBody) {
		System.out.println("CourseController.submitCourse() 도착");
		String courseName = requestBody.get("courseName")[0];
		String[] contentSeqArray1 = requestBody.get("contentSeqArray1");
		String[] contentSeqArray2 = requestBody.get("contentSeqArray2");
		String[] contentSeqArray3 = requestBody.get("contentSeqArray3");

		Course course = new Course();
		course.setCourseName(courseName);
		course.setCourse1(convertArrayIntoString(contentSeqArray1));
		course.setCourse2(convertArrayIntoString(contentSeqArray2));
		course.setCourse3(convertArrayIntoString(contentSeqArray3));
		String sessionId = (String)session.getAttribute("sessionId");
		courseService.createNewCourse(sessionId, course);
	}
	
	public String convertArrayIntoString(String[] stringArray) {
		String convertedString = "{";
		for(int i = 0; i<stringArray.length; i++) {
			if(i == 0)
			convertedString = convertedString + stringArray[i];
			else
			convertedString = convertedString + ", " + stringArray[i];
		}
		convertedString = convertedString + "}";
		System.out.println("convertedString: " + convertedString);
		return convertedString;
	}
	
	@GetMapping("/deleteCourse")
	public String deleteCourse(@RequestParam("num")String courseNumber) {
		System.out.println("CourseController.deleteCourse() 도착");
		System.out.println("courseNumber: " + courseNumber);
		String sessionId = (String)session.getAttribute("sessionId");
		courseService.deleteCourse(sessionId, courseNumber);
		
		return "redirect:/courses/myCourses";
	}
}
