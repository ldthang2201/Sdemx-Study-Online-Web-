<%--
  Created by IntelliJ IDEA.
  User: Son Van
  Date: 12/24/2020
  Time: 9:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<t:main>
    <jsp:body>
        <div class="container">
            <div class="row">
                <div id="carouselExampleIndicators" class="carousel slide ml-4" data-ride="carousel"
                     style="z-index:0; position: relative; max-height: 500px; max-width: 500px">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active" style="height: 270px">
                            <img src="${pageContext.request.contextPath}/public/Picture/1.jpg" class="d-block w-100"
                                 alt="...">
                        </div>
                        <div class="carousel-item" style="height: 270px">
                            <img src="${pageContext.request.contextPath}/public/Picture/2.jpg" class="d-block w-100"
                                 alt="...">
                        </div>
                        <div class="carousel-item" style="height: 270px">
                            <img src="${pageContext.request.contextPath}/public/Picture/3.jpg" class="d-block w-100"
                                 alt="...">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="space"></div>
            <div class="row ">
                <div class="card-container d-flex justify-content-center"
                     style="width: 100%; z-index: 0; position: relative">
                    <div class="btn-next-prev text-muted" style="top: 100px; left:10px" onclick="left_click_card1()"><i
                            class="fa fa-chevron-left" aria-hidden="true"></i></div>
                    <div class="slider owl-carousel owl-carousel_card">
                        <c:forEach var="c" items="${lstMV}">
                            <div class="slider-card">
                                <a href="${pageContext.request.contextPath}/Course/Detail?id=${c.courID}">
                                    <div class="imgslider"><img
                                            src="${pageContext.request.contextPath}/public/course/${c.courID}/main.jpg">
                                    </div>
                                    <div class="card-conent">
                                        <div class="card-title">${c.title}</div>
                                        <p class="card-subtitle text-muted">${c.getBranchNameByBranchID()}</p>
                                        <p class="card-subtitle text-muted">${c.getTeacherNameByTeacherID()}</p>
                                        <div>
                                            <span class="star-ratings-css">${c.getRate()}</span>
                                            <span class="star-ratings-css" title=".${c.getStarRate()}"></span>
                                            <span class="card-subtitle text-muted">(${c.numRate})</span>
                                        </div>
                                        <div>
                                            <span class="card-title"><fmt:formatNumber value="${c.getFinalPrice()}"/><small>&nbsp;<ins>đ</ins>
                                        </small></span>
                                            <c:choose>
                                                <c:when test="${c.sale != 1}">
                                                    <span class="card-subtitle text-muted"><del><fmt:formatNumber value="${c.prices}"/><small>&nbsp;<ins>đ</ins>
                                        </small></del></span>
                                                </c:when>
                                            </c:choose>
                                            <span></span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="btn-next-prev text-muted" style="top: 100px; right:10px" onclick="right_click_card1()">
                        <i class="fa fa-chevron-right" aria-hidden="true"></i></div>
                </div>
            </div>
        </div>
        <script>
            $('.slider').owlCarousel({
                loop: true,
                autoplay: false,
                autoplayHoverPause: true,
                autoWidth: true,
                items: 4,
            })


            var owl_card1 = $('.owl-carousel_card');
            owl_card1.owlCarousel();

            var right_click_card1 = function () {
                owl_card1.trigger('next.owl.carousel', [300]);
            }

            var left_click_card1 = function () {
                owl_card1.trigger('prev.owl.carousel', [300]);
            }
        </script>
    </jsp:body>
</t:main>