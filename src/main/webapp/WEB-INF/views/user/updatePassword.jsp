<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>GameZone | 비밀번호 수정</title>
	<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
	<link rel="stylesheet" href="resources/css/owl.carousel.css" />
	<link rel="stylesheet" href="resources/css/style.css" />
	<link rel="stylesheet" href="resources/css/animate.css" />
	<link rel="shortcut icon" href="resources/img/icon2.ico">
	<script src="resources/js/jquery-3.2.1.min.js"></script>
	<script src="resources/myLib/inCheck.js"></script>
	<script>
		
		let pCheck = false;
		let ppCheck = false;	
		
		$(function() {
			
			$('#oldPassword').focus();
			
			// ** Password
			$('#oldPassword').keydown(function(e) {
				if (e.which == 13) {
					e.preventDefault();
					$('#password').focus();
				}
			}).focusout(function() {
				pCheck = pwCheck();
			}); // oldPassword
	
			// ** Password
			$('#password').keydown(function(e) {
				if (e.which == 13) {
					e.preventDefault();
					$('#password2').focus();
				}
			}).focusout(function() {
				ppCheck = pw2Check();
			}); // password
			
			// ** Password
			$('#password2').keydown(function(e) {
				if (e.which == 13) {
					e.preventDefault();
					$('#submit').focus();
				}
			}).focusout(function() {
				ppCheck = pw2Check();
			}); // password2
			
		}); // ready
		
		function inCheck() {
			
			if (pCheck == false) {
				$('#pMessage').html('Password를 확인하세요 !!');
			}
			
			if (ppCheck == false) {
				$('#ppMessage').html('Password가 일치하지 않습니다 !!');
			}
			
			if (pCheck && ppCheck) {
				
				if (confirm("비밀번호를 변경하시겠습니까 ? (Yes:확인 / No:취소)") == false) {
					alert('비밀번호 변경 취소되었습니다.');
					return false;
					
				} else
					alert('비밀번호를 변경하겠습니다.');
					return true;
				
			} else
				return false;
			
		} // inCheck()
		
		function updatePW() {
			
			if (confirm("수정하시겠습니까? (Yes : 확인 / No : 취소)")) {
				alert(`비밀번호를 수정하겠습니다.`);
	           	return true; // 삭제
	           	
			} else {
	           	alert('비밀번호 수정 취소되었습니다.');
				return false;
			}
			
		} // updatePW
	
	</script>
</head>
<body>
	<!-- Header section -->
   	<header class="header-section">
    	<div>
        	<!-- logo -->
         	<a class="site-logo" href="home">
	        	<img src="resources/img/logo22.png" alt="gamelogo">
	        </a>
         	<!-- site menu -->
         	<nav class="main-menu">
            	<ul>
               		<li><a href="home">Home</a></li>
               		<li><a href="axPcGame">PC 게임조회</a></li>
               		<li><a href="axMobileGame">모바일 게임조회</a></li>
	               	<li><a href="axFlashGame">플래시 게임</a></li>
	               	<li><a href="boardList">자유 게시판</a></li>
	               	<li><a href="qnaBoardList">Q&amp;A</a></li>
            	</ul>
         	</nav>
         	<div class="user-panel">
            	<c:choose>
               		<c:when test="${not empty loginID && loginID != 'admin'}">
                  		<a href="detailUser">내 정보 보기</a> / <a href="logout">로그아웃</a>
               		</c:when>
               		<c:when test="${loginID == 'admin'}">
                  		<a href="userList">회원 리스트</a> / <a href="logout">로그아웃</a>
               		</c:when>
               		<c:otherwise>
                  		<a href="loginUser">로그인</a> / <a href="joinForm">회원가입</a>
               		</c:otherwise>
            	</c:choose>
         	</div>
      	</div>
   	</header>
   	<!-- Header section end -->
	<form action="updatePassword" method="post" id="myForm">
		<table style="width: 100;">
			<tr height="40">
				<th bgcolor="LightCoral" style="text-align: center;"><label for="oldPassword">현재 비밀번호</label></th>
				<td>
					<input type="password" name="oldPassword" id="oldPassword" size="20" placeholder="현재 비밀번호">
					<b><span id="pMessage" class="eMessage"></span></b>
				</td>
			</tr>

			<tr height="40">
				<th bgcolor="LightCoral" style="text-align: center;"><label for="password">새 비밀번호</label></th>
				<td>
					<input type="password" name="password" id="password" size="20" placeholder="특수문자 반드시 포함">
					<b><span id="pMessage" class="eMessage"></span></b>
				</td>
			</tr>

			<tr height="40">
				<th bgcolor="LightCoral" style="text-align: center;"><label for="password2">새 비밀번호 확인</label></th>
				<td>
					<input type="password" name=password2 id=password2 size="20">
					<b><span id="ppMessage" class="eMessage"></span></b>
				</td>
			</tr>

			<tr height="40">
				<td></td>
				<td>
					<input type="submit" value="수정" onclick="return updatePW()">&nbsp;&nbsp;
					<a href="javascript:history.go(-1)">취소</a>
				</td>
			</tr>
		</table>
	</form>
	<c:if test="${not empty message}">
		<hr>
			${message}<br>
	</c:if>
	<!-- Footer section -->
    <footer class="footer-section">
    	<div class="container">
        	<ul class="footer-menu">
            	<li><a href="home">Home</a></li>
             	<li><a href="axPcGame">PC 게임</a></li>
             	<li><a href="axMobileGame">모바일 게임</a></li>
             	<li><a href="boardList">자유 게시판</a></li>
             	<li><a href="qnaBoardList">Q&amp;A</a></li>
          	</ul>
          	<p class="copyright">
            	Copyright &copy;
            	<script>document.write(new Date().getFullYear());</script>
             	All rights reserved | This project is made with 
             	<i class="fa fa-heart-o" aria-hidden="true"></i> by 
             	<a href="#" target="_blank">GameZone</a>
          	</p>
       	</div>
    </footer>
    <!-- Footer section end -->
</body>
</html>