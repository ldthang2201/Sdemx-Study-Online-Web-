<%--
  Created by IntelliJ IDEA.
  User: Son Van
  Date: 1/15/2021
  Time: 8:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:main>
    <jsp:body>
        <div class="container d-flex justify-content-center p-4">
            <div class="card text-center m-3" style="width: 80%">
                <div class="card-header text-mute">
                    Can not Delete
                </div>
                <div class="card-body">
                    <p class="card-text">This Category is alreay has courses</p>
                    <a href="${pageContext.request.contextPath}/Admin/Category" class="btn btn-primary">Back Amin Category</a>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>