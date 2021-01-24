<%--
  Created by IntelliJ IDEA.
  User: Son Van
  Date: 1/24/2021
  Time: 10:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<t:main>
    <jsp:body>
        <div class="container mt-3 mb-5">
            <div class="row">
                <div class="col h3">
                    List User Instructor
                </div>
                <div class="col-4">
                    <a href="${pageContext.request.contextPath}/Admin/AddTeacher" class="btn btn-outline-primary">Add new Instructor</a>
                </div>
            </div>
            <div class="row">
                <c:choose>
                    <c:when test="${lstTeacher.size() == 0}">
                        <div class="card-body">
                            <p class="card-text">Không có dữ liệu.</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="card-body">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th scope="col">id</th>
                                    <th scope="col">UserName</th>
                                    <th scope="col">FullName</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">&nbsp;</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="u" items="${lstTeacher}">
                                    <tr>
                                        <th scope="row">${u.id}</th>
                                        <td>${u.getUsername()}</td>
                                        <td>${u.name}</td>
                                        <td>${u.email}</td>
                                        <td class="text-right">
                                            <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/Admin/EditCategory?id=${c.catID}" role="button">
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
                <div class="col h3">
                    List User Student
                </div>
            </div>
            <div class="row">
                <c:choose>
                    <c:when test="${lstStudent.size() == 0}">
                        <div class="card-body">
                            <p class="card-text">Không có dữ liệu.</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="card-body">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th scope="col">id</th>
                                    <th scope="col">UserName</th>
                                    <th scope="col">FullName</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">&nbsp;</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="u" items="${lstStudent}">
                                    <tr>
                                        <th scope="row">${u.id}</th>
                                        <td>${u.getUsername()}</td>
                                        <td>${u.name}</td>
                                        <td>${u.email}</td>
                                        <td class="text-right">
                                            &nbsp;
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
