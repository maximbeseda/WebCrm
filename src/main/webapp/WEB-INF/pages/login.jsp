<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="../../resources/img/icon.png">

    <title>WEB CRM</title>

    <!-- Bootstrap core CSS -->
    <link href="resources/vendors/bootstrap/dist/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/build/css/main.css" rel="stylesheet">

    <link href="resources/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,300,700' rel='stylesheet' type='text/css'>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

    <script src="resources/build/js/modernizr.custom.js"></script>

</head>

<body>

<!-- Menu -->
<nav class="menu" id="theMenu">
    <div class="menu-wrap">
        <h1 class="logo"><a href="#headerwrap" style="font-family: Calibri, sans-serif">WEB CRM</a></h1>
        <i class="fa fa-arrow-right menu-close"></i>
        <!--Login form-->
        <spring:url value="/j_spring_security_check" var="loginUrl"/>
        <c:if test="${param.error == null}">
        <form class="navbar-form" role="form" action="${loginUrl}" method="POST">
            <div class="form-group" style="padding-bottom: 5px">
                <input style="width: 170px" type="text" placeholder="Login" class="form-control" name="j_login" required>
            </div>
            <div class="form-group" style="padding-bottom: 5px">
                <input style="width: 170px" type="password" placeholder="Password" class="form-control" name="j_password" required>
            </div>
            <button type="submit" class="btn btn-success btn-md btn-block" style="font-family: Calibri, sans-serif">Вход</button>
        </form>
        </c:if>
        <c:if test="${param.error ne null}">
            <form class="navbar-form has-error" role="form" action="${loginUrl}" method="POST">
                <div class="form-group" style="padding-bottom: 5px">
                    <input style="width: 170px" type="text" placeholder="Login" class="form-control" name="j_login">
                </div>
                <div class="form-group" style="padding-bottom: 5px">
                    <input style="width: 170px" type="password" placeholder="Password" class="form-control" name="j_password">
                </div>
                <button type="submit" class="btn btn-success btn-md btn-block" style="font-family: Calibri, sans-serif">Вход</button>
            </form>

        </c:if>
        <br>
        <h5 style="color: #1abc9c; padding-left: 5px">Admin</h5>
        <h5 style="color: #73879C; padding-left: 5px">login: admin</h5>
        <h5 style="color: #73879C; padding-left: 5px">password: 1234</h5>
        <h5 style="color: #1abc9c; padding-left: 5px; font-family: Calibri, sans-serif">Менеджер по продажам</h5>
        <h5 style="color: #73879C; padding-left: 5px">login: manager</h5>
        <h5 style="color: #73879C; padding-left: 5px">password: 1234</h5>
        <h5 style="color: #1abc9c; padding-left: 5px; font-family: Calibri, sans-serif">Менеджер договорного отдела</h5>
        <h5 style="color: #73879C; padding-left: 5px">login: cd</h5>
        <h5 style="color: #73879C; padding-left: 5px">password: 1234</h5>
        <h5 style="color: #1abc9c; padding-left: 5px; font-family: Calibri, sans-serif">Руководитель отдела продаж</h5>
        <h5 style="color: #73879C; padding-left: 5px">login: head</h5>
        <h5 style="color: #73879C; padding-left: 5px">password: 1234</h5>
        <br>

        <!--/Login form-->
        <a href="#contact" style="font-family: Calibri, sans-serif">Контакты</a>
        <a target="_blank" href="https://ru-ru.facebook.com/people/%D0%9C%D0%B0%D0%BA%D1%81%D0%B8%D0%BC-%D0%91%D0%B5%D1%81%D0%B5%D0%B4%D0%B0/100001801253233"><i class="fa fa-facebook"></i></a>
        <a target="_blank" href="https://ua.linkedin.com/in/maxim-beseda-b6971012a"><i class="fa fa-linkedin"></i></a>
        <a target="_blank" href="https://plus.google.com/111374507781495347251"><i class="fa fa-google-plus"></i></a>
        <a target="_blank" href="mailto:maxim.beseda@gmail.com"><i class="fa fa-envelope"></i></a>

    </div>

    <!-- Menu button -->
    <div id="menuToggle"><i class="fa fa-bars"></i></div>
</nav>

<!-- MAIN IMAGE SECTION -->
<div id="headerwrap">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
                <c:if test="${param.error ne null}">
                <div class="alert alert-danger alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <strong>Неверный логин или пароль!</strong> Повторите попытку еще раз.
                </div>
                </c:if>
                <h1 style="font-family: Calibri, sans-serif">WEB CRM</h1>
                <h3 style="font-family: Calibri, sans-serif; color:#FFFFFF">CRM-система для управления всем комплексом задач застройщиков и агентств недвижимости.</h3>
                <div class="spacer"></div>
                <i class="fa fa-angle-down"></i>
            </div>
        </div><!-- row -->
    </div><!-- /container -->
