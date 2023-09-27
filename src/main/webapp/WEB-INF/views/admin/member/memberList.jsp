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
    <title>회원 목록</title> <!-- 제목 수정 -->
    <jsp:include page="../../include/head.jsp"></jsp:include>
</head>
<body>
<div class="container is-fullhd">
    <!-- 헤더 부분 인클루드 -->
    <jsp:include page="../../include/hd.jsp"></jsp:include>
    <div class="content" id="content">
        <div class="row column text-center">
            <h2 class="h1">회원 목록</h2> <!-- 제목 수정 -->
            <hr>
            <div class="container">
                <table>
                    <thead>
                    <tr>
                        <th>No</th>
                        <th>ID</th> <!-- 컬럼 이름 수정 -->
                        <th>Name</th>
                        <th>Registration Date</th> <!-- 컬럼 이름 수정 -->
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${memberList}" var="member" varStatus="status">
                        <tr>
                            <td>${status.count}</td>
                            <td><a href="${path1}/admin/memberDetail.do?id=${member.id}" title="${member.email}">${member.id}</a></td>
                            <td>
                                <a href="${path1}/admin/memberDetail.do?id=${member.id}" title="${member.tel}">${member.name}</a>
                            </td>
                            <td>
                                <fmt:parseDate value="${member.regdate}" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                                <fmt:formatDate value="${resdate}" pattern="yyyy-MM-dd" />
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="button-group">
                    <a class="button" href="${path1}/admin/memberInsert.do">Add Member</a> <!-- 버튼 텍스트 수정 -->
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 푸터 부분 인클루드 -->
<jsp:include page="../../include/ft.jsp"></jsp:include>
</body>
</html>
