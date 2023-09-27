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
	<title>자주 묻는 질문</title>
	<!-- 헤드 부분 인클루드 -->
	<jsp:include page="../../include/head.jsp"></jsp:include>
	<link href="https://cdn.jsdelivr.net/npm/bulma-accordion@2.0.1/dist/css/bulma-accordion.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src=https://cdn.jsdelivr.net/npm/bulma-accordion@2.0.1/dist/js/bulma-accordion.min.js"></script>
<body>
<!-- 헤더 부분 인클루드 -->
<jsp:include page="../../include/hd.jsp"></jsp:include>
<div class="container is-fullhd">
	<div class="columns">
		<jsp:include page="../include/admin_sidemenu.jsp"/>
		<div class="column is-10">
			<div class="conwrap">
				<div class="box">
					<span class="title">자주 묻는 질문</span>
				</div>
			</div>
			<section class="accordions" style="padding-top: 50px;">
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
<jsp:include page="../../include/ft.jsp"></jsp:include>
</body>
</html>