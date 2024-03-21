package com.springmvc.repository;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.Course;
import com.springmvc.domain.CourseInfo;
import com.springmvc.domain.LatLng;
import com.springmvc.domain.Schedule;

@Repository
public class CourseRepositoryImpl implements CourseRepository{

   private JdbcTemplate template;

   List<Course> courseList = new ArrayList<Course>();
   
   @Autowired
   public void setJdbctemplate(DataSource dataSource)
   {
      this.template = new JdbcTemplate(dataSource);
   }
   
   @Override
   public void createNewCourse(String sessionId, Course course) {
      System.out.println("courseRepository.createNewCourse() 도착");
      System.out.println("sessionId: " + sessionId);
      String SQL = "INSERT INTO course (courseNum, courseName, mem_id, course1, course2, course3) values(null, ?, ?, ?, ?, ?)";
      template.update(SQL, course.getCourseName(), sessionId, course.getCourse1(), course.getCourse2(), course.getCourse3());
   }

   
   
   @Override
   public void deleteCourse(String sessionId, String courseNumber) {
      System.out.println("CourseRepository.deleteCourse() 도착");
      String SQL = "DELETE FROM course WHERE mem_id = ? AND courseNum = ?";
      template.update(SQL, sessionId, courseNumber);
   }

   //DB의 코스 테이블에 세션id와 동일한 mem_id가 있는지 확인
   @Override
   public int getCourseCountById(String sessionId) {
      System.out.println("courseRepository.getCourseCountById 도착");
      String SQL = "SELECT COUNT(*) FROM course WHERE mem_id = ?";
      int count = template.queryForObject(SQL, Integer.class, sessionId);
      return count;
   }
   
   @Override
   public List<Course> getCourseList(String sessionId){
      System.out.println("courseRepository.getCourseList() 도착");
      String SQL = "SELECT * FROM course WHERE mem_id = ?";
      courseList = template.query(SQL, new CourseRowMapper(), sessionId);
      return courseList;
   }

   
   @Override
   public Course getCourseByCourseNum(String num, String sessionId) {
      System.out.println("courseRepository.getCourseByCourseNum() 도착");
      String SQL = "SELECT courseNum, courseName, mem_id, course1, course2, course3, createDate FROM course WHERE courseNum = ? and mem_id = ?";
      Course course = template.queryForObject(SQL, new CourseRowMapper(), num, sessionId);
      
      String course1 = course.getCourse1();
      String course2 = course.getCourse2();
      String course3 = course.getCourse3();
      course.setCourse1Array(convertStringToArray(course1));
      course.setCourse2Array(convertStringToArray(course2));
      course.setCourse3Array(convertStringToArray(course3));
      String[] course1Array = course.getCourse1Array();
      
      return course;
   }


   @Override
   public List<LatLng> getAddrObjectByCategoryAndAreaName(String category, String areaName) {
      System.out.println("courseRepository.getAddrObjectByCategoryAndAreaName() 도착");
      String SQL = "SELECT latitude, longitude, title, contentSeq, p1, partName FROM content WHERE partName = '" + category +"' AND areaName = ?";
      List<LatLng> addrObject = template.query(SQL, new LatLngRowMapper(), areaName);
      return addrObject;
   }

   @Override
   public LatLng getAddrObjectByContentSeq(String contentSeq) {
      System.out.println("courseRepository.getAddrObjectByContentSeq() 도착");
      String SQL = "SELECT latitude, longitude, title, contentSeq,  p1, partName FROM content WHERE contentSeq = ?";
       LatLng latLng = template.queryForObject(SQL, new LatLngRowMapper(), contentSeq);
       return latLng;
   }


   @Override
   public List<LatLng> getLatLngListByContentSeqArray(String[] contentSeqArray) {
      System.out.println("courseRepository.getLatLngListByContentSeqArray() 도착");
      List<LatLng> latLngList = new ArrayList<LatLng>();
      LatLng latLng = new LatLng();
      for(int i = 0; i<contentSeqArray.length; i++) {
         latLng = getAddrObjectByContentSeq(contentSeqArray[i]);
         latLngList.add(latLng);
      }
      return latLngList;
   }

