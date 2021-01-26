<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<t:main>
    <jsp:body>
        <div class="container m-5">
            <div class="row h3">Instructor</div>
            <div class="row mt-3">
                <div class="col-md-3">
                    <img class="d-flex justify-content-center "
                         src="${teacher.avatar}" style="width: 250px">
                </div>
                <c:choose>
                    <c:when test="${authUser.id == teacher.teacherID}">
                        <form method="post">
                            <div class="col-md">
                                <table class="table">
                                    <tbody>
                                    <tr>
                                        <th scope="row" style="width: 200px">Full Name:</th>
                                        <td style="color: #ff8d1e; font-weight: bold">${teacher.teacherName}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Age:</th>
                                        <td>${teacher.getAge()}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Areas of expertise:</th>
                                        <td><input class="form-control" type="text" placeholder="Areas of expertise"
                                                   value="${teacher.aoe}" name="aoe"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Description</th>
                                        <td><textarea class="form-control" id="txtDes"
                                                      placeholder="Input something about you" rows="3"
                                                      value="${teacher.fullDes}" name="fulldes">${teacher.fullDes}</textarea></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Courses</th>
                                        <td>${lstMyCourse.size()}</td>
                                    </tr>
                                    </tbody>
                                </table>
                                <button type="submit" class="btn btn-info" formaction="${pageContext.request.contextPath}/Teacher/Edit?id=${teacher.teacherID}">Save <i class="fa fa-check" aria-hidden="true"></i></button>
                            </div>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <div class="col-md">
                            <table class="table">
                                <tbody>
                                <tr>
                                    <th scope="row" style="width: 200px">Full Name:</th>
                                    <td style="color: #ff8d1e; font-weight: bold">${teacher.teacherName}</td>
                                </tr>
                                <tr>
                                    <th scope="row">Age:</th>
                                    <td>${teacher.getAge()}</td>
                                </tr>
                                <tr>
                                    <th scope="row">Areas of expertise:</th>
                                    <td>${teacher.aoe}</td>
                                </tr>
                                <tr>
                                    <th scope="row">Description</th>
                                    <td>${teacher.fullDes}</td>
                                </tr>
                                <tr>
                                    <th scope="row">Courses</th>
                                    <td>${lstMyCourse.size()}</td>
                                </tr>
                                <tr>

                                </tr>
                                </tbody>
                            </table>

                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="row h5 mt-3">My Courses</div>
            <div class="row m-5">
                <div class="card-container d-flex justify-content-center"
                     style="width: 100%; z-index: 0; position: relative">
                    <div class="btn-next-prev text-muted" style="top: 100px; left:10px"
                         onclick="left_click_card1()"><i
                            class="fa fa-chevron-left" aria-hidden="true"></i></div>
                    <div class="slider owl-carousel owl-carousel_card1">
                        <c:choose>
                            <c:when test="${lstMyCourse.size() == 0}">
                                <div class="slider-card d-flex align-items-center" style="height: 300px">
                                    <p style="font-weight: bold; font-size: 20px">No Course</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="c" items="${lstMyCourse}">
                                    <div class="slider-card" style="height: 300px">
                                        <a href="${pageContext.request.contextPath}/Course/Detail?id=${c.courID}">
                                            <div class="imgslider"><img
                                                    src="${pageContext.request.contextPath}/public/course/${c.courID}/main.jpg">
                                            </div>
                                            <div class="card-conent">
                                                <div class="card-title card-title-course">${c.title}</div>
                                                <p class="card-subtitle text-muted">${c.getCatNameByCatID()}</p>
                                                <p class="card-subtitle text-muted">${c.getTeacherNameByTeacherID()}</p>
                                                <div>
                                                        <span class="star-ratings-css">${c.calcRateByCourID()} <i
                                                                class="fa fa-star" aria-hidden="true"></i></span>
                                                </div>
                                                <div>
                                                </div>
                                                <div>
                                                    <c:if test="${c.getNumberofRegiterByCourID() > 10}"><span
                                                            class="best-seller">Best seler</span></c:if>
                                                    <c:if test="${c.calcDateUpdate() < 7 }"><span
                                                            class="best-seller">New</span></c:if>
                                                    <c:if test="${c.premium}"><span
                                                            class="best-seller">Premium</span> </c:if>
                                                </div>

                                            </div>
                                        </a>
                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="btn-next-prev text-muted" style="top: 100px; right:10px"
                         onclick="right_click_card1()">
                        <i class="fa fa-chevron-right" aria-hidden="true"></i></div>
                </div>
            </div>
        </div>
        <script>
            var owl_card1 = $('.owl-carousel_card1');
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