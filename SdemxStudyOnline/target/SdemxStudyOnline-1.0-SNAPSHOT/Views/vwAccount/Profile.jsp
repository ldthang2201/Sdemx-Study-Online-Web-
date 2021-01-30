<%--
  Created by IntelliJ IDEA.
  User: dajne
  Date: 1/21/2021
  Time: 10:59 AM
  To change this template use File | Settings | File Templates.
--%>

<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="authUser" scope="session" type="Beans.User"/>

<%--<jsp:useBean id="course" scope="request" type="java.util.List<Beans.Course>"/>--%>

<style>
    .profile-body {
        font-family: 'Yusei Magic', sans-serif;
        /*width: 60%;*/
        height: 600px;
        align-items: center;
        overflow: hidden;
        border: 1px solid powderblue;
        box-shadow: 2px 2px 5px black;
        margin: 10px 10px 10px 10px;
    }

    .profile-body::-webkit-scrollbar {
        display: none;
    }

    .profile-navbar {
        height: 1000px;
        overflow: hidden;
        border-right: 1px solid powderblue;;
    }

    .profile-navbar::-webkit-scrollbar {
        display: none;
    }


    .profile-main {
        /*background: #1dbdc9;*/
        height: 1000px;
        overflow: hidden;
    }

    .profile-main::-webkit-scrollbar {
        display: none;
    }

    .profile-avatar {
        border-radius: 50%;
        border: 1px solid red;
        height: 200px;
        width: 200px;
    }

    .profile-name {

        font-size: 25px;
        text-align: center;
        font-weight: bold;
        color: rosybrown;
    }

    .profile-navbar-option {
        font-size: 20px;
        width: 100%;
        cursor: pointer;
        box-shadow: inset 0 0 0 0 lightskyblue;
        transition: ease-in-out 0.3s;
        margin-bottom: 10px;
        margin-left: 15px;

    }

    .profile-navbar-option:hover {

        /*border: 2px solid #809fff;*/
        box-shadow: inset 200px 0 0 0 lightskyblue;
    }

    .profile-navbar-option:hover .profile-navbar-item {
        color: white;

    }

    .profile-navbar-item {
        margin: 20px auto 20px;

    }

    .profile-navbar-item:hover {
        text-decoration: none;

    }

    .profile-input {
        margin: 10px auto;
        border: 1px solid #8a92a3;
        border-radius: 10px;
        box-shadow: 1px 1px 1px black;
        width: 500px;
        height: 50px;
        margin-right: 50px;
        padding-left: 10px;
        outline: none;
    }

    .profile-input:focus {
        border-color: #1dbdc9;
        border-radius: 10px;
        background-color: antiquewhite;
        outline: none !important;

    }

    .profile-input-span {
        padding-right: 15px;
        padding-left: 15px;
        font-weight: 200;
        font-size: 20px;
        border-width: 3px;
        box-sizing: border-box;

    }

    .profile-header {
        border-bottom: 1px solid powderblue;
        font-weight: bold;
    }

    .btn-pwc {
        background: #34e5eb;
        width: 150px;
    }

    #Username {
        padding-left: 100px;
        margin-right: 100px;
        font-family: 'Yusei Magic', sans-serif;
        font-weight: 200;
        font-size: 20px;
    }

    .head-profile {
        font-family: 'Hachi Maru Pop', cursive;
        border-bottom: 2px solid rosybrown;
        font-size: 25px;
        padding-right: 50px;
        margin-bottom: 20px;
    }
    #uploadimage{

        box-sizing: border-box;
        border: 2px solid bisque;
        border-radius: 50%;

    }
