<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />

<style>
    .navbar-item img {
        max-height: 80px;
    }
    .navbar-item {
        padding-right: 40px !important;
        font-size: large !important;
        padding-top: 10px;
    }
</style>

<!-- 헤더 내용 기술 -->
<div class="hero-head" style="height: 90px;">
    <div class="first_nav">
        <div class="container">
            <nav class="navbar" style="background: #f0f0f0;">
                <div class="navbar-brand" style="height: 80px;">
                    <a class="navbar-item" href="${path1}/" style="height: 80px; padding-top: 10px">
                        <img src="${path1}/resources/img/logo.png" alt="Bulma Hotel" style="width: 160px; height: 100%;" />
                    </a>
                    <a class="navbar-item is-hidden-desktop" href="tel:+302109849583">
                  <span class="icon" style="color: #333;">
                    <i class="fa fa-lg fa-phone-alt"></i>
                  </span>
                    </a>
                    <a class="navbar-item is-hidden-desktop" href="mailto:reservations@bulmahotels.com">
                  <span class="icon" style="color: #333;">
                    <i class="fa fa-lg fa-envelope"></i>
                  </span>
                    </a>
                    <a class="navbar-item is-hidden-desktop" href="#" target="_blank">
                  <span class="icon">
                    <i class="fab fa-lg fa-facebook-f"></i>
                  </span>
                    </a>
                </div>
                <div id="navbarBasicExample" class="navbar-menu">
                    <div class="navbar-start"></div>
                    <div class="navbar-end">
                        <div class="navbar-item">
                            <a class="navbar-item" href="${path1}/edumag/list.do" style="font-size: 30px;">교육매거진</a>
                            <a class="navbar-item" href="${path1}/free/list.do" style="font-size: 30px;">자유게시판</a>
                            <a class="navbar-item" href="${path1}/event/list.do" style="font-size: 30px;">이벤트</a>
                            <div class="navbar-item has-dropdown is-hoverable">
                                <a class="navbar-link">
                                    고객센터
                                </a>

                                <div class="navbar-dropdown">
                                    <a class="navbar-item" href="${path1}/notice/list.do" style="font-size: 30px;">공지사항</a>
                                    <a class="navbar-item" href="${path1}/faq/list.do">자주 묻는 질문</a>
                                    <a class="navbar-item" href="${path1}/qna/list.do">묻고 답하기</a>
                                </div>
                            </div>
                        </div>
                        <div class="navbar-end">
                            <div class="navbar-item">
                                <div class="buttons">
                                    <c:if test="${!empty sid}">
                                        <a href="${path1}/member/mypage.do" class="button is-primary">
                                            <strong>MyPage</strong>
                                        </a>
                                        <a href="${path1}/member/logout.do" class="button is-light">
                                            LogOut
                                        </a>
                                    </c:if>
                                    <c:if test="${empty sid}">
                                        <a href="${path1}/member/term.do" class="button is-primary">
                                            <strong>Sign up</strong>
                                        </a>
                                        <a href="${path1}/member/login.do" class="button is-light">
                                            Log in
                                        </a>
                                    </c:if>
                                    <c:if test="${sid.equals('admin')}">
                                        <a href="${path1}/admin/adminList.do" class="button is-light">
                                            관리자 페이지
                                        </a>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>