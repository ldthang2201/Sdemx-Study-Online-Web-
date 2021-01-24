<%@ page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:main>
    <jsp:body>
        <div class="container d-flex justify-content-center p-4">
            <form method="post">
                <div class="card text-center m-3" style="width: 80%">
                    <div class="card-header text-muted">
                        Information!!
                    </div>
                    <input style="display: none" value="${curUser.id}" name="userid">
                    <div class="card-body">
                        <p class="card-text">Do you want to <span class="font-weigh-bold">Delete</span> username: ${curUser.id}</p>
                    </div>
                    <div class="card-footer">
                        <a class="btn btn-primary" href="${pageContext.request.contextPath}/Admin/User" role="button">
                            <i class="fa fa-backward" aria-hidden="true"></i>
                            List
                        </a>
                        <button type="submit" class="btn btn-outline-danger" formaction="${pageContext.request.contextPath}/Admin/DeleteUser">
                            <i class="fa fa-trash-o" aria-hidden="true"></i>
                            Delete
                        </button>

                    </div>
                </div>
            </form>
        </div>
    </jsp:body>
</t:main>