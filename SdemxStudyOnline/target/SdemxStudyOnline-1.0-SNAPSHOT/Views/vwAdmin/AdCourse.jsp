<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<t:main>
    <jsp:body>
        <div class="container mt-3 mb-5">
            <div class="row">
                <div class="col h3">
                    List Course
                </div>
            </div>
            <div class="row">
                <c:choose>
                    <c:when test="${lstCourse.size() == 0}">
                        <div class="card-body">
                            <p class="card-text">No Information</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="card-body">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Title</th>
                                    <th scope="col">Category</th>
                                    <th scope="col">Teacherss</th>
                                    <th scope="col">&nbsp;</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="c" items="${lstCourse}">
                                    <tr>
                                        <th scope="row">${c.courID}</th>
                                        <td>${c.title}</td>
                                        <td>${c.catName}</td>
                                        <td>${c.teacherID}</td>
                                        <td class="text-right">
                                            <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/Admin/DeleteCourse?id=${c.courID}" role="button">
                                                <i class="fa fa-pencil" aria-hidden="true"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="row">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/Admin" role="button">
                    <i class="fa fa-backward" aria-hidden="true"></i>
                    List
                </a>
            </div>
        </div>
    </jsp:body>
</t:main>