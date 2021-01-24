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
        <div class="container m-5" style="height: 400px">
            <div class="row h3"> Category</div>
            <form method="post">
                <div class="form-group">
                    <label for="txtCatID">#</label>
                    <input type="text" class="form-control" id="txtCatID" name="CatID" readonly value="${category.catID}">
                </div>
                <div class="form-group">
                    <label for="txtCategory">Category</label>
                    <input type="text" class="form-control" id="txtCategory" name="catName" value="${category.catName}">
                </div>
                <div class="form-group">
                    <label for="txtBranch">Branch</label>
                    <input type="text" class="form-control" id="txtBranch" readonly value="${category.getBranchName()}">
                </div>
                <input type="text" id="txtbranchID" name="branchID" style="display: none" value="${category.branchID}">
                <div class="card-footer">
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/Admin/Category" role="button">
                        <i class="fa fa-backward" aria-hidden="true"></i>
                        List
                    </a>
                    <button type="submit" class="btn btn-outline-danger" formaction="${pageContext.request.contextPath}/Admin/DeleteCategory">
                        <i class="fa fa-trash-o" aria-hidden="true"></i>
                        Delete
                    </button>
                    <button type="submit" class="btn btn-outline-success" formaction="${pageContext.request.contextPath}/Admin/UpdateCategory">
                        <i class="fa fa-check" aria-hidden="true"></i>
                        Save
                    </button>

                </div>
            </form>
        </div>
    </jsp:body>
</t:main>
