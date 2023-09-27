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
	<title>묻고 답하기</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
	<header id="header">
		<!-- 헤더 부분 인클루드 -->
	 	<jsp:include page="../include/hd.jsp"></jsp:include>
    </header>
	
	<div class="content" id="content">
	    <div class="row column text-center">
			<c:if test='${dto.lev == 0}'>
			<h2 class="h1">질문 상세</h2>
			</c:if>
			<c:if test='${dto.lev == 1}'>
				<h2 class="h1">답변 상세</h2>
			</c:if>
	      <hr>
	      <div class="container">
		      <table id="table1">
		      	<tbody>
		
		      		<tr>
		      			<th style="background-color:#dcdcdc">글 번호</th>
		      			<td>${dto.qno }</td>
		      		</tr>	
		      		<tr>
		      			<th style="background-color:#dcdcdc">글 제목</th>
		      			<td>${dto.title }</td>
		      		</tr>
		      		<tr>
		      			<th style="background-color:#dcdcdc">글 내용</th>
		      			<td><p>${dto.content }</p></td>
		      		</tr>
		      		<tr>
		      			<th style="background-color:#dcdcdc">작성일시</th>
		      			<td>${dto.resdate }</td>
		      		</tr>
					<tr>
						<th style="background-color:#dcdcdc">작성자</th>
						<td>${dto.name }</td>
					</tr>
		      		<tr>
		      			<th style="background-color:#dcdcdc">읽은 횟수</th>
		      			<td>${dto.visit }</td>
		      		</tr>
		      	</tbody>
		      </table>
			  <div class="button-group">
				  <a class="button" href="${path1 }/qna/list.do">글 목록</a>
			  </div>
			  <%-- <c:if test='${sid eq "admin"}' >  --%>
			  <div class="button-group">
				  <a class="button" href="${path1 }/qna/delete.do?qno=${dto.qno}">글 삭제</a>
				  <a class="button" href="${path1 }/qna/edit.do?qno=${dto.qno}&lev=${dto.lev}">글 수정</a>
			  </div>
			  <%-- </c:if> --%>
			  <%-- <c:if test='${!empty sid && lev == 0}'>  --%>
			  <div class="button-group">
				  <a class="button" href="${path1 }/qna/insert.do?lev=1&par=${dto.qno}">답변</a>
			  </dic
			  <%-- </c:if> --%>
		  </div>
	    </div>
	</div>
    <footer id="footer" class="footer-nav row expanded collapse">
    	<!-- 푸터 부분 인클루드 -->
    	<jsp:include page="../include/ft.jsp"></jsp:include>
    </footer>
</body>
</html>