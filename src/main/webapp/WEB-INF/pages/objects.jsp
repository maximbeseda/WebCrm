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

        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-3 col-md-2 sidebar">
                    <ul class="nav nav-sidebar">
                        <li><a href=${index}><span class="glyphicon glyphicon-home"></span> Главная</a></li>
                        <li><a href=${tasks}><span class="glyphicon glyphicon-tasks"></span> Задачи</a></li>
                        <li><a href=${contacts}><span class="glyphicon glyphicon-book"></span> Контакты</a></li>
                        <li><a href=${contracts}><span class="glyphicon glyphicon-list-alt"></span> Договора</a></li>
                    </ul>
                    <ul class="nav nav-sidebar">
                        <li class="active"><a href=${objects}><span class="glyphicon glyphicon-object-align-bottom"></span> Объекты<span class="sr-only">(current)</span></a></li>
                        <li><a href=${documents}><span class="glyphicon glyphicon-duplicate"></span> Документы</a></li>
                        <li><a href=${reports}><span class="glyphicon glyphicon-briefcase"></span> Отчеты</a></li>
                        <li><a href=${analytics}><span class="glyphicon glyphicon-stats"></span> Аналитика</a></li>
                    </ul>
                    <security:authorize access="hasAnyRole('ROLE_ADMIN')">
                    <ul class="nav nav-sidebar">
                        <li><a href=${users}><span class="glyphicon glyphicon-user"></span> Пользователи</a></li>
                    </ul>
                    </security:authorize>
                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    <h1 class="page-header">Объекты</h1>

                    <div class="col-lg-12">

                        <!--Button Group-->
                        <div class="panel">
                            <div class="btn-toolbar">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown">Добавить <span class="caret"></span></button>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a class="button" data-toggle="modal" data-target="#modal-create-apartment">Добавить квартиру</a></li>
                                        <li><a class="button" data-toggle="modal" data-target="#modal-create-parking">Добавить паркинг</a></li>
                                    </ul>
                                </div>
                                <div class="btn-group">
                                    <button id="edit_object" type="button" class="btn btn-warning">Изменить</button>
                                </div>
                                <div class="btn-group">
                                    <button id="delete_object" type="button" class="btn btn-danger">Удалить</button>
                                </div>
                            </div>
                        </div>

                        <!--Data Table-->
                        <div class="panel panel-default">
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
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
                                            <td>${object.status}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.panel-body -->
                        </div>

                        <!--Modal-Create Apartment-->
                        <div class="modal fade" id="modal-create-apartment">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Новый объект</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form role="form" enctype="multipart/form-data" class="form-horizontal" action="/apartment/add" method="post">
                                            <div class="form-group">
                                                <label class="control-label col-sm-3" for="houseNumber">Номер дома<span style="color:red;"> *</span></label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="houseNumber" name="houseNumber" placeholder="Номер дома" required>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-sm-3" for="apartmentNumber">Номер квартиры<span style="color:red;"> *</span></label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="apartmentNumber" name="apartmentNumber" placeholder="Номер квартиры" required>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-sm-3" for="level">Этаж<span style="color:red;"> *</span></label>
                                                <div class="col-sm-9">
                                                    <input type="number" class="form-control" id="level" name="level" placeholder="Этаж" required>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-sm-3" for="totalSpace">Общая площадь, м.кв.<span style="color:red;"> *</span></label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="totalSpace" name="totalSpace" placeholder="Общая площадь в формате 0.00" required pattern="\d+(\.\d{2})?">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-sm-3" for="livingSpace">Жилая площадь, м.кв.<span style="color:red;"> *</span></label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="livingSpace" name="livingSpace" placeholder="Жилая площадь в формате 0.00" required pattern="\d+(\.\d{2})?">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-sm-3" for="rooms">Количество комнат<span style="color:red;"> *</span></label>
                                                <div class="col-sm-9">
                                                    <input type="number" class="form-control" id="rooms" name="rooms" placeholder="Количество комнат" required>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-sm-3" for="priceUsd">Стоимость по прайсу, $<span style="color:red;"> *</span></label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="priceUsd" name="priceUsd" placeholder="Стоимость в формате 0.00" required pattern="\d+(\.\d{2})?">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-sm-3" for="status">Статус<span style="color:red;"> *</span></label>
                                                <div class="col-sm-9">
                                                    <input list="types" class="form-control" id="status" name="status" placeholder="Статус" required>
                                                    <datalist id="types">
                                                        <c:forEach items="${statusList}" var="status">
                                                        <option value='${status}'>
                                                            </c:forEach>
                                                    </datalist>
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
                        <div class="modal fade" id="modal-create-parking">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Новый объект</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form role="form" enctype="multipart/form-data" class="form-horizontal" action="/parking/add" method="post">
                                            <div class="form-group">
                                                <label class="control-label col-sm-3" for="houseNumberP">Номер дома<span style="color:red;"> *</span></label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="houseNumberP" name="houseNumber" placeholder="Номер дома" required>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-sm-3" for="parkingNumber">Номер паркинга<span style="color:red;"> *</span></label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="parkingNumber" name="parkingNumber" placeholder="Номер паркинга" required>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-sm-3" for="levelP">Этаж<span style="color:red;"> *</span></label>
                                                <div class="col-sm-9">
                                                    <input type="number" class="form-control" id="levelP" name="level" placeholder="Этаж" required>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-sm-3" for="totalSpaceP">Общая площадь, м.кв.<span style="color:red;"> *</span></label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="totalSpaceP" name="totalSpace" placeholder="Общая площадь в формате 0.00" required pattern="\d+(\.\d{2})?">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-sm-3" for="priceUsdP">Стоимость по прайсу, $<span style="color:red;"> *</span></label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="priceUsdP" name="priceUsd" placeholder="Стоимость в формате 0.00" required pattern="\d+(\.\d{2})?">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-sm-3" for="statusP">Статус<span style="color:red;"> *</span></label>
                                                <div class="col-sm-9">
                                                    <input list="types" class="form-control" id="statusP" name="status" placeholder="Статус" required>
                                                    <datalist id="types-parking">
                                                        <c:forEach items="${statusList}" var="status">
                                                        <option value='${status}'>
                                                            </c:forEach>
                                                    </datalist>
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
                    <!-- /.col-lg-12 -->
                </div>
            </div>
        </div>

    </jsp:body>

</page:template>