<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/f70c884d31.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/originalCss.css" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<title>수정하기</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/module/nav.jsp" flush="false"/>
	
<div class="container">
	<div class="row">
		<div class="col-md-4">
			<img src="${spot.p1}" style="width: 100%">
		</div>
		<div class="col-md-7">
			<form:form modelAttribute="updateSpot" action="./update?${_csrf.parameterName}=${_csrf.token}" class="form-horizontal">
				<fieldset>
					<div class="form-group row">
						<label class="col-sm-2 control-label">관광지 번호</label>
						<div class="col-sm-6" style="padding-top: 10px">
							<form:input id="contentSeq" path="contentSeq" type="hidden" class="form-control" value="${spot.contentSeq}"/>
							<span class="btn btn-success">${spot.contentSeq}</span>
						</div>
					</div>
					<br>
					 <div class="form-group row">
			            <label class="col-sm-2 control-label" >지역명</label>
			            <div class="col-sm-3">
			                <form:input  path="areaName"  class="form-control" value="${spot.areaName}"/>  
			            </div>
			        </div>
		        	<br>
			        <div class="form-group row">
			           <label class="col-sm-2 control-label" >업체명</label>
			           <div class="col-sm-3">
			               <form:input  path="title" class="form-control" value="${spot.title}"/>  
			           </div>
			        </div>
			        <br>
			        <div class="form-group row">
			           <label class="col-sm-2 control-label" >주소</label>
			           <div class="col-sm-3">
			               <form:input  path="address" class="form-control" value="${spot.address}"/>  
			           </div>
			        </div>
			        <br>
			        <div class="form-group row">
			            <label class="col-sm-2 control-label" >연락처</label>
			            <div class="col-sm-3">    
			                <form:input  path="tel" class="form-control" value="${spot.tel}"/>  
			            </div>
			        </div>
			        <br>
			        <div class="form-group row">
			            <label class="col-sm-2 control-label" >이용시간</label>
			            <div class="col-sm-3">     
			                <form:input path="usedTime" class="form-control" value="${spot.usedTime}"/>  
			            </div>
			        </div>
			        <br>
			        <div class="form-group row">
			            <label class="col-sm-2 control-label" >홈페이지</label>
			            <div class="col-sm-3">     
			                <form:input path="homePage" class="form-control" value="${spot.homePage}"/>  
			            </div>
			        </div>
			        <br>
			        <div class="form-group row">
			           <label class="col-sm-2 control-label" >검색키워드</label>
			           <div class="col-sm-3">
			               <form:input  path="keyword" class="form-control" value="${spot.keyword}"/>  
			           </div>
			        </div>
			        <br>
			      	<div class="form-group row">
			            <label class="col-sm-2 control-label" >소개</label>
			            <div class="col-sm-5">    
			                <textarea path="content" cols="50" rows="2" class="form-control">${spot.content}</textarea>

  
			            </div>
			        </div>
			        <br>
			        <div class="form-group row">
			            <label class="col-sm-2 control-label" >주요시설</label>
			            <div class="col-sm-5">    
			                <textarea  path="mainFacility" cols="50" rows="2" class="form-control">${spot.mainFacility}</textarea>
			            </div>
			        </div>
			        <br>
			        <div class="form-group row">
			            <label class="col-sm-2 control-label" >이용요금</label>
			            <div class="col-sm-5">    
			                <textarea  path="usedCost" cols="50" rows="2" class="form-control">${spot.usedCost}</textarea>
			            </div>
			        </div>
			        <br>
			        <div class="form-group row">
			            <label class="col-sm-2 control-label" >애견정책 및 주의사항</label>
			            <div class="col-sm-5">    
			                <textarea  path="policyCautions" cols="50" rows="2" class="form-control">${spot.policyCautions}</textarea>  
			            </div>
			        </div>
			        <br>
			         <div class="form-group row">
			            <label class="col-sm-2 control-label" >이미지주소1</label>
			            <div class="col-sm-5">     
			                <form:input path="p1" class="form-control" value="${spot.p1}"/>  
			            </div>
			        </div>
			        <div class="form-group row">
			            <label class="col-sm-2 control-label" >이미지주소2</label>
			            <div class="col-sm-5">     
			                <form:input path="p2" class="form-control" value="${spot.p2}"/>  
			            </div>
			        </div>
			        <div class="form-group row">
			            <label class="col-sm-2 control-label" >이미지주소3</label>
			            <div class="col-sm-5">     
			                <form:input path="p3" class="form-control" value="${spot.p3}"/>  
			            </div>
			        </div>
			        <div class="form-group row">
			            <label class="col-sm-2 control-label" >이미지주소4</label>
			            <div class="col-sm-5">     
			                <form:input path="p4" class="form-control" value="${spot.p4}"/>  
			            </div>
			        </div>
			        <div class="form-group row">
			            <label class="col-sm-2 control-label" >이미지주소5</label>
			            <div class="col-sm-5">     
			                <form:input path="p5" class="form-control" value="${spot.p5}"/>  
			            </div>
			        </div>
			        <div class="form-group row">
			            <label class="col-sm-2 control-label" >이미지주소6</label>
			            <div class="col-sm-5">     
			                <form:input path="p6" class="form-control" value="${spot.p6}"/>  
			            </div>
			        </div>
			        <div class="form-group row">
			            <label class="col-sm-2 control-label" >이미지주소7</label>
			            <div class="col-sm-5">     
			                <form:input path="p7" class="form-control" value="${spot.p7}"/>  
			            </div>
			        </div>
			        <div class="form-group row">
			            <label class="col-sm-2 control-label" >이미지주소8</label>
			            <div class="col-sm-5">     
			                <form:input path="p8" class="form-control" value="${spot.p8}"/>  
			            </div>
			        </div>
			        <div class="form-group row">
			            <label class="col-sm-2 control-label" >이미지주소9</label>
			            <div class="col-sm-5">     
			                <form:input path="p9" class="form-control" value="${spot.p9}"/>  
			            </div>
			        </div>
			        <div class="form-group row">
			            <label class="col-sm-2 control-label" >이미지주소10</label>
			            <div class="col-sm-5">     
			                <form:input path="p10" class="form-control" value="${spot.p10}"/>  
			            </div>
			        </div>       
	
	
	
	
	
	
	
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" class="btn btn-success" value="수정"/>
							<a href="<c:url value="/spots"/>" class="btn btn-warning">취소</a>
						</div>
					</div>


		
				</fieldset>
			</form:form>
		</div>
	</div>
</div>
	
	
	
	
	<br>
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<jsp:include page="/WEB-INF/views/module/footer.jsp" flush="false"/>
	</body>
</html>