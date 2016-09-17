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
                            <li class="active"><a href=${contracts}><span class="glyphicon glyphicon-list-alt"></span>
                                Договора<span class="sr-only">(current)</span></a></li>
                        </ul>
                        <ul class="nav side-menu">
                            <li><a href=${objects}><span class="glyphicon glyphicon-object-align-bottom"></span> Объекты</a>
                            </li>
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
                        <h3>Договора</h3>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Список всех договоров</h2>
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
                                            <button type="button" class="btn btn-success" data-toggle="modal"
                                                    data-target="#modal-create">Создать
                                            </button>
                                        </div>
                                        <div class="btn-group">
                                            <button id="edit_contract" type="button" class="btn btn-warning">Изменить
                                            </button>
                                        </div>
                                        <div class="btn-group">
                                            <button id="delete_contract" type="button" class="btn btn-danger">Удалить
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <!--Data Table-->
                                <table id="datatable" class="table table-striped table-bordered">
                                    <thead>
                                    <tr>
                                        <th>Тип</th>
                                        <th>Статус</th>
                                        <th>Номер</th>
                                        <th>Дата</th>
                                        <th>Сумма, USD</th>
                                        <th>Сумма, UAH</th>
                                        <th>Объект</th>
                                        <th>Клиент</th>
                                        <th>Менеджер</th>
                                    </tr>
                                    </thead>

                                    <tfoot>
                                    <tr>
                                        <th>Тип</th>
                                        <th>Статус</th>
                                        <th>Номер</th>
                                        <th>Дата</th>
                                        <th>Сумма, USD</th>
                                        <th>Сумма, UAH</th>
                                        <th>Объект</th>
                                        <th>Клиент</th>
                                        <th>Менеджер</th>
                                    </tr>
                                    </tfoot>

                                    <tbody>
                                    <c:forEach items="${allContracts}" var="contract">
                                        <tr data-value="${contract.id}">
                                            <c:if test="${contract.contractType eq 'BONDS'}">
                                                <td>Договор купли-продажи ЦБ</td>
                                            </c:if>
                                            <c:if test="${contract.contractType eq 'PRESALE'}">
                                                <td>Предварительный договор</td>
                                            </c:if>
                                            <c:if test="${contract.contractType eq 'SALE'}">
                                                <td>Основной договор</td>
                                            </c:if>

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
                                            <td>${contract.amountUSD}</td>
                                            <td>${contract.amountUAH}</td>
                                            <td>${contract.objectOfSale.name}</td>
                                            <td>${contract.client.fullName}</td>
                                            <td>${contract.manager.fullName}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <!--Data Table-->

                                <!--Modal-Create-->
                                <div id="modal-create" class="modal fade bs-example-modal-lg" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">

                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                                                </button>
                                                <h4 class="modal-title" id="myModalLabel">Новый договор</h4>
                                            </div>
                                            <div class="modal-body">
                                                <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" action="/contract/add" method="post">

                                                    <div class="item form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="contractType">Тип договора <span class="required">*</span></label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <select class="form-control" id="contractType" name="contractType" required="required">
                                                                <c:forEach items="${contractTypeList}" var="contractType">
                                                                    <option value='${contractType}'>${contractType}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="item form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="status">Статус <span class="required">*</span></label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <select class="form-control" id="status" name="status" required="required">
                                                                <c:forEach items="${contractStatusList}" var="contractStatus">
                                                                    <option value='${contractStatus}'>${contractStatus}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="item form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">Номер договора</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control" id="number" name="number" placeholder="Номер договора">
                                                        </div>
                                                    </div>

                                                    <div class="item form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="date">Дата договора <span class="required">*</span></label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="date" class="form-control" id="date" name="date" placeholder="ДД.ММ.ГГГГ" required="required">
                                                        </div>
                                                    </div>

                                                    <div class="item form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="amountString">Сумма, USD</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control" id="amountString" name="amountString" placeholder="0.00" pattern="\d+(\.\d{1,2})?">
                                                        </div>
                                                    </div>

                                                    <div class="item form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="rateString">Курс доллара</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control" id="rateString" name="rateString" placeholder="0.00" pattern="\d+(\.\d{1,2})?">
                                                        </div>
                                                    </div>

                                                    <div class="item form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="clientId">Ф.И.О. Клиента <span class="required">*</span></label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <select class="select2_client form-control" style="width: 100%" id="clientId" name="clientId" required="required">
                                                                <option></option>
                                                                <c:forEach items="${clientsList}" var="client">
                                                                    <option value='${client.id}'>${client.fullName}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="item form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="objectId">Номер дома/Номер объекта <span class="required">*</span></label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <select class="select2_object form-control" style="width: 100%" id="objectId" name="objectId" required="required">
                                                                <option></option>
                                                                <c:forEach items="${objectsList}" var="object">
                                                                    <option value='${object.id}'>${object.name}</option>
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
                                <!--Modal-Create-->
                                <form style="display: none" action="/contract_edit" method="POST" id="formidupdate">
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