<!DOCTYPE html>
<%@tag description="Template Site tag" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@attribute name="title" fragment="true" %>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="../../resources/img/icon.png">
    <title>
        <jsp:invoke fragment="title"/>
    </title>

    <!-- Bootstrap -->
    <link href="resources/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="resources/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="resources/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="resources/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <script src="resources/js/ie8-responsive-file-warning.js"></script>
    <![endif]-->
    <script src="resources/js/ie-emulation-modes-warning.js"></script>
    <!-- jQuery custom content scroller -->
    <link href="resources/vendors/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.min.css" rel="stylesheet"/>
    <!--Data Tables CSS-->
    <link href="resources/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="resources/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="resources/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <!-- Select2 -->
    <link href="resources/vendors/select2/dist/css/select2.min.css" rel="stylesheet">
    <!-- FullCalendar -->
    <link href="resources/vendors/fullcalendar/dist/fullcalendar.min.css" rel="stylesheet">
    <link href="resources/vendors/fullcalendar/dist/fullcalendar.print.css" rel="stylesheet" media="print">

    <!-- Custom Theme Style -->
    <link href="resources/build/css/custom.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">

        <!-- top navigation -->
        <div class="top_nav">
            <div class="nav_menu">
                <nav>
                    <div class="nav toggle">
                        <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                    </div>

                    <ul class="nav navbar-nav navbar-right">
                        <c:url value="/logout" var="logoutUrl"/>
                        <li class="">
                            <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown"
                               aria-expanded="false"><i class="fa fa-user"></i> <c:out value=" ${fullName}"/> <span class=" fa fa-angle-down"></span>
                            </a>
                            <ul class="dropdown-menu dropdown-usermenu pull-right">
                                <li><a href="/user_info"><i class="fa fa-user pull-right"></i>Профиль</a></li>
                                <li><a href="${logoutUrl}"><i class="fa fa-sign-out pull-right"></i>Выход</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        <!-- /top navigation -->

        <jsp:doBody/>

        <!-- footer content -->
        <footer>
            <div class="pull-right">
                <a target="_blank" href="https://ua.linkedin.com/in/maxim-beseda-b6971012a">© Maxim Beseda 2016</a>
            </div>
            <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
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
<!-- jQuery custom content scroller -->
<script src="resources/vendors/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- Data tables -->
<script src="resources/js/jquery.dataTables.min.js"></script>
<script src="resources/js/dataTables.bootstrap.min.js"></script>
<script src="resources/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="resources/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
<script src="resources/vendors/jszip/dist/jszip.min.js"></script>
<script src="resources/vendors/pdfmake/build/pdfmake.min.js"></script>
<script src="resources/vendors/pdfmake/build/vfs_fonts.js"></script>
<script src="resources/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="resources/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
<script src="resources/vendors/datatables.net-buttons/js/buttons.colVis.min.js"></script>
<!-- Select2 -->
<script src="resources/vendors/select2/dist/js/select2.full.min.js"></script>
<!-- Parsley -->
<script src="resources/vendors/parsleyjs/dist/parsley.min.js"></script>
<!-- Autosize -->
<script src="resources/vendors/autosize/dist/autosize.min.js"></script>
<!-- FullCalendar -->
<script src="resources/vendors/moment/min/moment.min.js"></script>
<script src="resources/vendors/fullcalendar/dist/fullcalendar.min.js"></script>
<script src="resources/vendors/fullcalendar/dist/lang/ru.js"></script>
<script src="resources/js/calendar.js"></script>

<!-- Custom Theme Scripts -->
<script src="resources/build/js/custom.min.js"></script>
<!--My JavaScript-->
<script src="resources/js/my.js"></script>

</body>

</html>