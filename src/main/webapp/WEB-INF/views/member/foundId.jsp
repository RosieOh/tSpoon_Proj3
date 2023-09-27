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
    <title>${title}</title>
    <style>
        body {
            margin-bottom: 0; /* body 요소의 아래 마진을 0으로 설정하여 공간 제거 */
        }

        .container.is-fullhd {
            min-height: 100vh; /* container 요소의 최소 높이를 뷰포트 높이와 동일하게 설정하여 페이지 아래 여백 제거 */
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .content {
            flex-grow: 1; /* content 요소가 남은 공간을 최대로 차지하도록 설정 */
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
            <h2 class="h1" style="font-size: 2rem;">${title}</h2>
            <hr>
            <div class="container" style="display: flex; flex-direction: column; align-items: center;">
                <c:if test="${not empty foundId}">
                    <p style="font-size: 1.5rem;">회원님의 아이디는 다음과 같습니다: ${foundId}</p>
                </c:if>
                <c:if test="${empty foundId}">
                    <p style="font-size: 1.5rem;">일치하는 이메일 주소로 등록된 아이디가 없습니다.</p>
                </c:if>
                <div class="button-group" style="margin-top: 20px;">
                    <a class="button" href="${path1}/member/login.do">로그인 하기</a>
                    <a class="button" href="${path1}/member/find_pw.do" style="margin-left: 10px;">비밀번호 찾기</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 푸터 부분 인클루드 -->
<jsp:include page="../include/ft.jsp"></jsp:include>
</body>
</html>
