<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>간단한 지도 표시하기</title>
    <!-- 네이버 지도 로드 -->
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=e6rqd9yxsp&callback=CALLBACK_FUNCTION"></script>
	<!-- 서브 모듈 로드 -->
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=YOUR_CLIENT_ID&submodules=panorama,geocoder"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=YOUR_CLIENT_ID&submodules=panorama"></script>
</head>
<body>
<h1>네이버 지도</h1> <br>
시, 군, 구, 동, 리 까지 따로 검색됨 <br>
검색 입력 ex)<br><br>
송촌동 , 추소리 , 송촌동 483-15 <br>
대전시 대덕구 송촌동 483-15<br> 
대전 대덕구<br> 
대전<br><br>

<input type="text" id="address" value="">
<button type="button" id="submit">주소검색</button>
<div id="map" style="width:100%;height:400px;"></div>
<div id="value">좌표값 : </div>
<br><br>
---현재 가능한 기능---<br>
1. 주소 검색<br>
2. 지도 줌인/아웃<br>
3. 클릭한 곳에 마커 놓기<br>
4. 검색한 주소 지번/도로명/영문 주소 메모박스 띄우기<br>
5. 주소가 있는 장소 클릭하면 지번/도로명/영문 주소 메모박스 띄우기<br>
6. 일반/위성 전환<br> 
7. 클릭한 위치 좌표값 얻어오기<br>
<br><br>
<div>
---해야 할 기능---<br>
클릭한 위치에 메모 박스 고정으로 회의 위치 찍어두기<br>
회의장소 좌표값 얻어서 저장<br>
지도 api열때마다 회의장소로 열리게 하기<br><br>

지금 까지 해놓은 기능만 이용해도 될거 같은..데?<br>
</div>

<script>
var x = 0;
var y = 0;
var contentString = '송촌동 우리집';

var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(36.3621284, 127.4379089),
    zoom: 17,	//지도의 초기 줌 레벨
    minZoom: 1,	//지도의 최소 줌 레벨
    zoomControl: true,	//줌 컨트롤의 표시 여부
    zoomControlOptions: {
    position: naver.maps.Position.LEFT_BOTTOM
    },
	mapTypeControl : true // 일반ㆍ위성 지도보기 컨트롤 표시 (기본값 표시안함)

});  


//클릭이벤트를 적용하여 경고창으로 위도 경도를 봅니다.
naver.maps.Event.addListener(map, 'click', function(e){
	x= e.coord.lat();
	y= e.coord.lng();
	
	// 지도를 클릭하면 아래 내용이 실행됩니다.
	$("#value").text(x + ', ' + y); 
	marker.setPosition(e.latlng)	// 클릭한 지점으로 마커 이동
	// e 는 클릭시 넘어오는 이벤트 (네이밍은 원하는 대로 하셔도 됩니다)
	// e 에서 필요한 것을 꺼내서 쓰면 됩니다.
	// e.coord.lat() 는 위도 (Latitude)  보통 약어로 lat
	// e.coord.lng() 는 경도 (Longitude) 보퉁 약어로 lng
});

var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(36.3621284, 127.4379089),
    map: map
});


/* var marker = new naver.maps.Marker({
	position : new naver.maps.LatLng(x,y),
	title:contentString,
	map:map
}); */




var infoWindow = new naver.maps.InfoWindow({
    anchorSkew: true
});

map.setCursor('pointer');

function searchCoordinateToAddress(latlng) {

    infoWindow.close();

    naver.maps.Service.reverseGeocode({
        coords: latlng,
        orders: [
            naver.maps.Service.OrderType.ADDR,
            naver.maps.Service.OrderType.ROAD_ADDR
        ].join(',')
    }, function(status, response) {
        if (status === naver.maps.Service.Status.ERROR) {
            return alert('Something Wrong!');
        }

        var items = response.v2.results,
            address = '',
            htmlAddresses = [];

        for (var i=0, ii=items.length, item, addrType; i<ii; i++) {
            item = items[i];
            address = makeAddress(item) || '';
            addrType = item.name === 'roadaddr' ? '[도로명 주소]' : '[지번 주소]';

            htmlAddresses.push((i+1) +'. '+ addrType +' '+ address);
        }

        infoWindow.setContent([
            '<div style="padding:10px;min-width:200px;line-height:150%;">',
            '<h4 style="margin-top:5px;">검색 좌표</h4><br />',
            htmlAddresses.join('<br />'),
            '</div>'
        ].join('\n'));

        infoWindow.open(map, latlng);
    });
}

