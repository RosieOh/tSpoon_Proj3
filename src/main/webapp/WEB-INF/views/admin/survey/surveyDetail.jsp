<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>설문 게시판 글보기</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<div class="container is-fullhd">
    <!-- 헤더 부분 인클루드 -->
    <jsp:include page="../include/hd.jsp"></jsp:include>
    <div class="columns">
        <div class="column is-2">
            <aside class="menu">
				<span class="box has-text-white has-text-weight-semibold has-text-centered is-size-5">
					이벤트
				</span>
                <ul class="menu-list">
                    <li>
                        <a href="${path1}/survey/list.do">이벤트 게시판</a>
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
            <div class="content" id="contents">
                <div class="row column text-center">
                    <h2 class="h1">설문 게시판 상세 보기</h2>
                    <hr>
                    <div class="card article">
                        <div class="card-content">
                            <form id="frm1" name="frm1" action="${path1 }/survey/sanswerInsert.do" method="post" onsubmit="return ckAuthor()">
                                <table id="table1">
                                    <tbody>
                                    <tr>
                                        <td class="title">${dto.title }</td>
                                        <input type="hidden" id="title" name="title" value="${dto.title }" >
                                    </tr>
                                    <tr>
                                        <td class="content">${dto.content }</td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: 1.5em;">
                                            <input type="hidden" id="sno" name="sno" value="${dto.sno }">
                                            <input type="hidden" id="sid" name="sid" value="${sid }">
                                            <input type="radio" id="q1" name="ans" value="1">
                                            <label for="q1">${dto.q1 }</label><br>
                                            <c:if test="${not empty dto.q2 }">
                                                <input type="radio" id="q2" name="ans" value="2">
                                                <label for="q2">${dto.q2 }</label><br>
                                            </c:if>
                                            <c:if test="${not empty dto.q3 }">
                                                <input type="radio" id="q3" name="ans" value="3">
                                                <label for="q3">${dto.q3 }</label><br>
                                            </c:if>
                                            <c:if test="${not empty dto.q4 }">
                                                <input type="radio" id="q4" name="ans" value="4">
                                                <label for="q4">${dto.q4 }</label><br>
                                            </c:if>
                                            <c:if test="${not empty dto.q5 }">
                                                <input type="radio" id="q5" name="ans" value="5">
                                                <label for="q5">${dto.q5 }</label><br>
                                            </c:if>
                                            <c:if test="${not empty dto.q6 }">
                                                <input type="radio" id="q6" name="ans" value="6">
                                                <label for="q6">${dto.q6 }</label><br>
                                            </c:if>
                                            <c:if test="${not empty dto.q7 }">
                                                <input type="radio" id="q7" name="ans" value="7">
                                                <label for="q7">${dto.q7 }</label><br>
                                            </c:if>
                                            <c:if test="${not empty dto.q8 }">
                                                <input type="radio" id="q8" name="ans" value="8">
                                                <label for="q8">${dto.q8 }</label><br>
                                            </c:if>
                                            <c:if test="${not empty dto.q9 }">
                                                <input type="radio" id="q9" name="ans" value="9">
                                                <label for="q9">${dto.q9 }</label><br>
                                            </c:if>
                                            <c:if test="${not empty dto.q10 }">
                                                <input type="radio" id="q10" name="ans" value="10">
                                                <label for="q10">${dto.q10 }</label><br>
                                            </c:if>
                                        </td>
                                    </tr>
                                    <c:if test="${empty sid}">
                                    <br>
                                    <tr>
                                        <td>
                                            <p>설문은 로그인을 한 후에 참여할 수 있습니다.</p>
                                        </td>
                                    </tr>
                                    </c:if>
                                    <c:if test="${not empty sid && !sid.equals('admin')}">
                                        <tr>
                                            <td colspan="3">
                                                <a class="button is-info" href="${path1 }/survey/list.do">글 목록</a>
                                                <input type="submit" class="submit success button" value="설문 답변 등록" >
                                                <input type="reset" class="reset button" value="취소" >
                                            </td>
                                        </tr>
                                    </c:if>
                                    </tbody>
                                </table>
                            </form>
                            <div class="button-group">
                                <c:if test="${sid.equals('admin')}">
                                    <br>
                                    <a class="button is-primary" href="${path1 }/survey/delete.do?sno=${dto.sno}">글 삭제(관리자)</a>
                                    <a class="button is-danger" href="${path1 }/survey/edit.do?sno=${dto.sno}">글 수정(관리자)</a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 푸터 부분 인클루드 -->
    <jsp:include page="../include/ft.jsp"></jsp:include>
</div>
<script>
    function ckAuthor(){
        if(${result != null}) {
            alert("이미 답변을 작성하신 설문입니다.");
        } else {
            alert("설문 등록이 완료되었습니다.");
        }
    }
</script>
</body>
</html>