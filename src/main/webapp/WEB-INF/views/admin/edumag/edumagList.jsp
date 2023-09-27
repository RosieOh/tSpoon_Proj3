<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>교육메거진 목록</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../../include/head.jsp"></jsp:include>
</head>
<style>
    .title1 {
        color: #363636;
        font-size: 2rem;
        font-weight: 600;
        line-height: 3;
    }

    .has-text-dark1{
        line-height: 25px;
        color: #1c1c1c!important;
    }

    .button2 {
        text-decoration: none;
        border-radius: 20px;
        margin: 15px;
        padding: 10px;
        float: right;
        background-color: #FFA500;
        border-color: #FFA500;
        color: #ffffff;
    }

    .pagination-link.is-current1 {
        background-color: #FFA500;
        border-color: #FFA500;
        color: #fff;
    }

    .column1 {
        margin-top: -125px;
        text-align: center;
        display: block;
        flex-basis: 0;
        flex-grow: 1;
        flex-shrink: 1;
        padding: 0.75rem;
    }

    .button-group {
        float: right;
        margin-top: -30px;
        margin-right: 10px;
    }

    .button-group a {
        margin-left: 5px;
    }
</style>
<body>
<section class="hero is-medium has-text-centered" >
    <!-- 헤더부분 인클루드 -->
    <jsp:include page="../../include/hd.jsp"></jsp:include>
    <div class="hero-body " style="margin-top: -100px; background: #F5F5F5;">
        <div class="container">
            <h1 class="title1">
                우리 자녀의 성공을 위한 필수 정보
            </h1>
            <h2 class="subtitle">
                학부모들을 위한 가장 신뢰할 만한 정보와 유용한 교육 리소스를 제공합니다!
            </h2>
            <br>
            <form action="${path1 }/edumag/list.do" method="get" class="field has-addons has-addons-right">
                <p class="control">
                <span class="select">
                    <select id="type" name="type">
                        <option value="title">제목</option>
                    </select>
                </span>
                </p>
                <p class="control">
                    <input class="input" type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요" value="${keyword }">
                </p>
                <p class="control">
                    <input type="submit" class="button is-mainColor" value="검색" />
                </p>
            </form>
            <br>
            <div class="columns is-centered">
                <div class="column1 is-10">
                    <div class="columns is-multiline">
                        <c:forEach items="${edumagList }" var="edumag" varStatus="status">
                            <div class="column is-one-third">
                                <div class="card rb-card">
                                    <div style=" cursor: pointer;"
                                         onclick="location.href='${path1 }/edumag/detail.do?no=${edumag.no}';">
                                        <!-- 관리자로 로그인한 경우에만 수정과 삭제 버튼 표시 -->
                                        <c:if test="${sid.equals('admin')}">
                                            <div class="button-group">
                                                <a href="${path1}/edumag/edit.do?no=${edumag.no}" class="button is-link">수정</a>
                                                <a href="${path1}/edumag/delete.do?no=${edumag.no}" class="button is-danger">삭제</a>
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="card-content" style="text-overflow:ellipsis;">
                                        <h3 class="title is-size-6 ellipsis is-ellipsis-1">
                                            <a class="has-text-dark1">
                                                    ${edumag.title}
                                            </a>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
                        <c:if test="${curPage > page.pageCount }">
                            <a href="${path1 }/edumag/list.do?page=${page.blockStartNum - 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-previous">Previous</a>
                        </c:if>
                        <c:if test="${page.blockLastNum < page.totalPageCount }">
                            <a href="${path1 }/edumag/list.do?page=${page.blockLastNum + 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-next">Next page</a>
                        </c:if>

                        <ul class="pagination-list">
                            <c:forEach var="i" begin="${page.blockStartNum }" end="${page.blockLastNum }">
                                <c:choose>
                                    <c:when test="${i == curPage }">
                                        <li>
                                            <a href="${path1 }/edumag/list.do?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link is-current1" aria-label="Page ${i }" aria-current="page">${i }</a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li>
                                            <a href="${path1 }/edumag/list.do?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link" aria-label="Page ${i }" aria-current="page">${i }</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </ul>
                    </nav>

                    <c:if test= "${sid.equals('admin')}">
                        <div class="button-group">
                            <a class="button2" href="${path1 }/edumag/insert.do">글쓰기</a>
                        </div>
                    </c:if>

                </div>
            </div>
        </div>
    </div>
</section>
<!-- 푸터 부분 인클루드 -->
<jsp:include page="../../include/ft.jsp"></jsp:include>

</body>
</html>