   @Override
   public List<String> convertAddrObjectToAddrArray(List<LatLng> addrObjectList) {
      System.out.println("courseRepository.convertAddrObjectToAddrArray() 도착");
      List<String> addrArray = new ArrayList<String>();
      String lat = null;
      String lng = null;
      LatLng latLng = new LatLng();
      String addrArrayElement = null;
      for(int i = 0; i<addrObjectList.size(); i++) {
         latLng = addrObjectList.get(i);
         lat = latLng.getLat();
         lng = latLng.getLng();
         addrArrayElement = "new kakao.maps.LatLng(" + lat + "," + lng + ")";
         addrArray.add(addrArrayElement);
      }
      return addrArray;
   }

   @Override
   public String[] convertStringToArray(String string) {
      System.out.println("convertArrayStringToArray() 실행");
      String[] convertedArray = string.substring(1, string.length() - 1).split(", ");
      return convertedArray;
   }

   @Override
   public URL getCourseInfoUrl(String startLongitude, String startLatitude, String goalLongitude,
         String goalLatitude){
      System.out.println("getCourseInfoUrl() 도착");
      String requestUrl = "https://naveropenapi.apigw.ntruss.com/map-direction/v1/driving?start=" + startLongitude + "," + startLatitude + "&goal=" + goalLongitude + "," + goalLatitude + "&option=traoptimal";
      URL url = null;
      try {
         url = new URL(requestUrl);
      } catch (MalformedURLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      return url;
   }
   
   @Override
   public StringBuffer getStringResponse(URL url){
      System.out.println("getUrlResponse() 도착");
      
       if (url == null) {
           // url이 null이면 null을 반환하거나 예외 처리를 수행
           return null; // 예시로 null 반환
       }
      
      HttpURLConnection con;
      BufferedReader br;
      StringBuffer urlResponse = null;
      try {
         con = (HttpURLConnection)url.openConnection();
         con.setRequestMethod("GET");
         con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", "il9z03otq7");
         con.setRequestProperty("X-NCP-APIGW-API-KEY", "IA73ERSaDgWoxIBhsBmhpR69pALe43CRSWlj5xxB");
         int responseCode = con.getResponseCode();
         
         if(responseCode == 200) {
            br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
         }else {
            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
         }
         String line;
         urlResponse = new StringBuffer();
         while((line = br.readLine()) != null) {
            urlResponse.append(line);
         }
         br.close();
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      return urlResponse;
   }

   @Override
   public CourseInfo getInfoFromDrivingJSON(StringBuffer urlResponse, CourseInfo courseInfo) {
      System.out.println("getInfoFromDrivingJSON() 도착");
      if(urlResponse == null)
         return null;
      
      JSONObject responseObject = new JSONObject(urlResponse.toString());
      JSONObject route = responseObject.getJSONObject("route");
      JSONArray traoptimal = route.getJSONArray("traoptimal");
      JSONObject traoptimalObject = traoptimal.getJSONObject(0);
      JSONObject summary = traoptimalObject.getJSONObject("summary");
      
      String duration = summary.get("duration").toString();
      String tollFare = summary.get("tollFare").toString();
      String distance = summary.get("distance").toString();
      String fuelPrice = summary.get("fuelPrice").toString();
      
      int duration_int = Integer.parseInt(duration);   
      courseInfo.setDuration(duration_int/(60*1000));
      courseInfo.setDistance(Integer.parseInt(distance));
      courseInfo.setTollFare(Integer.parseInt(tollFare));
      courseInfo.convertDuration(courseInfo.getDuration());
      courseInfo.convertDistance(courseInfo.getDistance());
      courseInfo.setConvertedTollFare(courseInfo.convertPrice(courseInfo.getTollFare()));
      courseInfo.setFuelPrice(Integer.parseInt(fuelPrice));
      courseInfo.setConvertedFuelPrice(courseInfo.convertPrice(courseInfo.getFuelPrice()));
      return courseInfo;
   }

   @Override
   public List<Schedule> getScheduleListByContentSeqList(String[] contentSeqArray) {
      System.out.println("courseRepository.getScheduleListByContentSeqList() 도착");
      List<Schedule> scheduleList = new ArrayList<Schedule>();
      Schedule schedule = new Schedule();
      if(contentSeqArray != null) {
         String SQL = "SELECT contentSeq, partName, title, keyword, p1, content FROM content WHERE contentSeq = ?";
           for (String contentSeq : contentSeqArray) {
               List<Schedule> schedules = template.query(SQL, new ScheduleRowMapper(), contentSeq);
               scheduleList.addAll(schedules);
           }
      }
      return scheduleList;
   }

}