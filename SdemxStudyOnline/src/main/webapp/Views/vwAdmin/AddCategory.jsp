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
                    <label for="txtCategory">Category</label>
                    <input type="text" class="form-control" id="txtCategory" name="categoryname">
                </div>
                <div class="form-group">
                    <label for="txtBranch">Branch</label>
                    <select class="form-control" id="txtBranch" name="branchID">
                        <c:forEach var="b" items="${filterlstBranch}">
                            <option>${b.branchID}</option>
                        </c:forEach>
                    </select>
                </div>
                <button type="submit" class="btn btn-outline-success" formaction="${pageContext.request.contextPath}/Admin/AddCategory">
                    <i class="fa fa-plus" aria-hidden="true"></i> Add
                </button>
            </form>
        </div>
    </jsp:body>
</t:main>
