<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>티스푼 메인 페이지</title>
    <jsp:include page="../include/head.jsp" />
    <jsp:include page="../include/chat.jsp" />
</head>
<body>
<div class="container is-fullhd">
    <jsp:include page="../include/hd.jsp" />
    <jsp:include page="../include/main_banner.jsp" />
    <br>
    <br>
    <div class="tile is-ancestor">
        <div class="tile is-vertical is-8">
            <div class="tile">
                <div class="tile is-parent is-vertical">
                    <article class="tile is-child notification is-primary">
                        <p class="title"><a href="${path1}/admin/boardList.do" class="d-block menu_item mt-2"> 공지사항 관리 </a></p>
                        <p class="subtitle">.</p>
                        <p class="title"><a href="${path1}/admin/freeList.do" class="d-block menu_item mt-2"> 자유게시판 관리 </a></p>
                        <p class="subtitle">.</p>
                    </article>
                    <article class="tile is-child notification is-warning">
                        <p class="title"><a href="${path1}/admin/freeList.do" class="d-block menu_item mt-2"> 자유게시판 관리 </a></p>
                        <p class="subtitle">Best 게시물</p>
                    </article>
                </div>
                <div class="tile is-parent">
                    <article class="tile is-child notification is-info">
                        <p class="title"><a href="${path1}/admin/edumagList.do" class="d-block menu_item mt-2"> 교재 매거진 관리 </a></p>
                        <p class="subtitle">With an image</p>
                        <p class="title"> <a href="${path1}/admin/eventList.do" class="d-block menu_item mt-2"> 이벤트 관리 </a></p>
                        <p class="subtitle">Best 게시물</p>
<%--                        <figure class="image is-4by3">--%>
<%--                            <img src="https://bulma.io/images/placeholders/640x480.png">--%>
<%--                        </figure>--%>
                    </article>
                </div>
            </div>
            <div class="tile is-parent">
                <article class="tile is-child notification is-danger">
                    <p class="title"><a href="${path1}/admin/winnerList.do" class="d-block menu_item mt-2"> Winner 관리 </a></p>
                    <p class="subtitle">윜 캔 두잇! Week Can Do It!!!!</p>
                    <div class="content">
                        <!-- Content -->
                    </div>
                </article>
            </div>
        </div>
        <div class="tile is-parent">
            <article class="tile is-child notification is-success">
                <div class="content">
                    <p class="title">교재 신간</p>
                    <p class="subtitle">이번 달 출시된 교재</p>
                    <div class="content">
                        <!-- Content -->
                    </div>
                </div>
            </article>
        </div>
    </div>
</div>
<br>
<br>
<jsp:include page="../include/ft.jsp" />
</body>
</html>

<%--            <div class="p-4 border">--%>
<%--                <a href="${path1}/admin/admin.do" class="d-block menu_item" style="color:#7FAD39; font-weight:bold"> ADMIN MAIN </a>--%>
<%--                <a href="${path1}/admin/memberList.do" class="d-block menu_item mt-2"> 회원 관리 </a>--%>
<%--                <a href="${path1}/admin/boardList.do" class="d-block menu_item mt-2"> 공지사항 관리 </a>--%>
<%--                <a href="${path1}/admin/edumagList.do" class="d-block menu_item mt-2"> 교재 매거진 관리 </a>--%>
<%--                <a href="${path1}/admin/freeList.do" class="d-block menu_item mt-2"> 자유게시판 관리 </a>--%>
<%--                <a href="${path1}/admin/winnerList.do" class="d-block menu_item mt-2"> Winner 관리 </a>--%>
<%--                <a href="${path1}/admin/noticeList.do" class="d-block menu_item mt-2"> 노티스 관리 </a>--%>
<%--                <a href="${path1}/admin/faqList.do" class="d-block menu_item mt-2"> 자주 묻는 질문 관리 </a>--%>
<%--                <a href="${path1}/admin/eventList.do" class="d-block menu_item mt-2"> 이벤트 관리 </a>--%>
<%--                <a href="${path1}/admin/qnaList.do" class="d-block menu_item mt-2"> 질의응답 관리 </a>--%>
<%--            </div>--%>
