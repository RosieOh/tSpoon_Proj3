<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title }</title>
    <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<div class="container is-fullhd">
    <!-- 헤더 부분 인클루드 -->
    <jsp:include page="../include/hd.jsp"></jsp:include>
    <div class="content" id="content">
        <div class="row column text-center">
            <h2 class="h1">${title }</h2>
            <hr>
            <div class="container">
                <c:if test="${not empty foundPassword}">
                    <p>회원님의 아이디는 다음과 같습니다: ${foundPassword}</p>
                    <p>등록된 이메일 주소: ${email}</p>
                </c:if>
                <c:if test="${empty foundPassword}">
                    <p>일치하는 이메일 주소로 등록된 아이디가 없습니다.</p>
                </c:if>
                <div class="button-group">
                    <a class="button" href="${path1}/member/find_password.do">아이디 찾기 다시 시도</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 푸터 부분 인클루드 -->
<jsp:include page="../include/ft.jsp"></jsp:include>
</body>
</html>
