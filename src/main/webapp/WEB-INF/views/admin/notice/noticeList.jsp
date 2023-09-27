<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>공지사항 목록</title>
	<!-- 헤드 부분 인클루드 -->
	<jsp:include page="../../include/head.jsp"></jsp:include>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
	<style>
		.content ul {
			list-style-type: none;
		}
		.content ul > li {
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
</head>
<body>
<!-- 헤더 부분 인클루드 -->
<jsp:include page="../../include/hd.jsp"></jsp:include>
<div class="container is-fullhd">
	<div class="columns">
		<jsp:include page="../include/admin_sidemenu.jsp" />
		<div class="column is-10">
			<div class="conwrap">
				<div class="box">
					<span class="title">공지사항</span>
				</div>
				<div class="box content">
					<c:forEach items="${noticeList }" var="notice" varStatus="status">
						<article class="post">
							<div class="media">
								<div class="media-content">
									<div class="content">
										<a href="${path1}/notice/detail.do?nno=${notice.nno }"><h4>${notice.title }</h4></a>
										<p>
											조회수
											<span>${notice.visit }</span>
											<c:forEach items="${commentCount }" var="count" varStatus="status">
												<c:if test="${count.nno eq notice.nno }">
													<i class="fa fa-solid fa-comment-dots" style="color: #2B3A55; margin: 11px 2px 11px 11px;"></i>
													<span>${count.count }</span>
												</c:if>
											</c:forEach>
										</p>
									</div>
								</div>
								<div class="media-right">
									<fmt:parseDate value="${notice.resdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
									<span style="float:right; font-weight: bold;"><fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" /> </span>
								</div>
							</div>
							<div class="buttons is-right">
								<c:if test="${sid eq 'admin'}">
									<a href="${path1}/notice/edit.do?nno=${notice.nno}" class="button is-link is-small">수정</a>
									<a href="${path1}/notice/delete.do?nno=${notice.nno}" class="button is-danger is-small">삭제</a>
								</c:if>
							</div>
						</article>
					</c:forEach>
				</div>
				<nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
					<c:if test="${curPage > page.pageCount }">
						<a href="${path1 }/notice/list.do?page=${page.blockStartNum - 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-previous">Previous</a>
					</c:if>
					<c:if test="${page.blockLastNum < page.totalPageCount }">
						<a href="${path1 }/notice/list.do?page=${page.blockLastNum + 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-next">Next page</a>
					</c:if>
					<ul class="pagination-list">
						<c:forEach var="i" begin="${page.blockStartNum }" end="${page.blockLastNum }">
							<c:choose>
								<c:when test="${i == curPage }">
									<li>
										<a href="${path1 }/notice/list.do?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link is-current" aria-label="Page ${i }" aria-current="page" >${i }</a>
									</li>
								</c:when>
								<c:otherwise>
									<li>
										<a href="${path1 }/notice/list.do?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link" aria-label="Page ${i }" aria-current="page">${i }</a>
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</ul>
				</nav>
				<div class="button-group">
					<c:if test='${sid eq "admin"}'>
						<a class="button post-btn" href="${path1 }/notice/insert.do">글쓰기</a>
					</c:if>
					<form action="${path1 }/notice/list.do" method="get" class="field has-addons has-addons-right">
						<p class="control">
                     <span class="select">
                        <select id="type" name="type">
                           <option value="title">제목</option>
                           <option value="content">내용</option>
                        </select>
                     </span>
						</p>
						<p class="control">
							<input class="input" type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요" value="${keyword }">
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
</body>
</html>
