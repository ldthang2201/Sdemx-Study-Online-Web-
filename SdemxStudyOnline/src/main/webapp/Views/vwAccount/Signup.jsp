<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>



<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@200&display=swap" rel="stylesheet">
    <title>Online Course - Learn anything | Sdemx</title>
    <link rel="icon" href="${pageContext.request.contextPath}/public/ImgLogo/logo1.ico" type="image/x-icon">

    <%--    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/themes/base/jquery-ui.css" rel="stylesheet" />--%>
    <%--    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>--%>
    <%--    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/jquery-ui.min.js"></script>--%>

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <%--    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css">

    <style>
        <%@include file="/Views/Styles.css" %>
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>


</head>

<body class="body-login">
<div class='cont s-signup'>
    <form method="post" id="frmlogin">
        <div class="form-signin">
            <h2>Sign in</h2>
            <label class="label-email">
                <span>Username</span>
                <input type="text" name="username" class="input-email">
            </label>
            <label class="label-password">
                <span>Password</span>
                <input type="password" name="password" class="input-password">
            </label>
            <button  type="submit" class="btn-signin" > Sign in</button>
            <p class="forgot-password">Forgot password</p>

            <c:if test="${hasError}" >
                <p class="login-message"> Login failed! ${errorMessage}</p>
            </c:if>
            <p class="social-text"> Or sign in with social</p>
            <div class="social-media">
                <a href="#" class="social-icon">
                    <img class="icon" src='https://static.xx.fbcdn.net/rsrc.php/yD/r/d4ZIVX-5C-b.ico'>
                </a>
                <a href="#" class="social-icon " >
                    <!-- <i class="fa fa-google" aria-hidden="true"></i> -->
                    <img class="icon" src='data:image/png;base64,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'>
                </a>
                <a href="#" class="social-icon">
                    <img class="icon" src='https://github.com/fluidicon.png'>

                </a>
                <a href="#" class="social-icon">
                    <img class="icon" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJcAAACXCAMAAAAvQTlLAAAAbFBMVEUAc7H///8AbK6Nrc8Ab69KiryMsdEAcbBlk8FMhboAaq0AZqsAaKwAWqYAY6pum8Xu9Pj3+fzm7fQdfLZVjr7F1+d5qM1xpMuyy+CArM8AXae71OZAgbgfd7PY5fCfwtuqxNxal8Odu9c6hrtHimUlAAAC8ElEQVR4nO2byXajMBBFQRYoERgLMJ6xIfz/P8YcdzoYShlKiUX3eXfBBi2uVaWphIMAAAAAAAAAAIAFJaVUviVGKJlk5Xod1VkqfbsMEDLaGZPnuSkunZyNmW6r8J1jp30L3dBxeIfZ6DnkmW7CMXvhWyoI0niiFYZb72KyJbTCsPYcSaUq0mvnucPkmtQKTeS3w5Id7eU79TNj8aoyn1qqtHmZg08vuc4tXuESXoRXNE+vueZXkBUWr2Pi1SuZLto3PM9fsqO1ipPf+d62Pl58byhkR2W+Sb3vDPVmqpWvfHdXL7afaLWpb6krSmxHQVzNQeuKqJv3JCuadAZBvCFFtK96NXPcn4T3lB+gRHZYLpeHZFZWAMwddV1r1dwGjdBpcOqphdY/VKeSfaFQ3p5vj/sfrkZv+4cavM1E+1JVRc+5OsZRmrkXHtXpiWA1qE/QLeq3t7puq9EhIa/a2rVUJRbk/it6D4agCj7hnx2HTDZn6vV5r91WMycvJVrb+SAsWicxFy+ZNtZj3pWdywhw8JIlGcJBl3V8Mb6XKK0x/CtWsmPJ9tLkwWAixh2WfK9PgnjjzO0wrteT7UA84sLckzO98pePRuKw4ROvx7j99UWtayR5iznX6+vwzqK/73VmLZW/75W3nNn1973ChhPIB3idOZc6P+CVG2M+HJ6cWpqzVxWvulPXxkd7k5hx0eroVXVK9LtqKeTaujAdGXcnbl6bZNAutYkVjLXIxStv78qK8mQRM4xdhYvXdpQ3IrL4R9+fwRy8dpMS/4HuMM7Myvcy0+E/rjy+sfn+zMr3aqajXz3Te9jFA71y4lChFB3IR3oVCTHINH0t/Uivadb3Xi/evchctiT+I73IsS9a717kXDkHL2ptsXwm8kivZ9KLXongBS94wQte8IIXvOAFL3jBC17wghe84AUveMHrP/SS0YIgLgct1lSLBX2ZXpJtGfd8gRQE+tMWtu+7NdV2Nv9wBgAAAAAAAADwj/IKObs6O2aV6nEAAAAASUVORK5CYII=">
                </a>
            </div>
        </div>
    </form>

    <div class="sub-cont">
        <div class="img">
            <div class="img-text m-up">
                <h2>New here?</h2>
                <p>Sign up and discover great amount of new opportunities!</p>
            </div>
            <div class="img-text m-in">
                <h2>Already have an account?</h2>
                <p>If you already has an account, just sign in. We've missed you!</p>
            </div>
            <div class="img-btn">
                <span class="m-up">Sign Up</span>
                <span class="m-in">Sign In</span>
            </div>
        </div>
        <div class="form sign-up form-signup">
            <form method="post" id="frmRegister" action="signup">
                <h2>Sign Up</h2>
                <label class="label-signup">
                    <label class="label-mess" id="name-mess"></label>
                    <input id="input-name" type="text" class="input-signup"  placeholder ="Name" name="name">
                </label>
                <label class="label-signup">
                    <label class="label-mess" id="username-mess"></label>
                    <input id="input-username" type="text" class="input-signup"  placeholder ="UserName" name="username">
                </label>
                <label class="label-signup">
                    <label class="label-mess" id="email-mess"></label>
                    <input  id="input-email" type="text" class="input-signup" placeholder ="Email" name="email">
                </label>
                <label class="label-signup" style="display: none">
                    <label class="label-mess" id="phone-mess"></label>
                    <input  id="input-phone" type="text" class="input-signup" placeholder ="Phone number" name="email">
                </label>
                <label class="label-signup">
                    <label class="label-mess" id="dob-mess"></label>
                    <input id="input-dob" type="text"  class="input-signup datepicker"  placeholder ="BirthDay" name="dob"></p>
                </label>
                <label class="label-password">
                    <label class="label-mess" id="password-mess"></label>
                    <input id="input-password" type="password" class="input-signup"  placeholder ="Password" name="password">
                </label>
                <label class="label-signup">
                    <label class="label-mess" id="cpassword-mess"></label>
                    <input id="input-comfirmpassword" type="password" class="input-signup" placeholder="Confirm Password">
                </label>
                <div id="succes-mess"  > Sign Up Succes!Please login</div>
                <button  class="btn-signup" type="submit">Sign Up </button>

                <p class="Policy-agree">By signing up, you agree to our Terms of Use and Privacy Policy. </p>
            </form>
        </div>
    </div>
