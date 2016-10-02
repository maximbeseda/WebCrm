<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>WEB CRM</title>

    <!-- Bootstrap -->
    <link href="resources/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="resources/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="resources/build/css/custom.min.css" rel="stylesheet">
</head>

<body class="nav-md">
<spring:url value="/" var="index"/>
<div class="container body">
    <div class="main_container">
        <!-- page content -->
        <div class="col-md-12">
            <div class="col-middle">
                <div class="text-center text-center">
                    <h1 class="error-number" style="color:#73879C">404</h1>
                    <h2 style="color:#73879C">Страница не найдена</h2>
                    <p style="color:#73879C">Запрашиваемая вами страница не существует, либо находится на стадии разработки.<a href="${index}" style="color: white">Перейти на главную!</a>
                    </p>
                    <p style="color:#73879C">${error}</p>
                </div>
            </div>
        </div>
        <!-- /page content -->
    </div>
</div>

<!-- jQuery -->
<script src="resources/vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="resources/vendors/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="resources/vendors/nprogress/nprogress.js"></script>

<!-- Custom Theme Scripts -->
<script src="resources/build/js/custom.min.js"></script>
</body>
</html>
