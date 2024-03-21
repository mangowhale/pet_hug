<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/f70c884d31.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/originalCss.css" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<title>관광지추가</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/module/nav.jsp" flush="false"/>
		
	<section>
		<div class="jumbotron background-lightgreen pt-5 pb-5">
			<div class="container">
				<h2 class="display-3 font text-center">관광지 추가</h2>
			</div>
		</div>
	</section>
	<br>
	
	
	
	
	
	<div class="container">
      <div class="flex-around" style="width:100%">
      <div id="left" style="width:10%">
      
      </div>
      <div id="mid" style="width:80%">
      <div style="width:100%; transform:translateX(150px);">
       <form:form modelAttribute = "NewSpot" class="form-horizontal" onsubmit="return validateForm();">
        <script>
		    function validateForm() {
		        var areaName = document.getElementById("areaName").value;
		        var title = document.getElementById("title").value;
		        var address = document.getElementById("address").value;
		        var tel = document.getElementById("tel").value;
		        var usedTime = document.getElementById("usedTime").value;
		        var homePage = document.getElementById("homePage").value;
		        var keyword = document.getElementById("keyword").value;
		        var content = document.getElementById("content").value;
		        var mainFacility = document.getElementById("mainFacility").value;
		        var usedCost = document.getElementById("usedCost").value;
		        var policyCautions = document.getElementById("policyCautions").value;
		        var p1 = document.getElementById("p1").value;
		
		        if (areaName.trim() === '' || areaName.trim() === '' || address.trim() === '' 
		        		|| tel.trim() === '' || address.trim() === '' || address.trim() === '' 
		        		|| address.trim() === '' || address.trim() === '' || address.trim() === '' 
		        		|| address.trim() === '' || address.trim() === '' || address.trim() === '') 
		        {
		            alert("지역명, 업체명, 주소, 연락처, 이미지주소1을 모두 입력하세요."); 
		            return false;
		        }
		    }
		</script>
        <fieldset> 
        <div class="form-group row">
            <label class="col-sm-2 control-label" >지역명</label>
            <div class="col-sm-4">
                <form:input  path="areaName" class="form-control" placeholder="@@시 , @@군 으로 입력해주세요"/>  
            </div>
        </div>
        <br>
        <div class="form-group row">
           <label class="col-sm-2 control-label" >업체명</label>
           <div class="col-sm-4">
               <form:input  path="title" class="form-control"/>  
           </div>
        </div>
        <br>
        <div class="form-group row">
           <label class="col-sm-2 control-label" >주소</label>
           <div class="col-sm-4">
               <form:input  path="address" class="form-control"/>  
           </div>
        </div>
        <br>
        <div class="form-group row">
            <label class="col-sm-2 control-label" >연락처</label>
            <div class="col-sm-4">    
                <form:input  path="tel" class="form-control"/>  
            </div>
        </div>
        <br>
        <div class="form-group row">
            <label class="col-sm-2 control-label" >이용시간</label>
            <div class="col-sm-4">     
                <form:input path="usedTime" class="form-control"/>  
            </div>
        </div>
        <br>
        <div class="form-group row">
            <label class="col-sm-2 control-label" >홈페이지</label>
            <div class="col-sm-4">     
                <form:input path="homePage" class="form-control"/>  
            </div>
        </div>
        <br>
        <div class="form-group row">
           <label class="col-sm-2 control-label" >검색키워드</label>
           <div class="col-sm-4">
               <form:input  path="keyword" class="form-control"/>  
           </div>
        </div>
        <br>
      	<div class="form-group row">
            <label class="col-sm-2 control-label" >소개</label>
            <div class="col-sm-6">    
                <form:textarea  path="content" cols="50" rows="2" class="form-control"/>  
            </div>
        </div>
        <br>
        <div class="form-group row">
            <label class="col-sm-2 control-label" >주요시설</label>
            <div class="col-sm-6">    
                <form:textarea  path="mainFacility" cols="50" rows="2" class="form-control"/>  
            </div>
        </div>
        <br>
        <div class="form-group row">
            <label class="col-sm-2 control-label" >이용요금</label>
            <div class="col-sm-6">    
                <form:textarea  path="usedCost" cols="50" rows="2" class="form-control"/>  
            </div>
        </div>
        <br>
        <div class="form-group row">
            <label class="col-sm-2 control-label" >애견정책 및 주의사항</label>
            <div class="col-sm-6">    
                <form:textarea  path="policyCautions" cols="50" rows="2" class="form-control"/>  
            </div>
        </div>
        <br>
         <div class="form-group row">
            <label class="col-sm-2 control-label" >이미지주소1</label>
            <div class="col-sm-6">     
                <form:input path="p1" class="form-control" placeholder="메인 이미지로 사용됩니다"/>  
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 control-label" >이미지주소2</label>
            <div class="col-sm-6">     
                <form:input path="p2" class="form-control"/>  
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 control-label" >이미지주소3</label>
            <div class="col-sm-6">     
                <form:input path="p3" class="form-control"/>  
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 control-label" >이미지주소4</label>
            <div class="col-sm-6">     
                <form:input path="p4" class="form-control"/>  
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 control-label" >이미지주소5</label>
            <div class="col-sm-6">     
                <form:input path="p5" class="form-control"/>  
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 control-label" >이미지주소6</label>
            <div class="col-sm-6">     
                <form:input path="p6" class="form-control"/>  
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 control-label" >이미지주소7</label>
            <div class="col-sm-6">     
                <form:input path="p7" class="form-control"/>  
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 control-label" >이미지주소8</label>
            <div class="col-sm-6">     
                <form:input path="p8" class="form-control"/>  
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 control-label" >이미지주소9</label>
            <div class="col-sm-6">     
                <form:input path="p9" class="form-control"/>  
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 control-label" >이미지주소10</label>
            <div class="col-sm-6">     
                <form:input path="p10" class="form-control"/>  
            </div>
        </div>
      
        
        <br>
        <div class="form-group row" style="text-align:center;">
            <div class="col-sm-offset-2 col-sm-10" >
            <input type="submit" class="btn btn-success" value ="등록하기"/>
            <a href="<c:url value="/hotels"/>" class="btn btn-warning">취소하기</a>
            </div>
        </div>
        </fieldset>
        </form:form> 
        </div>
        </div>
       <div id="right" style="width:10%">
       
       </div>
       
        </div>    			
	</div>
	<br>
	
	<jsp:include page="/WEB-INF/views/module/footer.jsp" flush="false"/>
	</body>
</html>