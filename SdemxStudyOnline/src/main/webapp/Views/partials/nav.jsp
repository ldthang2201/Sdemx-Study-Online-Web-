<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="authUser" scope="session" type="Beans.User"/>
<!--#region navBar-->
<div class="fade-dropdown">&nbsp;</div>
<div class="fade-search" onclick="closefrmSearchMobile()">&nbsp;</div>
<div id="navigationBar">
    <div class="navDiv">
        <div class="menubar ml-3">
            <button id="btnBars" class="btnBars"><i class="fa fa-bars" aria-hidden="true"></i></button>
        </div>
        <a href="${pageContext.request.contextPath}/Home/" class="Logo ml-2"></a>
        <div class="menu ml-3" onmouseover="activeFade()" onmouseout="unactiveFade()">
            <div class="btn btn-link btnCategory ml-3">Categories</div>
            <div class="menu-item">
                <div class="container">
                    <div class="row">
                        <c:forEach var="b" items="${filterlstBranch}">
                            <div class="col-sm-3 pl-3">
                                <ul style="list-style-type: none;">
                                    <li class="title-list"><a
                                            href="${pageContext.request.contextPath}/Course/Branch?id=${b.branchID}"
                                            class="title-list">${b.getBranchName()}</a></li>
                                    <c:forEach var="cat" items="${b.getLstCategory()}">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/Course/Category?id=${cat.getCatID()}"
                                               class="cat-list"> ${cat.getCatName()}</a></li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <a href="#" class=" ml-auto mr-auto LogoMobile"></a>
        <form action="" class="form-inline ml-auto frmSearch mt-1 ">
            <button type="" class="btnSearch"><i class="fa fa-search" aria-hidden="false"></i></button>
            <input class=" mr-sm-2 txtSearch" autocomplete="off" placeholder="Search for anything" id="txtSearch">
            <button type="button" id="some-button" class="btnTimesMobile" onclick="closefrmSearchMobile()"><i
                    class="fa fa-times" aria-hidden="true"></i></button>
        </form>
        <a href="" class="btnTeach">Teach on Sdemx</a>
        <a href="#" class="btnShopping ml-3 mr-3 "><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
        <button type="button" class="btnSearchMobile mr-3 " id="btnSearchMobile" onclick="openfrmSearchMobile()">
            <i class="fa fa-search " aria-hidden="true "></i></button>
        <c:choose>
            <c:when test="${auth}">
                <form method="post" id="frmlogout" class="ml-3"
                      action="${pageContext.request.contextPath}/Account/Logout">
                    <input type="hidden" name="action" value="Logout">
                    <div style="   margin: 0 auto;" class="user-option-div">
                        <img class="user-icon " src="${pageContext.request.contextPath}/public/ImgLogo/user-logo.png">
                        <script>  $(`.user-icon`).attr('src',`${authUser.avatar}`)</script>
                        <a class="user-info">Hi! ${authUser.name}</a>
                        <div class="user-dropdown">
                            <div class="list-group">
                                <a href="${pageContext.request.contextPath}/Account/Profile"
                                   class="list-group-item list-group-item-action user-option">About me</a>
                                <a href="#" class="list-group-item list-group-item-action user-option">Something else
                                    here</a>
                                <a href="javascript: $('#frmlogout').submit();"
                                   class="list-group-item list-group-item-action user-option">Logout</a>
                            </div>
                        </div>

                    </div>
                </form>
                <script>$('#frmlogout').on('submit', function (e) {
                    e.preventDefault();
                    $('#frmlogout').off('submit').submit();
                })</script>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/Account/Login">
                    <button class="btnLogin ml-2">Log in
                        <i class="fa fa-sign-in" aria-hidden="true"></i>
                    </button>
                </a>
                <a href="${pageContext.request.contextPath}/Account/Signup">
                    <button class="btnSignup ml-2 mr-3">Sign up
                        <i class="fa fa-user-plus" aria-hidden="true"></i>
                    </button>
                </a>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<!--#endregion-->
<!--#region Bar-item-->
<div class="fade-bars">&nbsp;</div>
<div class="list-group bar-item" id="bar-item">
    <c:forEach var="b" items="${filterlstBranch}">
        <div class="list-group-item list-group-item-action d-flex justify-content-between"
             onclick="openBranch(${b.getBranchID()})">
            <span>${b.getBranchName()}</span>
            <span><i class="fa fa-caret-right" aria-hidden="true"></i></span>
        </div>
        <div class="list-group bar-item-list" id="${b.getBranchID()}">
            <a href="#" class="list-group-item list-group-item-action bar-btnReturn"
               onclick="closeBranch(${b.getBranchID()})">
                <i class="fa fa-caret-left" aria-hidden="true"></i> Menu
            </a>
            <a href="${pageContext.request.contextPath}/Course/Branch?id=${b.branchID}"
               class="list-group-item list-group-item-action font-weight-bold">
                All ${b.getBranchName()}
            </a>
            <c:forEach var="c" items="${b.getLstCategory()}">
                <a href="${pageContext.request.contextPath}/Course/Category?id=${c.catID}"
                   class="list-group-item list-group-item-action">
                        ${c.getCatName()}
                </a>
            </c:forEach>
        </div>
    </c:forEach>
    <c:choose>
        <c:when test="${auth}">
            <div class="user-option-div d-flex align-items-center justify-content-start">
                <img class="user-icon " style="width: 40px; margin-left:10px;margin-right: 20px"
                     src="${pageContext.request.contextPath}/public/ImgLogo/user-logo.png">
                <a class="user-info" href="${pageContext.request.contextPath}/Account/Profile">Hi! ${authUser.name}</a>
            </div>
        </c:when>
        <c:otherwise>
            <a href="${pageContext.request.contextPath}/Account/Login" class="list-group-item list-group-item-action"
               style="color: #0040ff">Log in</a>
            <a href="${pageContext.request.contextPath}/Account/Signup" class="list-group-item list-group-item-action"
               style="color: #0040ff">Sign up</a>
        </c:otherwise>
    </c:choose>

</div>
<div class="space">&nbsp;</div>
<!--#endregion Bar-item-->