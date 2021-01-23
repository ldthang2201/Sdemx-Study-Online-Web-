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
    .profile-body{
        font-family: 'Yusei Magic', sans-serif;
        /*width: 60%;*/
        height: 520px;
        align-items: center;
        overflow: hidden;
        border:  1px solid powderblue;
        box-shadow: 2px 2px 5px black;
        margin: 10px 10px 10px 10px;
    }
    .profile-body::-webkit-scrollbar {
        display: none;
    }
    .profile-navbar{
         height: 1000px;
        overflow: hidden;
        border-right:1px solid powderblue; ;
    }
    .profile-navbar::-webkit-scrollbar {
        display: none;
    }


    .profile-main{
        /*background: #1dbdc9;*/
        height: 1000px;
        overflow: hidden;
    }
    .profile-main::-webkit-scrollbar {
        display: none;
    }
    .profile-avatar{
        border-radius: 50%;
        border: 1px solid red;
         height: 200px;
         width: 200px;
    }
    .profile-name{

        font-size: 25px;
        text-align: center;
        font-weight: bold;
        color:rosybrown;
    }
    .profile-navbar-option{
        font-size: 20px;
        width: 100%;
        cursor: pointer;
        box-shadow: inset 0 0 0 0 lightskyblue;
        transition: ease-in-out 0.3s;
        margin-bottom: 10px;
        margin-left: 15px;

    }
    .profile-navbar-option:hover{

        /*border: 2px solid #809fff;*/
        box-shadow: inset 200px 0 0 0  lightskyblue;
    }
    .profile-navbar-option:hover .profile-navbar-item{
        color: white;

    }
    .profile-navbar-item{
        margin: 20px auto 20px;

    }
    .profile-navbar-item:hover{
        text-decoration: none;

    }
    .profile-input{
        margin: 10px auto;
        border:1px solid #8a92a3;
        border-radius: 10px;
        box-shadow: 1px 1px 1px black;
        width: 500px;
        height: 50px;
        margin-right: 50px;
        padding-left: 10px;
        outline:none;
    }
    .profile-input:focus{
        border-color: #1dbdc9;
        border-radius: 10px;
        background-color: antiquewhite;
        outline: none !important;

    }
    .profile-input-span{
        padding-right: 15px;
        padding-left: 15px;
        font-weight: 200;
        font-size: 20px;
        border-width: 3px;
        box-sizing:border-box;

    }
    .profile-header{
        border-bottom:1px solid powderblue;
        font-weight: bold;
     }
    .btn-pwc{
        background: #34e5eb;
        width: 150px;
    }
    #Username{
        padding-left: 100px;
        margin-right: 100px;
        font-family: 'Yusei Magic', sans-serif;
        font-weight: 200;
        font-size: 20px;
    }

    .head-profile{
        font-family: 'Hachi Maru Pop', cursive;
        border-bottom: 2px solid rosybrown;
        font-size: 25px;
        padding-right: 50px;
        margin-bottom: 20px;
    }
</style>
<t:main>
    <jsp:body>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>

        <html>
           <body>
                    <div class=" container profile-body " style="max-width: 80%;min-width: 80%" >
                        <div class="row" >
                            <nav  class="profile-navbar col-sm-3  ">
                                <img class="profile-navbar-item profile-avatar d-flex justify-content-center " src="${pageContext.request.contextPath}/public/ImgLogo/user-logo.png">
                               <p class="profile-name profile-navbar-item " >${authUser.username}</p>
                                <div class="profile-navbar-option">
                                    <a id="profile" class="profile-navbar-item  " >View public profile</a>
                                </div>
                                <div class="profile-navbar-option">
                                    <a id="Mycourses"class="profile-navbar-item  ">My courses</a>
                                </div>
                                <div class="profile-navbar-option">
                                    <a id="changepassword"class="profile-navbar-item   ">Change Password</a>
                                </div>
                                <div class="profile-navbar-option">
                                    <a id="logout" href="javascript: $('#frmprofilelogout').submit();" h class="profile-navbar-item   ">Logout</a>
                                    <form  method="post" id="frmprofilelogout">
                                        <script>$('#frmprofilelogout').on('submit', function (e) {
                                            e.preventDefault();
                                            $('#frmprofilelogout').off('submit').submit();
                                        })</script>
                                        <input type="hidden" name="action" value="LogoutHome">
                                    </form>
                                </div>
                            </nav>
                            <main class="profile-main col-sm-9 " >
                                <div class="Profile" style="display: block">
                                    <div class="profile-header">
                                        <div class="row d-flex justify-content-center mt-2">
                                            <h2 > Public profile</h2>
                                        </div>
                                        <div class="row  justify-content-center mb-2">
                                            <h4>Add or edit information about yourself</h4>
                                        </div>
                                    </div>
                                    <form id="frmprofile " class="">
                                        <div class="  row mt-3 ml-3"> <h4 class="head-profile">Edit your profile here</h4></div>
                                        <div class="row d-flex align-items-center mt-2">
                                            <span class="col-sm-3" style=" font-weight: 200;font-size: 20px;">User name :</span>
                                            <span  class="  col-sm ml-2" type="text" style=" margin-right: 100px;"  id="Username">${authUser.username}</span><br>
                                        </div>

                                        <div class="row d-flex align-items-center">
                                            <span class="profile-input-span">Name :</span>
                                            <input id="Name" class=" profile-input " type="text" name="name" placeholder="Name" value=${authUser.fullname}><br>
                                        </div>
                                        <div class="row d-flex align-items-center">
                                            <span class="profile-input-span">Email :</span>
                                            <input id="Email" class="profile-input" type="text" name="email" PLACEHOLDER="Email" value=${authUser.email}><br>
                                        </div>
                                        <div class="row d-flex align-items-center">
                                            <span class="profile-input-span">Birthday :</span>
                                            <input  class="profile-input"  type="text" id="datepicker" name="birthday" value=${authUser.dob} placeholder="BirthDay"><br>
                                        </div>
