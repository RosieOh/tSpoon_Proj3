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
    <jsp:include page="../include/head.jsp"></jsp:include>
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
</style>
<body>
<section class="hero is-medium has-text-centered" >
    <!-- 헤더 부분 인클루드 -->
    <jsp:include page="../include/hd.jsp"></jsp:include>
    <div class="hero-body " style="margin-top: -100px;">
        <div class="container">
            <h1 class="title1">
                우리 자녀의 성공을 위한 필수 정보
            </h1>
            <h2 class="subtitle">
                학부모들을 위한 가장 신뢰할 만한 정보와 유용한 교육 리소스를 제공합니다!
            </h2>
            <br>
            <div class="columns is-centered">
                <div class="column is-10">
                    <div class="columns is-multiline">
                        <c:forEach items="${edumagList }" var="edumag" varStatus="status">
                        <div class="column is-one-third">
                            <div class="card rb-card">
                                <div style=" cursor: pointer;"
                                     onclick="location.href='${path1}/edumag/detail.do?no=${edumag.no}';">
                                    <div class="card-image">
                                        <figure class="image is-16by9">
                                            <img src="${path1}/resources/img/${edumag.img}">
                                        </figure>

                                    </div>
                                </div>
                                <div class="card-content" style="text-overflow:ellipsis;">
                                    <h3 class="title is-size-6 ellipsis is-ellipsis-1">
                                        <a class="has-text-dark1">
                                                ${edumag.title}
                                        </a>
                                    </h3>
<%--                                    <h4 class="subtitle is-size-7 ellipsis is-ellipsis-2">--%>
<%--                                        ${fn:substring(edumag.content,0,20)}--%>
<%--                                    </h4>--%>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>

                    <c:if test= "${sid.equals('admin')}">
                        <div class="button-group">
                            <a class="button" href="${path1 }/edumag/insert.do">글쓰기</a>
                        </div>
                    </c:if>

                </div>
            </div>
        </div>
    </div>
</section>
    <!-- 푸터 부분 인클루드 -->
    <jsp:include page="../include/ft.jsp"></jsp:include>

</body>
</html>