<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="stylesheet" href="/resources/css/confirm.css" />

<title>클래스잇 예약확인</title>
</head>
<body>

	<script src="https://cdn.portone.io/v2/browser-sdk.js"></script>




<div class="page-wrapper">

	<div class="header">
		<h1 class="header_title">Class IT</h1>
		<div class="header_btns">
		</div>
	</div>
	
	
	
	<div class="container">
	
		<h2 class="reserve_title">클래스 예약확인</h2>
	
		<div class="class_info_box">
			<h3>클래스 정보</h3>
			<div class="class_info">
				<div class="img_box">
					<img src="/resources/product_detail/${product.main_img}"></img>
				</div>
				<div class="class_detail">
					<div>
						<p>카테고리</p>
						<p class="content">${product.class_category}</p>
					</div>
					<div>
						<p>클래스명</p>
						<p class="content">${product.product_title}</p>
					</div>
					<div>
						<p>장소</p>
						<p class="content">${product.location}</p>
					</div>
					<div>
						<p>일시</p>
						<p class="content">${selected_schedule}</p>
					</div>
				</div>
			</div>
		</div>
		
		<div class="pay_form">
			<h3>결제 정보</h3>
			<h2>${product.product_title} 수강권 ${reserve_number}매</h2>
			<div>
				<p>1인당 수강료</p>
				<p class="content price2"></p>
			</div>
			<div>
				<p>인원수</p>
				<p class="content">x  ${reserve_number}명</p>
			</div>
			<div>
				<p>소계</p>
				<p class="content">=  ${reserve_amount}원</p>
			</div>
			<button class="pay_btn">결제하기</button>
		</div>
		
		<input class="price content" type="hidden" value="${product.price_per_person}">

	</div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>

<script>
	
		var price = $(".price").val()*1;	
		var price_reg = price.toLocaleString();
		
		$(".price2").html(price_reg + '원');
		
		
		
		$(".pay_btn").click(function(){
			$.ajax({
				type: "get",
				url: '/pay/kakaopay',
				data:{
					item_name: "초코파이",
					quantity: "1",
					total_amount: "1000",
					tax_free_amount: "10"
				},
				success: function(res){
					location.href = res.next_redirect_pc_url;
				}
			});
		});
		
		

		
</script>

</body>
</html>