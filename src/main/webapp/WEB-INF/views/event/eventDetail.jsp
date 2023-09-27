<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>이벤트게시판 글 보기</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<!-- 헤더 부분 인클루드 -->
<div class="container is-fullhd">
    <jsp:include page="../include/hd.jsp"></jsp:include>
    <div class="columns">
        <div class="column is-2">
            <aside class="menu">
				<span class="box has-text-white has-text-weight-semibold has-text-centered is-size-5">
					이벤트
				</span>
                <ul class="menu-list">
                    <li>
                        <a href="${path1}/event/list.do">이벤트 게시판</a>
                    </li>
                    <li>
                        <a href="${path1}/winner/list.do">이벤트 당첨자</a>
                    </li>
                    <li>
                        <a href="${path1}/survey/list.do">윜이슈(설문)</a>
                    </li>
                </ul>
            </aside>
        </div>
        <div class="column is-10">
            <div class="conwrap">
                <div class="box">
                    <%--<h6>이벤트게시판</h6>--%>
                    <span class="title">이벤트게시판</span>
                </div>
            </div>

            <div class="card article">
                <div class="card-content">
                    <div class="media">
                        <div class="media-content has-text-centered">
                            <h1 class="title article-title">${dto.title }</h1>
                            <h6 class="subtitle is-6 article-subtitle">
                                ${dto.id } | ${dto.regdate } | 조회수:${dto.visited }
                            </h6>
                        </div>
                    </div>
                    <hr>

                    <div class="content article-body">
                        <p>
                            ${dto.content }
                        </p>
                    </div>
                </div>

                <div class="columns">
                    <div class="column is-5"></div>
                    <div class="column is-2">
                        <a class="button is-fullwidth post-btn" href="${path1 }/event/edit.do?bno=${dto.bno}">
                            추천<span style="margin-left: 10px">${dto.rec}</span>
                        </a>
                    </div>
                    <div class="column is-5"></div>
                </div>

                <div class="columns">
                    <div class="column is-3"></div>
                    <div class="column is-2">
                        <a class="button is-fullwidth is-info" href="${path1 }/event/list.do">글 목록</a>
                    </div>
                    <div class="column is-2">
                        <a class="button is-fullwidth is-primary" href="${path1 }/event/edit.do?bno=${dto.bno}">글 수정</a>
                    </div>
                    <div class="column is-2">
                        <a class="button is-fullwidth is-danger" href="${path1 }/event/delete.do?bno=${dto.bno}">글 삭제</a>
                    </div>
                    <div class="column is-3"></div>
                </div>
            </div>

<%--            <div class="cmtwrap">--%>
<%--                <form action="/" method="post" class="columns mt-5">--%>
<%--                    <div class="column is-10">--%>
<%--                        <textarea class="textarea" name="content" id="content" placeholder="댓글을 입력해주세요."  rows="2" cols="30" maxlength="800" required></textarea>--%>
<%--                    </div>--%>
<%--                    <div class="column is-2">--%>
<%--                        <button type="submit" class="button is-fullwidth submission">등록</button>--%>
<%--                    </div>--%>
<%--                </form>--%>
<%--            </div>--%>



        </div>
    </div>
</div>
<!-- 푸터 부분 인클루드 -->
<jsp:include page="../include/ft.jsp"></jsp:include>
</body>
</html>