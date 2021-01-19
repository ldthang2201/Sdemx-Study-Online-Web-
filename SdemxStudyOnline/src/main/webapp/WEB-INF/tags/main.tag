<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ tag pageEncoding="utf-8" %>

<%@attribute name="css" fragment="true" required="false" %>

<%@attribute name="js" fragment="true" required="false" %>


<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Course - Learn anything | Sdemx</title>
    <link rel="icon" href="${pageContext.request.contextPath}/public/ImgLogo/logo1.ico" type="image/x-icon">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="http://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">



    <style>
        <%@include file="/Views/Styles.css" %>
    </style>
</head>

<body>
<jsp:include page="../../Views/partials/nav.jsp"/>

<jsp:doBody/>

<jsp:include page="../../Views/partials/footer.jsp"/>

<script>

    function openfrmSearchMobile() {
        $('.frmSearch').css('display', 'flex');
        $('body').css('overflow', 'hidden');
        $('.fade-search').css('display', 'block');
        $('.btnTimesMobile').css('display', 'block');
    }

    function closefrmSearchMobile() {
        $('.frmSearch').css('display', 'none');
        $('body').css('overflow', 'auto');
        $('.fade-search').css('display', 'none');
        $('.btnTimesMobile').css('display', 'none');
    }

    function activeFade() {
        $('.fade-dropdown').css('visibility', 'visible');
        $('.fade-dropdown').css('opacity', '0.6');
        $('.container').css('z-index', '-1');
        $('.container').css('transition-delay', '0ms');
    }

    function unactiveFade() {
        $('.fade-dropdown').css('visibility', 'hidden');
        $('.fade-dropdown').css('opacity', '0');
        $('.container').css('transition-delay', '500ms');
        $('.container').css('z-index', '1');
    }

    // $('#btnBars').on('click', function () {
    //     $('.bar-item').css('right','50%');
    //     $('.fade-bars').css('display','block')
    //     $('body').css('overflow', 'hidden');
    // })
    $('#btnBars').on('click',function (){
        $('#bar-item').css('width','50%');
        $('.fade-bars').css('display','block');
        $('body').css('overflow', 'hidden');
    })

    $('#bar-list-item').on('click',function (){
        $(this).find('#list-group-item').css('width','100%');
        $(this).find('#list-group-item').css('opacity','1');
    })
    function openBranch(id){
        $('#'+id).css('width','100%');
    }
    function closeBranch(id){
        $('#'+id).css('width','0');
    }
    $('.fade-bars').on('click', function () {
        $('#bar-item').css('width','0')
        $('.fade-bars').css('display','none')
        $('body').css('overflow', 'auto');
    })

    var prevScrollpos = window.pageYOffset;
    window.onscroll = function() {
        var currentScrollPos = window.pageYOffset;
        if (prevScrollpos > currentScrollPos) {
            $('#navigationBar').css('top', '0');
        } else {
            $('#navigationBar').css('top', '-65px');;
        }
        prevScrollpos = currentScrollPos;
    }


</script>
</body>


</html>
