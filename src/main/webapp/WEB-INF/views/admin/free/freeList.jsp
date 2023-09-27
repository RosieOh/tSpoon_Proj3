<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>자유게시판 목록</title>
	<!-- 헤드 부분 인클루드 -->
	<jsp:include page="../../include/head.jsp"></jsp:include>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
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
		.cmtNum {
			margin-left: 3px;
			font-size: 17px;
			color: #CE7777;
		}
		.media-right {
			margin: -34px 3px 0 0;
		}
	</style>
</head>
<body>
<!-- 헤더 부분 인클루드 -->
<div class="container is-fullhd">
	<jsp:include page="../../include/hd.jsp"></jsp:include>
	<div class="columns">
		<jsp:include page="../include/admin_bookMenu.jsp"/>
		<div class="column is-10">
			<div class="conwrap">
				<div class="box">
					<span class="title">자유게시판</span>
				</div>
				<div class="box content">
					<c:forEach items="${freeList}" var="free" varStatus="status">
						<article class="post">
							<div class="media">
								<div class="media-content">
									<div class="content">
										<h4>
											<a href="${path1}/free/detail.do?bno=${free.bno}">${free.title}</a>
											<c:if test="${free.count != 0}">
												<span class="cmtNum">(${free.count})</span>
											</c:if>
										</h4>
										<!-- 작성자 정보 -->
										<div class="media">
											<div class="media-content">
												<p class="has-text-grey">${free.id}</p>
												<p class="has-text-grey">${free.regdate}</p>
											</div>
										</div>
										<!-- 수정 및 삭제 버튼 -->
										<c:if test="${sid.equals('admin')}">
											<div class="button-group" style="float: right;">
												<a href="${path1}/free/edit.do?bno=${free.bno}" class="button is-link">수정</a>
												<a href="${path1}/free/delete.do?bno=${free.bno}" class="button is-danger">삭제</a>
											</div>
										</c:if>
									</div>
								</div>
							</div>
						</article>
					</c:forEach>
				</div>

				<nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
					<ul class="pagination-list">
						<!-- 페이지 번호 표시 -->
					</ul>
				</nav>

				<div class="button-group">
					<c:choose>
						<c:when test="${not empty sid}">
							<a class="button post-btn" href="${path1}/free/insert.do">글쓰기</a>
						</c:when>
						<c:otherwise>
							<a class="button post-btn" href="javascript:checkLogin()">글쓰기</a>
						</c:otherwise>
					</c:choose>
					<form action="${path1}/free/list.do" method="get" class="field has-addons has-addons-right">
						<p class="control">
                            <span class="select">
                                <select id="type" name="type">
                                    <option value="title">제목</option>
                                    <option value="content">내용</option>
                                </select>
                            </span>
						</p>
						<p class="control">
							<input class="input" type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요" value="${keyword}">
						</p>
						<p class="control">
							<input type="submit" class="button is-mainColor" value="검색" />
						</p>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 푸터 부분 인클루드 -->
<jsp:include page="../../include/ft.jsp"></jsp:include>

<script>
	function checkLogin() {
		var confirmLogin = confirm("글 작성은 로그인이 필요합니다. 로그인하시겠습니까?");
		if (confirmLogin) {
			location.href = '${path1}/member/login.do';
		}
	}
</script>
</body>
</html>