function searchAddressToCoordinate(address) {
    naver.maps.Service.geocode({
        query: address
    }, function(status, response) {
        if (status === naver.maps.Service.Status.ERROR) {
            return alert('Something Wrong!');
        }

        if (response.v2.meta.totalCount === 0) {
            return alert('잘못된 주소입니다. 다시 검색하세요' /* + response.v2.meta.totalCount */);
        }

        var htmlAddresses = [],
            item = response.v2.addresses[0],
            point = new naver.maps.Point(item.x, item.y);

        if (item.roadAddress) {
            htmlAddresses.push('[도로명 주소] ' + item.roadAddress);
        }

        if (item.jibunAddress) {
            htmlAddresses.push('[지번 주소] ' + item.jibunAddress);
        }

        if (item.englishAddress) {
            htmlAddresses.push('[영문명 주소] ' + item.englishAddress);
        }

        infoWindow.setContent([
            '<div style="padding:10px;min-width:200px;line-height:150%;">',
            '<h4 style="margin-top:5px;">검색 주소 : '+ address +'</h4><br />',
            htmlAddresses.join('<br />'),
            '</div>'
        ].join('\n'));

        map.setCenter(point);
        infoWindow.open(map, point);
    });
}

function initGeocoder() {
    if (!map.isStyleMapReady) {
        return;
    }

    map.addListener('click', function(e) {
        searchCoordinateToAddress(e.coord);
    });

    $('#address').on('keydown', function(e) {
        var keyCode = e.which;

        if (keyCode === 13) { // Enter Key
            searchAddressToCoordinate($('#address').val());
        }
    });

    $('#submit').on('click', function(e) {
        e.preventDefault();

        searchAddressToCoordinate($('#address').val());
    });

    searchAddressToCoordinate('송촌동 483-15');
}

function makeAddress(item) {
    if (!item) {
        return;
    }

    var name = item.name,
        region = item.region,
        land = item.land,
        isRoadAddress = name === 'roadaddr';

    var sido = '', sigugun = '', dongmyun = '', ri = '', rest = '';

    if (hasArea(region.area1)) {
        sido = region.area1.name;
    }

    if (hasArea(region.area2)) {
        sigugun = region.area2.name;
    }

    if (hasArea(region.area3)) {
        dongmyun = region.area3.name;
    }

    if (hasArea(region.area4)) {
        ri = region.area4.name;
    }

    if (land) {
        if (hasData(land.number1)) {
            if (hasData(land.type) && land.type === '2') {
                rest += '산';
            }

            rest += land.number1;

            if (hasData(land.number2)) {
                rest += ('-' + land.number2);
            }
        }

        if (isRoadAddress === true) {
            if (checkLastString(dongmyun, '면')) {
                ri = land.name;
            } else {
                dongmyun = land.name;
                ri = '';
            }

            if (hasAddition(land.addition0)) {
                rest += ' ' + land.addition0.value;
            }
        }
    }

    return [sido, sigugun, dongmyun, ri, rest].join(' ');
}

function hasArea(area) {
    return !!(area && area.name && area.name !== '');
}

function hasData(data) {
    return !!(data && data !== '');
}

function checkLastString (word, lastString) {
    return new RegExp(lastString + '$').test(word);
}
 
function hasAddition (addition) {
    return !!(addition && addition.value);
}

naver.maps.onJSContentLoaded = initGeocoder;
naver.maps.Event.once(map, 'init_stylemap', initGeocoder);
</script>



</body>
</html>