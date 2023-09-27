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
	<title>자유 게시판 글쓰기</title>
	<!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
	<!-- <script src="https://cdn.ckeditor.com/4.20.0/standard/ckeditor.js"></script> -->
	<script type="text/javascript" src="${path1 }/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
<div class="container is-fullhd">
	<!-- 헤더 부분 인클루드 -->
	<jsp:include page="../include/hd.jsp"></jsp:include>
	<div class="columns">
		<div class="column is-2">
			<aside class="menu">
				<span class="box has-text-white has-text-weight-semibold has-text-centered is-size-5">
					커뮤니티
				</span>
				<ul class="menu-list">
					<li>
						<a href="${path1}/free/list.do">자유게시판</a>
					</li>
					<li>
						<a href="${path1}/booktalk/list.do">교재게시판</a>
					</li>
				</ul>
			</aside>
		</div>
		<div class="column is-10">
			<div class="conwrap">
				<div class="box">
					<span class="title">자유게시판</span>
				</div>
			</div>

			<div class="formwrap">
				<form action="${path1 }/free/insert.do" method="post">
					<div class="field">
						<label class="label" for="title">제목</label>
						<div class="control">
							<input type="text" name="title" id="title" class="input" maxlength="98" required>
						</div>
					</div>
					<div class="field">
						<label class="label" for="content">내용</label>
						<textarea name="content" id="content" class="textarea" rows="8" cols="100" maxlength="1400" required></textarea>
						<script>
							CKEDITOR.replace('content',	{filebrowserUploadUrl:'${path1}/free/imageUpload.do'});
						</script>
					</div>
					<button type="submit" class="button post-btn">글 등록</button>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- 푸터 부분 인클루드 -->
<jsp:include page="../include/ft.jsp"></jsp:include>
</body>
</html>