<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="/pro3_war" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>파일 업로드</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<div class="container is-fullhd">
    <!-- 헤더 부분 인클루드 -->
    <jsp:include page="../include/hd.jsp"></jsp:include>
    <figure class="visual" id="vs1">
        <ul class="imgbox">
            <li class="hero is-medium is-link">
                <div class="hero-body">
                    <p class="title">
                        Medium hero
                    </p>
                    <p class="subtitle">
                        Medium subtitle
                    </p>
                </div>
            </li>
        </ul>
    </figure>
    <div class="content" id="contents">
        <div class="row column text-center">
            <h2 class="h1">파일 자료 등록</h2>
            <hr>
            <div class="container">
                <form method="post" enctype="multipart/form-data" action="${path1}/file/fileupload1.do">
                    <div class="control">
                        <label for="title">제목</label> <input type="text" name="title" id="title" class="input" required>
                    </div>
                    <div class="control">
                        <label for="content">내용</label><br>
                        <textarea name="content" id="content" class="textarea" required></textarea>
                    </div>
                    <div class="control">
                        <label for="file1" class="file-label">
                            <span style="padding:5px;margin:5px">파일1 : </span>
                            <input type="file" name="file1" id="file1" class="file-input" required>
                            <span class="file-cta">
                              <span class="file-icon">
                                <i class="fas fa-upload"></i>
                              </span>
                              <span class="file-label">
                                Choose a file…
                              </span>
                            </span>
                        </label>
                    </div>
                    <div class="control">
                        <label for="file2" class="file-label">
                            <span style="padding:5px;margin:5px">파일2 : </span>
                            <input type="file" name="file2" id="file2" class="file-input" required>
                            <span class="file-cta">
                              <span class="file-icon">
                                <i class="fas fa-upload"></i>
                              </span>
                              <span class="file-label">
                                Choose a file…
                              </span>
                            </span>
                        </label>
                    </div>
                    <div class="control">
                        <label for="file3" class="file-label">
                            <span style="padding:5px;margin:5px">파일3 : </span>
                            <input type="file" name="file3" id="file3" class="file-input" required>
                            <span class="file-cta">
                              <span class="file-icon">
                                <i class="fas fa-upload"></i>
                              </span>
                              <span class="file-label">
                                Choose a file…
                              </span>
                            </span>
                        </label>
                    </div>
                    <div class="button-group">
                        <input type="submit" value="파일 업로드" class="button is-info">
                        <a href="${path1}/file/filelist1.do" class="button is-primary">파일 자료 목록</a>
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
