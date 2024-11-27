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

	
	
	

<div class="page-wrapper">
<%@include file="../includes/header.jsp" %>



	<div class="container">
		
		<h2 class="sub_title">${product.product_title}</h2>
	
		<div class="detail_top">
			<div class="img_box">
				<img src="/resources/product_detail/${product.main_img}">
			</div>
			<form class="reserve_form" action="/product/confirm" method="get">
				<label class="schedule_label" for="class_schedule">클래스 일정 선택</label>
				<select class="schedule_select" name="class_schedule" id="class_schedule">
					<c:forEach var="schedule" items="${scheduleList}">
						<option class="schedule_option">${schedule.schedule}</option>
					</c:forEach>
				</select>
				<div class="people">
					<input class="max" type="hidden" value="${product.max_capacity}">
					<input class="price" type="hidden" value="${product.price_per_person}">
					<input class="selected_schedule" name="selected_schedule" type="hidden" value="">
					<input class="reserve_amount" name="reserve_amount" type="hidden" value="">
					<input class="reserve_number" name="reserve_number" type="hidden" value="">
					<input class="product_no" name="product_no" type="hidden" value="${product.product_no}">
					
					<p class="text">인원 선택</p>
					<div class="number_box">
						<button class="minus_btn">-</button>
						<div class="number">1</div>
						<button class="plus_btn">+</button>
					</div>
					<div class="price_box">
						<span class="price2"></span> 원/ <span class="number2">1</span> 인
					</div>
				</div>
				
				<button class="ask_btn">문의하기</button>
				<button class="apply_btn">클래스 신청하기</button>
			</form>
		</div>
		
		<div class="detail_bottom">
			<div class="detail_img">
				<img src="/resources/product_detail/${product.class_detail}">
			</div>
		</div>
		
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
			$(".reserve_form").find("input[name='selected_schedule']").val(selected_schedule);
			console.log($(".selected_schedule").val());
			
			var reserve_number = $(".number").html();
			$(".reserve_form").find("input[name='reserve_number']").val(reserve_number);
			console.log($(".reserve_number").val());
			
			var reserve_amount = $(".price2").html();
			$(".reserve_form").find("input[name='reserve_amount']").val(reserve_amount);
			console.log($(".reserve_amount").val());
			
			$(".reserve_form").submit();
		});
	
	</script>

</body>
</html>