<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: Максим Беседа
  Date: 25.08.2016
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<!-- saved from url=(0041)http://bootstrap-3.ru/examples/jumbotron/ -->
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="http://bootstrap-3.ru/assets/ico/favicon.ico">

    <title>WEB CRM</title>

    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>

    <link href="resources/css/carousel.css" rel="stylesheet">


    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="http://bootstrap-3.ru/examples/jumbotron/#">WEB CRM</a>
        </div>
        <div class="navbar-collapse collapse">
            <!--**************************************************************************************-->
            <c:url value="/j_spring_security_check" var="loginUrl"/>
            <form class="navbar-form navbar-right" role="form" action="${loginUrl}" method="POST">
                <div class="form-group">
                    <input type="text" placeholder="Login" class="form-control" name="j_login">
                </div>
                <div class="form-group">
                    <input type="password" placeholder="Password" class="form-control" name="j_password">
                </div>
                <button type="submit" class="btn btn-success">Sign in</button>
                <c:if test="${param.error ne null}">

                </c:if>
            </form>
            <!--***************************************************************************************-->
        </div><!--/.navbar-collapse -->
    </div>
</div>

<!-- Carousel
    ================================================== -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="item active">
            <img data-src="holder.js/900x500/auto/#777:#7a7a7a/text:First slide" alt="First slide">
            <div class="container">
                <div class="carousel-caption">
                    <h1>Example headline.</h1>
                    <p>Note: If you're viewing this page via a <code>file://</code> URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>
                    <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
                </div>
            </div>
        </div>
        <div class="item">
            <img data-src="holder.js/900x500/auto/#666:#6a6a6a/text:Second slide" alt="Second slide">
            <div class="container">
                <div class="carousel-caption">
                    <h1>Another example headline.</h1>
                    <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                    <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
                </div>
            </div>
        </div>
        <div class="item">
            <img data-src="holder.js/900x500/auto/#555:#5a5a5a/text:Third slide" alt="Third slide">
            <div class="container">
                <div class="carousel-caption">
                    <h1>One more for good measure.</h1>
                    <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                    <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
                </div>
            </div>
        </div>
    </div>
    <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
</div><!-- /.carousel -->


<div class="container">

    <hr>

    <footer>
        <p>© Created by Maxim Beseda 2016</p>
    </footer>
</div> <!-- /container -->


<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/docs.min.js"></script>

</body>
</html>