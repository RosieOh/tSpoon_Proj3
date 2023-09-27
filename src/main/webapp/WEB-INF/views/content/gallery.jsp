<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path3" value="${pageContext.request.contextPath }" />
<section class="hero" id="hotel-gallery">
    <div class="hero-body is-paddingless">
        <div class="container is-clipped">
            <div class="content">
                <h4 class="main_title title is-4">Hotel Gallery</h4>
            </div>
            <section class="section is-paddingless">
                <div id="slider">
                    <div class="card">
                        <div class="card-image">
                            <figure class="image is-16by9 is-covered">
                                <img
                                        src="https://images.unsplash.com/photo-1550921082-c282cdc432d6?ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80"
                                        alt=""
                                />
                            </figure>
                        </div>
                        <div class="card-content">
                            <div class="item__title">
                                Mon titre 1
                            </div>
                            <div class="item__description">
                                Ici une petite description pour tester le slider
                            </div>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-image">
                            <figure class="image is-16by9 is-covered">
                                <img
                                        src="https://images.unsplash.com/photo-1550945771-515f118cef86?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80"
                                        alt=""
                                />
                            </figure>
                        </div>
                        <div class="card-content">
                            <div class="item__title">
                                Mon titre 2
                            </div>
                            <div class="item__description">
                                Ici une petite description pour tester le slider
                            </div>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-image">
                            <figure class="image is-16by9 is-covered">
                                <img
                                        src="https://images.unsplash.com/photo-1550971264-3f7e4a7bb349?ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80"
                                        alt=""
                                />
                            </figure>
                        </div>
                        <div class="card-content">
                            <div class="item__title">
                                Mon titre 3
                            </div>
                            <div class="item__description">
                                Ici une petite description pour tester le slider
                            </div>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-image">
                            <figure class="image is-16by9 is-covered">
                                <img
                                        src="https://images.unsplash.com/photo-1550931937-2dfd45a40da0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80"
                                        alt=""
                                />
                            </figure>
                        </div>
                        <div class="card-content">
                            <div class="item__title">
                                Mon titre 4
                            </div>
                            <div class="item__description">
                                Ici une petite description pour tester le slider
                            </div>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-image">
                            <figure class="image is-16by9 is-covered">
                                <img
                                        src="https://images.unsplash.com/photo-1550930516-af8b8cc4f871?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80"
                                        alt=""
                                />
                            </figure>
                        </div>
                        <div class="card-content">
                            <div class="item__title">
                                Mon titre 5
                            </div>
                            <div class="item__description">
                                Ici une petite description pour tester le slider
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</section>
