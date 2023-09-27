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
	<title>자유게시판 글 보기</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
    <style>
        .commentnull {
            min-height: 100px;
            text-align: center;
            width: 100%;
            margin: 72px 0px 0px 110px;
            font-size: 20px;
            font-weight: 700;
        }
    </style>
</head>
<body>
<!-- 헤더 부분 인클루드 -->
<div class="container is-fullhd">
    <jsp:include page="../include/hd.jsp"></jsp:include>
    <div class="columns">
        <div class="column is-2">
            <aside class="menu">
				<span class="box has-text-white has-text-weight-semibold has-text-centered is-size-5">
					커뮤니티
				</span>
                <ul class="menu-list">
                    <li>
                        <a href="${path1}/free/list.do">자유게시판</a>
                    </li>
                    <li>
                        <a href="#">교재게시판</a>
                    </li>
                </ul>
            </aside>
        </div>
        <div class="column is-10">
            <div class="conwrap">
                <div class="box">
                    <%--<h6>자유게시판</h6>--%>
                    <span class="title">자유게시판</span>
                </div>
            </div>

            <div class="card article">
                <div class="card-content">
                    <div class="media">
                        <div class="media-content has-text-centered">
                            <h1 class="title article-title">${freeDTO.title }</h1>
                            <h6 class="subtitle is-6 article-subtitle">
                                ${freeDTO.id } | ${freeDTO.regdate } | 조회수:${freeDTO.visited }
                            </h6>
                        </div>
                    </div>
                    <hr>

                    <div class="content article-body">
                        <p>
                            ${freeDTO.content }
                        </p>
                    </div>
                </div>

                <div class="img-container">
                    <input type="hidden" id="rec_check" value="${recoDTO.flag }">
                    <%--<h1>${recoDTO.flag } </h1>--%>
                    <img src="${path1}/resources/img/before_rec.png" id="recimg" width="70px" height="70px">
                </div>
                <p class="has-text-centered has-text-info has-text-weight-bold is-size-5 is-large" id='thumbCnt'>
                    ${freeDTO.rec }
                </p>

                <div class="columns mt-5">
                    <%--<div class="column is-3"></div>
                    <div class="column is-2">
                        <a class="button is-fullwidth is-info" href="${path1 }/free/list.do">글 목록</a>
                    </div>
                    <div class="column is-2">
                        <a class="button is-fullwidth is-primary" href="${path1 }/free/edit.do?bno=${freeDTO.bno}">글 수정</a>
                    </div>
                    <div class="column is-2">
                        <a class="button is-fullwidth is-danger" href="${path1 }/free/delete.do?bno=${freeDTO.bno}">글 삭제</a>
                    </div>
                    <div class="column is-3"></div>--%>
                    <c:choose>
                        <c:when test="${not empty sid && (sid eq 'admin' || sid eq freeDTO.id)}">
                            <div class="column is-3"></div>
                            <div class="column is-2">
                                <a class="button is-fullwidth" style="background-color: #2B3A55; color: #fff" href="${path1 }/free/list.do">글 목록</a>
                            </div>
                            <div class="column is-2">
                                <a class="button is-fullwidth is-info" href="${path1 }/free/edit.do?bno=${freeDTO.bno}">글 수정</a>
                            </div>
                            <div class="column is-2">
                                <a class="button is-fullwidth is-danger" href="${path1 }/free/delete.do?nno=${freeDTO.bno}">글 삭제</a>
                            </div>
                            <div class="column is-3"></div>
                        </c:when>
                        <c:otherwise>
                            <div class="column is-5"></div>
                            <div class="column is-2">
                                <a class="button is-fullwidth is-info" href="${path1 }/free/list.do">글 목록</a>
                            </div>
                            <div class="column is-5"></div>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>

            <div class="cmtwrap">
                <c:if test="${!empty sid}">
                    <form action="${path1 }/free/detail.do?bno=${freeDTO.bno }" method="post" class="columns mt-5">
                        <div class="column is-10">
                            <textarea class="textarea" name="content" id="content" placeholder="댓글을 입력해주세요." rows="2" cols="30" maxlength="800" required></textarea>
                            <input type="hidden" name="author" id="author" value="${sid }">
                            <input type="hidden" name="bno" id="bno" value="${freeDTO.bno }">
                        </div>
                        <div class="column is-2">
                            <button type="submit" class="button is-fullwidth submission">등록</button>
                        </div>
                    </form>
                </c:if>
                <c:if test="${empty sid}">
                    <div class="column is-10 mb-5">
                        <div class="commentnull">댓글을 작성하려면 로그인을 하세요~!</div>
                    </div>
                </c:if>
            </div>
            <c:forEach items="${commentList }" var="comment" varStatus="status">
                <article class="media">
                    <figure class="media-left">
                        <div class="image is-64x64" style="border-radius: 50%; background-color: #2B3A55; color: #FFFFFF; ">
                            <p style=" color: #FFFFFF; text-align: center; padding: 20px 0px;">
                                    ${comment.name }
                            </p>
                        </div>
                    </figure>
                    <div class="media-content">
                        <div class="content">
                            <p style="line-height: 1.3;">
                                <strong>${comment.name }</strong> <small> ${comment.author }</small> <small> ${comment.resdate }</small>
                                <br>
                            <p style="color: black; line-height: 1.3;">${comment.content }</p>
                            </p>
                        </div>
                    </div>
                    <c:if test='${sid eq comment.author }'>
                        <div class="media-right">
                            <a class="delete" style="background-color: #2B3A55" href="${path1 }/free/commentDelete.do?bno=${freeDTO.bno }&cno=${comment.cno }">x</a>
                        </div>
                    </c:if>
                </article>
            </c:forEach>

        </div>
    </div>
</div>
<!-- 푸터 부분 인클루드 -->
<jsp:include page="../include/ft.jsp"></jsp:include>

<script>
    $(document).ready(function () {
        const bno = '${freeDTO.bno }';
        const id = "${sid }";
        let recoCnt = Number("${freeDTO.rec }"); // 임시

        console.log('bno:'+bno);
        console.log('id:'+id);
        const recImage = document.getElementById("recimg")



        console.log('recImage:'+recImage.src);
        let recval = document.getElementById('rec_check').value;
        if (recval > 0) {
            recimg.src = "${path1}/resources/img/after_rec.png";
        } else {
            recimg.src = "${path1}/resources/img/before_rec.png";
        }
        // 좋아요 버튼을 클릭 시 실행되는 코드
        $("#recimg").on("click", function () {
            console.log('id:'+id);

            if (!id) {
                alert("추천은 로그인 후에 가능합니다."); // 로그인되어 있지 않으면 경고창 표시
                return; // 함수 종료
            }

            $.ajax({
                url: '${path1}/free/rec',
                type: 'POST',
                data: { 'bno': bno, 'id': id, 'recoCnt': recoCnt},
                success: function (data) {
                    if (data == 1) {
                        $("#recimg").attr("src", "${path1}/resources/img/after_rec.png");
                        $("#thumbCnt").html(recoCnt + 1);
                        //location.reload();
                    } else {
                        //$("#recimg").attr("src", "${path1}/resources/img/before_rec.png");
                        alert("이미 추천한 게시물입니다.");
                        //location.reload();
                    }
                }, error: function () {
                    $("#recimg").attr("src", "${path1}/resources/img/after_rec.png");
                    console.log('오타 찾으세요')
                }
            });
        });
    });
</script>
</body>
</html>