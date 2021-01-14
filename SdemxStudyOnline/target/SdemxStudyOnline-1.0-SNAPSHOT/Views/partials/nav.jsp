<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                            <div class="col-sm-3 p-1">
                                <ul style="list-style-type: none;">
                                    <li class="title-list"><a href="" class="title-list">${b.getBranchName()}</a></li>
                                    <c:forEach var="cat" items="${b.getLstCategory()}">
                                        <li><a href="#" class="cat-list"> ${cat.getCatName()}</a></li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <a href="#" class=" ml-auto mr-auto LogoMobile"></a>
        <form action="" class="form-inline ml-auto frmSearch mt-2 ">
            <button type="" class="btnSearch"><i class="fa fa-search" aria-hidden="false"></i></button>
            <input class=" mr-sm-2 txtSearch" autocomplete="off" placeholder="Search for anything" id="txtSearch">
            <button type="button" id="some-button" class="btnTimesMobile" onclick="closefrmSearchMobile()"><i
                    class="fa fa-times" aria-hidden="true"></i></button>
        </form>
        <a href="" class="btnTeach">Teach on Sdemx</a>
        <a href="#" class="btnShopping ml-3 mr-3 "><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
        <button type="button" class="btnSearchMobile mr-3 " id="btnSearchMobile" onclick="openfrmSearchMobile()"><i
                class="fa fa-search " aria-hidden="true "></i></button>
        <a href="#">
            <button class="btnLogin ml-2">Log in</button>
        </a>
        <a href="#">
            <button class="btnSignup ml-2 mr-3">Sign up</button>
        </a>
    </div>
</div>
<!--#endregion-->
<!--#region Bar-item-->
<div class="fade-bars">&nbsp;</div>
<div class="list-group bar-item" id="bar-item">
    <c:forEach var="b" items="${filterlstBranch}">
        <a href="#" class="list-group-item list-group-item-action d-flex justify-content-between" onclick="openBranch(${b.getBranchID()})">
            <span>${b.getBranchName()}</span>
            <span><i class="fa fa-caret-right" aria-hidden="true"></i></span>
        </a>
        <div class="list-group bar-item-list" id="${b.getBranchID()}">
            <c:forEach var="c" items="${b.getLstCategory()}">
                <a href="#" class="list-group-item list-group-item-action">
                    ${c.getCatName()}
                </a>
            </c:forEach>
        </div>
    </c:forEach>
</div>
<div class="space">&nbsp;</div>
<!--#endregion Bar-item-->