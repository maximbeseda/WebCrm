<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>

<page:template>

    <jsp:attribute name="title">Пользователи</jsp:attribute>

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

                <br/>

                <!-- sidebar menu -->
                <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                    <div class="menu_section">
                        <br/><br/><br/>
                        <ul class="nav side-menu">
                            <li><a href=${index}><i class="fa fa-home"></i> Главная</a></li>
                            <li><a href=${tasks}><i class="fa fa-tasks"></i> Задачи</a></li>
                            <li><a href=${contacts}><i class="fa fa-phone"></i> Контакты</a></li>
                            <li><a href=${contracts}><i class="fa fa-clone"></i> Договора</a></li>
                        </ul>
                        <ul class="nav side-menu">
                            <li><a href=${objects}><i class="fa fa-building"></i> Объекты</a></li>
                            <li><a href=${documents}><i class="fa fa-file"></i> Документы</a></li>
                            <security:authorize access="hasAnyRole('ROLE_ADMIN')">
                                <ul class="nav side-menu">
                                    <li class="active"><a href=${users}><i class="fa fa-users"></i> Пользователи <span class="sr-only">(current)</span></a></li>
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
                        <h3>Пользователи</h3>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Профиль пользователя</h2>
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
                                    <h3>${getUser.fullName}</h3>

                                    <ul class="list-unstyled user_data">
                                        <li><i class="fa fa-map-marker user-profile-icon"></i> ${getUser.address}</li>
                                        <li><i class="fa fa-phone user-profile-icon"></i> ${getUser.phone}</li>
                                        <li class="m-top-xs">
                                            <i class="fa fa-envelope-o user-profile-icon"></i>
                                            <a href="mailto:${getUser.email}" target="_blank">${getUser.email}</a>
                                        </li>
                                    </ul>
                                    <a class="btn btn-success" href="/edit_profile"><i class="fa fa-edit m-right-xs"></i>Изменить</a>
                                    <br />
                                </div>
                                <div class="col-md-9 col-sm-9 col-xs-12">

                                    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                            <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Информация</a>
                                            </li>
                                            <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Клиенты</a>
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
                                                        <td>${getUser.id}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Паспорт</td>
                                                        <td>${getUser.passport}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>ИНН</td>
                                                        <td>${getUser.identNumber}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Дата Рождения</td>
                                                        <td>${getUser.dateBirth}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Роль</td>
                                                        <td>${getUser.role}</td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                                <!-- /Информация -->

                                            </div>
                                            <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">

                                                <!-- Клиенты -->
                                                <table class="table table-striped table-bordered">
                                                    <c:if test="${getUser.clients.size() eq 0}">
                                                        <br>
                                                        <p align="center">Клиенты отсутствуют</p>
                                                    </c:if>
                                                    <c:if test="${getUser.clients.size() ne 0}">
                                                    <thead>
                                                    <tr>
                                                        <th>id</th>
                                                        <th>Ф.И.О.</th>
                                                        <th>Телефон</th>
                                                        <th>E-mail</th>
                                                    </tr>
                                                    </thead>

                                                    <tbody>
                                                    <c:forEach items="${getUser.clients}" var="client">
                                                        <tr>
                                                            <td>${client.id}</td>
                                                            <td>${client.fullName}</td>
                                                            <td>${client.phone}</td>
                                                            <td>${client.email}</td>
                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                    </c:if>
                                                </table>
                                                <!-- /Клиенты -->

                                            </div>
                                            <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                                                <!-- Документы -->
                                                <table class="table table-striped table-bordered">
                                                    <c:if test="${getUser.documents.size() eq 0}">
                                                        <br>
                                                        <p align="center">Документы отсутствуют</p>
                                                    </c:if>
                                                    <c:if test="${getUser.documents.size() ne 0}">
                                                    <thead>
                                                    <tr>
                                                        <th>№</th>
                                                        <th>Название</th>
                                                        <th>Статус</th>
                                                        <th>Клиент</th>
                                                        <th>Файл</th>
                                                    </tr>
                                                    </thead>

                                                    <tbody>
                                                    <c:forEach items="${getUser.documents}" var="document">
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
                                                            <td>${document.client.fullName}</td>
                                                            <td align="center">
                                                                <c:forEach items="${document.files}" var="file">
                                                                    <a class="btn btn-primary btn-xs" href="/download/inbox/${file.id}/${file.fileHash}">${file.fileName}</a>
                                                                </c:forEach>
                                                            </td>

                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                    </c:if>
                                                </table>
                                                <!-- /Документы -->
                                            </div>
                                            <div role="tabpanel" class="tab-pane fade" id="tab_content4" aria-labelledby="profile-tab">
                                                <!-- Файлы -->
                                                <table class="table table-bordered table-striped">
                                                    <c:if test="${getUser.files.size() eq 0}">
                                                        <br>
                                                        <p align="center">Файлы отсутствуют</p>
                                                    </c:if>
                                                    <c:if test="${getUser.files.size() ne 0}">
                                                        <thead>
                                                        <tr>
                                                            <th>Скачать</th>
                                                            <th>Удалить</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <c:forEach items="${getUser.files}" var="file">
                                                            <tr data-value="${file.id}">
                                                                <td><a class="btn btn-primary btn-xs" href="/download/inbox/${file.id}/${file.fileHash}">${file.fileName}</a></td>
                                                                <td><a class="btn btn-danger btn-xs confirmation" style="cursor:pointer">${file.fileName}</a></td>
                                                            </tr>
                                                        </c:forEach>
                                                        </tbody>
                                                    </c:if>
                                                </table>
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