<%--                                        <div class="row d-flex align-items-center">--%>
<%--                                            <span class="profile-input-span">Password :</span>--%>
<%--                                            <input  class="profile-input" type="password" name="password" PLACEHOLDER="Password"><br>--%>
<%--                                        </div>--%>
<%--                                        <div class="row d-flex align-items-center">--%>
<%--                                            <span class="profile-input-span">Comfirm password :</span>--%>
<%--                                            <input class="profile-input"  type="password" placeholder="Comfirm password"><br>--%>
<%--                                        </div>--%>
                                        <div class="row d-flex justify-content-end  mr-5 mt-3">
                                            <div id="profile-mess" class="col-sm-9 " style="text-align:center;color:red;position: absolute"> </div>
                                            <button class="  btn-pwc btn btn-primary col-sm-3 mt-4" >Save Change</button>
                                        </div>
                                    </form>
                                </div>

                                <div class="Account" style="display: none">
                                    <div class="profile-header">
                                        <div class="row d-flex justify-content-center mt-2">
                                            <h2 > Public profile</h2>
                                        </div>
                                        <div class="row  justify-content-center mb-2">
                                            <h4>Add or edit information about yourself</h4>
                                        </div>
                                    </div>
                                    <div id="FrmAccount " class="container"    >
                                        <div class="row mt-3 ml-3 "> <h4 class="head-profile" style="margin-bottom: 5px">Change password</h4></div>
                                        <div class="row d-flex align-items-center  mt-4 ">
                                            <span class="profile-input-span ">Password :</span>
                                            <input id="account-pwc" class="profile-input " type="password" name="password" PLACEHOLDER="Password"><br>
                                        </div>
                                        <div class="row d-flex align-items-center mt-3">
                                            <span class="profile-input-span">Comfirm password :</span>
                                            <input id="account-comfirm-pwc" class="profile-input"  type="password" placeholder="Comfirm password"><br>
                                        </div>
                                        <div class="row d-flex align-items-center mt-3">
                                            <span class="profile-input-span">New password :</span>
                                            <input id="account-new-pwc" class="profile-input"  type="password" placeholder="New password" name="newpassword"><br>
                                        </div>
                                        <div class="row d-flex justify-content-end  mr-5 mt-3">
                                                <div id="account-mess" class="col-sm-9 " style="text-align:center;color:red;position: absolute"> </div>

                                            <button class="  btn-pwc btn btn-primary col-sm-3 mt-4" >Submit</button>
                                        </div>
<%--                                        <input type="hidden" name="action" value="PasswordChange">--%>

                                    </div>
                                </div>
                                <div class="MyCourse" style="display: none">
                                    <div class="profile-header">
                                        <div class="row d-flex justify-content-center mt-2">
                                            <h2 > Public profile</h2>
                                        </div>
                                        <div class="row  justify-content-center mb-2">
                                            <h4>Add or edit information about yourself</h4>
                                        </div>
                                    </div>
                                    <div id="MyCourse" class="container"    >
                                        <div class="row mt-3 ml-3 "> <h4 class="head-profile" style="margin-bottom: 5px">Your courses</h4></div>

                                    </div>
                                </div>
                            </main>
                        </div>

                    </div>
          </body>
        </html>
        <script>

                $("#datepicker").datetimepicker({
                    format: 'd/m/Y',
                    timepicker: false,
                    mask: true,
                    value:$('#datepicker').val()
                });

        </script>
        <script>
            $('.btn-pwc').click(
                ()=>{
                    // console.log($('#account-pwc').val())
                    // console.log($('#account-new-pwc').val())
                    $.ajax({
                        url: '${pageContext.request.contextPath}/Account/PasswordChange',
                        data: jQuery.param({
                            action:"PasswordChange",
                            password:$('#account-pwc').val(),
                            comfirmpassword:$('#account-comfirm-pwc').val(),
                            newpassword:$('#account-new-pwc').val(),
                        }),
                        processData: false,
                        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                        type: 'POST',
                        success: function(data){
                            console.log(data);
                            $('#account-mess').text(data);
                        }
                    });
                }
            )

            $('#profile').click(
                ()=>{
                    $('.Account').css('display','none');
                    $('.Profile').css('display','block');
                    $('.MyCourse').css('display','none');
                }
            )

            $('#changepassword').click(
                ()=>{
                    $('.Profile').css('display','none');
                    $('.Account').css('display','block');
                    $('.MyCourse').css('display','none');
                }
            )
            $('#Mycourses').click(
                ()=>{
                    $('.Profile').css('display','none');
                    $('.Account').css('display','none');
                    $('.MyCourse').css('display','block');
                }
            )

        </script>
    </jsp:body>
</t:main>

