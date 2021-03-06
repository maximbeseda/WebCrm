<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<page:template>

    <jsp:attribute name="title">WEB CRM</jsp:attribute>

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
                    <%--<div class="profile">--%>
                    <%--<div class="profile_info">--%>
                    <%--<h2><c:out value=" ${fullName}"/></h2>--%>
                    <%--</div>--%>
                    <%--</div>--%>
                <!-- /menu profile quick info -->

                <br/>

                <!-- sidebar menu -->
                <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                    <div class="menu_section">
                        <br/><br/><br/>
                        <ul class="nav side-menu">
                            <li class="active"><a href=${index}><i class="fa fa-home"></i> Главная <span
                                    class="sr-only">(current)</span></a></li>
                            <li><a href=${tasks}><i class="fa fa-tasks"></i> Задачи</a></li>
                            <li><a href=${contacts}><i class="fa fa-phone"></i> Контакты</a></li>
                            <li><a href=${contracts}><i class="fa fa-clone"></i> Договора</a></li>
                        </ul>
                        <ul class="nav side-menu">
                            <li><a href=${objects}><i class="fa fa-building"></i> Объекты</a></li>
                            <li><a href=${documents}><i class="fa fa-file"></i> Документы</a></li>
                                <%--<li><a href=${reports}><i class="fa fa-line-chart"></i> Отчеты</a></li>--%>
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
                <div class="row top_tiles" style="margin: 10px 0;">
                    <div class="col-md-3 col-sm-3 col-xs-6 tile">
                        <span>Продано за месяц</span>
                        <h2>${countContracts}</h2>
                        <span class="sparkline_one" style="height: 160px;">
                      <canvas width="200" height="60" style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
                  </span>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-6 tile">
                        <span>Сумма договоров</span>
                        <h2>$${totalAmount}</h2>
                        <span class="sparkline_one" style="height: 160px;">
                      <canvas width="200" height="60" style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
                  </span>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-6 tile">
                        <span>Квартиры</span>
                        <h2>${countApartment}</h2>
                        <span class="sparkline_two" style="height: 160px;">
                      <canvas width="200" height="60" style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
                  </span>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-6 tile">
                        <span>Паркинги</span>
                        <h2>${countParking}</h2>
                        <span class="sparkline_one" style="height: 160px;">
                      <canvas width="200" height="60" style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
                  </span>
                    </div>
                </div>
                <br />


                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="dashboard_graph x_panel">
                            <div class="row x_title">
                                <div class="col-md-6">
                                    <h3>Все продажи <small>за текущий месяц</small></h3>
                                </div>
                            </div>
                            <div class="x_content">
                                <!--Data Table-->
                                <table id="datatable" class="table table-striped table-bordered">
                                    <thead>
                                    <tr>
                                        <th>Тип</th>
                                        <th>Объект</th>
                                        <th>Дата</th>
                                        <th>USD</th>
                                        <th>UAH</th>
                                        <th>Клиент</th>
                                        <th>Менеджер</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <c:forEach items="${contractsThisMonth}" var="contract">
                                        <tr>
                                            <td>${contract.contractType}</td>
                                            <td>${contract.objectOfSale.type}</td>
                                            <td><fmt:formatDate type="date" value="${contract.date}"/></td>
                                            <td>${contract.amountUSD}</td>
                                            <td>${contract.amountUAH}</td>
                                            <td>${contract.client.fullName}</td>
                                            <td>${contract.manager.fullName}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <!--Data Table-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /page content -->

    </jsp:body>

</page:template>