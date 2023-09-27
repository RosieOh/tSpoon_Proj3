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
	<title>당첨자 게시판 목록</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../../include/head.jsp"></jsp:include>
</head>
<style>
	.content ul {
		list-style-type: none;
	}
	.content ul >li {
		list-style-type: none;
	}
	.icon {
		color: #2B3A55;
	}
	.menu-list a {
		min-width: 159px;
	}
	.pagination-link.is-current {
		background-color:#2B3A55;
		border-color: #2B3A55;
	}
	.pagination-link {
		background-color: #ffffff;
	}
	.select:not(.is-multiple):not(.is-loading)::after {
		border-color: #2B3A55;
	}
	form.field.has-addons.has-addons-right {
		float: right;
		padding-top: 3px;
	}
</style>
<body>
<!-- 헤더 부분 인클루드 -->
<div class="container is-fullhd" style="min-height: 100vh;">	<!-- 푸터 아래 여백 남는거 수정 -->
	<jsp:include page="../../include/hd.jsp"></jsp:include>
	<div class="columns">
		<jsp:include page="../include/admin_eventSideMenu.jsp" />
		<div class="column is-10">
			<div class="conwrap">
				<div class="box">
					<span class="title">당첨자 게시판</span>
				</div>

			<div class="button-group">
				<c:if test="${sid.equals('admin')}">
					<a class="button post-btn" href="${path1 }/winner/insert.do">당첨자 등록</a>
				</c:if>
			</div>
				<br>
				<br>
			<div class="box content">
				<c:forEach items="${winnerList }" var="winner" varStatus="status">
					<article class="post">
						<h4><a href="${path1}/winner/detail.do?bno=${winner.bno }">${winner.title }</a></h4>
						<div class="media">
							<div class="media-content">
								<div class="content">
									<p>
										조회수
										<span>${winner.visited }</span>
										| 추천수
										<span>${winner.rec }</span>
									</p>
								</div>
							</div>
							<div class="media-right">
								<span class="has-text-grey-light"><i class="fa fa-comments"></i> 1</span>
							</div>
						</div>
						<!-- 수정 및 삭제 버튼 -->
						<c:if test="${sid.equals('admin')}">
							<div class="button-group" style="float: right;">
								<a href="${path1}/winner/edit.do?bno=${winner.bno}" class="button is-link">수정</a>
								<a href="${path1}/winner/delete.do?bno=${winner.bno}" class="button is-danger">삭제</a>
							</div>
						</c:if>
					</article>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
</div>
<!-- 푸터 부분 인클루드 -->
<jsp:include page="../../include/ft.jsp"></jsp:include>
<style>
	body {
		margin-bottom: 0;
	}
</style>
</body>
</html>