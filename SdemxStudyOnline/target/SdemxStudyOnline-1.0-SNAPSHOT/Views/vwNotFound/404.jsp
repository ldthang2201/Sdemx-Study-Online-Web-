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
                    404 Not Found
                </div>
                <div class="card-body">
                    <h1 class="card-title m-5" style="font-size: 100px">Oops!</h1>
                    <p class="card-text">We can't find the page you're looking for.</p>
                    <a href="${pageContext.request.contextPath}/Home/" class="btn btn-primary">Back Home</a>
                </div>
                <div class="card-footer text-muted mt-5">
                    Sorry!!
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>