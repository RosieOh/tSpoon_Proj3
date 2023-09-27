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
	<title>자유게시판 목록</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<!-- 헤더 부분 인클루드 -->
<div class="container is-fullhd">
	<jsp:include page="../include/hd.jsp"></jsp:include>
	<div class="columns">
		<div class="column is-2">
			<aside class="menu">
				<span class="box has-text-white has-text-weight-semibold has-text-centered is-size-5">
					커뮤니티
				</span>
				<ul class="menu-list">
					<li>
						<a href="#">자유게시판</a>
					</li>
					<li>
						<a href="#">교재게시판</a>
					</li>
				</ul>
			</aside>
		</div>
		<div class="column is-10">
			<div class="conwrap">
				<div class="box">
					<%--<h6>자유게시판</h6>--%>
					<span class="title">자유게시판</span>
				</div>

				<div class="columns">
					<div class="column is-6">
						<div class="card events-card">
							<header class="card-header">
								<p class="card-header-title">추천 많은 글</p>
							</header>
							<div class="card-table">
								<div class="content">
									<table class="table is-fullwidth is-striped">
										<tbody>
										<tr>
											<td width="5%"><i class="fa fa-bell-o"></i></td>
											<td>Lorum ipsum dolem aire</td>
											<td class="level-right"><a class="button is-small is-primary" href="#">Action</a></td>
										</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>

					<div class="column is-6">
						<div class="card events-card">
							<header class="card-header">
								<p class="card-header-title">댓글 많은 글</p>
							</header>
							<div class="card-table">
								<div class="content">
									<table class="table is-fullwidth is-striped">
										<tbody>
										<tr>
											<td width="5%"><i class="fa fa-bell-o"></i></td>
											<td>Lorum ipsum dolem aire</td>
											<td class="level-right"><a class="button is-small is-primary" href="#">Action</a></td>
										</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="box content">
				<c:forEach items="${freeList }" var="free" varStatus="status">
					<article class="post">
						<%--<h4>${free.title }</h4>--%>
						<h4><a href="${path1}/free/detail.do?bno=${free.bno }">${free.title }</a></h4>
						<div class="media">
							<div class="media-content">
								<div class="content">
									<%--<p>
										<a href="#">@jsmith</a> replied 34 minutes ago &nbsp;
										<span class="tag">Question</span>
									</p>--%>
									<p>
										조회수
										<span>${free.visited }</span>
										| 추천수
										<span>${free.rec }</span>
									</p>
								</div>
							</div>
							<div class="media-right">
								<span class="has-text-grey-light"><i class="fa fa-comments"></i> 1</span>
							</div>
						</div>
					</article>
				</c:forEach>
			</div>

			<div class="button-group">
				<%--<a class="button is-info is-normal" href="${path1 }/free/insert.do">글쓰기</a>--%>
				<a class="button post-btn" href="${path1 }/free/insert.do">글쓰기</a>
			</div>
		</div>
	</div>
</div>
<!-- 푸터 부분 인클루드 -->
<jsp:include page="../include/ft.jsp"></jsp:include>
</body>
</html>