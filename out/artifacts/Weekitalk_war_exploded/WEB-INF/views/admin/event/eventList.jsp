<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>이벤트 게시판 목록</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
	<style>
		.eventbox { clear:both; margin: 0; padding: 0; width: 1320px; height: auto;  position:relative; }
		.lst { list-style: none; clear:both; width: 1290px; margin-bottom: 30px; }

		.lst:after { content:""; display:block; width: 100%; clear:both; }
		.lst li { list-style: none; width: 600px; height: 340px; background-color:#fff; float:left; box-sizing:border-box; border:1px solid #333; margin-top: 0.25em;
			margin-left: 30px; margin-right: 30px; box-shadow: 3px; }
		.lst li:nth-child(2n) { margin-right: 0; }

		.box_wrap .list .row li { width:1200px; list-style:none; margin:20px auto;  }

	</style>
</head>
<body>
<div class="container is-fullhd">
	<!-- 헤더 부분 인클루드 -->
	<jsp:include page="../include/hd.jsp"></jsp:include>
	<figure class="visual" id="vs1">
		<ul class="imgbox">
			<li class="hero is-medium is-link">
				<div class="hero-body">
					<p class="title">
						Medium hero
					</p>
					<p class="subtitle">
						Medium subtitle
					</p>
				</div>
			</li>
		</ul>
	</figure>
	<div class="content" id="contents">
	    <div class="row column text-center">
	      <h2 class="h1">이벤트 게시판 목록</h2>
	      <hr>
	      <div class="container">
		      <!-- <table>
		      	<thead>
		      		<tr>
		      			<th>No</th>
		      			<th>Title</th>
		      			<th>RegDate</th>
		      			<th>Visited</th>
		      		</tr>
		      	</thead>
		      	<tbody>
				<c:if test="${not empty eventList }">
		      	<c:forEach items="${eventList }" var="event" varStatus="status">
		      		<tr>
		      			<td>${status.count }</td>
		      			<td><a href="${path1}/event/detail.do?bno=${event.bno }">${event.title }</a></td>
		      			<td>
	      					<fmt:parseDate value="${event.regdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
	      					<fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
		      			</td>
		      			<td>${event.visited }</td>
		      		</tr>
		      	</c:forEach>
				</c:if>
				<c:if test="${empty eventList }">
					<tr>
						<td colspan="4">이벤트 게시판에 글이 존재하지 않습니다.</td>
					</tr>
				</c:if>
		      	</tbody>
		      </table> -->
			  <section class="eventbox">
				  <div class="box_wrap">
					  <ul class="lst">
						  <c:forEach var="event" items="${eventList }" varStatus="status">
							  <li style="overflow: hidden">
								  <a href="${path1}/event/detail.do?bno=${event.bno }">
								  <div style="width: 600px;">
									  <div>
										  <h3 style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">${event.title }</h3>
									  </div>
									  <div style="width:600px;">
										  ${event.content}
									  </div>
								  </div>
								  </a>
							  </li>
						  </c:forEach>
						  <c:if test="${empty eventList}">
							  <li class="col-12">이벤트가 존재하지 않습니다.</li>
						  </c:if>
					  </ul>
				  </div>
			  </section>
			      	    <%-- <c:if test='${sid eq "admin"}'>  --%> 
		      	<div class="button-group">
					<c:if test="${sid.equals('admin')}">
						<a class="button is-info" href="${path1 }/event/insert.do">글쓰기</a>
					</c:if>
				</div>
			<%-- </c:if> --%>
	      </div>

	    </div>
	</div>
	<!-- 푸터 부분 인클루드 -->
	<jsp:include page="../include/ft.jsp"></jsp:include>
</div>
</body>
</html>