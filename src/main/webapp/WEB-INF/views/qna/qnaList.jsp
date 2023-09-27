<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
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
	<jsp:include page="../include/head.jsp"></jsp:include>
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
<jsp:include page="../include/hd.jsp"></jsp:include>
<div class="container is-fullhd">
	<div class="columns">
		<div class="column is-2">
			<aside class="menu">
				<span class="box has-text-white has-text-weight-semibold has-text-centered is-size-5">
					고객센터
				</span>
				<ul class="menu-list">
					<li>
						<a href="${path1 }/notice/list.do">공지사항</a>
					</li>
					<li>
						<a href="${path1 }/qna/list.do">묻고 답하기</a>
					</li>
					<li>
						<a href="${path1 }/faq/list.do">자주 묻는 질문</a>
					</li>
				</ul>
			</aside>
		</div>
		<div class="column is-10">
			<div class="conwrap">
				<div class="box">
					<%--<h6>자유게시판</h6>--%>
					<span class="title">묻고 답하기</span>
				</div>
				<div class="columns">
					<div class="column is-6">
						<div class="card events-card">
							<header class="card-header">
								<p class="card-header-title">조회수 높은 글</p>
							</header>
							<div class="card-table">
								<div class="content">
									<div class="table is-fullwidth is-striped">
										<c:forEach items="${selectVisit }" var="visit" varStatus="status">
											<a href="${path1}/qna/detail.do?qno=${visit.qno }&lev=${visit.lev }">
												<div> <i class="fa fa-solid fa-seedling" style="color: #2B3A55; margin: 11px 11px;"></i>  ${visit.title }</div>
											</a>
											<hr style=" margin: 0.5rem 0;"/>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="column is-6">
						<div class="card events-card">
							<header class="card-header">
								<p class="card-header-title">답변 많은 글</p>
							</header>
							<div class="card-table">
								<div class="content">
									<div class="table is-fullwidth is-striped">
										<c:forEach items="${selectBest }" var="best" varStatus="status">
											<a href="${path1}/qna/detail.do?qno=${best.qno }&lev=${best.lev }">
											<div> <i class="fa fa-solid fa-fire" style="color: #2B3A55; margin: 11px 11px;"></i>  ${best.title }</div>
											</a>
											<hr style=" margin: 0.5rem 0;"/>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="box content">
				<c:forEach items="${qnaList }" var="qna" varStatus="status">
					<c:set var="prevPar" value="${status.index == 0 ? -1 : qnaList[status.index - 1].par}" />
					<c:if test="${qna.par != prevPar}">
						<br/>
					</c:if>
					<div class="card">
						<div class="card-content">
							<fmt:parseDate value="${qna.resdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
							<div class="content">
								<a href="${path1}/qna/detail.do?qno=${qna.qno }&lev=${qna.lev }">
									<c:if test='${qna.lev == 0 }'>
										<h4 style="font-size: 1.19em;">${qna.title }</h4>
									</c:if>
									<c:if test='${qna.lev == 1 }'>
<%--										<img src="${path1 }/resources/img/icon_reply.png" alt="[답변]">--%>
										<h4 style="font-size: 1.19em;"><i class="fa fa-solid fa-reply fa-rotate-180" style="color: #2B3A55;"></i> ${qna.title }</h4>
									</c:if>
								</a>
								<div class="media">
									<div class="media-content">
										<div class="content">
											<p>
												조회수
												<span>${qna.visit }</span>
												<c:forEach items="${commentCount }" var="count" varStatus="status">
													<c:if test="${count.qno eq qna.qno }">
														<i class="fa fa-solid fa-comment-dots" style="color: #2B3A55; margin: 11px 2px 11px 11px;"></i>
														<span>${count.count }</span>
													</c:if>
												</c:forEach>
											</p>
										</div>
									</div>
									<div class="media-right">
											<%--								<span class="has-text-grey-light"><i class="fa fa-comments"></i> 1</span>--%>
										<fmt:parseDate value="${qna.resdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
										<span style="float:right; font-weight: bold;"><fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" /> </span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
				<c:if test="${curPage > page.pageCount }">
					<a href="${path1 }/qna/list.do?page=${page.blockStartNum - 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-previous">Previous</a>
				</c:if>
				<c:if test="${page.blockLastNum < page.totalPageCount }">
					<a href="${path1 }/qna/list.do?page=${page.blockLastNum + 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-next">Next page</a>
				</c:if>

				<ul class="pagination-list">
					<c:forEach var="i" begin="${page.blockStartNum }" end="${page.blockLastNum }">
						<c:choose>
							<c:when test="${i == curPage }">
								<li>
									<a href="${path1 }/qna/list.do?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link is-current" aria-label="Page ${i }" aria-current="page" >${i }</a>
								</li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="${path1 }/qna/list.do?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link" aria-label="Page ${i }" aria-current="page">${i }</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</ul>
			</nav>
				<div class="button-group">
					<c:if test='${!empty sid}'>
					<a class="button post-btn" href="${path1 }/qna/insert.do?lev=0&par=0">질문</a>
					</c:if>
					<form action="${path1 }/qna/list.do" method="get" class="field has-addons has-addons-right">
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
<!-- 푸터 부분 인클루드 -->
<jsp:include page="../include/ft.jsp"></jsp:include>
</body>
</html>