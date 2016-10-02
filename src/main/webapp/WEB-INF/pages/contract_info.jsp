<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<page:template>

    <jsp:attribute name="title">Договора</jsp:attribute>

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
                            <li class="active"><a href=${contracts}><i class="fa fa-clone"></i> Договора<span class="sr-only">(current)</span></a></li>
                        </ul>
                        <ul class="nav side-menu">
                            <li><a href=${objects}><i class="fa fa-building"></i> Объекты</a></li>
                            <li><a href=${documents}><i class="fa fa-file"></i> Документы</a></li>
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
                        <h3>Договора</h3>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Карточка договора</h2>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">

                                <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                    <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                        <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Информация</a>
                                        </li>
                                        <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab1" data-toggle="tab" aria-expanded="false">Платежи</a>
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
                                                    <td>${getContract.id}</td>
                                                </tr>
                                                <tr>
                                                    <td>Тип договора</td>
                                                    <td>${getContract.contractType}</td>
                                                </tr>
                                                <tr>
                                                    <td>Статус</td>
                                                    <c:if test="${getContract.status eq 'SIGNED'}">
                                                        <td>Подписан</td>
                                                    </c:if>
                                                    <c:if test="${getContract.status eq 'PREPARE'}">
                                                        <td>На утверждение</td>
                                                    </c:if>
                                                    <c:if test="${getContract.status eq 'APPROVED'}">
                                                        <td>Утвержден</td>
                                                    </c:if>
                                                    <c:if test="${getContract.status eq 'CANCELED'}">
                                                        <td>Отменен</td>
                                                    </c:if>
                                                </tr>
                                                <tr>
                                                    <td>Номер</td>
                                                    <td>${getContract.number}</td>
                                                </tr>
                                                <tr>
                                                    <td>Дата</td>
                                                    <td><fmt:formatDate type="date" value="${getContract.date}"/></td>
                                                </tr>
                                                <tr>
                                                    <td>Сумма, USD</td>
                                                    <td>${getContract.amountUSD}</td>
                                                </tr>
                                                <tr>
                                                    <td>Сумма, UAH</td>
                                                    <td>${getContract.amountUAH}</td>
                                                </tr>
                                                <tr>
                                                    <td>Курс доллара</td>
                                                    <td>${getContract.rate}</td>
                                                </tr>
                                                <tr>
                                                    <td>Тип объекта</td>
                                                    <td>${getContract.objectOfSale.type}</td>
                                                </tr>
                                                <tr>
                                                    <td>№ объекта</td>
                                                    <td>${getContract.objectOfSale.name}</td>
                                                </tr>
                                                <tr>
                                                    <td>Клиент</td>
                                                    <td>${getContract.client.fullName}</td>
                                                </tr>
                                                <tr>
                                                    <td>Менеджер</td>
                                                    <td>${getContract.manager.fullName}</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                            <!-- /Информация -->

                                        </div>

                                        <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
                                            <!-- Платежи -->
                                            <c:if test="${getContract.invoices.size() eq 0}">
                                                <br>
                                                <p align="center">Платежи отсутствуют</p>
                                            </c:if>
                                            <c:if test="${getContract.invoices.size() ne 0}">

                                            </c:if>
                                            <!-- /Платежи -->
                                        </div>

                                        <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                                            <!-- Документы -->
                                            <table class="table table-striped table-bordered">
                                                <c:if test="${getContract.documents.size() eq 0}">
                                                    <br>
                                                    <p align="center">Документы отсутствуют</p>
                                                </c:if>
                                                <c:if test="${getContract.documents.size() ne 0}">
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
                                                <c:forEach items="${getContract.documents}" var="document">
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
                                                <c:if test="${getContract.files.size() eq 0}">
                                                    <br>
                                                    <p align="center">Файлы отсутствуют</p>
                                                </c:if>
                                                <c:if test="${getContract.files.size() ne 0}">
                                                    <thead>
                                                    <tr>
                                                        <th>Скачать</th>
                                                        <th>Удалить</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach items="${getContract.files}" var="file">
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
                <!--Modal-Create-->
            </div>
        </div>
        <!-- /page content -->

    </jsp:body>

</page:template>