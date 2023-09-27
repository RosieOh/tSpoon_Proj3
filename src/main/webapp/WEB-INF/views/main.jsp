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
    <jsp:include page="./include/head.jsp" />
    <jsp:include page="./include/chat.jsp" />

    <style>
        .edumag {
            margin-top: 20px;
            font-size: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container is-fullhd">
    <!-- hd.jsp 인클루드 -->
    <jsp:include page="./include/hd.jsp" />
    <!-- main_banner.jsp 인클루드 -->
    <jsp:include page="./include/main_banner.jsp" />
    <br>
    <br>
    <div class="tile is-ancestor">
        <!-- 최신 공지사항 표시 -->
        <div class="tile is-ancestor">
            <div class="tile is-vertical is-8">
                <div class="tile">
                    <div class="tile is-parent is-vertical">
                        <article class="tile is-child notification is-primary" style="background: #ABDEE6">
                            <p class="title">공지사항</p>
                            <p class="subtitle">최근 공지사항</p>
                            <div class="table is-fullwidth is-striped" style="background: none">
                                <c:choose>
                                    <c:when test="${empty newNotice}">
                                        <p>최신 공지사항이 없습니다.</p>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach items="${newNotice}" var="notice" varStatus="status">
                                            <!-- 첫 5개 공지사항만 표시 -->
                                            <c:if test="${status.index < 3}">
                                                <a href="${path1}/notice/detail.do?nno=${notice.nno}" style="text-decoration-line: none;">
                                                    <div>
                                                        <i class="fa fa-solid fa-seedling" style="color: #2B3A55; margin: 11px 11px;"></i>
                                                            ${notice.title}
                                                    </div>
                                                </a>
                                            </c:if>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </article>
                        <article class="tile is-child notification is-warning" style="background: #FEE1E8;">
                            <p class="title">자유게시판</p>
                            <p class="subtitle">Best 게시물</p>
                            <c:choose>
                                <c:when test="${empty freeBestRecList}">
                                    <p>Best 게시물이 없습니다.</p>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${freeBestRecList}" var="free" varStatus="status">
                                        <!-- 첫 3개 Best 게시물만 표시 -->
                                        <c:if test="${status.index < 3}">
                                            <a href="${path1}/free/detail.do?bno=${free.bno}" style="text-decoration-line: none;">
                                                <div>
                                                    <i class="fa fa-regular fa-thumbs-up" style="color: #2B3A55; margin: 11px 11px;"></i>
                                                        ${free.title}
                                                </div>
                                            </a>
                                        </c:if>
                                    </c:forEach>

                                </c:otherwise>
                            </c:choose>
                        </article>
                    </div>
                    <div class="tile is-parent">
                        <article class="tile is-child notification is-info" style="background: #CBAACB;">
                            <p class="title" style="margin-left: 110px; margin-top: 13px;">교육 매거진</p>
                            <div class="content">
                                <!-- 1개만 표시 -->
                                <a href="${path1 }/edumag/detail.do?no=${newEdumag.no }" style="text-decoration-line: none;">
                                    <div>
                                        <img src=" ${newEdumag.imagesLink }">
                                        <p class="edumag">
                                            「 ${newEdumag.title } 」
                                        </p>
                                    </div>
                                </a>
                            </div>
                        </article>
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
                    <div class="content">
                        <p class="title">윜 이슈!(설문)</p>
                        <p class="subtitle"></p>
                        <div class="content">
                            <div>
                                <a href="${path1}/survey/detail.do?sno=${lastSurvey.sno }" style="color: #2B3A55; margin: 11px 11px;">
                                    <div>
                                        <h2>${lastSurvey.title }</h2>
                                        ${lastSurvey.content}
                                        <div>
                                            <input type="radio" id="q1" name="ans" value="1">
                                            <label for="q1">${lastSurvey.q1 }</label><br>
                                            <c:if test="${not empty lastSurvey.q2 }">
                                                <input type="radio" id="q2" name="ans" value="2">
                                                <label for="q2">${lastSurvey.q2 }</label><br>
                                            </c:if>
                                            <c:if test="${not empty lastSurvey.q3 }">
                                                <input type="radio" id="q3" name="ans" value="3">
                                                <label for="q3">${lastSurvey.q3 }</label><br>
                                            </c:if>
                                            <c:if test="${not empty lastSurvey.q4 }">
                                                <input type="radio" id="q4" name="ans" value="4">
                                                <label for="q4">${lastSurvey.q4 }</label><br>
                                            </c:if>
                                            <c:if test="${not empty lastSurvey.q5 }">
                                                <input type="radio" id="q5" name="ans" value="5">
                                                <label for="q5">${lastSurvey.q5 }</label><br>
                                            </c:if>
                                            <c:if test="${not empty lastSurvey.q6 }">
                                                <input type="radio" id="q6" name="ans" value="6">
                                                <label for="q6">${lastSurvey.q6 }</label><br>
                                            </c:if>
                                            <c:if test="${not empty lastSurvey.q7 }">
                                                <input type="radio" id="q7" name="ans" value="7">
                                                <label for="q7">${lastSurvey.q7 }</label><br>
                                            </c:if>
                                            <c:if test="${not empty lastSurvey.q8 }">
                                                <input type="radio" id="q8" name="ans" value="8">
                                                <label for="q8">${lastSurvey.q8 }</label><br>
                                            </c:if>
                                            <c:if test="${not empty lastSurvey.q9 }">
                                                <input type="radio" id="q9" name="ans" value="9">
                                                <label for="q9">${lastSurvey.q9 }</label><br>
                                            </c:if>
                                            <c:if test="${not empty lastSurvey.q10 }">
                                                <input type="radio" id="q10" name="ans" value="10">
                                                <label for="q10">${lastSurvey.q10 }</label><br>
                                            </c:if>
                                        </div>
                                    </div>
                                </a>
                            </div>
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
<jsp:include page="./include/ft.jsp" />
</body>
</html>
