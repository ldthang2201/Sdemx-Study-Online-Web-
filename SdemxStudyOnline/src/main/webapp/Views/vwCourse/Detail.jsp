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

<%--<jsp:useBean id="course" scope="request" type="java.util.List<Beans.Course>"/>--%>

<t:main>
    <jsp:body>
        <style>
            .container-detail {
                width: 100%;
                background-color: #006666;
            }

            .video {
                background-color: black;
                color: white;
                width: 100%;
                height: 200px;
            }

            .detail-category span a {
                color: #ff8d1e;
                font-size: 16px;
                font-weight: bold;
            }

            .detail-title {
                color: white;
            }

            .detail-sub {
                color: white;
                font-size: 14px;
            }

            .feedback-username {
                font-size: 16px;
                font-weight: bold;
            }

            #btn-like:focus {
                background-color: red !important;
            }

            #btn-buy:focus {
                background-color: #218838 !important;
            }
        </style>
        <link rel="stylesheet" href="https://cdn.plyr.io/3.6.3/plyr.css"/>

        <div class="container-detail">
            <div class="container">
                <div class="row ">
                    <div class="col-md-4">
                        <div class="   mt-5 video   plyr__video-embed" id="player">

                            <iframe
                                    src=""
                                    allowfullscreen
                                    allowtransparency
                                    allow="autoplay" id="video"
                                    class=" mt-5 "
                            ></iframe>
                            <script src="https://cdn.plyr.io/3.6.3/plyr.js"></script>

                            <script>
                                const player = new Plyr('#player');
                            </script>

                        </div>
                        <div class="d-flex justify-content-around" style="width: 100%">
                            <form method="POST" id="frmbuy">
                                <c:choose>
                                    <c:when test="${!auth}">
                                        <button id="btn-buy" type="button" class="btn btn-register mt-3 mb-4">
                                            Buy now
                                        </button>
                                        <input type="hidden" name="action" value="buy">
                                        <input id="inputCourseId" type="hidden" name="CourseId" value="">
                                        <script>
                                            $('#inputCourseId').val($('#courseID').text());

                                            $('#btn-buy').on('click', () => {
                                                console.log("submit");
                                                $('#frmbuy').submit();
                                            })
                                            $('#frmbuy').on("submit", (e) => {
                                                e.preventDefault()
                                                $('#frmbuy').off('submit').submit();
                                            })
                                        </script>
                                    </c:when>
                                    <c:otherwise>
                                        <c:choose>
                                            <c:when test="${checkBuy}">
                                                <button id="btn-buy" type="button" class="btn btn-success mt-3 mb-4">
                                                    Buy now <i class="fa fa-check" aria-hidden="true"></i>
                                                </button>
                                                <script>
                                                    $('#video').attr('src', 'https://www.youtube.com/embed/rwCJvSKzQkc')
                                                </script>
                                            </c:when>
                                            <c:otherwise>
                                                <button id="btn-buy" type="button" class="btn btn-register mt-3 mb-4">
                                                    Buy now <i id="checkicon" class=" " aria-hidden="true"></i>
                                                </button>
                                                <script>
                                                    $('#btn-buy').click(
                                                        () => {
                                                            $('#btn-buy').removeClass('btn-register ');
                                                            $('#btn-buy').addClass('btn-success');
                                                            $('#video').attr('src', 'https://www.youtube.com/embed/rwCJvSKzQkc')
                                                            $('#checkicon').addClass('fa fa-check');
                                                            $.ajax({
                                                                url: '${pageContext.request.contextPath}/Course/Buy',
                                                                data: jQuery.param({
                                                                    action: "buy",
                                                                    CourseId: $('#courseID').text(),
                                                                }),
                                                                processData: false,
                                                                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                                                                type: 'POST',
                                                                success: function (data) {
                                                                }
                                                            });

                                                        }
                                                    )
                                                </script>
                                            </c:otherwise>
                                        </c:choose>

                                    </c:otherwise>
                                </c:choose>
                            </form>
                            <form method="POST" id="frmlike">
                                <c:choose>
                                    <c:when test="${!auth}">
                                        <button id="btn-dislike" type="button" class="btn btn-outline-danger mt-3 mb-4">
                                            Wishlisted <i class="fa fa-heart" aria-hidden="true"></i>
                                        </button>
                                        <input type="hidden" name="action" value="like">
                                        <input id="inputlike" type="hidden" name="CourseId" value="">
                                        <script>
                                            $('#inputlike').val(${course.courID});
                                            <%--console.log(${course.courID})--%>
                                            $('#btn-dislike').on('click', () => {
                                                console.log("submit");
                                                $('#frmlike').submit();
                                            })
                                            $('#frmlike').on("submit", (e) => {
                                                e.preventDefault()
                                                $('#frmlike').off('submit').submit();
                                            })
                                        </script>
                                    </c:when>
                                    <c:otherwise>
                                        <c:choose>
                                            <c:when test="${checkLike}">
                                                <button id="btn-like" type="button" class="btn btn-danger mt-3 mb-4">
                                                    Wishlisted <i class="fa fa-heart" aria-hidden="true"></i>
                                                </button>

                                            </c:when>
                                            <c:otherwise>
                                                <button id="btn-like" type="button"
                                                        class="btn btn-outline-danger mt-3 mb-4">
                                                    Wishlisted <i class="fa fa-heart" aria-hidden="true"></i>
                                                </button>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:otherwise>
                                </c:choose>

                                <script>
                                    $('#btn-like').click(
                                        () => {
                                            $.ajax({
                                                url: '${pageContext.request.contextPath}/Course/Like',
                                                data: jQuery.param({
                                                    action: "like",
                                                    CourseId:${course.courID},
                                                }),
                                                processData: false,
                                                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                                                type: 'POST',
                                                success: function (data) {
                                                    console.log("submit")
                                                }
                                            });
                                            $('#btn-like').toggleClass('btn-outline-danger');
                                            $('#btn-like').toggleClass('btn-danger');
                                        }
                                    )
                                </script>
                                <a id="courseID" style="display:none;">${course.getCourID()}</a>

                            </form>
                        </div>

                    </div>
                    <div class="col-md">
                        <div class="detail-category mt-5">
                            <span><a href="">${course.getBranchNameByBranchID()}</a></span>
                            <span> > </span>
                            <span><a href="">${course.getCatNameByCatID()}</a></span>
                        </div>
                        <div class="detail-title h3 font-weight-bold">${course.title}</div>
                        <div class="detail-title">${course.tiniDes}</div>
                        <div class="mt-2">
                            <c:if test="${course.getNumberofRegiterByCourID() > 10}"><span class="best-seller">Best seler</span></c:if>
                            <c:if test="${course.calcDateUpdate() < 7 }"><span class="best-seller">New</span></c:if>
                            <c:if test="${course.premium}"><span class="best-seller">Premium</span> </c:if>
                            <span class="star-ratings-css" style="color: gold">${course.getRate()}</span>
                            <span class="star-ratings-css" style="color: gold" title=".${course.getStarRate()}"></span>
                            <span class="card-subtitle" style="color: white">(<fmt:formatNumber
                                    value="${course.numRate}"/> ratings)</span>
                            <span class="card-subtitle" style="color: white"><fmt:formatNumber
                                    value="${course.numRegister}"/> students</span>
                        </div>
                        <div class="detail-sub">Create by <a style="color: white"
                                                             href="">${course.getTeacherNameByTeacherID()}</a></div>
                        <div class="detail-sub">
                            <span><i class="fa fa-wrench"
                                     aria-hidden="true"></i> Last Update: ${course.lastUpdate}</span>
                            <span>&nbsp;  <i class="fa fa-globe" aria-hidden="true"></i> ${course.language}</span>
                        </div>
                        <div class="mb-4 mt-1">
                            <span class="detail-title"
                                  style="font-weight: bold; font-size: 20px; color:#ff8d1e;"><fmt:formatNumber
                                    value="${course.getFinalPrice()}"/><small>&nbsp;<ins>đ</ins>
                                        </small></span>
                            <c:choose>
                                <c:when test="${course.sale != 1}">
                                                    <span class="detail-sub"><del><fmt:formatNumber
                                                            value="${course.prices}"/><small>&nbsp;<ins>đ</ins>
                                        </small></del></span>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container mt-5">
            <div class="row h3 font-weight-bold mt-3"> Description</div>
            <div class="row ml-5">
                    ${course.fullDes}
            </div>
            <div class="row h3 font-weight-bold mt-3">Courses Content</div>
            <div class="row h3 font-weight-bold mt-3">Another Courses</div>
            <c:forEach var="c" items="${lst5Course}">
                <a href="${pageContext.request.contextPath}/Course/Detail?id=${c.courID}" class="row card-course">
                    <div class="col-sm-3" style="max-height: 190px;min-height: 100px;">
                        <img src="${pageContext.request.contextPath}/public/course/${c.courID}/main.jpg"
                             class="card-img-left">
                    </div>
                    <div class="col-sm">
                        <h5 class="h5">${c.title}</h5>
                        <div>
                            <span class="star-ratings-css">${c.calcRateByCourID()} <i class="fa fa-star"
                                                                                      aria-hidden="true"></i></span>
                            <span class="card-subtitle text-muted ml-1"><i class="fa fa-eye"
                                                                           aria-hidden="true"></i> ${c.views}</span>

                        </div>
                        <div class="card-subtitle text-muted mt-1"><i class="fa fa-wrench"
                                                                      aria-hidden="true"> ${c.lastUpdate}</i></div>
                        <div class="mt-2">
                            <c:if test="${c.numRegister > 10}"><span class="best-seller">Best seler</span></c:if>
                            <c:if test="${c.calcDateUpdate() < 7 }"><span class="best-seller">New</span></c:if>
                        </div>
                    </div>
                    <div class="col-sm-1">
                                <span class="card-title card-title-course"><fmt:formatNumber
                                        value="${c.getFinalPrice()}"/><small>&nbsp;<ins>đ</ins>
                                        </small></span>
                        <c:choose>
                            <c:when test="${c.sale != 1}">
                                                    <span class="card-subtitle text-muted"><del><fmt:formatNumber
                                                            value="${c.prices}"/><small>&nbsp;<ins>đ</ins>
                                        </small></del></span>
                            </c:when>
                        </c:choose>
                    </div>
                </a>
            </c:forEach>
            <div class="row h3 font-weight-bold mt-3"> Student feedback</div>
            <c:if test="${auth}">
                <form method="post">
                    <div class="row ml-5">
                        <div class="form-group">
                            <select class="form-control" id="txrate" name="rate">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>
                        <div class="star-ratings-css mt-2" style="font-size: 20px"><i class="fa fa-star"
                                                                                      aria-hidden="true"></i></div>
                        <div class="form-group">
                            <textarea class="form-control" id="txtfeedback" name="feedback" rows="3" placeholder="Feedback content"></textarea>
                        </div>
                        <div class="ml-5">
                        <button type="submit" class="btn btn-outline-dark" formaction="${pageContext.request.contextPath}/AddFeedback">Add Feedback</button>
                        </div>
                        <input style="display: none" name="courid" value="${course.courID}">
                        <input style="display: none" name="userid" value="${authUser.id}">
                    </div>
                </form>
            </c:if>
            <c:forEach var="f" items="${course.lstFeedbackByCourID()}">
                <div class="row mb-2">
                    <div class="col-sm-1">
                        <img style="width: 100px; height: 100px; border-radius: 50%"
                             src="${pageContext.request.contextPath}/public/ImgLogo/user-logo.png">
                    </div>
                    <div class="col-sm">
                        <div class="feedback-username">${f.getUserFullNameByUserID()}</div>
                        <div>
                            <span class="star-ratings-css" title=".${f.rate}"></span>
                            <span class="detail-sub" style="color: gray">${f.dateFeedback}</span>
                        </div>
                        <div>${f.fullfeedback}</div>
                    </div>
                </div>
            </c:forEach>


        </div>
    </jsp:body>
</t:main>