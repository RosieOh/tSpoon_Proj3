<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path1" value="${pageContext.request.contextPath }" />

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>티스푼 메인 페이지</title>
    <!-- head.jsp와 chat.jsp 인클루드 -->
    <jsp:include page="../include/head.jsp" />
    <jsp:include page="../include/chat.jsp" />

    <style>
        .edumag {
            margin-top: 20px;
            font-size: 20px;
            text-align: center;
        }

        .tile-content {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100%;
        }
    </style>
</head>
<body>
<div class="container is-fullhd">
    <!-- hd.jsp 인클루드 -->
    <jsp:include page="../include/hd.jsp" />
    <!-- main_banner.jsp 인클루드 -->
    <br>
    <br>
    <div class="tile is-ancestor">
        <!-- 최신 공지사항 표시 -->
        <div class="tile is-ancestor">
            <div class="tile is-vertical is-8">
                <div class="tile">
                    <div class="tile is-parent is-vertical">
                        <article class="tile is-child notification is-primary" style="background: #ABDEE6">
                            <div class="tile-content">
                                <p class="title">공지사항</p>
                                <div class="table is-fullwidth is-striped" style="background: none">
                                    <a href="${path1}/admin/noticeList.do" class="button is-primary is-fullwidth">공지사항 바로가기</a>
                                </div>
                            </div>
<%--                            <div class="table is-fullwidth is-striped" style="background: none">--%>
<%--                                <a href="${path1}/admin/noticeList.do" class="button is-primary is-fullwidth">공지사항 바로가기</a>--%>
<%--                            </div>--%>
                        </article>
                        <article class="tile is-child notification is-warning" style="background: #FEE1E8;">
                            <div class="tile-content">
                                <p class="title">자유게시판</p>
                                <div class="table is-fullwidth is-striped" style="background: none">
                                    <a href="${path1}/admin/freeList.do" class="button is-warning is-fullwidth">자유게시판 바로가기</a>
                                </div>
                            </div>
                        </article>
                        <article class="tile is-child notification is-warning" style="background: #FEE1E8;">
                            <div class="tile-content">
                                <p class="title">설문조사</p>
                                <div class="table is-fullwidth is-striped" style="background: none">
                                    <a href="${path1}/admin/surveyList.do" class="button is-warning is-fullwidth">설문조사 바로가기</a>
                                </div>
                            </div>
                        </article>
                    </div>
                    <div class="tile is-parent" style="width: 50%;">
                        <div class="tile is-vertical">
                            <article class="tile is-child notification is-info" style="background: #CBAACB;">
                                <div class="tile-content" style="padding-left: 5px;">
                                    <p class="title" >교육 매거진</p>
                                    <div class="table is-fullwidth is-striped" style="background: none">
                                        <a href="${path1}/admin/edumagList.do" class="button is-info is-fullwidth">교육 매거진 바로가기</a>
                                    </div>
                                </div>
                            </article>
                            <article class="tile is-child notification is-info" style="background: #CBAACB;">
                                <div class="tile-content">
                                    <p class="title">이벤트</p>
                                    <div class="table is-fullwidth is-striped" style="background: none">
                                        <a href="${path1}/admin/eventList.do" class="button is-info is-fullwidth">이벤트 바로가기</a>
                                    </div>
                                </div>
                            </article>
                        </div>
                    </div>
                    <div class="tile is-parent" style="width: 50%;">
                        <div class="tile is-vertical">
                            <article class="tile is-child notification is-info" style="background: #CBAACB; height: 50%;">
                                <div class="tile-content">
                                    <p class="title">Qna</p>
                                    <div class="table is-fullwidth is-striped" style="background: none">
                                        <a href="${path1}/admin/qnaList.do" class="button is-info is-fullwidth">Qna 바로가기</a>
                                    </div>
                                </div>
                            </article>
                            <article class="tile is-child notification is-info" style="background: #CBAACB; height: 50%;">
                                <div class="tile-content">
                                    <p class="title">FAQ</p>
                                    <div class="table is-fullwidth is-striped" style="background: none">
                                        <a href="${path1}/admin/faqList.do" class="button is-info is-fullwidth">FAQ 바로가기</a>
                                    </div>
                                </div>
                            </article>
                        </div>
                    </div>
                </div>
                <div class="tile is-parent">
                    <article class="tile is-child notification is-danger" style="background: #FFCCB6;">
                        <p class="title">슬로건</p>
                        <p class="subtitle">윜 캔 두잇! Week Can Do It!!!!</p>
                        <div class="content">
                            <!-- Content -->
                        </div>
                    </article>
                </div>
            </div>
            <div class="tile is-parent">
                <article class="tile is-child notification is-success" style="background: #F3B0C3;">
                    <div class="tile-content">
                        <p class="title">교재 게시판</p>
                        <p class="subtitle">이번 달 출시된 교재</p>
                        <div class="table is-fullwidth is-striped" style="background: none">
                            <a href="${path1}/admin/bookTalkList.do" class="button is-info is-fullwidth">교재게시판 바로가기</a>
                        </div>
                    </div>
                </article>
            </div>
        </div>
    </div>
</div>
<br>
<br>
<!-- ft.jsp 인클루드 -->
<jsp:include page="../include/ft.jsp" />
</body>
</html>
