<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="/resources/css/product.css" />

<title>클래스잇 검색</title>
</head>
<body>

	<div class="header">
		<h1 class="header_title">Class IT</h1>
		<div class="header_btns">
			<button class="login_btn">로그인</button>
			<button class="join_btn">회원가입</button>
		</div>
	</div>

	
	
	
  
	<div class="container">
	
		<div>
			<h2>클래스 검색하기</h2>
			
			<form action="/product/list" method="post">
			
  				<label for="product_category">클래스 카테고리</label>
  				<select name="product_category" id="product_category">
  					<option value="">----</option>
    				<option value="handmade" <%= "handmade".equals(request.getAttribute("selected_Category")) ? "selected" : "" %>>수공예</option>
    				<option value="drawing" <%= "drawing".equals(request.getAttribute("selected_Category")) ? "selected" : "" %>>드로잉</option>
    				<option value="music" <%= "music".equals(request.getAttribute("selected_Category")) ? "selected" : "" %>>음악</option>
    				<option value="sports" <%= "sports".equals(request.getAttribute("selected_Category")) ? "selected" : "" %>>스포츠</option>
    				<option value="all" <%= "all".equals(request.getAttribute("selected_Category")) ? "selected" : "" %>>모든 카테고리</option>
  				</select>

  				<div class="product_title">
  					<label for="product_title">클래스명</label>
  					<select name="product_title" id="product_title">
  						<option value="">----</option>
    					<option class="handmade_op" value="나만의 디저트 케이크+마카롱캔들 원데이클래스">나만의 디저트 케이크+마카롱캔들 원데이클래스</option>
    					<option class="handmade_op" value="단하나뿐인 나만의 시그니처 향수 만들기">단하나뿐인 나만의 시그니처 향수 만들기</option>
    					<option class="handmade_op" value="나만의 개성이 담긴 힙팟 만들기 원데이클래스">나만의 개성이 담긴 힙팟 만들기 원데이클래스</option>
    					<option class="handmade_op" value="[가죽공예] 양면 카드지갑 만들기">[가죽공예] 양면 카드지갑 만들기</option>
    					<option class="drawing_op" value="아이패드 드로잉 원데이클래스">아이패드 드로잉 원데이클래스</option>
    					<option class="drawing_op" value="(서울/마포) 작가님과 함께하는 아크릴화클래스">(서울/마포) 작가님과 함께하는 아크릴화클래스</option>
    					<option class="drawing_op" value="베어브릭 페인팅 원데이클래스">베어브릭 페인팅 원데이클래스</option>
    					<option class="drawing_op" value="글씨에 감성을 더하다 캘리그라피 클래스">글씨에 감성을 더하다 캘리그라피 클래스</option>
    					<option class="music_op" value="누구나 할 수 있는 작곡 원데이클래스">누구나 할 수 있는 작곡 원데이클래스</option>
    					<option class="music_op" value="인천 보컬 1:1 원데이 클래스 (선학역)">인천 보컬 1:1 원데이 클래스 (선학역)</option>
    					<option class="music_op" value="신나는 음악과 함께 디제잉을 배워보자!">신나는 음악과 함께 디제잉을 배워보자!</option>
    					<option class="music_op" value="아늑한 분위기에서 배우는 기타 맞춤레슨">아늑한 분위기에서 배우는 기타 맞춤레슨</option>
    					<option class="sports_op" value="다이나믹 클라이밍">다이나믹 클라이밍</option>
    					<option class="sports_op" value="체험 프리다이빙! 물속 세상을 체험해볼까요?">체험 프리다이빙! 물속 세상을 체험해볼까요?</option>
    					<option class="sports_op" value="포항에서 원데이서핑강습 풀패키지">포항에서 원데이서핑강습 풀패키지</option>
    					<option class="sports_op" value="펜싱 마에스트로에게 배우는 펜싱 원데이클래스!">펜싱 마에스트로에게 배우는 펜싱 원데이클래스!</option>
  					</select>
  					
  					<input class="search_btn" type="submit" value="검색하기" />
  				</div>
  				
			</form>
		</div>

  		<table class="table">
    		<thead>
      			<tr>
        			<th>클래스 번호</th>
        			<th>클래스명</th>
        			<th>클래스 카테고리</th>
        			<th>가격</th>
        			<th>최대 가용인원</th>
        			<th>스케줄</th>
      			</tr>
    		</thead>
    		<tbody>
    			<c:forEach var="product"  items="${list}"> 
	      			<tr>
	        			<td>${product.product_no}</td>
	        			<td>${product.product_title}</td>
	        			<td>${product.class_category}</td>
	        			<td>${product.price_per_person}</td>
	        			<td>${product.max_capacity}</td>
	        			<c:forEach var="schedule" items="${list2}">
	        				<td>${schedule.schedule}</td>
	        			</c:forEach>
	      			</tr>
    			</c:forEach>
    		</tbody>
  		</table>
  		
	</div>
	
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	
	<script>
	
	$(document).ready(function(){
		
		//$(".table").hide();
		
		$(".handmade_op").hide();
		$(".drawing_op").hide();
		$(".music_op").hide();
		$(".sports_op").hide();
		
		$("#product_category").on("change", function(e){
			
			var selected_category = $("#product_category option:selected").val();
			console.log(selected_category);
			
			if(selected_category === 'handmade'){
				$(".drawing_op").hide();
				$(".music_op").hide();
				$(".sports_op").hide();
				$(".handmade_op").show();
			}else if(selected_category === 'drawing'){
				$(".music_op").hide();
				$(".sports_op").hide();
				$(".handmade_op").hide();
				$(".drawing_op").show();
			}else if(selected_category === 'music'){
				$(".drawing_op").hide();
				$(".sports_op").hide();
				$(".handmade_op").hide();
				$(".music_op").show();
			}else if(selected_category === 'sports'){
				$(".drawing_op").hide();
				$(".music_op").hide();
				$(".handmade_op").hide();
				$(".sports_op").show();
			}else if(selected_category === 'all'){
				$(".drawing_op").show();
				$(".music_op").show();
				$(".handmade_op").show();
				$(".sports_op").show();
			}
		});
		
//		$(".search_btn").on("click", function(e){
//			$(".table").show();
//		})
	});
	
	</script>
	
</body>
</html>