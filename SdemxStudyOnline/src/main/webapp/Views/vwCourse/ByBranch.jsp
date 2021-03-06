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
        <div class="container mb-5">
            <div class="row m-3">
                <a class="btn btn-info ml-3 mr-3" style="border-radius: 20px"
                   href="${pageContext.request.contextPath}/Course/Branch?id=${lstCat.get(0).branchID}">${titleBranch}</a>
                <c:forEach var="c" items="${lstCat}">
                    <a class="btn btn-outline-info ml-3 mr-3" style="border-radius: 20px"
                       href="${pageContext.request.contextPath}/Course/Category?id=${c.catID}">${c.catName}</a>
                </c:forEach>
            </div>
            <div class="row">
                <div class="col-sm">
                    <p class="h2 pl-3">${titleBranch} Courses</p>
                </div>
                <div class="col-sm-1">
                    <p class="text-mute pl-3 d-flex justify-content-end">${total} results</p>
                </div>
            </div>
            <c:choose>
                <c:when test="${lstCourse.size() == 0}">
                    <div class="row">
                        <div>No Course in this Category! Sorry!!</div>
                    </div>
                </c:when>
                <c:otherwise>
                    <c:forEach var="c" items="${lstCourse}">
                        <a href="${pageContext.request.contextPath}/Course/Detail?id=${c.courID}"
                           class="row card-course">
                            <div class="col-sm-3" style="max-height: 190px;min-height: 100px;">
                                <img src="${pageContext.request.contextPath}/public/course/${c.courID}/main.jpg"
                                     class="card-img-left">
                            </div>
                            <div class="col-sm">
                                <h5 class="h4">${c.title}</h5>
                                <p class="tini-Des">${c.tiniDes}</p>
                                <p class="card-subtitle text-muted">${c.getBranchNameByBranchID()}</p>
                                <p class="card-subtitle text-muted">${c.getTeacherNameByTeacherID()}</p>
                                <div>
                                    <span class="star-ratings-css">${c.getRate()}</span>
                                    <span class="star-ratings-css" title=".${c.getStarRate()}"></span>
                                    <span class="card-subtitle text-muted">(${c.numRate})</span>
                                </div>
                                <div class="mt-2">
                                    <c:if test="${c.getNumberofRegiterByCourID() > 10}"><span class="best-seller">Best seler</span></c:if>
                                    <c:if test="${c.calcDateUpdate() < 7 }"><span class="best-seller">New</span></c:if>
                                    <c:if test="${c.premium}"><span class="best-seller">Premium</span> </c:if>
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
                </c:otherwise>
            </c:choose>
        </div>
        <div class="d-flex justify-content-center mt-5 mb-3" style="width: 100%">
            <nav aria-label="Page navigation example">
                <ul class="pagination">

                    <c:choose>
                        <c:when test="${curPage==1}">
                            <li class="page-item disabled">
                                <p class="page-link" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </p>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <a class="page-link" href="?id=${branchID}&page=${curPage-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:otherwise>
                    </c:choose>

                    <c:forEach var="p" items="${pages}">
                        <c:choose>
                            <c:when test="${curPage == p}">
                                <li class="page-item active" style="z-index: 0"><a class="page-link"
                                                                href="?id=${branchID}&page=${p}">${p}</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link" href="?id=${branchID}&page=${p}">${p}</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:choose>
                        <c:when test="${curPage==nPages}">
                            <li class="page-item disabled">
                                <p class="page-link" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </p>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <a class="page-link" href="?id=${branchID}&page=${curPage+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </nav>
        </div>
    </jsp:body>
</t:main>