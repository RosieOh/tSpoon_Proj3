<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path1" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<!-- 헤더 부분 인클루드 -->
<jsp:include page="../include/hd.jsp"></jsp:include>
<section class="hero is-fullheight">
    <div class="hero-body">
        <div class="container has-text-centered">
            <div class="column is-4 is-offset-4">
                <div class="box">
                    <img src="${path1}/resources/img/logo.png" alt="Bulma Hotel" style="width: 160px; height: 100%;" />
                    <br>
                    <br/>
                    <form action="${path1}/member/loginpro.do" method="post" name="loginForm">
                        <c:if test="${not empty loginError}">
                            <p class="has-text-danger">${loginError}</p>
                        </c:if>
                        <div class="field">
                            <p class="control has-icons-left has-icons-right">
                                <input class="input is-medium" class="form-control" id="id" name="id"
                                       placeholder="아이디를 입력하세요" required/>
                                <span class="icon is-medium is-left">
                                        <i class="fas fa-envelope"></i>
                                    </span>
                                <span class="icon is-medium is-right">
                                        <i class="fas fa-check"></i>
                                    </span>
                            </p>
                        </div>
                        <div class="field">
                            <p class="control has-icons-left">
                                <input class="input is-medium" type="password" class="form-control" id="pw"
                                       name="pw" placeholder="비밀번호를 입력하세요" required/>
                                <span class="icon is-small is-left">
                                        <i class="fas fa-lock"></i>
                                    </span>
                            </p>
                        </div>
                        <div class="field">
                            <label class="checkbox">
                                <input type="checkbox"/>
                                Remember me
                            </label>
                        </div>
                        <button class="button is-block is-info is-large is-fullwidth">Login</button>
                        <br/>
                    </form>
                    <script>
                        function loginFaiure() {
                            alert("로그인 실패");
                        }
                    </script>
                    <br/>
                    <div class="has-text-centered">
                        <p class="subtitle is-6"><a href="${path1}/member/find_id.do">아이디 찾기</a> &nbsp;·&nbsp; <a href="${path1}/member/find_pw.do">비밀번호 찾기</a></p>
                    </div>
                </div>
                <p class="has-text-grey">
                <h4 class="mb-3">아직 회원이 아니라면</h4>
                <nav class="level is-mobile">
                    <button class="level-item button is-sparta is-outlined"
                            onclick="toggle_sign_up()">
                        <a href="${path1}/member/term.do">회원가입하기</a>
                    </button>
                </nav>
                </p>
            </div>
        </div>
    </div>
</section>
<jsp:include page="../include/ft.jsp"></jsp:include>
</body>
</html>
