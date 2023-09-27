<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<div class="column is-2">
    <aside class="menu">
				<span class="box has-text-white has-text-weight-semibold has-text-centered is-size-5">
					이벤트
				</span>
        <ul class="menu-list">
            <li>
                <a href="${path1}/admin/eventList.do">이벤트 게시판</a>
            </li>
            <li>
                <a href="${path1}/admin/winnerList.do">이벤트 당첨자</a>
            </li>
            <li>
                <a href="${path1}/admin/surveyList.do">윜이슈(설문)</a>
            </li>
        </ul>
    </aside>
</div>