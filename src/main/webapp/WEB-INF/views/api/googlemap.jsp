<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<title>구글지도사용하기</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyBJTaYHbcZLVZVx9AC2s5IqC7NTSv_ksvw" ></script>
<style>
#map_ma {width:80%; height:800px; clear:both; border:solid 1px red;}
</style>
</head>
<body>
<h1>구글지도</h1>
<div id="map_ma"></div>
<script type="text/javascript">
$(document).ready(function() {
	var myLatlng = new google.maps.LatLng(36.362124, 127.437933); // 위치값 위도 경도
	var Y_point			= 36.362124;		// Y 좌표
	var X_point			= 127.437933;		// X 좌표
	var zoomLevel		= 17;				// 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
	var markerTitle		= "한상진네 집";		// 현재 위치 마커에 마우스를 오버을때 나타나는 정보
	var markerMaxWidth	= 300;				// 마커를 클릭했을때 나타나는 말풍선의 최대 크기
// 말풍선 내용
	var contentString	= 
		
		'<div>' +
			'<h2>송촌동 우리집</h2>'+
			'<p>구글지도입니다.</p>' +
		'</div>';
	
	var myLatlng = new google.maps.LatLng(Y_point, X_point);
	var mapOptions = {
						zoom: zoomLevel,
						center: myLatlng,
						mapTypeId: google.maps.MapTypeId.ROADMAP
					}
	var map = new google.maps.Map(document.getElementById('map_ma'), mapOptions);
	var marker = new google.maps.Marker({
											position: myLatlng,
											map: map,
											title: markerTitle
	});
	var infowindow = new google.maps.InfoWindow(
												{
													content: contentString,
													maxWizzzdth: markerMaxWidth
												}
			);
	google.maps.event.addListener(marker, 'click', function() {
		infowindow.open(map, marker);
	});
});
</script>

오류발생 하면 새로고침 하셔
</body>
</html>
    