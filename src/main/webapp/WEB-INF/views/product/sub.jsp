<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="stylesheet" href="/resources/css/sub.css" />

<title>클래스 상세 페이지</title>
</head>
<body>

	<%@include file="../includes/header.jsp" %>
	
	


	<div class="container">
	
		<div class="detail_top">
			<div class="img_box">
				<img src="/resources/product_detail/${product.main_img}">
			</div>
			<form action=#>
				<label for="class_schedule">클래스 일정 선택</label>
				<select name="class_schedule" id="class_schedule">
					<c:forEach var="schedule" items="${scheduleList}">
						<option>${schedule.schedule}</option>
					</c:forEach>
				</select>
				<div class="people">
					<input class="max" type="hidden" value="${product.max_capacity}">
					<input class="price" type="hidden" value="${product.price_per_person}">
					<p class="text">인원 선택</p>
					<button class="minus_btn">-</button>
					<div class="number">1</div>
					<button class="plus_btn">+</button>
				</div>
				<div>
					<span class="price2"></span> 원/<span class="number2">1</span>인
				</div>
				<button class="apply_btn">클래스 신청하기</button>
			</form>
		</div>
		
	</div>
	
	
	
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	
	<script>
	
		var max = $(".max").val();		
		var price = $(".price").val()*1;	
		var num = 1;
		var price_reg = price.toLocaleString();
		
		$(".price2").html(price_reg);
	
		$(".plus_btn").on("click", function(e){
			e.preventDefault();
			
			if(num >= max){
				 num = max;
			}else{
				num += 1;
			}
		
			$(".number").html(num);
			$(".number2").html(num);
			
			var real_price = price*num;
			var real_price_reg = real_price.toLocaleString();
			
			
			$(".price2").html(real_price_reg);
		});
		
		$(".minus_btn").on("click", function(e){
			e.preventDefault();
			
			if(num <= 1){
				num = 1;
			}else{
				num -= 1;
			}
			
			$(".number").html(num);
			$(".number2").html(num);
			
			var real_price = price*num;
			var real_price_reg = real_price.toLocaleString();
			
			
			$(".price2").html(real_price_reg);
		});
		
		$(".apply_btn").on("click", function(e){
			e.preventDefault();
			var selected_schedule = $("select[name=class_schedule]").val();
			
		});
	
	</script>

</body>
</html>