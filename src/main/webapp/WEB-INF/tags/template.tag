<!DOCTYPE html>
<%@tag description="Template Site tag" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@attribute name="title" fragment="true" %>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
    <title><jsp:invoke fragment="title"/></title>


    <!-- Bootstrap Core CSS -->
    <spring:url value="resources/css/bootstrap.min.css" var="bootstrap"/>
    <link href="${bootstrap}" rel="stylesheet" />
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <spring:url value="resources/css/ie10-viewport-bug-workaround.css" var="ie10"/>
    <link href="${ie10}" rel="stylesheet">
    <!-- Custom styles for this template -->
    <spring:url value="resources/css/dashboard.css" var="dash"/>
    <link href="${dash}" rel="stylesheet">
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <spring:url value="resources/js/ie8-responsive-file-warning.js" var="ie8"/>
    <script src=${ie8}></script><![endif]-->
    <spring:url value="resources/js/ie-emulation-modes-warning.js" var="ie"/>
    <script src="${ie}"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href=${index}>WEB CRM</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <c:url value="/logout" var="logoutUrl" />
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Почта</a></li>
                <li class="dropdow">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> <c:out value=" ${fullName}" /> <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><span class="glyphicon glyphicon-user"></span> Профиль</a>
                        </li>
                        <li>
                            <a href="#"><span class="glyphicon glyphicon-cog"></span> Настройки</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="${logoutUrl}"><span class="glyphicon glyphicon-off"></span></i> Выход</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="Поиск...">
            </form>
        </div>
    </div>
</nav>

<jsp:doBody/>

<!-- Bootstrap core JavaScript
   ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="resources/js/bootstrap.min.js"></script>
<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
<script src="resources/js/holder.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="resources/js/ie10-viewport-bug-workaround.js"></script>
</body>

</html>