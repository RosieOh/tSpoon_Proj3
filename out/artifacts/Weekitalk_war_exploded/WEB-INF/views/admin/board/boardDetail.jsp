<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>관리자 페이지</title>
	<!-- 헤드 부분 인클루드 -->
	<jsp:include page="../../include/head.jsp"></jsp:include>

	<style>
		.menu_item {
			color: #333;
		}
		.menu_item:hover {
			color: #333;
			font-weight: bold;
		}
	</style>

	<!-- Chart.js -->
	<script src="https://cdn.jsdelivr.net/npm/chart,js@2.8.0"></script>
</head>
<body>
<header id="header">
	<!-- 헤더 부분 인클루드 -->
	<jsp:include page="../../include/hd.jsp"></jsp:include>
</header>

<div class="content" id="content">
	<div class="row column text-center">
		<h2 class="h1">관리자 페이지</h2>
		<hr>
		<div class="container">
			<!-- 여기에 관리자 페이지의 내용을 추가하세요 -->
			<table>
				<thead>
				<tr>
					<th width="80">No</th>
					<th>Title</th>
					<th width="120">RegDate</th>
					<th width="100">Visited</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${boardList }" var="board" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td><a href="${path1}/board/detail.do?seq=${board.seq }">${board.title }</a></td>
						<td>
							<fmt:parseDate value="${board.regdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
							<fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
						</td>
						<td>${board.visited }</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>

			<div class="button-group">
				<a class="button" href="${path1 }/board/insert.do">글쓰기</a>
			</div>
		</div>
	</div>
</div>
<footer id="footer" class="footer-nav row expanded collapse">
	<!-- 푸터 부분 인클루드 -->
	<jsp:include page="../../include/ft.jsp"></jsp:include>
</footer>
</body>
</html>
