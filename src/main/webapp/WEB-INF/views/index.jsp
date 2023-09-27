<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path0" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="./include/head.jsp"/>
    <link rel="stylesheet" href="${path0}/resources/css/fullpage.min.css">
    <style>
        a:hover {
            text-decoration: none;
            color: inherit;
        }
        .title.is-1 {
            font-size: 5rem;
        }
        /* 첫 번째 섹션을 화면에 꽉 차게 만듭니다. */
        .main-text-container {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            opacity: 0.8;
        }

        .section {
            display: flex;
            flex-direction: column;
            justify-content: center;
            width: 100%;
            margin: 0 auto;
            padding: 0;
        }

        /* 왼쪽 말풍선 스타일 */
        .message-left {
            background-color: #0084FF;
            color: white;
            padding: 15px;
            border-radius: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin: 10px 0;
            max-width: 80%; /* 변경 */
            align-self: flex-start;
            transition: transform 0.3s ease; /* 애니메이션 트랜지션 추가 */
            cursor: pointer; /* 커서 변경 */
        }

        /* 오른쪽 말풍선 스타일 */
        .message-right {
            background-color: #00CC66;
            color: white;
            padding: 15px;
            margin-left: 150px;
            margin-top: 10px;
            margin-bottom: 10px;
            border-radius: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 80%; /* 변경 */
            align-self: flex-end;
            transition: transform 0.3s ease; /* 애니메이션 트랜지션 추가 */
            cursor: pointer; /* 커서 변경 */
        }

        /* 대화 요소에 마우스 오버 시 스케일링 효과 추가 */
        .message-left:hover,
        .message-right:hover {
            transform: scale(1.05); /* 크기 확대 */
        }

        #fp-nav ul li, .fp-slidesNav ul li {
            display: none;
            width: 14px;
            height: 13px;
            margin: 7px;
            position: relative;
        }
    </style>
</head>
<body>
<div id="fullpage">
    <div class="section">
        <section class="hero main_hero is-fullheight">
            <div class="hero-body" onclick="goMain()">
                <div class="container has-text-centered">
                    <div class="slider-content animated zoomIn pb-6">
                        <div>
                            <p class="title is-1 main-text">Welcome to Weekitalk</p>
                            <p class="subtitle is-4 main-text">Experience The Our Community</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <div class="section" onclick="goMain()">
        <section class="section">
            <div class="container">
                <div class="columns is-centered">
                    <div class="column is-half">
                        <div class="main-text-container">
                            <div class="message-left">
                                <p class="is-size-4"><b>Weekitalk Bot:</b></p>
                                <p class="is-size-5">안녕하세요! Weekitalk에 오신 것을 환영합니다.</p>
                            </div>

                            <div class="message-right">
                                <p class="is-size-4"><b>사용자:</b></p>
                                <p class="is-size-5">안녕하세요!</p>
                            </div>

                            <div class="message-left">
                                <p class="is-size-4"><b>Weekitalk Bot:</b></p>
                                <p class="is-size-5">교육 관련 문의나 정보가 필요하신가요?</p>
                            </div>

                            <div class="message-right">
                                <p class="is-size-4"><b>사용자:</b></p>
                                <p class="is-size-5">네, 자녀의 교육 관련 정보를 알고 싶어요.</p>
                            </div>
                            <div class="message-left">
                                <p class="is-size-4"><b>Weekitalk Bot:</b></p>
                                <p class="is-size-5">정답은 Weekitalk 입니다!</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>

<script src="${path0}/resources/js/fullpage.min.js"></script>
<script>
    new fullpage('#fullpage', {
        // fullPage.js 옵션 설정
        autoScrolling: true, // 자동 스크롤 활성화
        navigation: true, // 페이지 네비게이션 활성화
    });

    function goMain() {
        location.href = "${path0}/main";
    }
</script>
</body>
</html>
