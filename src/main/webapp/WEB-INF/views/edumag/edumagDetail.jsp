<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>교육메거진 글 보기</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>

    <style>
        .content h2 {
            height: 80px;
            margin-top: 155px;
            text-align: center;
            font-size: 30px;
            margin-bottom: 0.5714em;
            color: #363636;
            font-weight: 540;
            line-height: 40px;
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
        .p {
            line-height: 35px;
        }

        .button {
            text-decoration: none;
            border-radius: 20px;
            margin: 15px;
            padding: 10px;
            float: right;
            background-color: #1D7151;
            border-color: #1D7151;
            color: #ffffff;
        }

        .button2 {
            text-decoration: none;
            border-radius: 20px;
            margin: 10px;
            padding: 25px;
            float: right;
            background-color: #FFA500;
            border-color: #FFA500;
            color: #ffffff;
        }

        .button3 {
            text-decoration: none;
            border-radius: 20px;
            margin: 15px;
            padding: 10px;
            float: right;
            background-color: #FFA500;
            border-color: #FFA500;
            color: #ffffff;
        }
    </style>
</head>

<body>
<div class="container is-fullhd">
    <!-- 헤더 부분 인클루드 -->
    <jsp:include page="../include/hd.jsp"></jsp:include>
    <div class="content" id="contents">
        <div class="row column1 text-center" style="margin-bottom: 80px;">
            <h2 class="h2">${dto.title}</h2>
            <hr>
            <div class="container">
                <table id="table1">
                    <tbody>
                        <tr>
                            <th style="background-color:#dcdcdc"></th>
                            <td><img src="${dto.imagesLink}"></td>
                        </tr>
                        <tr>
                            <th style="background-color:#dcdcdc">관련 영상</th>
                            <!-- youtube -->
                            <td class="video">
                                <iframe width="640" height="360"
                                    src="${dto.link}"
                                    title="YouTube video player" frameborder="0"
                                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                                    allowfullscreen>
                                </iframe>
                            </td>
                        </tr>
                        <tr>
                            <th style="background-color:#dcdcdc">내용</th>
                            <td class="p"><p>${dto.content }</p></td>
                        </tr>
                        <tr>
                            <th style="background-color:#dcdcdc">작성일</th>
                            <td>${dto.resdate }</td>
                        </tr>
                        <tr>
                            <th style="background-color:#dcdcdc">조회수</th>
                            <td>${dto.visited }</td>
                        </tr>
                    </tbody>
                </table>
                <div class="cmtwrap">
                    <c:if test="${!empty sid}">
                        <form action="${path1 }/edumagComment/insert.do" method="post" class="columns mt-5">
                            <div class="column is-10">
                                <textarea class="textarea" name="content" id="content" placeholder="댓글을 입력해주세요!" rows="2" cols="30" maxlength="800" required style="left: 130px;margin-bottom: 50px;"></textarea>
                                <input type="hidden" name="author" id="author" value="${sid }">
                                <input type="hidden" name="par" id="par" value="${dto.no }">
                            </div>
                            <div class="column is-2">
                                <button type="submit" class="button">등록</button>
                            </div>
                        </form>
                    </c:if>
                    <c:if test="${empty sid}">
                        <div class="column is-10">
                            <div class="commentnull"
                                 style="margin-left: 335px;
                                 font-weight: 1000;
                                 margin-bottom: 20px;
                                 font-size: 25px;">
                                「 댓글을 작성하시려면 로그인을 해주세요 ! 」
                            </div>
                        </div>
                    </c:if>
                </div>

                <c:forEach items="${edumagCommentList }" var="edumagComment" varStatus="status">
                    <article class="media">
                        <figure class="media-left">
                            <div class="image is-64x64" style="border-radius: 50%; background-color: #2B3A55; color: #FFFFFF; ">
                                <p style=" color: #FFFFFF; text-align: center; padding: 20px 0px;">
                                        ${edumagComment.author }
                                </p>
                            </div>
                        </figure>

                        <div class="media-content">
                            <div class="content">
                                <p style="line-height: 1.3;">
                                    <strong>${edumagComment.author }</strong>
                                    <small> ${edumagComment.regdate }</small>
                                    <br>
                                <p style="color: black; font-size: 20px; line-height: 1.3;" >${edumagComment.content }</p>
                            </div>
                        </div>
                        <c:if test='${sid eq edumagComment.author }'>
                            <div class="media-right">
                                <a class="delete" style="background-color: #2B3A55"
                                   href="${path1 }/edumagComment/delete.do?dno=${edumagComment.dno}&no=${dto.no}">x</a>
                            </div>
                        </c:if>
                    </article>
                </c:forEach>
                <br>
                <c:if test= "${sid.equals('admin')}">
                    <div class="button-group">
                        <a class="button" href="${path1 }/edumag/list.do">목록으로</a>
                        <a class="button3" href="${path1 }/edumag/delete.do?no=${dto.no}">삭제</a>
                        <a class="button3" href="${path1 }/edumag/edit.do?no=${dto.no}">수정</a>
                    </div>
                </c:if>
        </div>
    </div>
</div>
    <!-- 푸터 부분 인클루드 -->
    <jsp:include page="../include/ft.jsp"></jsp:include>
</div>
</body>
</html>
