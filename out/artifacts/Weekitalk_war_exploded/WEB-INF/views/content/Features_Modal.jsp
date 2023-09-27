<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path3" value="${pageContext.request.contextPath }" />
<div class="modal">
    <div class="modal-background"></div>
    <div class="modal-content">
        <div class="content">
            <div class="columns">
                <div class="column">
                    <img src="https://bulma.io/images/bulma-logo.png" alt="Bulma Hotels" width="150" />
                </div>
                <div class="column">
                    <div>
                        <i class="fa fa-phone"></i> &nbsp; <span>Phone Number</span> &nbsp;
                        <a style="color: black;" href="tel:+30 2109999999">+30 2109999999</a>
                    </div>
                    <div>
                        <i class="fa fa-phone"></i> &nbsp; <span>Reservation</span> &nbsp;
                        <a style="color: black;" href="tel:+30 2109999997">+30 210999997</a>
                    </div>
                </div>
            </div>
            <h3>Facilities &amp; Features</h3>
            <div class="columns">
                <ul class="column">
                    <li>Free Wi-Fi Connectivity</li>
                    <li>Complimentary Breakfast</li>
                    <li>Doc on Call</li>
                    <li>Board Rooms</li>
                    <li>Electronic Card Locks</li>
                    <li>In Room Safe</li>
                </ul>
                <ul class="column">
                    <li>Laundry Facility</li>
                    <li>Hair Dryer</li>
                    <li>Travel Assistance</li>
                    <li>24 hrs Check-in &amp; Check-out</li>
                    <li>Coffee / Tea Maker in Room</li>
                    <li>Mini Bar</li>
                </ul>
            </div>
        </div>
    </div>
    <button class="modal-close is-large" aria-label="close"></button>
</div>

