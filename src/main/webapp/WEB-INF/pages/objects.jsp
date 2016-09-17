<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>

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
        <spring:url value="/analytics" var="analytics"/>
        <spring:url value="/users" var="users"/>

        <div class="col-md-3 left_col menu_fixed">
            <div class="left_col scroll-view">
                <div class="navbar nav_title" style="border: 0;">
                    <a href="${index}" class="site_title"><i class="fa fa-paw"></i> <span>WEB CRM</span></a>
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
                            <li><a href=${index}><span class="glyphicon glyphicon-home"></span> Главная</a></li>
                            <li><a href=${tasks}><span class="glyphicon glyphicon-tasks"></span> Задачи</a></li>
                            <li><a href=${contacts}><span class="glyphicon glyphicon-book"></span> Контакты</a></li>
                            <li><a href=${contracts}><span class="glyphicon glyphicon-list-alt"></span> Договора</a>
                            </li>
                        </ul>
                        <ul class="nav side-menu">
                            <li class="active"><a href=${objects}><span
                                    class="glyphicon glyphicon-object-align-bottom"></span> Объекты<span
                                    class="sr-only">(current)</span></a></li>
                            <li><a href=${documents}><span class="glyphicon glyphicon-duplicate"></span> Документы</a>
                            </li>
                            <li><a href=${reports}><span class="glyphicon glyphicon-briefcase"></span> Отчеты</a></li>
                            <security:authorize access="hasAnyRole('ROLE_ADMIN')">
                                <ul class="nav side-menu">
                                    <li><a href=${users}><span class="glyphicon glyphicon-user"></span> Пользователи</a>
                                    </li>
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
                                <h2>Список всех объектов</h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </li>
                                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">

                                <!--Button Group-->
                                <div class="panel">
                                    <div class="btn-toolbar">
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-success dropdown-toggle"
                                                    data-toggle="dropdown">Добавить <span class="caret"></span></button>
                                            <ul class="dropdown-menu" role="menu">
                                                <li><a class="button" data-toggle="modal"
                                                       data-target="#modal-create-apartment">Добавить квартиру</a></li>
                                                <li><a class="button" data-toggle="modal"
                                                       data-target="#modal-create-parking">Добавить паркинг</a></li>
                                            </ul>
                                        </div>
                                        <div class="btn-group">
                                            <button id="edit_object" type="button" class="btn btn-warning">Изменить
                                            </button>
                                        </div>
                                        <div class="btn-group">
                                            <button id="delete_object" type="button" class="btn btn-danger">Удалить
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <!--Data Table-->
                                <table id="datatable" class="table table-striped table-bordered">

                                    <thead>
                                    <tr>
                                        <th>Тип</th>
                                        <th>№</th>
                                        <th>Этаж</th>
                                        <th>Общая пл.</th>
                                        <th>Жилая пл.</th>
                                        <th>Комнаты</th>
                                        <th>Стоимость</th>
                                        <th>Скидка</th>
                                        <th>Менеджер</th>
                                        <th>Статус</th>
                                    </tr>
                                    </thead>

                                    <tfoot>
                                    <tr>
                                        <th>Тип</th>
                                        <th>№</th>
                                        <th>Этаж</th>
                                        <th>Общая пл.</th>
                                        <th>Жилая пл.</th>
                                        <th>Комнаты</th>
                                        <th>Стоимость</th>
                                        <th>Скидка</th>
                                        <th>Менеджер</th>
                                        <th>Статус</th>
                                    </tr>
                                    </tfoot>

                                    <tbody>
                                    <c:forEach items="${allObjects}" var="object">
                                        <tr data-value="${object.id}">
                                            <th>${object.type}</th>
                                            <td>${object.name}</td>
                                            <td>${object.level}</td>
                                            <td>${object.totalSpace}</td>
                                            <c:choose>
                                                <c:when test="${object.type eq 'Квартира'}">
                                                    <td>${object.livingSpace}</td>
                                                    <td>${object.rooms}</td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td></td>
                                                    <td></td>
                                                </c:otherwise>
                                            </c:choose>
                                            <td>${object.priceUsd}</td>
                                            <td>${object.discount}</td>
                                            <td>${object.manager.fullName}</td>
                                            <c:if test="${object.status eq 'SOLD'}">
                                                <td>Продан</td>
                                            </c:if>
                                            <c:if test="${object.status eq 'RESERVE'}">
                                                <td>Резерв</td>
                                            </c:if>
                                            <c:if test="${object.status eq 'FREE'}">
                                                <td>Свободен</td>
                                            </c:if>
                                            <c:if test="${object.status eq 'NOT_SALE'}">
                                                <td>Не продается</td>
                                            </c:if>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <!-- /.table-responsive -->

                                <!--Modal-Create Apartment-->
                                <div id="modal-create-apartment" class="modal fade bs-example-modal-lg" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">

                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                                                </button>
                                                <h4 class="modal-title" id="myModalLabel">Новый объект</h4>
                                            </div>
                                            <div class="modal-body">
                                                <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" action="/apartment/add" method="post">

                                                    <div class="item form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="houseNumber">Номер дома <span class="required">*</span></label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control" id="houseNumber" name="houseNumber" placeholder="Номер дома" required="required">
                                                        </div>
                                                    </div>

                                                    <div class="item form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="apartmentNumber">Номер квартиры <span class="required">*</span></label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control" id="apartmentNumber" name="apartmentNumber" placeholder="Номер квартиры" required="required">
                                                        </div>
                                                    </div>

                                                    <div class="item form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="level">Этаж <span class="required">*</span></label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="number" class="form-control" id="level" name="level" placeholder="Этаж" required="required">
                                                        </div>
                                                    </div>

                                                    <div class="item form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="totalSpace">Общая площадь, м.кв. <span class="required">*</span></label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control" id="totalSpace" name="totalSpace" placeholder="Общая площадь в формате 0.00" required="required" pattern="\d+(\.\d{1,2})?">
                                                        </div>
                                                    </div>

                                                    <div class="item form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="livingSpace">Жилая площадь, м.кв. <span class="required">*</span></label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control" id="livingSpace" name="livingSpace" placeholder="Жилая площадь в формате 0.00" required="required" pattern="\d+(\.\d{1,2})?">
                                                        </div>
                                                    </div>

                                                    <div class="item form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="rooms">Количество комнат <span class="required">*</span></label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="number" class="form-control" id="rooms" name="rooms" placeholder="Количество комнат" required="required">
                                                        </div>
                                                    </div>

                                                    <div class="item form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="priceUsd">Стоимость по прайсу, $ <span class="required">*</span></label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control" id="priceUsd" name="priceUsd" placeholder="Стоимость в формате 0.00" required="required" pattern="\d+(\.\d{1,2})?">
                                                        </div>
                                                    </div>

                                                    <div class="item form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="status">Статус <span class="required">*</span></label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <select class="form-control" id="status" name="status" required="required">
                                                                <c:forEach items="${statusList}" var="status">
                                                                    <option value='${status}'>${status}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Отменить</button>
                                                        <button type="submit" class="btn btn-primary">Сохранить изменения</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.panel -->

                                <!--Modal-Create Parking-->
                                <div id="modal-create-parking" class="modal fade bs-example-modal-lg" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">

                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                                                </button>
                                                <h4 class="modal-title" id="myModalLabelP">Новый объект</h4>
                                            </div>
                                            <div class="modal-body">
                                                <form id="demo-form2P" data-parsley-validate class="form-horizontal form-label-left" action="/parking/add" method="post">

                                                    <div class="item form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="houseNumberP">Номер дома <span class="required">*</span></label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control" id="houseNumberP" name="houseNumber" placeholder="Номер дома" required="required">
                                                        </div>
                                                    </div>

                                                    <div class="item form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="parkingNumber">Номер паркинга <span class="required">*</span></label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control" id="parkingNumber" name="parkingNumber" placeholder="Номер паркинга" required="required">
                                                        </div>
                                                    </div>

                                                    <div class="item form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="levelP">Этаж <span class="required">*</span></label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="number" class="form-control" id="levelP" name="level" placeholder="Этаж" required="required">
                                                        </div>
                                                    </div>

                                                    <div class="item form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="totalSpaceP">Общая площадь, м.кв. <span class="required">*</span></label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control" id="totalSpaceP" name="totalSpace" placeholder="Общая площадь в формате 0.00" required="required" pattern="\d+(\.\d{1,2})?">
                                                        </div>
                                                    </div>

                                                    <div class="item form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="priceUsdP">Стоимость по прайсу, $ <span class="required">*</span></label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control" id="priceUsdP" name="priceUsd" placeholder="Стоимость в формате 0.00" required="required" pattern="\d+(\.\d{1,2})?">
                                                        </div>
                                                    </div>

                                                    <div class="item form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="statusP">Статус <span class="required">*</span></label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <select class="form-control" id="statusP" name="status" required="required">
                                                                <c:forEach items="${statusList}" var="status">
                                                                    <option value='${status}'>${status}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Отменить</button>
                                                        <button type="submit" class="btn btn-primary">Сохранить изменения</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.panel -->
                                <form style="display: none" action="/object_edit" method="POST" id="formidupdate">
                                    <input type="hidden" id="toUpdate" name="toUpdate" value=""/>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /page content -->

    </jsp:body>

</page:template>