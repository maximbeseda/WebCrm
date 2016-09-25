<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<page:template>

    <jsp:attribute name="title">Контакты</jsp:attribute>

    <jsp:body>

        <spring:url value="/" var="index"/>
        <spring:url value="/tasks" var="tasks"/>
        <spring:url value="/contacts" var="contacts"/>
        <spring:url value="/contracts" var="contracts"/>
        <spring:url value="/objects" var="objects"/>
        <spring:url value="/documents" var="documents"/>
        <spring:url value="/reports" var="reports"/>
        <spring:url value="/users" var="users"/>

        <div class="col-md-3 left_col menu_fixed">
            <div class="left_col scroll-view">
                <div class="navbar nav_title" style="border: 0;">
                    <a href="${index}" class="site_title"><i class="fa fa-cube"></i> <span>WEB CRM</span></a>
                </div>
                <div class="clearfix"></div>

                <!-- menu profile quick info -->
                <div class="profile">
                    <div class="profile_info">
                        <h2><c:out value=" ${fullName}"/></h2>
                    </div>
                </div>
                <!-- /menu profile quick info -->

                <br/>

                <!-- sidebar menu -->
                <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                    <div class="menu_section">
                        <br/><br/><br/>
                        <ul class="nav side-menu">
                            <li><a href=${index}><i class="fa fa-home"></i> Главная</a></li>
                            <li><a href=${tasks}><i class="fa fa-tasks"></i> Задачи</a></li>
                            <li class="active"><a href=${contacts}><i class="fa fa-phone"></i> Контакты<span class="sr-only">(current)</span></a></li>
                            <li><a href=${contracts}><i class="fa fa-clone"></i> Договора</a></li>
                        </ul>
                        <ul class="nav side-menu">
                            <li><a href=${objects}><i class="fa fa-building"></i> Объекты</a></li>
                            <li><a href=${documents}><i class="fa fa-file"></i> Документы</a></li>
                            <li><a href=${reports}><i class="fa fa-line-chart"></i> Отчеты</a></li>
                            <security:authorize access="hasAnyRole('ROLE_ADMIN')">
                                <ul class="nav side-menu">
                                    <li><a href=${users}><i class="fa fa-users"></i> Пользователи</a></li>
                                </ul>
                            </security:authorize>
                        </ul>
                    </div>
                </div>
                <!-- /sidebar menu -->
            </div>
        </div>

        <!-- page content -->
        <div class="right_col" role="main">
            <div class="">
                <div class="page-title">
                    <div class="title_left">
                        <h3>Контакты</h3>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Карточка котнакта</h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">


                                <div class="col-md-3 col-sm-3 col-xs-12 profile_left">
                                    <div class="profile_img">
                                        <div id="crop-avatar">
                                            <!-- Current avatar -->
                                            <img class="img-responsive avatar-view" src="resources/img/picture.jpg" alt="Avatar" title="Change the avatar">
                                        </div>
                                    </div>
                                    <h3>${getClient.fullName}</h3>

                                    <ul class="list-unstyled user_data">
                                        <li><i class="fa fa-map-marker user-profile-icon"></i> ${getClient.address}</li>
                                        <li><i class="fa fa-phone user-profile-icon"></i> ${getClient.phone}</li>
                                        <li class="m-top-xs">
                                            <i class="fa fa-envelope-o user-profile-icon"></i>
                                            <a href="mailto:${getClient.email}" target="_blank">${getClient.email}</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-md-9 col-sm-9 col-xs-12">

                                    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                            <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Информация</a>
                                            </li>
                                            <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Договора</a>
                                            </li>
                                            <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">Документы</a>
                                            </li>
                                            <li role="presentation" class=""><a href="#tab_content4" role="tab" id="profile-tab3" data-toggle="tab" aria-expanded="false">Файлы</a>
                                            </li>
                                        </ul>
                                        <div id="myTabContent" class="tab-content">
                                            <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">

                                                <!--Информация-->
                                                <table class="table table-bordered table-striped">
                                                    <tbody>
                                                    <tr>
                                                        <td>id</td>
                                                        <td>${getClient.id}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Паспорт</td>
                                                        <td>${getClient.passport}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>ИНН</td>
                                                        <td>${getClient.identNumber}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Дата Рождения</td>
                                                        <td>${getClient.dateBirth}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Супруг(га)</td>
                                                        <td>${getClient.partnerFullName}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>ИНН супруга(ги)</td>
                                                        <td>${getClient.partnerIdentNumber}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Менеджер</td>
                                                        <td>${getClient.manager.fullName}</td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                                <!-- /Информация -->

                                            </div>
                                            <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">

                                                <!-- Договора -->
                                                <table class="table table-striped table-bordered">
                                                    <thead>
                                                    <tr>
                                                        <th>Тип</th>
                                                        <th>Объект</th>
                                                        <th>Статус</th>
                                                        <th>Номер</th>
                                                        <th>Дата</th>
                                                    </tr>
                                                    </thead>

                                                    <tbody>
                                                    <c:forEach items="${getClient.contracts}" var="contract">
                                                        <tr>
                                                            <td>${contract.contractType}</td>
                                                            <td>${contract.objectOfSale.name}</td>
                                                            <c:if test="${contract.status eq 'SIGNED'}">
                                                                <td>Подписан</td>
                                                            </c:if>
                                                            <c:if test="${contract.status eq 'PREPARE'}">
                                                                <td>На утверждение</td>
                                                            </c:if>
                                                            <c:if test="${contract.status eq 'APPROVED'}">
                                                                <td>Утвержден</td>
                                                            </c:if>
                                                            <c:if test="${contract.status eq 'CANCELED'}">
                                                                <td>Отменен</td>
                                                            </c:if>
                                                            <td>${contract.number}</td>
                                                            <td><fmt:formatDate type="date" value="${contract.date}"/></td>
                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                                <!-- /Договора -->

                                            </div>
                                            <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                                                <!-- Документы -->
                                                <table class="table table-striped table-bordered">
                                                    <thead>
                                                    <tr>
                                                        <th>№</th>
                                                        <th>Название</th>
                                                        <th>Статус</th>
                                                        <th>Примечание</th>
                                                        <th>Файл</th>
                                                    </tr>
                                                    </thead>

                                                    <tbody>
                                                    <c:forEach items="${getClient.documents}" var="document">
                                                        <tr>
                                                            <td>${document.id}</td>
                                                            <td>${document.name}</td>
                                                            <c:if test="${document.status eq 'FOR_APPROVAL'}">
                                                                <td>На утверждение</td>
                                                            </c:if>
                                                            <c:if test="${document.status eq 'AGREED'}">
                                                                <td>Согласовано</td>
                                                            </c:if>
                                                            <c:if test="${document.status eq 'DENIED'}">
                                                                <td>Отказано</td>
                                                            </c:if>
                                                            <td>${document.info}</td>
                                                            <td align="center">
                                                                <c:forEach items="${document.uploadFiles}" var="file">
                                                                <a class="btn btn-primary btn-xs" href="/download/inbox/${file.id}/${file.fileHash}">${file.fileName}</a>
                                                                </c:forEach>
                                                            </td>

                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                                <!-- /Документы -->
                                            </div>
                                            <div role="tabpanel" class="tab-pane fade" id="tab_content4" aria-labelledby="profile-tab">
                                                <!-- Файлы -->

                                                <!-- /Файлы -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /page content -->

    </jsp:body>

</page:template>