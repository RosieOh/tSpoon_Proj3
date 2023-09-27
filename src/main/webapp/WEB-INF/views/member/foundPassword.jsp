<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title}</title>
    <style>
        body {
            margin-bottom: 0;
        }

        .container.is-fullhd {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .content {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .content p {
            font-size: 1.5rem;
            text-align: center;
        }

        .button-group {
            margin-top: 20px;
            display: flex;
            flex-direction: row;
            justify-content: center;
        }

        .button-group .button {
            margin-left: 10px;
        }
    </style>
    <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<div class="container is-fullhd">
    <!-- 헤더 부분 인클루드 -->
    <jsp:include page="../include/hd.jsp"></jsp:include>
    <div class="content" id="content">
        <div class="row column text-center">
            <h1 class="title is-2">${title}</h1>
            <hr>
            <div class="container">
                <c:if test="${not empty newPassword}">
                    <p class="is-size-4">새로운 비밀번호: ${newPassword}</p>
                </c:if>
                <c:if test="${empty newPassword}">
                    <p class="is-size-4">일치하는 정보로 등록된 비밀번호가 없습니다.</p>
                </c:if>
                <div class="button-group" style="margin-top: 20px;">
                    <a class="button" href="${path1}/member/login.do">로그인 하기</a>
                    <a class="button" href="${path1}/member/find_id.do">아이디 찾기</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 푸터 부분 인클루드 -->
<jsp:include page="../include/ft.jsp"></jsp:include>
</body>
</html>
