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
        <div class="container m-5">
            <form method="post">
                <div class="form-group">
                    <label for="txtCategory">UserName</label>
                    <input type="text" autofocus class="form-control" id="txtCategory" name="username">
                </div>
                <div class="form-group">
                    <label for="txtPass">Password</label>
                    <input type="password" class="form-control" id="txtPass" name="password">
                </div>
                <div class="form-group">
                    <label for="fullname">Full Name</label>
                    <input type="text" class="form-control" id="fullname" name="fullname">
                </div>
                <div class="form-group">
                    <label for="email">email</label>
                    <input type="text" class="form-control" id="email" name="email">
                </div>
                <button type="submit" class="btn btn-outline-success" formaction="${pageContext.request.contextPath}/Admin/AddTeacher">
                    <i class="fa fa-plus" aria-hidden="true"></i> Add
                </button>
            </form>
        </div>
    </jsp:body>
</t:main>
