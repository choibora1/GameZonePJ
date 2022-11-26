<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** Ranking List **</title>
    <link rel="stylesheet" href="resources/css/rank.css" />
    <link rel="stylesheet" href="resources/css/style.css" />
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" />
</head>
<body>
	<table class="rank_table">
		<tr>
			<th> 게임 검색 순위 </th>
		</tr>
		<c:if test="${not empty rank}">
			<c:forEach var="rank" items="${rank}">
				<tr height="30">
					<td><a class="rank_list" href="detailPcGame?game_name=${rank.game_name}">${rank.game_name}</a></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</body>
</html>