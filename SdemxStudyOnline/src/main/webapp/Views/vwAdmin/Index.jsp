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
        <div class="container mt-5" style="height: 700px">
            <div class="list-group ml-5 mr-5">
                <a href="${pageContext.request.contextPath}/Admin/Category" class="list-group-item list-group-item-action">
                    <i class="fa fa-meetup" aria-hidden="true"></i> Category Management
                </a>
                <a href="#" class="list-group-item list-group-item-action">Dapibus ac facilisis in</a>
                <a href="#" class="list-group-item list-group-item-action">Morbi leo risus</a>
                <a href="#" class="list-group-item list-group-item-action">Porta ac consectetur ac</a>
                <a href="#" class="list-group-item list-group-item-action disabled" tabindex="-1" aria-disabled="true">Vestibulum at eros</a>
            </div>
        </div>
    </jsp:body>
</t:main>