</div><!-- /headerwrap -->


<!-- BLOG POSTS -->
<div class="container">
    <div class="row mt">
        <div class="col-lg-12">
            <h1 style="font-family: Calibri, sans-serif">WEB CRM</h1>
        </div><!-- col-lg-12 -->
        <div class="col-lg-12">
            <p style="font-family: Calibri, sans-serif">Cистема для управления всем циклом продаж, от анализа потребности до заключения сделки и контроля оплат.</p>
        </div><!-- col-lg-8-->
    </div><!-- row -->

    <div class="row mt">
        <div class="col-lg-4">
            <img class="img-responsive" src="resources/img/post01.jpg" alt="">
            <h3><a style="font-family: Calibri, sans-serif">Единая база контактов</a></h3>
            <p style="font-family: Calibri, sans-serif">Создайте единую базу клиентов и партнеров вашей компании. В WEB CRM вы можете хранить любую контактную информацию.</p>
        </div>
        <div class="col-lg-4">
            <img class="img-responsive" src="resources/img/post02.jpg" alt="">
            <h3><a style="font-family: Calibri, sans-serif">Единая база объектов недвижимости</a></h3>
            <p style="font-family: Calibri, sans-serif">Создайте базу всех объектов недвижимости компании: дома, секции, квартиры, У вас всегда будет доступ к наиболее полной информации об объектах, включая описание, параметры, планировки и документы.</p>
        </div>
        <div class="col-lg-4">
            <img class="img-responsive" src="resources/img/post03.jpg" alt="">
            <h3><a style="font-family: Calibri, sans-serif">Единый реестр всех договоров</a></h3>
            <p style="font-family: Calibri, sans-serif">Ведите все договоры компании, а также связанные с ними спецификации и дополнительные соглашения, акты и другие документы, в едином реестре.</p>
        </div>
    </div><!-- row -->
</div><!-- container -->


<div class="container">
    <div class="row mt">
        <div class="col-lg-12">
            <h1 style="font-family: Calibri, sans-serif">Присоединяйтесь к нам в наших социальных сетях.</h1>
            <br>
        </div><!-- col-lg-12 -->
    </div><!-- row -->
</div><!-- container -->


<!-- SOCIAL FOOTER -->
<section id="contact"></section>
<div id="sf">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 dg">
                <h4 class="ml">Facebook</h4>
                <p class="centered"><a target="_blank" href="https://ru-ru.facebook.com/people/%D0%9C%D0%B0%D0%BA%D1%81%D0%B8%D0%BC-%D0%91%D0%B5%D1%81%D0%B5%D0%B4%D0%B0/100001801253233"><i class="fa fa-facebook"></i></a></p>
            </div>
            <div class="col-lg-4 lg">
                <h4 class="ml">LinkedIn</h4>
                <p class="centered"><a target="_blank" href="https://ua.linkedin.com/in/maxim-beseda-b6971012a"><i class="fa fa-linkedin"></i></a></p>
            </div>
            <div class="col-lg-4 dg">
                <h4 class="ml">Google +</h4>
                <p class="centered"><a target="_blank" href="https://plus.google.com/111374507781495347251"><i class="fa fa-google-plus"></i></a></p>
            </div>
        </div><!-- row -->
    </div><!-- container -->
</div><!-- Social Footer -->

<!-- CONTACT FOOTER -->
<div id="cf">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div id="mapwrap">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2682585.6691765273!2d29.838441313048392!3d50.36404733055903!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x40d4cf4ee15a4505%3A0x764931d2170146fe!2z0JrQuNGX0LIsIDAyMDAw!5e0!3m2!1suk!2sua!4v1474631052708" width="100%" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
                </div>
            </div><!--col-lg-8-->
            <div class="col-lg-4">
                <h4 style="font-family: Calibri, sans-serif">Контакты<br/></h4>
                <br>
                <p style="font-family: Calibri, sans-serif">
                    Максим Беседа<br/>
                    Тел: +38(095)943-19-89<br/>
                    E-mail: <a href="mailto:maxim.beseda@gmail.com">maxim.beseda@gmail.com</a>
                </p>
            </div><!--col-lg-4-->
        </div><!-- row -->
    </div><!-- container -->
</div><!-- Contact Footer -->


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="resources/vendors/jquery/dist/jquery-1.10.2.min.js"></script>
<script src="resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="resources/build/js/main.js"></script>
<script src="resources/build/js/masonry.pkgd.min.js"></script>
<script src="resources/build/js/imagesloaded.js"></script>
<script src="resources/build/js/classie.js"></script>
<script src="resources/build/js/AnimOnScroll.js"></script>
<script>
    new AnimOnScroll( document.getElementById( 'grid' ), {
        minDuration : 0.4,
        maxDuration : 0.7,
        viewportFactor : 0.2
    } );
</script>
</body>
</html>