<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<page:template>

    <jsp:attribute name="title">Объекты</jsp:attribute>

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
                            <li><a href=${contacts}><i class="fa fa-phone"></i> Контакты</a></li>
                            <li><a href=${contracts}><i class="fa fa-clone"></i> Договора</a></li>
                        </ul>
                        <ul class="nav side-menu">
                            <li class="active"><a href=${objects}><i class="fa fa-building"></i> Объекты<span class="sr-only">(current)</span></a></li>
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
                        <h3>Объекты</h3>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Карточка объекта</h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">

                                <div class="col-md-7 col-sm-7 col-xs-12">
                                    <div class="product-image">
                                        <c:if test="${getObject.plan ne null}">
                                            <img src="/download/inbox/${getObject.plan.id}/${getObject.plan.fileHash}" alt="..." />
                                        </c:if>
                                        <c:if test="${getObject.plan eq null}">
                                            <img src="resources/img/prod1.jpg" alt="..." />
                                        </c:if>
                                    </div>
                                </div>

                                <div class="col-md-5 col-sm-5 col-xs-12" style="border:0px solid #e5e5e5;">

                                    <h3 class="prod_title">${getObject.houseNumber}/${getObject.level}/
                                        <c:if test="${getObject.type eq 'Квартира'}">
                                            ${getObject.apartmentNumber}
                                        </c:if>
                                        <c:if test="${getObject.type eq 'Паркинг'}">
                                            ${getObject.parkingNumber}
                                        </c:if>
                                    </h3>

                                    <p>${getObject.info}</p>
                                    <br />

                                    <table class="table table-bordered table-striped">
                                        <tbody>
                                        <tr>
                                            <td>id</td>
                                            <td>${getObject.id}</td>
                                        </tr>
                                        <tr>
                                            <td>Тип</td>
                                            <td>${getObject.type}</td>
                                        </tr>
                                        <tr>
                                            <td>Номер дома</td>
                                            <td>${getObject.houseNumber}</td>
                                        </tr>
                                        <tr>
                                            <td>Номер объекта</td>
                                            <c:if test="${getObject.type eq 'Квартира'}">
                                                <td>${getObject.apartmentNumber}</td>
                                            </c:if>
                                            <c:if test="${getObject.type eq 'Паркинг'}">
                                                <td>${getObject.parkingNumber}</td>
                                            </c:if>
                                        </tr>
                                        <tr>
                                            <td>Этаж</td>
                                            <td>${getObject.level}</td>
                                        </tr>
                                        <tr>
                                            <td>Общая площадь</td>
                                            <td>${getObject.totalSpace}</td>
                                        </tr>
                                        <c:if test="${getObject.type eq 'Квартира'}">
                                            <tr>
                                                <td>Жилая площадь</td>
                                                <td>${getObject.livingSpace}</td>
                                            </tr>
                                            <tr>
                                                <td>Количество комнат</td>
                                                <td>${getObject.rooms}</td>
                                            </tr>
                                        </c:if>
                                        <tr>
                                            <td>Прайсовая стоимость, $</td>
                                            <td>${getObject.priceUsd}</td>
                                        </tr>
                                        <tr>
                                            <td>Статус</td>
                                            <c:if test="${getObject.status eq 'SOLD'}">
                                                <td>Продан</td>
                                            </c:if>
                                            <c:if test="${getObject.status eq 'RESERVE'}">
                                                <td>Резерв</td>
                                            </c:if>
                                            <c:if test="${getObject.status eq 'FREE'}">
                                                <td>Свободен</td>
                                            </c:if>
                                            <c:if test="${getObject.status eq 'NOT_SALE'}">
                                                <td>Не продается</td>
                                            </c:if>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>


                                <div class="col-md-12">

                                    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                            <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Договора</a>
                                            </li>
                                            <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Файлы</a>
                                            </li>
                                        </ul>
                                        <div id="myTabContent" class="tab-content">
                                            <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                                                <!-- Договора -->
                                                <table class="table table-striped table-bordered">
                                                    <thead>
                                                    <tr>
                                                        <th>Тип</th>
                                                        <th>Статус</th>
                                                        <th>Номер</th>
                                                        <th>Дата</th>
                                                        <th>Клиент</th>
                                                    </tr>
                                                    </thead>

                                                    <tbody>
                                                    <c:forEach items="${getObject.contracts}" var="contract">
                                                        <tr>
                                                            <td>${contract.contractType}</td>
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
                                                            <td>${contract.client.fullName}</td>
                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                                <!-- /Договора -->
                                            </div>
                                            <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
                                                <!-- Файлы -->
                                                <table class="table table-bordered table-striped">
                                                    <tbody>
                                                    <c:forEach items="${getObject.uploadFiles}" var="file">
                                                        <tr>
                                                            <td>Название</td>
                                                            <td>${file.fileName}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Файл</td>
                                                            <td><a class="btn btn-primary btn-xs" href="/download/inbox/${file.id}/${file.fileHash}">${file.fileName}</a></td>
                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
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