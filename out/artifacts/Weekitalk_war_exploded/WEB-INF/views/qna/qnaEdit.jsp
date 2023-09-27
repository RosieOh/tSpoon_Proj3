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

<div class="content" id="contents">
    <div class="row column text-center">
        <c:if test='${lev }== 0'>
            <h2 class="h1">질문 수정</h2>
        </c:if>
        <c:if test='${lev }== 1'>
            <h2 class="h1">답변 수정</h2>
        </c:if>        <hr>
        <div class="container">
            <form action="${path1 }/qna/edit.do" method="post">
                <table id="table1">
                    <tbody>
                    <tr>
                        <c:if test='${lev == 0}'>
                            <th style="background-color:#dcdcdc">질문 수정</th>
                        </c:if>
                        <c:if test='${lev == 1}'>
                            <th style="background-color:#dcdcdc">답변 수정</th>
                        </c:if>
                        <td>
                            <input type="hidden" name="qno" id="qno" value="${dto.qno }" >
                            <input type="hidden" name="author" id="author" value="${sid }">
                        <input type="text" name="title" id="title" placeholder="제목 입력" value="${dto.title }" maxlength="98" required>
                        </td>
                    </tr>
                    <tr>
                        <th style="background-color:#dcdcdc">글 내용</th>
                        <td>
                            <textarea name="content" id="content" placeholder="내용 입력" rows="8" cols="100" maxlength="800" required>${dto.content }</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit" class="submit success button" value="글 수정" >
                            <a class="button" href="${path1 }/qna/list.do">글 목록</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</div>
<footer id="footer" class="footer-nav row expanded collapse">
    <!-- 푸터 부분 인클루드 -->
    <jsp:include page="../include/ft.jsp"></jsp:include>
</footer>
</body>
</html>