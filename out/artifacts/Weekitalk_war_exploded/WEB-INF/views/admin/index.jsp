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
    <title>관리자 페이지 메인</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp" />
</head>
<body>
<div class="contents" style="min-height:100vh">
    <nav aria-label="breadcrumb container-fluid" style="padding-top:28px; border-bottom:2px solid #666;">
        <div class="container">
            <ol class="breadcrumb justify-content-end">
                <li class="breadcrumb-item"><a href="${path1 }">Home</a></li>
                <li class="breadcrumb-item"><a href="${path1 }/board/list.do">관리자 페이지 메인</a></li>
            </ol>
        </div>
    </nav>
    <h2 class="title">관리자 페이지 메인</h2>
    <div class="art container-fluid">
        <aside class="col-3">
            <jsp:include page="../include/adminNav.jsp" />
        </aside>
        <article class="col-9">

        </article>
<!-- 푸터 부분 인클루드 -->
<jsp:include page="../include/ft.jsp"></jsp:include>
</body>
</html>