</style>
<t:main>
    <jsp:body>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
        <script src='https://cdn.jsdelivr.net/jquery.cloudinary/1.0.18/jquery.cloudinary.js'
                type='text/javascript'></script>
        <script src="https://widget.cloudinary.com/global/all.js" type="text/javascript"></script>
        <html>
        <body>
        <div class=" container profile-body " style="max-width: 80%;min-width: 80%">
            <div class="row">
                <nav class="profile-navbar col-sm-3  ">
                    <img class="profile-navbar-item profile-avatar d-flex justify-content-center "
                         src="${pageContext.request.contextPath}/public/ImgLogo/user-logo.png">
                    <p class="profile-name profile-navbar-item ">${authUser.username}</p>
                    <div class="profile-navbar-option">
                        <a id="profile" class="profile-navbar-item  ">View public profile</a>
                    </div>
                    <div class="profile-navbar-option">
                        <a id="Mycourses" class="profile-navbar-item  ">My courses</a>
                    </div>
                    <div class="profile-navbar-option">
                        <a id="changepassword" class="profile-navbar-item   ">Change Password</a>
                    </div>
                    <div class="profile-navbar-option">
                        <a id="changeavatar" class="profile-navbar-item   ">Change avatar</a>
                    </div>
                    <c:if test="${authUser.permission == 2}">
                        <div class="profile-navbar-option">
                            <a id="addnewCourse" class="profile-navbar-item ">Add New Course</a>
                        </div>
                    </c:if>
                    <div class="profile-navbar-option">
                        <a id="logout" href="javascript: $('#frmprofilelogout').submit();" h
                           class="profile-navbar-item   ">Logout</a>
                        <form method="post" id="frmprofilelogout">
                            <script>$('#frmprofilelogout').on('submit', function (e) {
                                e.preventDefault();
                                $('#frmprofilelogout').off('submit').submit();
                            })</script>
                            <input type="hidden" name="action" value="LogoutHome">
                        </form>
                    </div>
                </nav>
                <main class="profile-main col-sm-9 ">
                    <div class="Profile" style="display: block">
                        <div class="profile-header">
                            <div class="row d-flex justify-content-center mt-2">
                                <h2> Public profile</h2>
                            </div>
                            <div class="row  justify-content-center mb-2">
                                <h4>Add or edit information about yourself</h4>
                            </div>
                        </div>

                            <div class="  row mt-3 ml-3"><h4 class="head-profile">Edit your profile here</h4></div>
                            <div class="row d-flex align-items-center mt-2">
                                <span class="col-sm-3" style=" font-weight: 200;font-size: 20px;">User name :</span>
                                <span class="  col-sm ml-2" type="text" style=" margin-right: 100px;"
                                      id="Username">${authUser.username}</span><br>
                            </div>

                            <div class="row d-flex align-items-center">
                                <span class="profile-input-span">Name :</span>
                                <input id="Name" class=" profile-input " type="text" name="name" placeholder="Name"
                                       value=""><br>
                            <script>
                                $('#Name').val(`${authUser.name}`);
                                console.log(`${authUser.name}`);
                                $(document).ready(()=>{
                                    $(`.profile-avatar`).attr('src',`${authUser.avatar}`)
                                })

                            </script>
                            </div>
                            <div class="row d-flex align-items-center">
                                <span class="profile-input-span">Email :</span>
                                <input id="Email" class="profile-input" type="text" name="email" PLACEHOLDER="Email"
                                       value=${authUser.email}><br>
                            </div>
                            <div class="row d-flex align-items-center">
                                <span class="profile-input-span">Birthday :</span>
                                <input class="profile-input" type="text" id="datepicker" name="birthday"
                                       value=${user.dob} placeholder="BirthDay"><br>
                            </div>
                        <div class="row d-flex align-items-center">
                            <span class="profile-input-span">Phone :</span>
                            <input class="profile-input" type="text" id="Phone"
                                   value="" placeholder="Phone number"><br>
                            <script> $('#Phone').val(`${user.phone}`)</script>
                        </div>

                            <div class="row d-flex justify-content-end  mr-5 mt-3">
                                <div id="profile-mess" class="col-sm-9 "
                                     style="text-align:center;color:red;position: absolute"></div>
                                <button id="btn-save" class="  btn-pwc btn btn-primary col-sm-3 mt-4">Save Change</button>
                                <script>
                                            $('#btn-save').on('click',()=>{

                                                $('#frmprofile').on('submit', (e) => {
                                                    e.preventDefault();
                                                })

                                                $.ajax({
                                                    url: '${pageContext.request.contextPath}/Account/update',
                                                    data: jQuery.param({
                                                        action: "update",
                                                        email:$('#Email').val(),
                                                        dob:$('#datepicker').val(),
                                                        fullname:$('#Name').val(),
                                                        phone:$('#Phone').val()
                                                    }),
                                                    processData: false,
                                                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                                                    type: 'POST',
                                                    success: function (data) {
                                                        console.log(data);
                                                        $('#profile-mess').text(data);
                                                    }
                                                });

                                            })
                                </script>
                            </div>

                    </div>

                    <div class="Account" style="display: none">
                        <div class="profile-header">
                            <div class="row d-flex justify-content-center mt-2">
                                <h2> Public profile</h2>
                            </div>
                            <div class="row  justify-content-center mb-2">
                                <h4>Add or edit information about yourself</h4>
                            </div>
                        </div>
                        <div id="FrmAccount " class="container">
                            <div class="row mt-3 ml-3 "><h4 class="head-profile" style="margin-bottom: 5px">Change
                                password</h4></div>
                            <div class="row d-flex align-items-center  mt-4 ">
                                <span class="profile-input-span ">Password :</span>
                                <input id="account-pwc" class="profile-input " type="password" name="password"
                                       PLACEHOLDER="Password"><br>
                            </div>
                            <div class="row d-flex align-items-center mt-3">
                                <span class="profile-input-span">Comfirm password :</span>
                                <input id="account-comfirm-pwc" class="profile-input" type="password"
                                       placeholder="Comfirm password"><br>
                            </div>
                            <div class="row d-flex align-items-center mt-3">
                                <span class="profile-input-span">New password :</span>
                                <input id="account-new-pwc" class="profile-input" type="password"
                                       placeholder="New password" name="newpassword"><br>
                            </div>
                            <div class="row d-flex justify-content-end  mr-5 mt-3">
                                <div id="account-mess" class="col-sm-9 "
                                     style="text-align:center;color:red;position: absolute"></div>

                                <button class="  btn-pwc btn btn-primary col-sm-3 mt-4">Submit</button>
                            </div>
                                <%--                                        <input type="hidden" name="action" value="PasswordChange">--%>

                        </div>
                    </div>

                    <div class="ChangeAvatar " style="display: none">
                        <div class="profile-header">
                            <div class="row d-flex justify-content-center mt-2">
                                <h2> Public profile</h2>
                            </div>
                            <div class="row  justify-content-center mb-2">
                                <h4>Change your avatar</h4>
                            </div>
                        </div>
                        <form id="frmUpload">
                            <img id="uploadimage" class="  "  style="width: 300px;height: 300px;margin: 20px 200px  ; "><br>
                                <%--                                        <input type="file" id="myFile" name="filename"><br>--%>
                            <button id="btn-upload" class="  btn btn-primary  " style="margin: 30px 0 30px 220px;width: 120px ">upload</button>

                                <%--                                        <input type="file" id="myFile" name="filename"><br>--%>
                            <button id="btn-saveupload" class="  btn btn-primary  " style="margin: 30px;width: 120px  ">save change</button>

                        </form>



                        <script>


                            $(function () {
                                // Configure Cloudinary
                                // with the credentials on
                                // your Cloudinary dashboard
                                $.cloudinary.config({
                                    cloud_name: 'dajneem23',
                                    api_key: '295818925833263'
                                });
                                // Upload button
                                var uploadButton = $('#btn-upload');
                                // Upload-button event
                                var url;
                                uploadButton.on('click', function (e) {
                                    // Initiate upload
                                    $('#frmUpload').on('submit', (e) => {
                                        e.preventDefault();
                                    })
                                    cloudinary.openUploadWidget({
                                            cloud_name: 'dajneem23',
                                            upload_preset: 'jt0vztyy',
                                            tags: ['cgal']
                                        },
                                        function (error, result) {
                                            if (error) console.log(error);
                                            // If NO error, log image data to console
                                            var id = result[0].public_id;
                                            url=processImage(id);
                                        });
                                });
                                // console.log($.cloudinary.url(id, options))


                                $('#btn-saveupload').on('click',()=>{
                                    $('#frmUpload').on('submit', (e) => {
                                        e.preventDefault();
                                    })
                                   $('.profile-avatar').attr('src',url);
                                    $.ajax({
                                        url: '${pageContext.request.contextPath}/Account/Avatar',
                                        data: jQuery.param({
                                            action: "Avatar",
                                            url: url,
                                        }),
                                        processData: false,
                                        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                                        type: 'POST',
                                        success: function (data) {
                                            console.log("submit")
                                        }
                                    });


                                })
                            })

                            function processImage(id) {
                                var options = {
                                    client_hints: true,
                                };
                                $('#uploadimage').attr('src', $.cloudinary.url(id, options));
                                return   $.cloudinary.url(id, options)
                            }
                        </script>
                    </div>
                    <div class="MyCourse" style="display: none">
                        <div class="profile-header">
                            <div class="row d-flex justify-content-center mt-2">
                                <h2> Public profile</h2>
                            </div>
                            <div class="row  justify-content-center mb-2">
                                <h4>Add or edit information about yourself</h4>
                            </div>
                        </div>
                        <div class="row mt-3 ml-3"><h4 class="head-profile">My Course</h4></div>
                        <div class="row ml-3">
                            <div class="col-sm" style="font-weight: bold; font-size: 20px">
                                Watch List
                            </div>
                            <div class="text-muted col-sm-2"
                                 style=" font-weight:bold; font-size: 13px;">${lstWatch.size()} results
                            </div>
                        </div>
                        <div class="row">
                            <div class="card-container d-flex justify-content-center"
                                 style="width: 100%; z-index: 0; position: relative">
                                <div class="btn-next-prev text-muted" style="top: 100px; left:10px"
                                     onclick="left_click_card1()"><i
                                        class="fa fa-chevron-left" aria-hidden="true"></i></div>
                                <div class="slider owl-carousel owl-carousel_card1">
                                    <c:choose>
                                        <c:when test="${lstWatch.size() == 0}">
                                            <div class="slider-card d-flex align-items-center" style="height: 300px">
                                                <p style="font-weight: bold; font-size: 20px">No Course</p>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach var="c" items="${lstWatch}">
                                                <div class="slider-card" style="height: 300px">
                                                    <a href="${pageContext.request.contextPath}/Course/Detail?id=${c.courID}">
                                                        <div class="imgslider"><img
                                                                src="${pageContext.request.contextPath}/public/course/${c.courID}/main.jpg">
                                                        </div>
                                                        <div class="card-conent">
                                                            <div class="card-title card-title-course">${c.title}</div>
                                                            <p class="card-subtitle text-muted">${c.getCatNameByCatID()}</p>
                                                            <p class="card-subtitle text-muted">${c.getTeacherNameByTeacherID()}</p>
                                                            <div>
                                                        <span class="star-ratings-css">${c.calcRateByCourID()} <i
                                                                class="fa fa-star" aria-hidden="true"></i></span>
                                                            </div>
                                                            <div>
                                                            </div>
                                                            <div>
                                                                <c:if test="${c.getNumberofRegiterByCourID() > 10}"><span
                                                                        class="best-seller">Best seler</span></c:if>
                                                                <c:if test="${c.calcDateUpdate() < 7 }"><span
                                                                        class="best-seller">New</span></c:if>
                                                                <c:if test="${c.premium}"><span
                                                                        class="best-seller">Premium</span> </c:if>
                                                            </div>

                                                        </div>
                                                    </a>
                                                </div>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="btn-next-prev text-muted" style="top: 100px; right:10px"
                                     onclick="right_click_card1()">
                                    <i class="fa fa-chevron-right" aria-hidden="true"></i></div>
                            </div>
                        </div>
                        <div class="row ml-3 mt-3">
                            <div class="col-sm" style="font-weight: bold; font-size: 20px">
                                Wish List
                            </div>
                            <div class="text-muted col-sm-2"
                                 style="font-size: 13px; font-weight: bold">${lstWish.size()} results
                            </div>
                        </div>
                        <div class="row">
                            <div class="card-container d-flex justify-content-center"
                                 style="width: 100%; z-index: 0; position: relative">
                                <div class="btn-next-prev text-muted" style="top: 100px; left:10px"
                                     onclick="left_click_card2()"><i
                                        class="fa fa-chevron-left" aria-hidden="true"></i></div>
                                <div class="slider owl-carousel owl-carousel_card2">
                                    <c:choose>
                                        <c:when test="${lstWish.size() == 0}">
                                            <div class="slider-card d-flex align-items-center" style="height: 300px">
                                                <p style="font-weight: bold; font-size: 20px">No Course</p>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach var="c" items="${lstWish}">
                                                <div class="slider-card" style="height: 300px">
                                                    <a href="${pageContext.request.contextPath}/Course/Detail?id=${c.courID}">
                                                        <div class="imgslider"><img
                                                                src="${pageContext.request.contextPath}/public/course/${c.courID}/main.jpg">
                                                        </div>
                                                        <div class="card-conent">
                                                            <div class="card-title card-title-course">${c.title}</div>
                                                            <p class="card-subtitle text-muted">${c.getCatNameByCatID()}</p>
                                                            <p class="card-subtitle text-muted">${c.getTeacherNameByTeacherID()}</p>
                                                            <div>
                                                        <span class="star-ratings-css">${c.calcRateByCourID()} <i
                                                                class="fa fa-star" aria-hidden="true"></i></span>
                                                            </div>
                                                            <div>
                                                            </div>
                                                            <div>
                                                                <c:if test="${c.getNumberofRegiterByCourID() > 10}"><span
                                                                        class="best-seller">Best seler</span></c:if>
                                                                <c:if test="${c.calcDateUpdate() < 7 }"><span
                                                                        class="best-seller">New</span></c:if>
                                                                <c:if test="${c.premium}"><span
                                                                        class="best-seller">Premium</span> </c:if>
                                                            </div>

                                                        </div>
                                                    </a>
                                                </div>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="btn-next-prev text-muted" style="top: 100px; right:10px"
                                     onclick="right_click_card2()">
                                    <i class="fa fa-chevron-right" aria-hidden="true"></i></div>
                            </div>
                        </div>
                    </div>

                    <div class="AddCourse" style="display: none">
                        <div class="profile-header">
                            <div class="row d-flex justify-content-center mt-2">
                                <h2> Add New Course</h2>
                            </div>
                        </div>
                        <div class="row ml-3">
                            <div class="form-group">
                                <label for="txttitle">Course title</label>
                                <input type="text" autofocus class="form-control" id="txttitle" name="title">
                            </div>
                        </div>
                        <div class="row ml-3">
                            <div class="form-group">
                                <label for="txtcatid">Category ID</label>
                                <select class="form-control" id="txtcatid" name="catid">
                                    <c:forEach var="c" items="${lstCat}">
                                        <option>${c.catID}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row ml-3">
                            <div class="form-group">
                                <label for="txttini">Tini Description</label>
                                <input type="text" autofocus class="form-control" id="txttini" name="tinides">
                            </div>
                        </div>
                        <div class="row ml-3">
                            <div class="form-group">
                                <label for="txtprice">Price</label>
                                <input type="text" autofocus class="form-control" id="txtprice" name="prices">
                            </div>
                        </div>
                        <div class="row ml-3">
                            <div class="form-group">
                                <label for="txtfulldes">Full Descripe</label>
                                <textarea class="form-control" id="txtfulldes" rows="3" name="fulldes"></textarea>
                            </div>
                        </div>
                        <div class="row ml-3">
                            <div class="form-group">
                                <label for="txtLanguage">Language</label>
                                <input type="text" autofocus class="form-control" id="txtLanguage" name="language">
                            </div>
                        </div>
                        <button id="addcourse" type="submit" class="btn btn-outline-success"  >
                            <i class="fa fa-plus" aria-hidden="true"></i> Add
                        </button>
                        <script>
                            $('#addcourse').on('click',()=>{

                                // $('#frm').on('submit', (e) => {
                                //     e.preventDefault();
                                // })

                                $.ajax({
                                    url: '${pageContext.request.contextPath}/Account/update',
                                    data: jQuery.param({
                                        action: "AddCourse",
                                        title:$('#txttitle').val(),
                                        fulldes:$('#txtfulldes').val(),
                                        tinides:$('#txttini').val(),
                                        prices:$('#txtprice').val(),
                                        language:$('#txtLanguage').val(),
                                        catid:$('#txtcatid').val()
                                    }),
                                    processData: false,
                                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                                    type: 'POST',
                                    success: function (data) {
                                    }
                                });


                            })
                        </script>
                    </div>
                </main>
            </div>

        </div>
        </body>
        </html>
        <script>
                 var dob = $('#datepicker').val();
                    console.log(dob);

                     $("#datepicker").datetimepicker({
                         useCurrent:false,
                         defaultDate: Date.parse(dob),
                         format: 'd/m/Y',
                         timepicker: false,
                         mask: true,
                         value:dob
                     });





            var owl_card1 = $('.owl-carousel_card1');
            owl_card1.owlCarousel();
            var right_click_card1 = function () {
                owl_card1.trigger('next.owl.carousel', [300]);
            }

            var left_click_card1 = function () {
                owl_card1.trigger('prev.owl.carousel', [300]);
            }
            var owl_card2 = $('.owl-carousel_card2');
            owl_card2.owlCarousel();
            var right_click_card2 = function () {
                owl_card2.trigger('next.owl.carousel', [300]);
            }

            var left_click_card2 = function () {
                owl_card2.trigger('prev.owl.carousel', [300]);
            }

            $('.btn-pwc').click(
                () => {
                    // console.log($('#account-pwc').val())
                    // console.log($('#account-new-pwc').val())
                    $.ajax({
                        url: '${pageContext.request.contextPath}/Account/PasswordChange',
                        data: jQuery.param({
                            action: "PasswordChange",
                            password: $('#account-pwc').val(),
                            comfirmpassword: $('#account-comfirm-pwc').val(),
                            newpassword: $('#account-new-pwc').val(),
                        }),
                        processData: false,
                        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                        type: 'POST',
                        success: function (data) {
                            console.log(data);
                            $('#account-mess').text(data);
                        }
                    });
                }
            )

            $('#profile').click(
                () => {
                    $('.ChangeAvatar').css('display', 'none')
                    $('.Account').css('display', 'none');
                    $('.Profile').css('display', 'block');
                    $('.MyCourse').css('display', 'none')
                    $('.profile-body').css('height', '600px')
                    $('.AddCoure').css('display', 'none')
                }
            )

            $('#changepassword').click(
                () => {
                    $('.ChangeAvatar').css('display', 'none')
                    $('.Profile').css('display', 'none');
                    $('.Account').css('display', 'block');
                    $('.MyCourse').css('display', 'none')
                    $('.profile-body').css('height', '520px')
                    $('.AddCoure').css('display', 'none')
                }
            )

            $('#changeavatar').click(
                () => {
                    $('.Profile').css('display', 'none');
                    $('.Account').css('display', 'none');
                    $('.ChangeAvatar').css('display', 'block')
                    $('.MyCourse').css('display', 'none')
                    $('.profile-body').css('height', '520px')
                    $('.AddCoure').css('display', 'none')
                }
            )
            $('#Mycourses').click(
                () => {
                    $('.Profile').css('display', 'none');
                    $('.Account').css('display', 'none');
                    $('.ChangeAvatar').css('display', 'none')
                    $('.MyCourse').css('display', 'block')
                    $('.profile-body').css('height', '880px')
                    $('.AddCoure').css('display', 'none')
                }
            )
            $('#addnewCourse').click(
                () => {
                    $('.Profile').css('display', 'none');
                    $('.Account').css('display', 'none');
                    $('.ChangeAvatar').css('display', 'none')
                    $('.MyCourse').css('display', 'none')
                    $('.profile-body').css('height', '880px')
                    $('.AddCourse').css('display', 'block')
                }
            )

        </script>
        <script src="${pageContext.request.contextPath}/lib/jquery.fileupload.js"></script>
    </jsp:body>
</t:main>

