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
                    List Category
                </div>
                <div class="col-4">
                    <a href="${pageContext.request.contextPath}/Admin/AddCategory" class="btn btn-outline-primary">Add new Category</a>
                </div>
            </div>
            <div class="row">
                <c:choose>
                    <c:when test="${categories.size() == 0}">
                        <div class="card-body">
                            <p class="card-text">Không có dữ liệu.</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="card-body">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Category</th>
                                    <th scope="col">Branch</th>
                                    <th scope="col">&nbsp;</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="c" items="${lstCat}">
                                    <tr>
                                        <th scope="row">${c.catID}</th>
                                        <td>${c.catName}</td>
                                        <td>${c.getBranchName()}</td>
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
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/Admin" role="button">
                    <i class="fa fa-backward" aria-hidden="true"></i>
                    List
                </a>
            </div>
        </div>
    </jsp:body>
</t:main>
