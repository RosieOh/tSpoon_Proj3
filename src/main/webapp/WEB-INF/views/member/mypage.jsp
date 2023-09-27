<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보 보기</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
    <!-- 추가한 CSS 스타일 -->
    <style>
        /* 입력 필드와 버튼 스타일링 */
        .input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        /* 테이블 스타일링 */
        .table_form {
            width: 100%;
        }
        .table_form th {
            width: 100px;
            text-align: right;
            padding-right: 10px;
        }
        .content table tbody tr:last-child td, .content table tbody tr:last-child th {
            border-bottom-width: 0;
            text-align: center;
        }
        /* 페이지 제목 스타일링 */
        .page_tit {
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center; /* 페이지 제목 가운데 정렬 */
        }
        /* 폼 컨테이너 스타일링 */
        .form-container {
            max-width: 600px; /* 폼 컨테이너 최대 너비 */
            margin: 0 auto; /* 수평 가운데 정렬 */
        }
    </style>
</head>
<body>
<div class="container is-fullhd">
    <!-- 헤더 부분 인클루드 -->
    <jsp:include page="../include/hd.jsp"></jsp:include>
    <figure class="visual" id="vs1">
        <!-- 이미지 슬라이더 부분은 그대로 두세요. -->
    </figure>
    <div class="content" id="content">
        <div class="row column text-center">
            <div class="container form-container"> <!-- 폼 컨테이너 -->
                <c:if test="${sid=='admin' }">
                    <h2 class="page_tit">관리자 회원 정보 수정하기</h2>
                </c:if>
                <c:if test="${sid!='admin' }">
                    <h2 class="page_tit">회원 정보 수정하기</h2>
                </c:if>
                <hr>
                <form action="${path1 }/member/update.do" method="post" onsubmit="return updateCheck(this)">
                    <div class="table_form_wrap">
                        <table class="table_form">
                            <tbody>
                            <tr>
                                <th><label for="id">아이디</label></th>
                                <td><input type="text" name="id" id="id" size="100" class="input" value="${member.id }" readonly required>
                                </td>
                            </tr>
                            <tr>
                                <th><label for="pw">비밀번호</label></th>
                                <td><input type="password" name="pw" id="pw"  class="input" value="${member.pw }" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
                                    <p>(최소 8자리에서 최대 16자리까지, 숫자, 영문 대소문자, 특수문자가 각 1 문자 이상 포함되어야 함)</p>
                                </td>
                            </tr>
                            <tr>
                                <th><label for="pw2">비밀번호 확인</label></th>
                                <td><input type="password" name="pw2" id="pw2"  class="input" value="${member.pw }" required></td>
                            </tr>
                            <tr>
                                <th><label for="name">이름</label></th>
                                <td><input type="text" name="name" id="name" class="input"  value="${member.name }" required></td>
                            </tr>
                            <tr>
                                <th><label for="email">이메일</label></th>
                                <td><input type="email" name="email" id="email" class="input" value="${member.email }" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required></td>
                            </tr>
                            <tr>
                                <th><label for="tel">전화번호</label></th>
                                <td><input type="tel" name="tel" id="tel" class="input"  value="${member.tel }" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" required></td>
                            </tr>
                            <tr>
                                <th><label for="findBtn" onclick="findAddr()">주소</label></th>
                                <td>
                                    <input type="text" name="addr1" id="addr1" class="input" value="${member.addr1 }"><br>
                                    <input type="text" name="addr2" id="addr2" class="input" value="${member.addr2 }"><br>
                                    <input type="text" name="postcode" id="postcode"  class="input" value="${member.postcode }">
                                    <input type="button" value="주소찾기" id="findBtn" onclick="findAddr()" class="button is-primary">
                                </td>
                            </tr>
                            <tr>
                                <th><label for="birth" >생년월일</label></th>
                                <td>
                                    <fmt:parseDate value="${member.birth }" var="birth" pattern="yyyy-MM-dd" />
                                    <span style="display:none"><fmt:formatDate var="br" value="${birth }" pattern="yyyy-MM-dd" /></span>
                                    <input type="birth" name="birth" id="birth" value="${br }" class="input">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input type="submit" class="button btn-writer" value="회원정보수정">
                                    <input type="reset" class="button btn-primary" value="취소">
                                    <c:if test="${sid=='admin' }">
                                        <a href="${path1 }/member/delete.do?id=${member.id }" class="button is-primary">직권 강퇴</a>
                                    </c:if>
                                    <c:if test="${sid!='admin' }">
                                        <a href="${path1 }/member/delete.do?id=${sid }" class="button is-primary">회원 탈퇴</a>
                                    </c:if>
                                    <c:if test="${sid=='admin' }">
                                        <a href="${path1 }/member/list.do" class="button is-primary">회원 목록</a>
                                    </c:if>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- 푸터 부분 인클루드 -->
    <jsp:include page="../include/ft.jsp"></jsp:include>
</div>
</body>
</html>
