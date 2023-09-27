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
	
	<div class="content" id="contents">
	    <div class="row column text-center">
			<c:if test='${lev == 0}'>
				<h2 class="h1">질문 작성</h2>
			</c:if>
			<c:if test='${lev == 1}'>
				<h2 class="h1">답변 작성</h2>
			</c:if>
			<hr>
	      <div class="container">
	      	<form action="${path1 }/qna/insert.do" method="post">
			      <table id="table1">
			      	<tbody>
			      		<tr>
							<c:if test="${lev == 0}">
								<th style="background-color:#dcdcdc">QNA 제목</th>
							</c:if>
							<c:if test="${lev == 1}">
								<th style="background-color:#dcdcdc">답변 제목</th>
							</c:if>
			      			<td>
			      				<input type="text" name="title" id="title" placeholder="제목 입력" maxlength="98" required>
								<input type="hidden" name="lev" id="lev" value="${lev }">
								<input type="hidden" name="par" id="par" value="${par }">
								<input type="hidden" name="author" id="author" value="${sid }">
			      			</td>
			      		</tr>
			      		<tr>
							<c:if test="${lev == 0}">
								<th style="background-color:#dcdcdc">QNA 내용</th>
							</c:if>
							<c:if test="${lev == 1}">
								<th style="background-color:#dcdcdc">답변 내용</th>
							</c:if>
							<td>
			      				<textarea name="content" id="content" placeholder="내용 입력" rows="8" cols="100" maxlength="800" required></textarea>
			      			</td>
			      		</tr>
			      		<tr>
			      			<td colspan="2">
			      				<input type="submit" class="submit success button" value="글 등록" >
			      				<a class="button" href="${path1 }/qna/list.do">글 목록</a>
			      			</td>
			      		</tr>
			      	</tbody>
			      </table>
			   </form>   
	      </div>
	    </div>
	</div>
    <footer id="footer" class="footer-nav row expanded collapse">
    	<!-- 푸터 부분 인클루드 -->
    	<jsp:include page="../include/ft.jsp"></jsp:include>
    </footer>
</body>
</html>