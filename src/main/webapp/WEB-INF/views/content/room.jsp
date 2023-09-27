<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path3" value="${pageContext.request.contextPath }" />

<section class="hero" id="rooms">
    <div class="hero-body">
        <div class="container">
            <div class="rooms columns">
                <!-- Executive Gold Single -->
                <div class="column">
                    <figure class="image">
                        <img
                                src="https://images.unsplash.com/photo-1515510621228-30de609bbd60?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80"
                                alt="Executive Gold Single"
                        />
                    </figure>
                    <div class="content">
                        <div></div>
                        <h1 class="title is-6">Executive Gold Single</h1>
                        <p>The Executive Gold Single Rooms can hold <b>2 guests</b> (with extra bed €50).</p>
                        <a class="button is-primary open-modal" href="#">View Details €119/day</a>
                    </div>
                </div>
                <!-- Executive Gold Double -->
                <div class="column">
                    <figure class="image">
                        <img
                                src="https://images.unsplash.com/photo-1444201983204-c43cbd584d93?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80"
                                alt="Executive Gold Double"
                        />
                    </figure>
                    <div class="content">
                        <div></div>
                        <h1 class="title is-6">Executive Gold Double</h1>
                        <p>The Executive Gold Double Rooms can hold <b>3 guests</b> (with extra bed €50).</p>
                        <a class="button is-primary open-modal" href="#">View Details €239/day</a>
                    </div>
                </div>
                <!-- Premier Diamond Single -->
                <div class="column">
                    <figure class="image">
                        <img
                                src="https://images.unsplash.com/photo-1590490360836-2e3b067c082b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80"
                                alt="Premier Diamond Single"
                        />
                    </figure>
                    <div class="content">
                        <div></div>
                        <h1 class="title is-6">Premier Diamond Single</h1>
                        <p>The Premier Diamond Single rooms can hold <b>2 guests</b> (with extra bed €50).</p>
                        <a class="button is-primary open-modal" href="#">View Details €399/day</a>
                    </div>
                </div>
                <!-- Premier Diamond Double -->
                <div class="column">
                    <figure class="image">
                        <img
                                src="https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80"
                                alt="Premier Diamond Double"
                        />
                    </figure>
                    <div class="content">
                        <div></div>
                        <h1 class="title is-6">Premier Diamond Double</h1>
                        <p>he Premier Diamond Double rooms can hold <b>3 guests</b> (with extra bed €50).</p>
                        <a class="button is-primary open-modal" href="#">View Details €499/day</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>