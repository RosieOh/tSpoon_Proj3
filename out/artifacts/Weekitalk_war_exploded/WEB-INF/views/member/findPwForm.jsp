<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.3/css/bulma.min.css">
    <title>비밀번호 찾기 결과</title>
</head>
<body>
<section class="section">
    <div class="container">
        <h1 class="title">비밀번호 찾기 결과</h1>
        <div class="content">
            <c:if test="${not empty newPassword}">
                <p>새로운 비밀번호: ${newPassword}</p>
            </c:if>
            <c:if test="${empty newPassword}">
                <p>일치하는 정보로 등록된 비밀번호가 없습니다.</p>
            </c:if>
            <div class="field">
                <div class="control">
                    <a href="${path1}/member/find-password-form" class="button is-primary">비밀번호 찾기 다시 시도</a>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
