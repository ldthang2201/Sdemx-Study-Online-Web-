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
        <div class="container">
            <div class="row">
                <div class="card" style="width: 18rem;">
                    <img src="${pageContext.request.contextPath}/public/Picture/1.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">${course.title}</h5>
                        <p class="card-text">${course.tiniDes}</p>
                    </div>
                    <div class="card-body">
                        <a href="#" class="card-link">${course.prices}</a>
                        <a href="#" class="card-link">${course.rate}</a>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>