<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/f70c884d31.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
<link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/originalCss.css?=ver1" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<title>회원가입</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/module/nav.jsp" flush="false"/>	

    <section>
        <div class="jumbotron background-lightgreen pt-5 pb-5">
            <div class="container">
                <h2 class="display-3 font text-center">회원가입</h2>
            </div>
        </div>
    </section>

    <section>
        <div class="container" style="padding: 180px 0;">
            <div class="flex-center">
                <div class="form col-sm-6 me-5 offset-md-3">	                
                    <form:form modelAttribute="new_member" class="form-horizontal">
                        <h2 class="form-title mb-4">회원가입</h2>
                        <div class="form-group row">
                            <label for="" class="col-sm-3 control-label">*아이디</label>
                            <div class="col-sm-3">
                                <form:input class="input" id="id" required="required" path="mem_id" maxlength="15" placeholder="최대 15글자"/>
                            </div> 
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3">*비밀번호</label>
                            <div class="col-sm-3">
                                <form:password class="input" required="required" path="mem_pw" maxlength="15" placeholder="최대 15글자"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3">*이름</label>
                            <div class="col-sm-3">
                                <form:input class="input" required="required" path="mem_name" maxlength="17"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3">닉네임</label>
                            <div class="col-sm-3">
                                <form:input class="input" path="mem_nickname" minlength="2" maxlength="10" placeholder="2~10글자"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3">전화번호</label>
                            <div class="col-sm-3">
                                <form:input class="input" maxlength="11" path="mem_phone" placeholder="'-' 없이 숫자만 입력해주세요"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3">이메일</label>
                            <div class="col-sm-3">
                                <form:input class="input" maxlength="40" path="mem_email"/>
                            </div>
                        </div>
                        <div class="form-group row mt-4">
                            <div class="col-sm-offset-2 col-sm-10">
                                <input type="submit" value="확인" class="offset-md-8 submit-green" onclick="submitForm()">
                            </div>
                        </div>
                    </form:form>
                </div>
                
            </div>
        </div>
    </section>
<script>
// 중복확인 함수(Id중복확인 버튼에 onclick 연결)
   $("#id").blur(function() {
        checkId();
    });
	function checkId(){
		let status = $('#id').attr('status'); //아이디 중복체크 상태
		let memberId = $('#id').val(); //입력한 아이디값
		$('.checkIdSpan').remove(); //기존에 중복체크한 이력 지워주기
		
		//아이디를 입력하지 않았다면
		if(memberId == ""){
			$('#id').after("<span class='checkIdSpan' style='color:lightgray'>아이디를 입력해주세요.</span>");
			$('#id').focus();
			return
		}
		
		$.ajax({
			url: '/pet_hug/member/checkId',
			type: 'POST',
			data: {
				id: memberId
			},
			dataType: 'text',
			success: function(data){
				if(data == 1){
					$('#id').attr('status', 'no');
					$('#id').after("<span class='checkIdSpan' style='color:red; display: inline-block; width: 300px;'>중복된 아이디입니다.</span>")
					$('#id').focus();
				}else{
					$('#id').attr('status', 'yes');
					$('#id').after("<span class='checkIdSpan' style='color:blue; display: inline-block; width: 300px;'>사용 가능한 아이디입니다.</span>")
				}
			},
			error: function(e){
				alert("error");
			}
		});
	}

// 회원가입 폼 제출 제한하는 함수
function submitForm(){
		let status = $('#id').attr('status'); //아이디 중복체크 상태
		
		if(status == ""){
			alert("아이디 중복체크를 해주세요.");
			$('#id').focus();
		}else if(status == "no"){
			alert("다른 아이디를 입력해주세요.")
			$('#id').focus();
		}else{
			$('#f').submit();
		}
	}


	</script>

    <jsp:include page="/WEB-INF/views/module/footer.jsp" flush="false"/>

</body>
</html>