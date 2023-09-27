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
	<title>자주 묻는 질문</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
	<script type="text/javascript" src=https://cdn.jsdelivr.net/npm/bulma-accordion@2.0.1/dist/js/bulma-accordion.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bulma-accordion@2.0.1/dist/css/bulma-accordion.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
	<script>
		bulmaAccordion.attach();
	</script>
	<style>
		.accordions .accordion .accordion-header {
			background-color: #2B3A55;
		}
		.accordion-content {
			background-color: #fcecec;
		}
		.accordions {
			min-height: 500px;
		}
		.content ul {
			list-style-type: none;
		}
		.content ul >li {
			list-style-type: none;
		}
		.icon {
			color: #2B3A55;
		}
		.menu-list a {
			min-width: 159px;
		}
	</style>
</head>
<body>
<!-- 헤더 부분 인클루드 -->
<jsp:include page="../include/hd.jsp"></jsp:include>
<div class="container is-fullhd">
	<div class="content" id="content">
	    <div class="row column text-center">
	      <h2 class="h1">자주 묻는 질문</h2>
	      <hr>
<%--	      <div class="container">--%>
<%--		      <table>--%>
<%--		      	<thead>--%>
<%--		      		<tr>--%>
<%--		      			<th width="80">No</th>--%>
<%--		      			<th>Title</th>--%>
<%--		      			<th width="120">RegDate</th>--%>
<%--		      			<th width="100">Visited</th>--%>
<%--		      		</tr>--%>
<%--		      	</thead>--%>
<%--		      	<tbody>--%>
<%--		      	<c:forEach items="${boardList }" var="board" varStatus="status">--%>
<%--		      		<tr>--%>
<%--		      			<td>${status.count }</td>--%>
<%--		      			<td><a href="${path1}/board/detail.do?seq=${board.seq }">${board.title }</a></td>--%>
<%--		      			<td>--%>
<%--	      					<fmt:parseDate value="${board.regdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />--%>
<%--	      					<fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />--%>
<%--		      			</td>--%>
<%--		      			<td>${board.visited }</td>--%>
<%--		      		</tr>--%>
<%--		      	</c:forEach>	--%>
<%--		      	</tbody>--%>
<%--		      </table>--%>
<%--			      	    &lt;%&ndash; <c:if test='${sid eq "admin"}'>  &ndash;%&gt; --%>
<%--		      	<div class="button-group">--%>
<%--				  <a class="button" href="${path1 }/board/insert.do">글쓰기</a>--%>
<%--				</div>--%>
<%--			&lt;%&ndash; </c:if> &ndash;%&gt;--%>
<%--	      </div>--%>
			<section class="main-content columns is-fullheight">
			<aside class="column is-2 is-narrow-mobile is-fullheight section is-hidden-mobile">
				<p class="menu-label is-hidden-touch">고객센터</p>
				<ul class="menu-list">
					<li>
						<a href="${path1 }/notice/list.do" class="">
							<span class="icon" ><i class="fa fa-solid fa-bell"></i></span> 공지사항
						</a>
					</li>
					<li>
						<a href="${path1 }/qna/list.do" class="">
							<span class="icon"><i class="fa fa-solid fa-question"></i></span> 묻고 답하기
						</a>
						<%--								<ul>--%>
						<%--									<li>--%>
						<%--										<a href="#">--%>
						<%--											<span class="icon is-small"><i class="fa fa-window-maximize"></i></span> Link1--%>
						<%--										</a>--%>
						<%--									</li>--%>
						<%--									<li>--%>
						<%--										<a href="#">--%>
						<%--											<span class="icon is-small"><i class="fa fa-link"></i></span> Link2--%>
						<%--										</a>--%>
						<%--									</li>--%>
						<%--								</ul>--%>
					</li>
					<li>
						<a href="${path1 }/faq/list.do" class="is-active" style="background-color: #2B3A55;">
							<span class="icon" style="color: #FFFFFF"><i class="fa fa-window-maximize"></i></span> 자주 묻는 질문
						</a>
					</li>
				</ul>
			</aside>
			<div class="container column is-10">
				<div class="section">
				<section class="accordions">
				<c:forEach items="${faqList }" var="faq" varStatus="status">
				<article class="accordion">
					<div class="accordion-header toggle">
						<p>${status.count }. &nbsp;&nbsp; ${faq.question }</p>
					</div>
					<div class="accordion-body">
						<div class="accordion-content">
							${faq.answer }
						</div>
					</div>
				</article>
				</c:forEach>
			</section>
				</div>
			</div>
			</section>
		</div>
		<script>
		$(document).ready(function(){
			$(".accordion-header").click(function(){
				$(this).parents(".accordion").toggleClass("is-active");
			});
		});
		</script>
	</div>
</div>
<!-- 푸터 부분 인클루드 -->
<jsp:include page="../include/ft.jsp"></jsp:include>
</body>
</html>

