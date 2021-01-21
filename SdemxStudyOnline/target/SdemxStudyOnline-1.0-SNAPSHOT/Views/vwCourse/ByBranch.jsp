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
                <a class="btn btn-outline-info ml-3 mr-3" style="border-radius: 20px" href="${pageContext.request.contextPath}/Course/Branch?id=${lstCat.get(0).branchID}">${titleBranch}</a>
                <c:forEach var="c" items="${lstCat}">
                    <a class="btn btn-outline-info ml-3 mr-3" style="border-radius: 20px" href="${pageContext.request.contextPath}/Course/Category?id=${c.catID}">${c.catName}</a>
                </c:forEach>

            </div>
            <div class="row">
                <p class="h1">${titleBranch} Courses</p>
            </div>
            <div class="row">
                <c:choose>
                    <c:when test="${lstCourse.size() == 0}">
                        <div>No Infomation</div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="c" items="${lstCourse}">
                            <div class="card card-course" style="width: 18rem;">
                                <img src="${pageContext.request.contextPath}/public/course/${c.courID}/main.jpg" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">${c.title}</h5>
                                    <p class="card-text">${c.tiniDes}</p>
                                    <div class="star-ratings-css" title=".${c.getRate()}"></div>
                                </div>
                                <div class="card-body">
                                    <a href="#" class="card-link">${c.getBranchNameByBranchID()} </a>
                                    <a href="#" class="card-link">${c.getTeacherNameByTeacherID()} </a>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>

        </div>
    </jsp:body>
</t:main>