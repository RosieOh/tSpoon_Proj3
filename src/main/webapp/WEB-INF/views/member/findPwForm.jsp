<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.3/css/bulma.min.css">
    <title>비밀번호 찾기</title>
</head>
<body>
<section class="section">
    <div class="container">
        <h1 class="title">비밀번호 찾기</h1>
        <div class="content">
            <form action="${path1}/member/find_pw_process.do" method="post">
                <div class="field">
                    <label class="label">아이디</label>
                    <div class="control">
                        <input class="input" type="text" name="id" required>
                    </div>
                </div>
                <div class="field">
                    <label class="label">이메일</label>
                    <div class="control">
                        <input class="input" type="email" name="email" required>
                    </div>
                </div>
                <div class="field">
                    <div class="control">
                        <button type="submit" class="button is-primary">비밀번호 찾기</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
</body>
</html>
