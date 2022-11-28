<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>** Write Reply **</title>
</head>
<body>
	<div> <!-- 댓글 전체 start -->
		<div>
			<c:if test="${not empty list}">
				<c:forEach var="reply" items="${list}">
					<ul>
						<li>${one.id | one.regdate}</li>			
						<li>${one.content}</li>			
					</ul>
				</c:forEach>
			</c:if>
		</div> <!-- 댓글 리스트 -->
		
		<div>
			<c:if test="${not empty loginID}">
				<textarea rows="5" cols="100" name="content"></textarea>
				<input type="submit" value="등록" class="sclick">
			</c:if>
		</div> <!-- 댓글 폼 -->
	</div> <!-- 댓글 전체 end -->
</body>
</html>