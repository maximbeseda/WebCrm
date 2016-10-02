<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>

<page:template>

    <jsp:attribute name="title">Документы</jsp:attribute>

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
                            <li class="active"><a href=${documents}><i class="fa fa-file"></i> Документы<span class="sr-only">(current)</span></a></li>
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
                        <h3>Документы</h3>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Карточка документа</h2>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">

                                <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                    <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                        <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Информация</a>
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
                                                    <td>${getDocument.id}</td>
                                                </tr>
                                                <tr>
                                                    <td>Название</td>
                                                    <td>${getDocument.name}</td>
                                                </tr>
                                                <tr>
                                                    <td>Статус</td>
                                                    <c:if test="${getDocument.status eq 'FOR_APPROVAL'}">
                                                        <td>На утверждение</td>
                                                    </c:if>
                                                    <c:if test="${getDocument.status eq 'AGREED'}">
                                                        <td>Согласовано</td>
                                                    </c:if>
                                                    <c:if test="${getDocument.status eq 'DENIED'}">
                                                        <td>Отказано</td>
                                                    </c:if>
                                                </tr>
                                                <tr>
                                                    <td>Примечание</td>
                                                    <td>${getDocument.info}</td>
                                                </tr>
                                                <tr>
                                                    <td>Клиент</td>
                                                    <td>${getDocument.client.fullName}</td>
                                                </tr>
                                                <tr>
                                                    <td>Договор</td>
                                                    <td>${getDocument.contract.number}</td>
                                                </tr>
                                                <tr>
                                                    <td>Менеджер</td>
                                                    <td>${getDocument.manager.fullName}</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                            <!-- /Информация -->
                                        </div>

                                        <div role="tabpanel" class="tab-pane fade" id="tab_content4" aria-labelledby="profile-tab">
                                            <!-- Файлы -->
                                            <table class="table table-bordered table-striped">
                                                <c:if test="${getDocument.files.size() eq 0}">
                                                    <br>
                                                    <p align="center">Файлы отсутствуют</p>
                                                </c:if>
                                                <c:if test="${getDocument.files.size() ne 0}">
                                                <thead>
                                                <tr>
                                                    <th>Скачать</th>
                                                    <th>Удалить</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${getDocument.files}" var="file">
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
        <!-- /page content -->

    </jsp:body>

</page:template>