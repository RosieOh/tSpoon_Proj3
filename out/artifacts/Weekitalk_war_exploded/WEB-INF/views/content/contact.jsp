<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path3" value="${pageContext.request.contextPath }" />
<section class="hero" id="contact-us">
    <div class="hero-body">
        <div class="container">
            <div>
                <div class="content">
                    <h4 class="title is-4">Contact Us</h4>
                </div>
                <h6 class="subtitle is-6">If you've any queries feel free to contact us</h6>
                <div class="columns box">
                    <form class="column" action="#">
                        <div class="field">
                            <label class="label">Name</label>
                            <div class="control">
                                <input class="input" type="text" placeholder="Your Name" required="" />
                            </div>
                        </div>
                        <div class="field">
                            <label class="label">Email</label>
                            <div class="control">
                                <input class="input" type="text" placeholder="Email address" required="" />
                            </div>
                        </div>
                        <div class="field">
                            <label class="label">Phone Number</label>
                            <div class="control">
                                <input class="input" type="text" placeholder="Phone number" required="" />
                            </div>
                        </div>
                        <div class="field">
                            <label class="label">Message</label>
                            <div class="control">
                    <textarea
                            class="textarea"
                            type="text"
                            placeholder="Type your message here..."
                            required=""
                    ></textarea>
                            </div>
                        </div>
                        <div class="field">
                            <label class="label"></label>
                            <div class="control">
                                <input class="button is-primary" type="submit" />
                            </div>
                        </div>
                    </form>
                    <div class="column">
                        <iframe
                                width="100%"
                                height="100%"
                                frameborder="0"
                                style="border: 0;"
                                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d50310.604001548294!2d23.703320025394262!3d37.99083200838609!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14a1bd1f067043f1%3A0x2736354576668ddd!2zzpHOuM6uzr3OsQ!5e0!3m2!1sel!2sgr!4v1593689527371!5m2!1sel!2sgr"
                                allowfullscreen
                        ></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>