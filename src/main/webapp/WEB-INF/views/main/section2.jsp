<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<div class="tile is-ancestor" style="padding-top: 10px;">
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
                                <c:when test="${empty noticeList}">
                                    <p>최신 공지사항이 없습니다.</p>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${noticeList}" var="notice" varStatus="status">
                                        <!-- 첫 5개 공지사항만 표시 -->
                                        <c:if test="${status.index < 5}">
                                            <a href="${path1}/notice/detail.do?nno=${notice.nno}">
                                                <div>
                                                    <i class="fa fa-solid fa-seedling" style="color: #2B3A55; margin: 11px 11px;"></i>
                                                        ${notice.title}
                                                </div>
                                            </a>
                                            <hr style="margin: 0.5rem 0;"/>

                                            <!-- 게시물 미리보기 내용 -->
                                            <div class="preview">
                                                <div class="title">${notice.title}</div>
                                                <div class="preview-content">
                                                        <%-- 데이터베이스에서 미리보기 내용 가져오기 --%>
                                                    <c:out value="${getPreviewContentFromDB(conn, notice.nno)}" />
                                                </div>
                                            </div>
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
                            <c:when test="${empty freeRecList}">
                                <p>Best 게시물이 없습니다.</p>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${freeRecList}" var="free" varStatus="status">
                                    <!-- 첫 5개 Best 게시물만 표시 -->
                                    <c:if test="${status.index < 5}">
                                        <a href="${path1}/free/detail.do?fno=${free.fno}">
                                            <div>
                                                    ${free.title}
                                            </div>
                                        </a>
                                        <hr style="margin: 0.5rem 0;"/>
                                    </c:if>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </article>
                </div>
                <div class="tile is-parent">
                    <article class="tile is-child notification is-info" style="background: #CBAACB;">
                        <p class="title">교육 매거진</p>
                        <p class="subtitle">With an image</p>
                        <div class="content">
                            <c:forEach items="${edumagList}" var="edumag" varStatus="status">
                                <div class="edumag-item">
                                    <h3>${edumag.title}</h3>
                                    <p>${edumag.description}</p>
                                    <figure class="image is-4by3">
                                        <img src="${edumag.imageUrl}" alt="${edumag.title} 이미지">
                                    </figure>
                                    <p><a href="${path1}/edumag/detail.do?id=${edumag.id}">자세히 보기</a></p>
                                </div>
                                <hr style="margin: 0.5rem 0;"/>
                            </c:forEach>
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
</div>