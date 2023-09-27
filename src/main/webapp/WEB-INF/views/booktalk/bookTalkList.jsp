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
		.cmtNum {
			margin-left: 3px;
			font-size: 17px;
			color: #CE7777;
		}
		.media-right {
			margin: -34px 3px 0 0;
		}
	</style>
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
						<a href="${path1}/free/list.do">자유게시판</a>
					</li>
					<li>
						<a href="${path1}/booktalk/list.do">교재게시판</a>
					</li>
				</ul>
			</aside>
		</div>
		<div class="column is-10">
			<%--<form action="${path1 }/booktalk/list.do" method="get" class="field has-addons has-addons-right">
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
			</form>--%>

			<div class="conwrap">
				<div class="box">
					<span class="title">교재게시판</span>
				</div>

				<div class="columns">
					<div class="column is-6">
						<div class="card events-card">
							<header class="card-header">
								<p class="card-header-title">추천 많은 글</p>
							</header>
                            <c:forEach items="${bookTalkBestRecList }" var="bt" varStatus="status">
                                <div class="card-table">
                                    <div class="content">
                                        <table class="table is-fullwidth">
                                            <tbody>
                                            <tr>
                                                <%--<td width="1%"><i class="fa fa-bell-o"></i></td>--%>
                                                <td>
                                                    &#${9311+status.count} <a href="${path1}/booktalk/detail.do?bno=${bt.bno }">${bt.title }</a>
                                                </td>
                                                <%--<td class="level-right"><a class="button is-small is-primary" href="#">Action</a></td>--%>
                                                <td class="level-right">
													<i class="fa fa-regular fa-thumbs-up" style="font-weight: normal"> ${bt.rec }</i>
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
							<c:forEach items="${bookTalkBestCmtList }" var="bt" varStatus="status">
								<div class="card-table">
									<div class="content">
										<table class="table is-fullwidth">
											<tbody>
											<tr>
												<td>
													&#${9311+status.count} <a href="${path1}/booktalk/detail.do?bno=${bt.bno }">${bt.title }</a>
												</td>
												<td class="level-right">
													<%--&#x1F5E8; ${bt.count }--%>
														<i class="fa fa-regular fa-comment" style="font-weight: normal"> ${bt.count }</i>
												</td>
											</tr>
											</tbody>
										</table>
									</div>
								</div>
							</c:forEach>

						</div>
					</div>
				</div>
			</div>

			<div class="box content">
				<c:forEach items="${bookTalkList }" var="bt" varStatus="status">
					<article class="post">
						<h4>
							<a href="${path1}/booktalk/detail.do?bno=${bt.bno }">${bt.title }</a>

							<c:if test="${bt.count != 0}">
								<span class="cmtNum">(${bt.count})</span>
							</c:if>
						</h4>

						<div class="media">
							<div class="media-content">
								<div class="content">
									<p>
										조회수
										<span>${bt.visited }</span>
										| 추천수
										<span>${bt.rec }</span>
									</p>
								</div>
							</div>
							<div class="media-right">
								<%--<span class="has-text-grey-light"><i class="fa fa-comments"></i> 1</span>--%>
									<p class="has-text-grey">${bt.id }</p>
									<p class="has-text-grey">${bt.regdate }</p>
							</div>
						</div>
					</article>
				</c:forEach>
			</div>

			<nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
				<c:if test="${curPage > page.pageCount }">
					<a href="${path1 }/booktalk/list.do?page=${page.blockStartNum - 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-previous">Previous</a>
				</c:if>
				<c:if test="${page.blockLastNum < page.totalPageCount }">
					<a href="${path1 }/booktalk/list.do?page=${page.blockLastNum + 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-next">Next page</a>
				</c:if>

				<ul class="pagination-list">
					<c:forEach var="i" begin="${page.blockStartNum }" end="${page.blockLastNum }">
						<c:choose>
							<c:when test="${i == curPage }">
								<li>
									<a href="${path1 }/booktalk/list.do?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link is-current" aria-label="Page ${i }" aria-current="page" >${i }</a>
								</li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="${path1 }/booktalk/list.do?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link" aria-label="Page ${i }" aria-current="page">${i }</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</ul>
			</nav>

			<%--<form action="${path1 }/booktalk/list.do" method="get" class="field has-addons has-addons-centered">
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
			</form>--%>

			<div class="button-group">
                <c:choose>
                    <c:when test="${not empty sid }">
                        <a class="button post-btn" href="${path1 }/booktalk/insert.do">글쓰기</a>
                    </c:when>
                    <c:otherwise>
                        <a class="button post-btn" href="javascript:checkLogin()">글쓰기</a>
                    </c:otherwise>
                </c:choose>

				<form action="${path1 }/booktalk/list.do" method="get" class="field has-addons has-addons-right">
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

<script>
    function checkLogin() {
        var confirmLogin = confirm("글 작성은 로그인이 필요합니다. 로그인하시겠습니까?");
        if (confirmLogin) {
            location.href = '${path1 }/member/login.do';
        }
    }
</script>
</body>
</html>