</div>

</div>

</body>
<script>
    document.querySelector('.img-btn').addEventListener('click', function()
        {
            document.querySelector('.cont').classList.toggle('s-signup')
        }
    );

    $('.datepicker').on('click', function() {
        $(".datepicker").datetimepicker({
            format: 'd/m/Y',
            timepicker: false,
            mask: true,
        });
    } );
    $('#frmlogin').on('submit', function (e) {
        e.preventDefault();
        var form =document.getElementById('frmlogin');//retrieve the form as a DOM element

        var input = document.createElement('input');//prepare a new input DOM element
        input.setAttribute('name', "action");//set the param name
        input.setAttribute('value', 'Login');//set the value
        input.setAttribute('type', 'text')//set the type, like "hidden" or other
        form.appendChild(input);
        $('#frmlogin').off('submit').submit();
    })

    $('#frmRegister').on('submit', function (e) {
        e.preventDefault();
        $.ajax({
            url: '${pageContext.request.contextPath}/Account/Signup',
            data: jQuery.param({
                action:"Signup",
                name:$('#input-name').val(),
                username:$('#input-username').val(),
                password:$('#input-password').val(),
                email:$('#input-email').val(),
                dob:$('#input-dob').val(),
                comfirmpassword:$('#input-comfirmpassword').val()
            }),
            processData: false,
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            type: 'POST',
            success: function(data){
                console.log(data);
                if(data.includes("email"))
                {
                    $('#email-mess').text("");

                    $('#email-mess').text("Invalid Email");
                }
                else $('#email-mess').text("");

                if(data.includes("exist"))
                {
                    $('#email-mess').text("");
                    $('#email-mess').text("Email already exist!!!");
                }


                if(data.includes("Username")){
                    if(!$('#username-mess').text())$('#username-mess').text("Username already exists");
                }
                else $('#username-mess').text("");

                if(data.includes("birthday")){
                    if(!$('#dob-mess').text())$('#dob-mess').text("Invalid birthday");
                }
                else $('#dob-mess').text("");

                if(data.includes("pempty")){
                    if(!$('#password-mess').text())$('#password-mess').text("Invalid Password  ");
                }
                else {
                    $('#password-mess').text("");
                    if(data.includes("Comfirm")){
                        if(!$('#cpassword-mess').text())$('#cpassword-mess').text("Password not match ");
                    }
                    else $('#cpassword-mess').text("");
                }
                if(data.includes("Succes")){
                    if( $('#succes-mess').css('visibility')=='hidden') $('#succes-mess').css('visibility','visible');
                }
                else $('#succes-mess').css('visibility','hidden');

            }
        });



    });


</script>
<!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/8.2.4/firebase-app.js"></script>

<!-- TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#available-libraries -->
<script src="https://www.gstatic.com/firebasejs/8.2.4/firebase-analytics.js"></script>

<script>
    // Your web app's Firebase configuration
    // For Firebase JS SDK v7.20.0 and later, measurementId is optional
    var firebaseConfig = {
        apiKey: "AIzaSyCx1CYACjH1LkJzqsZMdmVNdOTKVcc2r08",
        authDomain: "sdemxstudyonline.firebaseapp.com",
        projectId: "sdemxstudyonline",
        storageBucket: "sdemxstudyonline.appspot.com",
        messagingSenderId: "861086264482",
        appId: "1:861086264482:web:3e78252588846be1fa3bfb",
        measurementId: "G-GKFSJYDF5Z"
    };
    // Initialize Firebase
    firebase.initializeApp(firebaseConfig);
    firebase.analytics();
</script>
</html>