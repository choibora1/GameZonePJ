<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>** UserDetail **</title>
	<!-- Stylesheets -->
	<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
	<link rel="stylesheet" href="resources/css/owl.carousel.css" />
	<link rel="stylesheet" href="resources/css/style.css" />
	<link rel="stylesheet" href="resources/css/animate.css" />
<script src="resources/js/jquery-3.2.1.min.js"></script>
</head>
<body>
	<!-- Header section -->
	<header class="header-section">
		<div class="container">
			<!-- logo -->
			<a class="site-logo" href="index.html">
				<img src="resources/img/logo.png" alt="">
			</a>
			<div class="user-panel">
			<c:if test="${empty loginID}">
				<a href="loginf">로그인</a> / <a href="joinf">회원가입</a>
			</c:if>
			<c:if test="${not empty loginID}">
				<a href="logout">로그아웃</a>
			</c:if>
			</div>
			<!-- responsive -->
			<div class="nav-switch">
				<i class="fa fa-bars"></i>
			</div>
			<!-- site menu -->
			<nav class="main-menu">
				<ul>
					<li><a href="home">Home</a></li>
					<li><a href="categories.html">PC 게임조회</a></li>
					<li><a href="categories.html">모바일 게임조회</a></li>
					<li><a href="blist">자유 게시판</a></li>
					<li><a href="review.html">쉼터</a></li>
					<li><a href="contact.html">1:1문의</a></li>
				</ul>
			</nav>
		</div>
	</header>

<c:if test="${not empty one}">
	<table style="text-align: center;">
	
		<tr height="40">
			<th bgcolor="MediumPurple" style="text-align: center;">Image</th>
			<td><img src="${one.uploadimg}" width="80" height="100"></td>
		</tr>
		
		<tr height="40">
			<th bgcolor="MediumPurple" style="text-align: center;">I D</th>
			<td>${one.id}</td>
		</tr>
		
		<tr height="40">
			<th bgcolor="MediumPurple" style="text-align: center;">Password</th>
			<td>${one.password}</td>
		</tr>
		
		<tr height="40">
			<th bgcolor="MediumPurple" style="text-align: center;">Name</th>
			<td>${one.uname}</td>
		</tr>
		
		<tr height="40">
			<th bgcolor="MediumPurple" style="text-align: center;">Birthday</th>
			<td>${one.birthday}</td>
		</tr>
		
		<tr height="40">
			<th bgcolor="MediumPurple" style="text-align: center;">Gender</th>
			<td>${one.gender}</td>
		</tr>
		
		
		<tr height="40">
			<th bgcolor="MediumPurple" style="text-align: center;">Email</th>
			<td>${one.email}</td>
		</tr>

		<tr height="40">
			<th bgcolor="MediumPurple" style="text-align: center;">Phone</th>
			<td>${one.phone}</td>
		</tr>
		
	</table>
</c:if>
		<!-- Footer section -->
	<footer class="footer-section">
		<div class="container">
			<ul class="footer-menu">
				<li><a href="index.html">Home</a></li>
				<li><a href="review.html">Games</a></li>
				<li><a href="categories.html">Blog</a></li>
				<li><a href="community.html">Forums</a></li>
				<li><a href="contact.html">Contact</a></li>
			</ul>
			<p class="copyright"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
</p>
		</div>
	</footer>
	<!-- Footer section end -->


	<!--====== Javascripts & Jquery ======-->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.marquee.min.js"></script>
	<script src="js/main.js"></script>
	<!-- 다른 페이지로 넘어가는거 -->
<c:if test="${not empty message}">
	${message}<br>
</c:if>

<br>
&nbsp;&nbsp;&nbsp;<a href="udetail?jCode=U&id=${one.id}">[내 정보 수정]</a>
&nbsp;&nbsp;&nbsp;<a href="udetail?jCode=P&id=${one.id}">[비밀번호 변경]</a>
<!-- password 수정하기 만들어야 됨 -->

&nbsp;&nbsp;&nbsp;<a href="udelete?id=${one.id}">[회원 탈퇴]</a><br>
<br>
&nbsp;&nbsp;&nbsp;<a href="javascript:history.go(-1)">[이전으로]</a>

</body>
</html>