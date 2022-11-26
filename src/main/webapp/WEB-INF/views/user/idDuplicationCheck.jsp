<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>GameZone | ID 중복확인</title>
	<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
	<link rel="stylesheet" href="resources/css/owl.carousel.css" />
	<link rel="stylesheet" href="resources/css/style.css" />
	<link rel="stylesheet" href="resources/css/animate.css" />
	<link rel="shortcut icon" href="resources/img/icon2.ico">
	<script src="resources/js/jquery-3.2.1.min.js"></script>
	<script src="resources/myLib/inCheck.js"></script>
	<script>
		function idOK() {
			opener.$('#id').val('${newId}');
			
		// ---------------------------------------------------------------------------------------------------------
			
			// ** JQ ver.
			opener.$('#submit').attr('disabled', false); // 적용 됨.
			opener.$('#idDupCheck').attr('disabled', 'disabled');

			// => id가 확정되었으므로 수정 불가 -> readonly
			opener.$('#id').prop('readonly', true);
			opener.$('#password').focus();

			window.close();
			// close();, self.close();, this.close(); -> 확인 필요
			
		} // idOK
	</script>
	
	<style>
		body {
	      /* background-color: LightYellow; */
	      font-family: 맑은고딕;
	   }
	   
	   /* #wrap {
	      margin-left: 0;
	      text-align: center;
	   } */
	   
	   h3 { 
	   	color: navy;
	   }
	</style>
</head>
	<body>
	
		<div id="Wrap">
			<h3>GameZone | ID 중복 확인</h3>
			<form action="idDuplicationCheck" method="get">
				User_ID : 
				<input type="text" name="id" id="id">&nbsp;
				<input type="submit" value="ID 중복확인" onclick="return idCheck()">
				<!-- inCheck.js의 idCheck()의 결과에 따라 submit 결정 -->
				<span id="iMessage" class="eMessage"></span>
			</form>
			<br><br>
			<hr>
			<!-- ** 서버의 확인 결과에 따른 처리 영역
				=> isUse : 'T' 가능 / 'F' 불가능 -->
			<div id="msgBlock">
				<c:if test="${isUse == 'T'}">
					${newId}는(은) 사용 가능합니다.&nbsp;&nbsp;
					<input type="button" value="사용" onclick="idOK()">
					<!-- 사용자가 입력한 ID를 사용 가능하도록 해주고, 현재(this)창은 close -->
				</c:if>
				
				<c:if test="${isUse == 'F'}">
					${newId}는(은) 사용 불가능합니다. (사용중이거나 탈퇴한 ID입니다)<br>
					다시 입력하세요.
					<!-- 부모창(joinForm, opener)에 남아있는 사용자가 입력한 id는 지워주고,
						현재(this)창에서는 id에 focus를 주고 재입력 유도 -> script 필요 -->
					<script>
						$('#id').focus();
						opener.document.getElementById('id').value='';
					</script>
				</c:if>
			</div>
		</div>
	
	</body>
</html>