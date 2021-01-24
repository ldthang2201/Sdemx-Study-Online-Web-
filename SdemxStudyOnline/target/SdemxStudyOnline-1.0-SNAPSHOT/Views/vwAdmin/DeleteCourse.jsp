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
                    <input type="text" class="form-control" id="txtCatID" name="courID" readonly value="${course.courID}">
                </div>
                <div class="form-group">
                    <label for="txtCategory">Title</label>
                    <input type="text" class="form-control" id="txtCategory" name="title" readonly value="${course.title}">
                </div>
                <div class="form-group">
                    <label for="txtBranch">Category</label>
                    <input type="text" class="form-control" id="txtBranch" readonly value="${course.getCatNameByCatID()}">
                </div>
                <div class="card-footer">
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/Admin/Course" role="button">
                        <i class="fa fa-backward" aria-hidden="true"></i>
                        List
                    </a>
                    <button type="submit" class="btn btn-outline-danger" formaction="${pageContext.request.contextPath}/Admin/DeleteCourse">
                        <i class="fa fa-trash-o" aria-hidden="true"></i>
                        Delete
                    </button>

                </div>
            </form>
        </div>
    </jsp:body>
</t:main>