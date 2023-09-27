<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>이벤트 게시판 글쓰기</title>
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
					이벤트
				</span>
				<ul class="menu-list">
					<li>
						<a href="${path1}/survey/list.do">이벤트 게시판</a>
					</li>
					<li>
						<a href="${path1}/winner/list.do">이벤트 당첨자</a>
					</li>
					<li>
						<a href="${path1}/survey/list.do">윜이슈(설문)</a>
					</li>
				</ul>
			</aside>
		</div>
		<div class="column is-10">
			<div class="conwrap">
				<div class="box">
					<span class="title">설문 등록</span>
				</div>
			</div>

			<div class="formwrap">
				<form action="${path1 }/survey/insert.do" method="post">
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
							CKEDITOR.replace('content',	{filebrowserUploadUrl:'${path1}/survey/imageUpload.do'});
						</script>
					</div>

					<div class="field">
						<label class="label" for="content">설문 1 내용</label>
						<input type="text" name="q1" id="q1" placeholder="설문 1" class="input" required>
					</div>
					<div class="field">
						<label class="label" for="content">설문 2 내용</label>
						<input type="text" name="q2" id="q2" placeholder="설문 2" class="input" >
					</div>
					<div class="field">
						<label class="label" for="content">설문 3 내용</label>
						<input type="text" name="q3" id="q3" placeholder="설문 3" class="input" >
					</div>
					<div class="field">
						<label class="label" for="content">설문 4 내용</label>
						<input type="text" name="q4" id="q4" placeholder="설문 4" class="input" >
					</div>
					<div class="field">
						<label class="label" for="content">설문 5 내용</label>
						<input type="text" name="q5" id="q5" placeholder="설문 5" class="input" >
					</div>
					<div class="field">
						<label class="label" for="content">설문 6 내용</label>
						<input type="text" name="q6" id="q6" placeholder="설문 6" class="input" >
					</div>
					<div class="field">
						<label class="label" for="content">설문 7 내용</label>
						<input type="text" name="q7" id="q7" placeholder="설문 7" class="input" >
					</div>
					<div class="field">
						<label class="label" for="content">설문 8 내용</label>
						<input type="text" name="q8" id="q8" placeholder="설문 8" class="input" >
					</div>
					<div class="field">
						<label class="label" for="content">설문 9 내용</label>
						<input type="text" name="q9" id="q9" placeholder="설문 9" class="input" >
					</div>
					<div class="field">
						<label class="label" for="content">설문 10 내용</label>
						<input type="text" name="q10" id="q10" placeholder="설문 10" class="input" >
					</div>

					<div class="columns">
						<div class="column is-3"></div>
						<div class="column is-2">
							<a class="button is-fullwidth is-primary" href="${path1 }/suvey/list.do">글 목록</a>
						</div>
						<div class="column is-2">
							<button type="submit" class="button is-fullwidth is-success">설문 등록</button>
						</div>
						<div class="column is-2">
							<button type="reset" class="button is-fullwidth is-danger">취소</button>
						</div>
						<div class="column is-3"></div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- 푸터 부분 인클루드 -->
<jsp:include page="../include/ft.jsp"></jsp:include>
</body>
</html>