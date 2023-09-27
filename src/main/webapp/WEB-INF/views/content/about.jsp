<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path3" value="${pageContext.request.contextPath }" />
<section class="hero" id="about-us">
    <div class="hero-body">
        <div class="container">
            <div class="content">
                <h4 class="main_title title is-4">Explore Bulma Hotel</h4>
            </div>
            <div class="columns content">
                <div class="column">
                    <p>
                        With unmatched hospitality, convenience &amp; comforts, Bulma Hotel is an ideal choice for your stay.
                        Whether business trip or just a weekend leisure, we make an effort to bestow the finest services, that
                        will make your stay memorable.
                    </p>
                    <div class="reception">
                        <h5 class="main_title title is-5">Reception</h5>
                        <div class="reception-item">
                            <div>
                                <div>
                                    <i class="fa fa-phone"></i>
                                    <span>Phone Number</span>
                                </div>
                                <a href="tel:+302109999999">+30 210 9999999</a>
                            </div>
                            <a href="tel:+302109999999" class="button mobile-only">
                                <span>Call</span>
                            </a>
                        </div>
                        <div class="reception-item">
                            <div>
                                <div>
                                    <i class="fa fa-phone"></i>
                                    <span>Reservation</span>
                                </div>
                                <a href="tel:+302109999997">+30 2109999997</a>
                            </div>
                            <a href="tel:+302109999997" class="button mobile-only">
                                <span>Call</span>
                            </a>
                        </div>
                        <div class="reception-item">
                            <div>
                                <div>
                                    <i class="fa fa-envelope"></i>
                                    <span>Email</span>
                                </div>
                                <a href="mailto:reservations@bulmahotels.com">reservations@bulmahotels.com</a>
                            </div>
                            <a href="mailto:reservations@bulmahotels.com" class="button mobile-only">
                                <span>Mail</span>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- Reception Image -->
                <div class="column reception-image">
                    <img
                            src="https://images.unsplash.com/photo-1564501049412-61c2a3083791?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80"
                            alt="Bulma Hotels"
                    />
                </div>
            </div>
            <div class="content">
                <h5 class="main_title title is-5">Location</h5>
                <p>
                    Bulma Hotel is a business hotel with 45 air conditioned luxury rooms. The hotel is conveniently located in
                    close proximity to Athens, Greece.
                </p>
                <ul>
                    <li>3 kms from Kifisia bus station and railway station.</li>
                    <li>25 kms from Athens International Airport.</li>
                    <li>Less than 2 km from nearest shopping malls (The Mall Athens, &amp; Icon Mall).</li>
                </ul>
            </div>
        </div>
    </div>
</section>