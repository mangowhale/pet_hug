<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css?ver=1" rel="stylesheet">
<title>로그인</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/module/nav.jsp" flush="false"/>	

    <section>
        <div class="jumbotron background-lightgreen pt-5 pb-5">
            <div class="container">
                <h2 class="display-3 font text-center">로그인</h2>
            </div>
        </div>
    </section>

    <section>
        <div class="container" style="padding: 180px 0; min-height: 700px; position: relative;">
            
            <div class="div-center" style="width: 80%; text-align:center;position: absolute; top: 50%; left: 10%; transform: translateY(-50%);">                
            <hr>    
                <form action="/pet_hug/member/login" style="padding: 100px 0;" class="form-horizontal" method="POST">
                    <div>
                        <label for="" class="col-md-2">아이디</label> <input type="text" name="mem_id" class="input">
                    </div>
                    <div>
                        <label for="" class="col-md-2">비밀번호</label> <input type="password" name="mem_pw" class="input">
                    </div>
                    <div class="form-group row mt-4">
                        <div class="col-sm-offset-3 col-sm-10">
                            <input type="submit" value="로그인" class="offset-md-8 submit-green" style="position: relative; top: 0%; left: -5%;">
                        </div>
                    </div>
                </form>
            <hr>
            </div>
            
        </div>
    </section>
    
    <jsp:include page="/WEB-INF/views/module/footer.jsp" flush="false"/>
    
</body>
</html>