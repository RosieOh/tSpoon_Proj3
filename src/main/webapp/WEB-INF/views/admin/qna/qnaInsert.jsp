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
	<title>공지사항 글 쓰기</title>
	<!-- 헤드 부분 인클루드 -->
	<jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<header id="header">
	<!-- 헤더 부분 인클루드 -->
	<jsp:include page="../include/hd.jsp"></jsp:include>
</header>
<div class="container is-fullhd">
	<!-- 헤더 부분 인클루드 -->
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
					<c:if test='${lev == 0}'>
						<span class="title">묻고 답하기 - 질문 작성 </span>
					</c:if>
					<c:if test='${lev == 1}'>
						<span class="title">묻고 답하기 - 답변 작성 </span>
					</c:if>
				</div>
			</div>

			<div class="formwrap">
				<form action="${path1 }/qna/insert.do" method="post">
					<div class="field">
						<c:if test="${lev == 0}">
							<label class="label" for="title">질문 제목</label>
							<div class="control">
								<input type="text" name="title" id="title" placeholder="질문 제목" class="input" maxlength="98" required>
							</div>
						</c:if>
						<c:if test="${lev == 1}">
							<label class="label" for="title">질문 제목</label>
							<div class="control">
								<input type="text" name="title" id="title2" placeholder="답변 제목" class="input" maxlength="98" required>
							</div>
						</c:if>
						<input type="hidden" name="lev" id="lev" value="${lev }">
						<input type="hidden" name="par" id="par" value="${par }">
						<input type="hidden" name="author" id="author" value="${sid }">
					</div>
					<div class="field">
						<c:if test="${lev == 0}">
							<label class="label" for="content">질문 내용</label>
							<textarea name="content" id="content" placeholder="질문 내용" class="textarea" rows="8" cols="100" maxlength="1400" required></textarea>
						</c:if>
						<c:if test="${lev == 1}">
							<label class="label" for="content">답변 내용</label>
							<textarea name="content" id="content2" placeholder="답변 내용" class="textarea" rows="8" cols="100" maxlength="1400" required></textarea>
						</c:if>
					</div>
					<button type="submit" class="button post-btn">글 등록</button>
				</form>
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