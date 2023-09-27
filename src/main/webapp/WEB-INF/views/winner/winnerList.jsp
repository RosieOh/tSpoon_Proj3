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
	<title>당첨자 게시판 목록</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<!-- 헤더 부분 인클루드 -->
<div class="container is-fullhd" style="min-height: 100vh;" > <!-- 푸터 아래 여백 남는거 수정 -->
	<jsp:include page="../include/hd.jsp"></jsp:include>
	<div class="columns">
		<div class="column is-2">
			<aside class="menu">
				<span class="box has-text-white has-text-weight-semibold has-text-centered is-size-5">
					이벤트
				</span>
				<ul class="menu-list">
					<li>
						<a href="${path1}/event/list.do">이벤트 게시판</a>
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
					<%--<h6>당첨자 게시판</h6>--%>
					<span class="title">당첨자 게시판</span>
				</div>

				<div class="columns">
					<div class="column is-6">
						<div class="card events-card">
							<header class="card-header">
								<p class="card-header-title">추천 많은 글</p>
							</header>
                            <c:forEach items="${winnerRecList }" var="winner" varStatus="status">
                                <div class="card-table">
                                    <div class="content">
                                        <table class="table is-fullwidth">
                                            <tbody>
                                            <tr>
                                                <%--<td width="1%"><i class="fa fa-bell-o"></i></td>--%>
                                                <td>
                                                    &#${9311+status.count} <a href="${path1}/winner/detail.do?bno=${winner.bno }">${winner.title }</a>
                                                </td>
                                                <%--<td class="level-right"><a class="button is-small is-primary" href="#">Action</a></td>--%>
                                                <td class="level-right">
                                                    &#x1F44D; ${winner.rec }
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </c:forEach>

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

			<div class="button-group">
				<c:if test="${sid.equals('admin')}">
					<a class="button post-btn" href="${path1 }/winner/insert.do">당첨자 등록</a>
				</c:if>
			</div>

			<div class="box content">
				<c:forEach items="${winnerList }" var="winner" varStatus="status">
					<article class="post">
						<%--<h4>${winner.title }</h4>--%>
						<h4><a href="${path1}/winner/detail.do?bno=${winner.bno }">${winner.title }</a></h4>
						<div class="media">
							<div class="media-content">
								<div class="content">
									<%--<p>
										<a href="#">@jsmith</a> replied 34 minutes ago &nbsp;
										<span class="tag">Question</span>
									</p>--%>
									<p>
										조회수
										<span>${winner.visited }</span>
										| 추천수
										<span>${winner.rec }</span>
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
		</div>
	</div>
</div>
<!-- 푸터 부분 인클루드 -->
<jsp:include page="../include/ft.jsp"></jsp:include>
</body>
</html>