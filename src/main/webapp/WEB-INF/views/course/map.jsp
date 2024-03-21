<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/originalCss.css?=ver3" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/course.css?=ver3" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css?" rel="stylesheet">
<title>지도에서 코스 찾기</title>
</head>
<body onload="selectChanged(); switchUl('#courseUl1');">
	<jsp:include page="/WEB-INF/views/module/nav.jsp" flush="false"/>
	
	<div class="d-flex position-relative">
		<div id="map" style="width:100%; height:1000px;"></div>
		<div style="width: 300px; top: 0px; left: 100%; transform: translateX(-100%); z-index: 5; background-color: rgba(255, 255, 255, 0.5); height: 100%;" class="position-absolute p-4">
			<select id="areaName" onchange="selectChanged()" class="input" style="width:100px;">
				<option value="강릉시" selected>강릉시
				<option value="고성군">고성군
				<option value="동해시">동해시
				<option value="삼척시">삼척시
				<option value="속초시">속초시
				<option value="양구군">양구군
				<option value="양양군">양양군
				<option value="영월군">영월군
				<option value="원주시">원주시
				<option value="인제군">인제군
				<option value="정선군">정선군
				<option value="철원군">철원군
				<option value="춘천시">춘천시
				<option value="태백시">태백시
				<option value="평창군">평창군
				<option value="홍천군">홍천군
				<option value="화천군">화천군
				<option value="횡성군">횡성군
			</select>
			<select id="category" onchange="selectChanged()" class="input" style="width:100px;">
				<option value="전체" selected>전체
				<option value="숙박">숙소
				<option value="관광지">관광지
				<option value="식음료">식음료
				<option value="체험">체험
			</select>
			<hr>
			<c:choose>
				<c:when test="${courseCount eq 10}">
					<h5 style="text-align: center;">코스는 10개까지만<br>만들 수 있습니다.</h5>
				</c:when>
				<c:when test="${empty sessionScope.sessionId}">
					<h5 style="text-align: center;">코스 만들기는<br>로그인 후 이용 가능합니다.</h5>
				</c:when>
				<c:otherwise>
					<div>
						<input type="text" id="courseName" class="input" placeholder="코스 이름" style="width: 100%;">
						<div id="dayBox">
							<a onclick="switchUl('#courseUl1')" id="atag1">1일차</a>
							<a onclick="switchUl('#courseUl2')" id="atag2">2일차</a>
							<a onclick="switchUl('#courseUl3')" id="atag3">3일차</a>
						</div>
						<ul id="courseUl1">
						</ul>
						<ul id="courseUl2" style="display: none;">
						</ul>
						<ul id="courseUl3" style="display: none;">
						</ul>
						<a onclick="submitCourse();" class="submit-green" style="width: 100%;">코스 만들기</a>
					</div>
				</c:otherwise>
			</c:choose>
		</div>

		
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7a4ab729c1aae3934d705ceb879a263a&libraries=services"></script>
	<script type="text/javascript">

		/* 카카오 지도 */
	    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.7091295,128.8324462), // 지도의 중심좌표
	        level: 8 // 지도의 확대 레벨
	    };  
	
		// 지도 생성    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
	
		let hotelAddrs = [];
		let spotAddrs = [];
		let hotelMarkers = [];
		let spotMarkers = [];
		let cafeMarkers = [];
		let	expMarkers = []; 
		var markerImageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png';
		
		let hotelMarkerImageSrc = '/pet_hug/resources/images/map/hotelmarker.png';
		let spotMarkerImageSrc = '/pet_hug/resources/images/map/spotmarker.png';
		let cafeMarkerImageSrc = '/pet_hug/resources/images/map/cafemarker.png';
		let expMarkerImageSrc = '/pet_hug/resources/images/map/expmarker.png';
		
		let currentOverlay = null;
		let overlayContet = null;
		let newOverlay = null;
		let previousMarker = null;
		
		
    	var titleArray1 = [];
		var titleArray2 = [];
		var titleArray3 = [];
		let contentSeqArray1 = [];
		let contentSeqArray2 = [];
		let contentSeqArray3 = [];
		let selectedArray = null;
		var selectedUl = null;
		let courseName = [];
		let miniContentSeqArray = [];
		
		
		
		/* 지도 이동, category/areaName 가져옴 */
		function selectChanged(){
			let areaName = document.getElementById("areaName").value;
			console.log("areaValue: ", areaName);
			let category = document.getElementById("category").value;
			console.log("categoryValue: ", category);
			
			if(areaName == '강릉시'){
				moveMap(37.7091295,128.8324462);	
			}else if(areaName == '고성군'){
				moveMap(38.3773762,128.3997526);
			}else if(areaName == '동해시'){
				moveMap(37.5067666,129.0555852);
			}else if(areaName == '삼척시'){
				moveMap(37.2773968,129.1220028);
			}else if(areaName == '속초시'){
				moveMap(38.17601,128.5194615);
			}else if(areaName == '양구군'){
				moveMap(38.178176,128.001272);
			}else if(areaName == '양양군'){
				moveMap(38.0045219,128.5950959);
			}else if(areaName == '영월군'){
				moveMap(37.2039413,128.500649);
			}else if(areaName == '원주시'){
				moveMap(37.3082307,127.9294889);
			}else if(areaName == '인제군'){
				moveMap(38.0688048,128.263324);
			}else if(areaName == '정선군'){
				moveMap(37.3786668,128.7390494);
			}else if(areaName == '철원군'){
				moveMap(38.2434576,127.4141162);
			}else if(areaName == '춘천시'){
				moveMap(37.8897796,127.7398952);
			}else if(areaName == '태백시'){
				moveMap(37.1722939,128.9800161);
			}else if(areaName == '평창군'){
				moveMap(37.556735,128.4826261);
			}else if(areaName == '홍천군'){
				moveMap(37.7450683,128.0742344);
			}else if(areaName == '화천군'){
				moveMap(38.1383179,127.6849292);
			}else if(areaName == '횡성군'){
				moveMap(37.5089632,128.0770982);
			}
			//기존 마커 제거
			removeMarkers();
			requestAddrArray(areaName, category);
		}
		
		function requestAddrArray(areaName, category){
		    $.ajax({
		        url: '/pet_hug/courses/getAddrArray',
		        type: 'POST',
		        contentType: 'application/json',
		        data: JSON.stringify({areaName: areaName, category: category}),
		        success: function(data) {
		            if(category === '숙박'){
		                displayHotelMarkers(data);
		            }else if(category === '관광지'){
		            	displaySpotMarkers(data);
		            }else if(category === '식음료'){
		            	displayCafeMarkers(data);
		            }else if(category === '체험'){
		            	displayExpMarkers(data);
		            }else if(category === '전체'){
		            	displayHotelMarkers(data);
		            	displaySpotMarkers(data);
		            	displayCafeMarkers(data);
		            	displayExpMarkers(data);
		            }
		        },
		        error: function(error) {
		        }
		    });
		}
		
		function moveMap(latitude, longitude){
			let center = new kakao.maps.LatLng(latitude, longitude);
			map.panTo(center);
		}
		
		function removeMarkers(){
		    for (var i = 0; i < hotelMarkers.length; i++) {
		        hotelMarkers[i].setMap(null);
		    }
		    for (var i = 0; i < spotMarkers.length; i++) {
		        spotMarkers[i].setMap(null);
		    }
		    for (var i = 0; i < cafeMarkers.length; i++) {
		        cafeMarkers[i].setMap(null);
		    }
		    for (var i = 0; i < expMarkers.length; i++) {
		        expMarkers[i].setMap(null);
		    }
		}
		
		
		
		function displayHotelMarkers(data){
			hotelAddrs = data[0].map(function(item){
				return new kakao.maps.LatLng(item.lat, item.lng);
			});
			
			var hotelInfo = data[0];
			
		    // 호텔 주소 배열에 있는 좌표를 지도에 표시
		    for (var i = 0; i < hotelAddrs.length; i++) {
		        var marker = new kakao.maps.Marker({
		            position: hotelAddrs[i],
		            image: new kakao.maps.MarkerImage(hotelMarkerImageSrc, new kakao.maps.Size(42, 42)),
		            map: map
		        });
		        hotelMarkers.push(marker);
		        
			 // 호텔 마커에 클릭 이벤트 리스너 추가
			    kakao.maps.event.addListener(marker, 'click', (function(marker, hotel) {
			        return function() {
			            // 이전에 클릭된 마커와 현재 클릭된 마커가 다른 경우에만 처리
			            if (previousMarker !== marker) {
			                // 이전에 클릭된 마커의 오버레이가 열려있으면 닫음
			                if (previousMarker && currentOverlay) {
			                    currentOverlay.setMap(null);
			                }
			                // 현재 클릭된 마커의 오버레이를 열고, 이전에 클릭된 마커를 저장
			                overlayContent = getOverlayContent(hotel.p1, hotel.title, hotel.contentSeq, hotel.partName);

			                var newOverlay = new kakao.maps.CustomOverlay({
			                    position: marker.getPosition(),
			                    content: overlayContent,
			                    xAnchor: 0.3,
			                    yAnchor: 1.2 // 마커보다 약간 위로 이동
			                });

			                newOverlay.setMap(map);
			                // 새로운 오버레이와 클릭된 마커를 저장
			                currentOverlay = newOverlay;
			                previousMarker = marker;
			                
			                moveMap(marker.getPosition().getLat(), marker.getPosition().getLng());
			            } else {
			                // 이전에 클릭된 마커와 현재 클릭된 마커가 같으면 오버레이를 닫음
			                if (currentOverlay) {
			                    closeAllOverlay();
			                }
			            }
			        };
			    })(marker, hotelInfo[i]));
		    }
		}
		function addScheduleInCourse(title){
			console.log('addScheduleInCourse() 실행');
			
		    var selectedDay = $('.selectedDay'); // 선택된 일자를 가리키는 클래스
		    var selectedUl = $('.selectedUl'); // 선택된 일자의 다음에 오는 ul 태그
	
		    var newSchedule = '<li class="mb-3">' +
	        '<div class="d-flex justify-content-between scheduleBox">' +
	        '<p class="scheduleName">' + title + '</p>' +
	        //'<p class="close" onclick="removeSchedule(this)">x</p>' +
	        '</div>' +
	        '</li>';
	
		    // 최대 7개까지만 li를 추가합니다.
		    if (selectedUl.children('li').length < 7) {
		        selectedUl.append(newSchedule);
		    } else {
		        alert('최대 7개까지만 추가할 수 있습니다.');
		    }
		    
		}
		
		function getCourseInfo(){
			console.log('() 실행')
			
			 $.ajax({
			        url: '/pet_hug/courses/map/courseInfo',
			        type: 'POST',
			        contentType: 'application/json',
			        data: JSON.stringify({ contentSeqArray: miniContentSeqArray }),
			        success: function (response) {
			            // 성공적으로 응답을 받았을 때 처리
			            console.log('서버로 전송 완료:', response);
			            var convertedDuration = response.convertedDuration;
			            var convertedDistance = response.convertedDistance;
			            addCourseInfoToLastLi(convertedDistance, convertedDuration);
			        },
			        error: function (error) {
			            // 오류 발생 시 처리
			            console.error('서버로 전송 중 오류 발생:', error);
			        }
			    });
		}
		
		function addCourseInfoToLastLi(convertedDistance, convertedDuration){
			var lastSchedule = $('.selectedUl li:last');
			var infoHtml = '<p>거리: ' + convertedDistance + ' | 소요 시간: ' + convertedDuration + '</p>';
			lastSchedule.before(infoHtml);
		}
		
		function closeAllOverlay(){
			currentOverlay.setMap(null);
            currentOverlay = null;
            previousMarker = null;
		}
	
		
		function displaySpotMarkers(data) {	    
		    // 관광명소 주소 배열 생성 및 마커 표시
		    spotAddrs = data[1].map(function(item){
		        return new kakao.maps.LatLng(item.lat, item.lng);
		    });
		    
		    var spotInfo = data[1];

		    // 호텔 주소 배열에 있는 좌표를 지도에 표시
		    for (var i = 0; i < spotAddrs.length; i++) {
		        var marker = new kakao.maps.Marker({
		            position: spotAddrs[i],
		            image: new kakao.maps.MarkerImage(spotMarkerImageSrc, new kakao.maps.Size(42, 42)),
		            map: map
		        });
		        spotMarkers.push(marker);
		        
			 // 호텔 마커에 클릭 이벤트 리스너 추가
			    kakao.maps.event.addListener(marker, 'click', (function(marker, spot) {
			        return function() {
			            // 이전에 클릭된 마커와 현재 클릭된 마커가 다른 경우에만 처리
			            if (previousMarker !== marker) {
			                // 이전에 클릭된 마커의 오버레이가 열려있으면 닫음
			                if (previousMarker && currentOverlay) {
			                    currentOverlay.setMap(null);
			                }
			                // 현재 클릭된 마커의 오버레이를 열고, 이전에 클릭된 마커를 저장
			                overlayContent = getOverlayContent(spot.p1, spot.title, spot.contentSeq, spot.partName);

			                var newOverlay = new kakao.maps.CustomOverlay({
			                    position: marker.getPosition(),
			                    content: overlayContent,
			                    xAnchor: 0.3,
			                    yAnchor: 1.2 // 마커보다 약간 위로 이동
			                });

			                newOverlay.setMap(map);
			                // 새로운 오버레이와 클릭된 마커를 저장
			                currentOverlay = newOverlay;
			                previousMarker = marker;
			                
			                moveMap(marker.getPosition().getLat(), marker.getPosition().getLng());
			            } else {
			                // 이전에 클릭된 마커와 현재 클릭된 마커가 같으면 오버레이를 닫음
			                if (currentOverlay) {
			                    closeAllOverlay();
			                }
			            }
			        };
			    })(marker, spotInfo[i]));
		    }
		}
		function displayCafeMarkers(data){
		    //주소 배열 생성 및 마커 표시
		    cafeAddrs = data[2].map(function(item){
		        return new kakao.maps.LatLng(item.lat, item.lng);
		    });
		    var cafeInfo = data[2];

		    //주소 배열에 있는 좌표를 지도에 표시
		    for (var i = 0; i < cafeAddrs.length; i++) {
		        var marker = new kakao.maps.Marker({
		            position: cafeAddrs[i],
		            image: new kakao.maps.MarkerImage(cafeMarkerImageSrc, new kakao.maps.Size(42, 42)),
		            map: map
		        });
		        cafeMarkers.push(marker);
		        
			 //마커에 클릭 이벤트 리스너 추가
			    kakao.maps.event.addListener(marker, 'click', (function(marker, cafe) {
			        return function() {
			            // 이전에 클릭된 마커와 현재 클릭된 마커가 다른 경우에만 처리
			            if (previousMarker !== marker) {
			                // 이전에 클릭된 마커의 오버레이가 열려있으면 닫음
			                if (previousMarker && currentOverlay) {
			                    currentOverlay.setMap(null);
			                }
			                // 현재 클릭된 마커의 오버레이를 열고, 이전에 클릭된 마커를 저장
			                overlayContent = getOverlayContent(cafe.p1, cafe.title, cafe.contentSeq, cafe.partName);

			                var newOverlay = new kakao.maps.CustomOverlay({
			                    position: marker.getPosition(),
			                    content: overlayContent,
			                    xAnchor: 0.3,
			                    yAnchor: 1.2 // 마커보다 약간 위로 이동
			                });

			                newOverlay.setMap(map);
			                // 새로운 오버레이와 클릭된 마커를 저장
			                currentOverlay = newOverlay;
			                previousMarker = marker;
			                
			                moveMap(marker.getPosition().getLat(), marker.getPosition().getLng());
			            } else {
			                // 이전에 클릭된 마커와 현재 클릭된 마커가 같으면 오버레이를 닫음
			                if (currentOverlay) {
			                    closeAllOverlay();
			                }
			            }
			        };
			    })(marker, cafeInfo[i]));
		    }
		}
		function displayExpMarkers(data){
		    //주소 배열 생성 및 마커 표시
		    expAddrs = data[3].map(function(item){
		        return new kakao.maps.LatLng(item.lat, item.lng);
		    });
		    var expInfo = data[3];

		    //주소 배열에 있는 좌표를 지도에 표시
		    for (var i = 0; i < expAddrs.length; i++) {
		        var marker = new kakao.maps.Marker({
		            position: expAddrs[i],
		            image: new kakao.maps.MarkerImage(expMarkerImageSrc, new kakao.maps.Size(42, 42)),
		            map: map
		        });
		        expMarkers.push(marker);
		        
			 //마커에 클릭 이벤트 리스너 추가
			    kakao.maps.event.addListener(marker, 'click', (function(marker, exp) {
			        return function() {
			            // 이전에 클릭된 마커와 현재 클릭된 마커가 다른 경우에만 처리
			            if (previousMarker !== marker) {
			                // 이전에 클릭된 마커의 오버레이가 열려있으면 닫음
			                if (previousMarker && currentOverlay) {
			                    currentOverlay.setMap(null);
			                }
			                // 현재 클릭된 마커의 오버레이를 열고, 이전에 클릭된 마커를 저장
			                overlayContent = getOverlayContent(exp.p1, exp.title, exp.contentSeq, exp.partName);

			                var newOverlay = new kakao.maps.CustomOverlay({
			                    position: marker.getPosition(),
			                    content: overlayContent,
			                    xAnchor: 0.3,
			                    yAnchor: 1.2 // 마커보다 약간 위로 이동
			                });

			                newOverlay.setMap(map);
			                // 새로운 오버레이와 클릭된 마커를 저장
			                currentOverlay = newOverlay;
			                previousMarker = marker;
			                
			                moveMap(marker.getPosition().getLat(), marker.getPosition().getLng());
			            } else {
			                // 이전에 클릭된 마커와 현재 클릭된 마커가 같으면 오버레이를 닫음
			                if (currentOverlay) {
			                    closeAllOverlay();
			                }
			            }
			        };
			    })(marker, expInfo[i]));
		    }
		}
		
		function getOverlayContent(p1, title, contentSeq, partName){
			overlayContent = '<div style="width: 320px; height: 280px; background-color: white; border-radius: 0px 0px 5% 5%;" class="border position-relative">' +
            '<img src="' + p1 + '" style="width:100%"/>' +
            '<div style="padding: 5px;">' +
                '<div style="margin: 1px 0; height: 1.5rem; font-size: 1rem;">' +
                	'<p style="display: inline-block; width: 100%; margin-bottom: 0px;">' + title + '</p><br>' +
                '</div>' +
                '<div class="d-flex mb-2" style="justify-content: end">' +
                	'<a href="/pet_hug/' + partName + 's/' + partName + '?num=' + contentSeq + '" style="border-radius: 6px; text-decoration: none; padding: 5px; display: inline-block; width: 75px; margin-right: 3px;" class="background-lightgreen">상세정보</a>' +
                	'<button onclick="pushContentSeqArray(\'' + contentSeq + '\'); addScheduleInCourse(\'' + title + '\');" style="border-radius: 6px; padding: 5px; border: none;" class="background-green">코스에 추가</button>'
                '</div>' +
            '</div>' +
            '</div>';
            return overlayContent;
		}
		
	    function switchUl(ulId) {
	    	let atag;
	    	if(ulId === '#courseUl1'){
	    		atag = '#atag1';
	    		selectedArray = contentSeqArray1;
	    	}else if(ulId === '#courseUl2'){
	    		atag = '#atag2';
	    		selectedArray = contentSeqArray2;
	    	}else if(ulId === '#courseUl3'){
	    		atag = '#atag3';
	    		selectedArray = contentSeqArray3;
	    	}
	        $('#courseUl1').hide();
	        $('#courseUl2').hide();
	        $('#courseUl3').hide();
	        $(ulId).show();
	        
	        $('.selectedDay').removeClass('selectedDay');
	        $(atag).addClass('selectedDay');
	        
	        $('.selectedUl').removeClass('selectedUl');
	        $(ulId).addClass('selectedUl');
	    }
	    
	    function pushContentSeqArray(contentSeq){
	    	console.log("pushContentSeqArray() 실행");
	        if (selectedArray.length < 7) {
	            selectedArray.push(contentSeq);
	            
			    if(selectedArray.length >= 2){
			    	console.log("selectedArray 길이 2 이상")
			    	miniContentSeqArray = [];
			    	miniContentSeqArray = selectedArray.slice(-2);
			    	console.log('miniContentSeqArray[0]: ' + miniContentSeqArray[0]);
			    	getCourseInfo(miniContentSeqArray);
			    }
	        }
	    }
	    
	    function submitCourse(){
	    	console.log("submitCourse() 실행")
	    	courseName.push($('#courseName').val());
	    	console.log(courseName);
	    	var jsontest = JSON.stringify({
                courseName: courseName,
                contentSeqArray1: contentSeqArray1,
                contentSeqArray2: contentSeqArray2,
                contentSeqArray3: contentSeqArray3
            });
	    	console.log('jsontest: ' + jsontest);
	    	 $.ajax({
	            url: '/pet_hug/courses/submitCourse', // 컨트롤러 URL 설정
	            type: 'POST',
	            contentType: 'application/json; charset=utf-8',
	            data: jsontest,
	            success: function(response) {
	                // 성공적으로 응답을 받았을 때 처리
	                console.log("코스 만들기 성공:", response);
	                alert("만들어진 코스는 마이페이지에서 확인 가능합니다.");
	                location.reload();
	            },
	            error: function(error) {
	                // 오류 발생 시 처리
	                console.error("코스 만들기 오류:", error);
	                // 오류 처리 로직 추가
	            }
	        }); 
	    	
	    }
/* 	    function removeSchedule(element) {
	    	console.log("removeSchedule() 실행");
	        // 클릭된 'x' 버튼의 부모 요소인 <li>를 찾습니다.
	        var parentLi = $(element).closest('li');

	        // 해당 리스트 아이템의 순서를 찾음
	        var index = parentLi.index();
	        console.log("index: " + index);

	        // 해당 리스트 아이템을 삭제
	        
	        parentLi.prev('p').remove();     
	        parentLi.next('p').remove();
	        parentLi.remove();

	        // 삭제된 인덱스의 항목을 selectedArray에서 삭제합니다.
	        selectedArray.splice(index, 1);
	        
	        console.log('contentSeqArray1: ' + contentSeqArray1);
	        console.log('contentSeqArray2: ' + contentSeqArray2);
	        console.log('contentSeqArray3: ' + contentSeqArray3);
	        
	        miniContentSeqArray = [];
	    	miniContentSeqArray = selectedArray.slice(-2);
	    	console.log('miniContentSeqArray[0]: ' + miniContentSeqArray[0]);
	    	getCourseInfo(miniContentSeqArray);
	    } */

	</script>
	
	<jsp:include page="/WEB-INF/views/module/footer.jsp" flush="false"/>
</body>
</html>