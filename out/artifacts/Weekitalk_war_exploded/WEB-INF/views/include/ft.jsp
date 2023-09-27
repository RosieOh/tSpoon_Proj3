<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path3" value="${pageContext.request.contextPath }" />
<!-- 푸터 내용 기술 -->
<footer class="hero">
    <div class="hero-body">
        <div class="container">
            <div class="columns">
                <div class="column is-4">
                    <div class="content">
                        <h6 class="footer_title title is-6">NEWSLETTER</h6>
                        <p>We love to share new offers and exclusive promotions</p>
                        <div class="newsletter">
                            <form action="#" method="POST" class="newsletter-form">
                                <input type="email" name="email" placeholder="Enter your email address" />
                                <button>
                                    <i class="fa fa-paper-plane"></i>
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="column is-4" style="text-align: center;">
                    <div class="content">
                        <div>
                            <h6 class="footer_title title is-6">SOCIAL MEDIA</h6>
                            <p>Follow the Bulma Hotels on social media</p>
                            <a class="button is-medium is-facebook">
                    <span class="icon">
                      <i class="fab fa-facebook-f fa-lg"></i>
                    </span>
                            </a>
                            <a class="button is-medium is-foursquare">
                    <span class="icon">
                      <i class="fab fa-foursquare fa-lg"></i>
                    </span>
                            </a>
                            <a class="button is-medium is-twitter">
                    <span class="icon">
                      <i class="fab fa-twitter fa-lg"></i>
                    </span>
                            </a>
                            <a class="button is-medium is-linkedin">
                    <span class="icon">
                      <i class="fab fa-linkedin-in fa-lg"></i>
                    </span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="column is-4">
                    <div class="content">
                        <h6 class="footer_title title is-6">ADDRESS</h6>
                        <p class="is-marginless">Reach the destinaiton safely</p>
                        <p class="is-marginless">Street 21 - Kifisia - 99999 - Athens Greece</p>
                        <div>
                            <i class="fa fa-phone"></i> &nbsp; <span>Phone Number</span> &nbsp;
                            <a href="tel:+302109999999">+210 9999999</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="hero-foot">
        <div class="container has-text-centered">
            <p class="footer-text">
                &copy; 2020 - Bulma Hotel. All rights reserved. <br />
                <a href="https://www.aldiduzha.com?utm_source=Github" style="color: white;"
                >Designed with <i class="fa fa-heart fa-fw" style="font-size: 10px; color: red;"></i> by Aldi Duzha</a
                >
            </p>
        </div>
    </div>
</footer>