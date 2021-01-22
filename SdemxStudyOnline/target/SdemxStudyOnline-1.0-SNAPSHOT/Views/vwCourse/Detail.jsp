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
        </style>
        <div class="container-detail">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="video mt-5">
                            Video here
                        </div>
                        <form action="#" class="d-flex justify-content-around" style="width: 100%">
                            <button type="submit" class="btn btn-register mt-3 mb-4">
                                Buy now
                            </button>
                            <button type="submit" class="btn btn-outline-danger mt-3 mb-4">
                                Wishlisted <i class="fa fa-heart" aria-hidden="true"></i>
                            </button>
                        </form>
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
                        <div class="detail-sub mb-5">
                            <span><i class="fa fa-wrench"
                                     aria-hidden="true"></i> Last Update: ${course.lastUpdate}</span>
                            <span>&nbsp;  <i class="fa fa-globe" aria-hidden="true"></i> ${course.language}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container mt-5">
            <div class="row h3 font-weight-bold">${course.courID} Student feedback ${course.lstFeedbackByCourID().size()}</div>
<%--            <c:forEach var="f" items="${course.lstFeedbackByCourID()}">--%>
<%--                <div>${course.lstFeedbackByCourID().size()}</div>--%>
<%--                <div class="row">--%>
<%--                    <div class="col-sm-1">--%>
<%--                        <img class="user-icon" src="${pageContext.request.contextPath}/public/ImgLogo/user-logo.png">--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </c:forEach>--%>

        </div>
    </jsp:body>
</t:main>