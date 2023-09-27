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
	<title>공지사항 글</title>
	<!-- 헤드 부분 인클루드 -->
	<jsp:include page="../include/head.jsp"></jsp:include>
	<style>
		.commentnull {
			min-height: 100px;
			text-align: center;
			width: 100%;
			margin: 72px 0px 0px 5px;
			font-size: 20px;
			font-weight: 700;
		}

	</style>
</head>
<body>
<header id="header">
	<!-- 헤더 부분 인클루드 -->
	<jsp:include page="../include/hd.jsp"></jsp:include>
</header>
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
					<span class="title">공지사항</span>
				</div>
			</div>

			<div class="card article">
				<div class="card-content">
					<div class="media">
						<div class="media-content has-text-centered">
							<h1 class="title article-title">${dto.title }</h1>
							<h6 class="subtitle is-6 article-subtitle">
								관리자 | ${dto.resdate } | 조회수:${dto.visit }
							</h6>
						</div>
					</div>
					<hr>

					<div class="content article-body">
						<p style="padding: 20px 100px; min-height: 100px; font-size: 18px;">
							${dto.content }
						</p>
					</div>
				</div>
				<div class="columns">
					<c:choose>
						<c:when test="${sid eq 'admin'}">
							<div class="column is-3"></div>
							<div class="column is-2">
								<a class="button is-fullwidth is-info" href="${path1 }/notice/list.do" style="background-color: #2B3A55;">글 목록</a>
							</div>
							<div class="column is-2">
								<a class="button is-fullwidth is-info" href="${path1 }/notice/edit.do?nno=${dto.nno}" style="background-color: #2B3A55;">글 수정</a>
							</div>
							<div class="column is-2">
								<a class="button is-fullwidth is-danger" href="${path1 }/notice/delete.do?nno=${dto.nno}">글 삭제</a>
							</div>
							<div class="column is-3"></div>
						</c:when>
						<c:otherwise>
							<div class="column is-5"></div>
							<div class="column is-2">
								<a class="button is-fullwidth is-info" href="${path1 }/notice/list.do" style="background-color: #2B3A55;">글 목록</a>
							</div>
							<div class="column is-5"></div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<div class="cmtwrap">
				<c:if test="${!empty sid}">
				<form action="${path1 }/notice/detail.do?nno=${dto.nno }" method="post" class="columns mt-5">
					<div class="column is-10">
						<textarea class="textarea" name="content" id="content" placeholder="댓글을 입력해주세요." rows="2" cols="30" maxlength="800" required></textarea>
						<input type="hidden" name="author" id="author" value="${sid }">
						<input type="hidden" name="nno" id="nno" value="${dto.nno }">
					</div>
					<div class="column is-2">
						<button type="submit" class="button is-fullwidth submission">등록</button>
					</div>
				</form>
				</c:if>
				<c:if test="${empty sid}">
				<div class="column is-12">
					<div class="commentnull">「 댓글을 작성하시려면 로그인을 해주세요 ! 」</div>
				</div>
				</c:if>
			</div>
			<div class="column is-12">
			<c:forEach items="${commentList }" var="comment" varStatus="status">
			<article class="media">
				<figure class="media-left">
					<div class="image is-64x64" style="border-radius: 50%; background-color: #2B3A55; color: #ffffff; ">
						<p style=" color: #ffffff; text-align: center; padding: 20px 0px;">
							${comment.name }
						</p>
					</div>
				</figure>
				<div class="media-content">
					<div class="content">
						<p style="line-height: 1.3;">
							<strong>${comment.name }</strong> <small> ${comment.author }</small> <small> ${comment.resdate }</small>
							<br>
						<p style="color: black; line-height: 1.3;">${comment.content }</p>
						</p>
					</div>
				</div>
				<c:if test='${sid eq comment.author }'>
				<div class="media-right">
					<a class="delete" style="background-color: #2B3A55" href="${path1 }/notice/commentDelete.do?nno=${dto.nno }&cno=${comment.cno }">x</a>
				</div>
				</c:if>
			</article>
			</c:forEach>
			</div>
		</div>
	</div>
</div>
<footer id="footer" class="footer-nav row expanded collapse">
	<!-- 푸터 부분 인클루드 -->
	<jsp:include page="../include/ft.jsp"></jsp:include>
</footer>
</body>
</html>