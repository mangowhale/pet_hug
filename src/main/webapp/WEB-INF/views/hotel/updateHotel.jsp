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
	
	<section>
		<div class="jumbotron background-lightgreen pt-5 pb-5">
			<div class="container">
				<h2 class="display-3 font text-center">수정하기</h2>
			</div>
		</div>
	</section>
	<br>
	
<div class="container">
	<div class="row">
		<div class="col-md-4">
			<img src="${hotel.p1}" style="width: 100%">
		</div>
		<div class="col-md-7">
			<form:form modelAttribute="updateHotel" action="./update?${_csrf.parameterName}=${_csrf.token}" class="form-horizontal" onsubmit="return validateForm();">
				<script>
				    function validateForm() {
				        var areaName = document.getElementById("areaName").value;
				        var partName = document.getElementById("partName").value;		        
				        var address = document.getElementById("address").value;
				        var title = document.getElementById("title").value;
				        var tel = document.getElementById("tel").value;		        
				        var p1 = document.getElementById("p1").value;
				
				        if (areaName.trim() === '' || partName.trim() === '' || address.trim() === '' || title.trim() === '' 
				        		|| tel.trim() === '' || p1.trim() === '') 
				        {
				            alert("지역명, 분야명, 주소, 업체명, 연락처, 이미지URL1을 모두 입력하세요."); 
				            return false;
				        }
				    }
				</script>
				<fieldset>
					<div class=" flex">
						<label class="col-sm-2 control-label" style="margin-right:4px">컨텐츠 번호</label>
						<div class="" style="padding-top: 10px">
							<form:input id="contentSeq" path="contentSeq" type="hidden" class="form-control" value="${hotel.contentSeq}"/>							
						</div>
						<span class="btn btn-success">${hotel.contentSeq}</span>
					</div>
					<br>
					 <div class="form-group row">
			            <label class="col-sm-2 control-label">지역명</label>
			            <div class="col-sm-4">                               
				            <select id="areaName" class="pl" name="areaName"> 
				            	<option value="${hotel.areaName}">${hotel.areaName}</option>
				            	<option value="">선택</option>
				                <option value="강릉시">강릉시</option>
				                <option value="고성군">고성군</option>
				                <option value="동해시">동해시</option>
				                <option value="삼척시">삼척시</option>
				                <option value="속초시">속초시</option>
				                <option value="양구군">양구군</option>
				                <option value="양양군">양양군</option>
				                <option value="영월군">영월군</option>
				                <option value="원주시">원주시</option>
				                <option value="인제군">인제군</option>
				                <option value="정선군">정선군</option>
				                <option value="철원군">철원군</option>
				                <option value="춘천시">춘천시</option>
				                <option value="태백시">태백시</option>
				                <option value="평창군">평창군</option>
				                <option value="홍천군">홍천군</option>
				                <option value="화천군">화천군</option>
				                <option value="횡성군">횡성군</option>               		                
				            </select>       		                            
			            </div>
			        </div>
			        <br>
		        	<div class="form-group row">
			            <label class="col-sm-2 control-label">분야명</label>
			            <div class="col-sm-2">               
					            <select id="partName" class="pl" name="partName"> 
					            	<option value="${hotel.partName}">${hotel.partName}</option>
					            	<option value="">선택</option>
					                <option value="숙박">숙박</option>
					                <option value="관광지">관광지</option>
					                <option value="식음료">식음료</option>
					                <option value="체험">체험</option>		             	               		                
					            </select>       		            			                
			            </div>
			        </div>
			        <br>			        
			        <div class="flex">
           <label class="col-sm-2 control-label" style="margin-right:4px">주소</label>           
           <div class="col-sm-4" style="width:329.59px">
          	 <form:input path="address" class="form-control" value="${hotel.address}"/>      				  
           </div>           
           <input class="myButton" type="button" onclick="address_search()" value="주소 검색">	           		
			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
			function address_search() 
			{
		        new daum.Postcode({
		            oncomplete: function(data) {
		                var addr = data.address; // 최종 주소 변수

		                // 주소 정보를 해당 필드에 넣는다.
		                document.getElementById("address").value = addr;
		             	// 커서를 업체명 필드로 이동한다.
		                document.getElementById("title").focus();
		            }
		        }).open();
		    }
			</script>			
        </div>
        <br>			        
			        <div class="form-group row">
			           <label class="col-sm-2 control-label" >업체명</label>
			           <div class="col-sm-6">
			               <form:input  path="title" class="form-control" value="${hotel.title}"/>  
			           </div>
			        </div>
			        <br>
			        <div class="form-group row">
			            <label class="col-sm-2 control-label" >연락처</label>
			            <div class="col-sm-6">    
			                <form:input  path="tel" class="form-control" value="${hotel.tel}"/>  
			            </div>
			        </div>
			        <br>
			        <div class="form-group row">
			            <label class="col-sm-2 control-label" >이용시간</label>
			            <div class="col-sm-6">     
			                <form:input path="usedTime" class="form-control" value="${hotel.usedTime}"/>  
			            </div>
			        </div>
			        <br>
			        <div class="form-group row">
			            <label class="col-sm-2 control-label" >홈페이지</label>
			            <div class="col-sm-6">     
			                <form:input path="homePage" class="form-control" value="${hotel.homePage}"/>  
			            </div>
			        </div>
			        <br>
			        <div class="form-group row">
			           <label class="col-sm-2 control-label" >검색키워드</label>
			           <div class="col-sm-6">
			               <form:input path="keyword" class="form-control" value="${hotel.keyword}"/>  
			           </div>
			        </div>
			        <br>
			      	<div class="form-group row">
			            <label class="col-sm-2 control-label" >소개</label>
			            <div class="col-sm-7">    
			                <textarea name="content" cols="50" rows="2" class="form-control">${hotel.content}</textarea>  
			            </div>
			        </div>
			        <br>
			        <div class="form-group row">
			            <label class="col-sm-2 control-label" >주요시설</label>
			            <div class="col-sm-7">    
			                <textarea name="mainFacility" cols="50" rows="2" class="form-control">${hotel.mainFacility}</textarea>
			            </div>
			        </div>
			        <br>
			        <div class="form-group row">
			            <label class="col-sm-2 control-label" >이용요금</label>
			            <div class="col-sm-7">    
			                <textarea name="usedCost" cols="50" rows="2" class="form-control">${hotel.usedCost}</textarea>
			            </div>
			        </div>
			        <br>
			        <div class="form-group row">
			            <label class="col-sm-2 control-label" >애견정책 및 주의사항</label>
			            <div class="col-sm-7">    
			                <textarea name="policyCautions" cols="50" rows="2" class="form-control">${hotel.policyCautions}</textarea>  
			            </div>
			        </div>
			        <br>
			         <div class="form-group row">
			            <label class="col-sm-2 control-label" >이미지주소1</label>
			            <div class="col-sm-7">     
			                <form:input path="p1" class="form-control" value="${hotel.p1}"/>  
			            </div>
			        </div>
			        <div class="form-group row">
			            <label class="col-sm-2 control-label" >이미지주소2</label>
			            <div class="col-sm-7">     
			                <form:input path="p2" class="form-control" value="${hotel.p2}"/>  
			            </div>
			        </div>
			        <div class="form-group row">
			            <label class="col-sm-2 control-label" >이미지주소3</label>
			            <div class="col-sm-7">     
			                <form:input path="p3" class="form-control" value="${hotel.p3}"/>  
			            </div>
			        </div>
			        <div class="form-group row">
			            <label class="col-sm-2 control-label" >이미지주소4</label>
			            <div class="col-sm-7">     
			                <form:input path="p4" class="form-control" value="${hotel.p4}"/>  
			            </div>
			        </div>
			        <div class="form-group row">
			            <label class="col-sm-2 control-label" >이미지주소5</label>
			            <div class="col-sm-7">     
			                <form:input path="p5" class="form-control" value="${hotel.p5}"/>  
			            </div>
			        </div>
			        <div class="form-group row">
			            <label class="col-sm-2 control-label" >이미지주소6</label>
			            <div class="col-sm-7">     
			                <form:input path="p6" class="form-control" value="${hotel.p6}"/>  
			            </div>
			        </div>
			        <div class="form-group row">
			            <label class="col-sm-2 control-label" >이미지주소7</label>
			            <div class="col-sm-7">     
			                <form:input path="p7" class="form-control" value="${hotel.p7}"/>  
			            </div>
			        </div>
			        <div class="form-group row">
			            <label class="col-sm-2 control-label" >이미지주소8</label>
			            <div class="col-sm-7">     
			                <form:input path="p8" class="form-control" value="${hotel.p8}"/>  
			            </div>
			        </div>
			        <div class="form-group row">
			            <label class="col-sm-2 control-label" >이미지주소9</label>
			            <div class="col-sm-7">     
			                <form:input path="p9" class="form-control" value="${hotel.p9}"/>  
			            </div>
			        </div>
			        <div class="form-group row">
			            <label class="col-sm-2 control-label" >이미지주소10</label>
			            <div class="col-sm-7">     
			                <form:input path="p10" class="form-control" value="${hotel.p10}"/>  
			            </div>
			        </div>       
	
	
	
	
	
	
	
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" class="btn btn-success" value="수정"/>
							<a href="<c:url value="/hotels"/>" class="btn btn-warning">취소</a>
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