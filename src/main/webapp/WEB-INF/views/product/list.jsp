<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="stylesheet" href="/resources/css/list.css" />

<title>클래스잇 검색</title>
</head>
<body>

	<%@include file="../includes/header.jsp" %>
	

	
	
	
  
	<div class="container">
	
		<div>
			<h2 class="search_title">클래스 검색하기</h2>
			
			<form action="/product/list" method="post">
			
  				<label class="category_label" for="class_category">클래스 카테고리</label>
  				<select name="class_category" id="class_category">
  					<option value="">----</option>
    				<option value="수공예" <%= "수공예".equals(request.getAttribute("selected_Category")) ? "selected" : "" %>>수공예</option>
    				<option value="드로잉" <%= "드로잉".equals(request.getAttribute("selected_Category")) ? "selected" : "" %>>드로잉</option>
    				<option value="음악" <%= "음악".equals(request.getAttribute("selected_Category")) ? "selected" : "" %>>음악</option>
    				<option value="스포츠" <%= "스포츠".equals(request.getAttribute("selected_Category")) ? "selected" : "" %>>스포츠</option>
  				</select>
  				
  				<input class="search_btn" type="submit" value="검색하기" />
  				
			</form>
		</div>

  		<table class="table">
    		<thead>
      			<tr>
        			<th>클래스명</th>
        			<th>가격</th>
        			<th>가용인원</th>
        			<th>주소</th>
      			</tr>
    		</thead>
    		<tbody>
    			<c:forEach var="product" items="${list}"> 
	      			<tr>
	        			<td><a class="sub_link" href='/product/sub?product_no=${product.product_no}'>${product.product_title}</a></td>
	        			<td>${product.price_per_person}원</td>
	        			<td>1~${product.max_capacity}명</td>
	        			<td>${product.location}</td>
	      			</tr>
    			</c:forEach>
    		</tbody>
  		</table>
  		
	</div>
	
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	
	<script>
	
	
	
	</script>
	
</body>
</html>