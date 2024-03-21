<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/f70c884d31.js"></script>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/originalCss.css?=ver2" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/course.css?=ver3" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>

</head>
<body onload = "clickEvent('day1')">
	<script>
	let course1 = "${course.course1Array}";
	let course2 = "${course.course2Array}";
	let course3 = "${course.course3Array}";
	let courseNum = "${course.courseNum}";
	console.log("course1: " + course1);
	function clickEvent(day){
		changeColor(day);
		displaySchedule(day);
	}
	function changeColor(day){
		var element = document.getElementById(day);
		if (element) {
	        document.querySelectorAll("#days a").forEach(link => {
	            link.style.backgroundColor = "white";
	            link.style.color = "black";
	            element.style.borderColor = "black";
	        });
	        element.style.backgroundColor = "#076e43";
	        element.style.color = "#f3c300";
	        element.style.borderColor = "#f3c300";
	    }
	}
	function displaySchedule(day){
	    var courses = document.querySelectorAll('[id^="course"]');
	    courses.forEach(course => {
	        course.style.display = "none";
	    });

	    var courseElement = document.getElementById(day.replace("day", "course"));
	    if(courseElement){
	        courseElement.style.display = "block";
	    }
	}

	function moveToDetail(partName, contentSeq){
		let cate;
		if(partName === '숙박'){
			cate = 'hotel';
		}else if(partName === '관광지'){
			cate = 'spot'
		}else if(partName === '식음료'){
			cate = 'cafe'
		}else if(partName === '체험'){
			cate = 'exp'
		}
		window.location.href = "/pet_hug/" + cate + "s/" + cate +"?num=" + contentSeq;
	}
	</script>
	<jsp:include page="/WEB-INF/views/module/nav.jsp" flush="false"/>
	
	<section>
      <div class="jumbotron background-lightgreen pt-5 pb-5">
         <div class="container">
            <h2 class="display-3 font text-center">나의 여행코스</h2>
         </div>
      </div>
	</section>
   
	<section class="container" style="padding: 100px 0; min-height: 750px;">
   		<div>
	   		<h3>${course.courseName}</h3>
	   		<div id="days" class="d-flex my-4">
	   			<a id="day1" onclick="clickEvent('day1')">1일차</a>
	   			<a id="day2" onclick="clickEvent('day2')">2일차</a>
	   			<a id="day3" onclick="clickEvent('day3')">3일차</a>
	  		</div>
  		</div>
  		<hr>
		<c:if test="${fn:length(scheduleList1) > 0}">
		    <div id="course1">
		        <c:forEach var="index" begin="0" end="${fn:length(scheduleList1) - 1}" varStatus="loop">
		            <div class="schedule" onclick="moveToDetail('${scheduleList1[index].partName}', '${scheduleList1[index].contentSeq}')">
		                <div class="imgContentContainer d-flex">
		                    <div class="imgBox">
		                        <img src="${scheduleList1[index].p1}" class="me-4 my-4 img-fluid">
		                    </div>
		                    <div class="my-4 textBox">
		                        <h4>${scheduleList1[index].title}</h4>
		                        <p>
		                            <c:choose>
		                                <c:when test="${fn:length(scheduleList1[index].content) gt 180}">
		                                    ${fn:substring(scheduleList1[index].content, 0, 180)}...
		                                </c:when>
		                                <c:otherwise>
		                                    ${scheduleList1[index].content}
		                                </c:otherwise>
		                            </c:choose>
		                        </p>
		                        <div class="d-flex justify-content-between" style="width: 100%;">
		                            <p>키워드: ${scheduleList1[index].keyword}</p>
		                            <div class="toDetail vertical-center">상세보기</div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <c:if test="${index ne fn:length(scheduleList1) - 1}">
		                <br>
		                <div style="text-align: center;">
		                    이동 거리: ${interCourseInfoList1[index].convertedDistance} | 예상 이동 시간: ${interCourseInfoList1[index].convertedDuration} | 예상 유류비: ${interCourseInfoList1[index].convertedFuelPrice}
		                </div>
		                <br>
		            </c:if>
		        </c:forEach>
		    </div>
		</c:if>
		<c:if test="${fn:length(scheduleList2) > 0}">
		    <div id="course2">
		        <c:forEach var="index" begin="0" end="${fn:length(scheduleList2) - 1}" varStatus="loop">
		            <div class="schedule" onclick="moveToDetail('${scheduleList2[index].partName}', '${scheduleList2[index].contentSeq}')">
		                <div class="imgContentContainer d-flex">
		                    <div class="imgBox">
		                        <img src="${scheduleList2[index].p1}" class="me-4 my-4 img-fluid">
		                    </div>
		                    <div class="my-4 textBox">
		                        <h4>${scheduleList2[index].title}</h4>
		                        <p>
		                            <c:choose>
		                                <c:when test="${fn:length(scheduleList2[index].content) gt 180}">
		                                    ${fn:substring(scheduleList2[index].content, 0, 180)}...
		                                </c:when>
		                                <c:otherwise>
		                                    ${scheduleList2[index].content}
		                                </c:otherwise>
		                            </c:choose>
		                        </p>
		                        <div class="d-flex justify-content-between" style="width: 100%;">
		                            <p>키워드: ${scheduleList2[index].keyword}</p>
		                            <div class="toDetail vertical-center">상세보기</div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <c:if test="${index ne fn:length(scheduleList2) - 1}">
		                <br>
		                <div style="text-align: center;">
		                    이동 거리: ${interCourseInfoList2[index].convertedDistance} | 예상 이동 시간: ${interCourseInfoList2[index].convertedDuration} | 예상 유류비: ${interCourseInfoList2[index].convertedFuelPrice}
		                </div>
		                <br>
		            </c:if>
		        </c:forEach>
		    </div>
		</c:if>
		<c:if test="${fn:length(scheduleList3) > 0}">
		    <div id="course3">
		        <c:forEach var="index" begin="0" end="${fn:length(scheduleList3) - 1}" varStatus="loop">
		            <div class="schedule" onclick="moveToDetail('${scheduleList3[index].partName}', '${scheduleList3[index].contentSeq}')">
		                <div class="imgContentContainer d-flex">
		                    <div class="imgBox">
		                        <img src="${scheduleList3[index].p1}" class="me-4 my-4 img-fluid">
		                    </div>
		                    <div class="my-4 textBox">
		                        <h4>${scheduleList3[index].title}</h4>
		                        <p>
		                            <c:choose>
		                                <c:when test="${fn:length(scheduleList3[index].content) gt 180}">
		                                    ${fn:substring(scheduleList3[index].content, 0, 180)}...
		                                </c:when>
		                                <c:otherwise>
		                                    ${scheduleList3[index].content}
		                                </c:otherwise>
		                            </c:choose>
		                        </p>
		                        <div class="d-flex justify-content-between" style="width: 100%;">
		                            <p>키워드: ${scheduleList3[index].keyword}</p>
		                            <div class="toDetail vertical-center">상세보기</div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <c:if test="${index ne fn:length(scheduleList3) - 1}">
		                <br>
		                <div style="text-align: center;">
		                    이동 거리: ${interCourseInfoList3[index].convertedDistance} | 예상 이동 시간: ${interCourseInfoList3[index].convertedDuration} | 예상 유류비: ${interCourseInfoList3[index].convertedFuelPrice}
		                </div>
		                <br>
		            </c:if>
		        </c:forEach>
		    </div>
		</c:if>
		<a href="deleteCourse?num=${course.courseNum}" onclick="confirmDelete(${course.courseNum});" id="deleteCourse">코스 삭제</a>
		<script>
		    function confirmDelete(courseNum) {
		        if (confirm("정말로 이 코스를 삭제하시겠습니까?")) {
		            // 확인 버튼을 클릭한 경우
		            window.location.href = "deleteCourse?num=" + courseNum;
		        } else {
		        	event.preventDefault();
		        	return false;
		        }
		    }
		</script>
	</section>
	
	
	
	<jsp:include page="/WEB-INF/views/module/footer.jsp" flush="false"/>
</body>
</html>