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
    <title>묻고 답하기</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<header id="header">
    <!-- 헤더 부분 인클루드 -->
    <jsp:include page="../include/hd.jsp"></jsp:include>
</header>
<div class="container is-fullhd">
    <div class="columns">
        <div class="column is-2">
            <aside class="menu">
				<span class="box has-text-white has-text-weight-semibold has-text-centered is-size-5">
					고객센터
				</span>
                <ul class="menu-list">
                    <li>
                        <a href="${path1 }/notice/list.do">공지사항</a>
                    </li>
                    <li>
                        <a href="${path1 }/qna/list.do">묻고 답하기</a>
                    </li>
                    <li>
                        <a href="${path1 }/faq/list.do">자주 묻는 질문</a>
                    </li>
                </ul>
            </aside>
        </div>
        <div class="column is-10">
            <div class="conwrap">
                <div class="box">
                    <span class="title">묻고 답하기</span>
                </div>
            </div>

            <div class="formwrap">
                <form action="${path1 }/qna/edit.do" method="post">
                    <div class="field">
                        <c:if test='${lev == 0}'>
                            <label class="label" for="title">질문 제목</label>
                        </c:if>
                        <c:if test='${lev == 1}'>
                            <label class="label" for="title">답변 제목</label>
                        </c:if>
                        <div class="control">
                            <input type="hidden" name="qno" id="qno" value="${dto.qno }" >
                            <input type="hidden" name="author" id="author" value="${sid }">
                            <input type="text" name="title" id="title" class="input" value="${dto.title }" maxlength="98" required>
                        </div>
                    </div>
                    <div class="field">
                        <c:if test='${lev == 0}'>
                            <label class="label" for="content">질문 내용</label>
                        </c:if>
                        <c:if test='${lev == 1}'>
                            <label class="label" for="content">답변 내용</label>
                        </c:if>
                        <textarea name="content" class="textarea" id="content" placeholder="내용" rows="8" cols="100" maxlength="800" required>${dto.content }</textarea>
                    </div>
                    <button type="submit" class="button post-btn">글 수정</button>
                </form>
            </div>
        </div>
    </div>
</div>
<footer id="footer" class="footer-nav row expanded collapse">
    <!-- 푸터 부분 인클루드 -->
    <jsp:include page="../include/ft.jsp"></jsp:include>
</footer>
</body>
</html>