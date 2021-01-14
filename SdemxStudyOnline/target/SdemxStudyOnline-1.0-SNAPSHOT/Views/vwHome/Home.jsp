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
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel"
                 style="z-index:0; position: relative; max-height: 500px; max-width: 500px">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="${pageContext.request.contextPath}/public/Picture/1.jpg" class="d-block w-100"
                             alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="${pageContext.request.contextPath}/public/Picture/2.jpg" class="d-block w-100"
                             alt="...">
                    </div>
                    <div class="carousel-item">
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
            <div class="space"></div>
            <div>
                <c:forEach var="cat" items="${lstCat}">
                    <div>${cat.getCatName()}</div>
                </c:forEach>

                <c:forEach var="bran" items="${filterlstBranch}">
                    <h4 style="color:red">${bran.getBranchName()}</h4>
                    <c:forEach var="cat" items="${bran.getLstCategory()}">
                        <div>${cat.getCatID()} - ${cat.getCatName()}</div>
                    </c:forEach>

                </c:forEach>
            </div>
        </div>
    </jsp:body>
</t:main>