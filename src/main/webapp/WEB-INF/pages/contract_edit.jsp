<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>

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
                            <li class="active"><a href=${contracts}><i class="fa fa-clone"></i> Договора<span class="sr-only">(current)</span></a></li>
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
                        <h3>Договора</h3>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Изменить договор</h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">

                                <!--Modal-Edit-->
                                <form id="demo-form2P" data-parsley-validate class="form-horizontal form-label-left" action="/contract/update" method="post">
                                    <input type="hidden" id="id" name="id" value="${id}"/>

                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="contractTypeId">Тип договора <span class="required">*</span></label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <select class="form-control" id="contractTypeId" name="contractTypeId" required="required">
                                                <option value="${editContract.contractType.id}">${editContract.contractType}</option>
                                                <c:forEach items="${contractTypeList}" var="contractType">
                                                    <c:if test="${contractType.id ne editContract.contractType.id}">
                                                    <option value='${contractType.id}'>${contractType}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="status">Статус <span class="required">*</span></label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <select class="form-control" id="status" name="status" required="required">
                                                <c:if test="${editContract.status eq 'SIGNED'}">
                                                    <c:set var="contractStatus" value="Подписан"/>
                                                </c:if>
                                                <c:if test="${editContract.status eq 'PREPARE'}">
                                                    <c:set var="contractStatus" value="На утверждение"/>
                                                </c:if>
                                                <c:if test="${editContract.status eq 'APPROVED'}">
                                                    <c:set var="contractStatus" value="Утвержден"/>
                                                </c:if>
                                                <c:if test="${editContract.status eq 'CANCELED'}">
                                                    <c:set var="contractStatus" value="Отменен"/>
                                                </c:if>
                                                <option value="${contractStatus}">${contractStatus}</option>
                                                <c:forEach items="${contractStatusList}" var="status">
                                                    <c:if test="${status ne contractStatus}">
                                                    <option value='${status}'>${status}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">Номер договора</label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <input type="text" class="form-control" id="number" name="number" value="${editContract.number}" placeholder="Номер договора">
                                        </div>
                                    </div>

                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="date">Дата договора <span class="required">*</span></label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <input type="date" class="form-control" id="date" name="date" value="${editContract.date}" placeholder="ДД.ММ.ГГГГ" required="required">
                                        </div>
                                    </div>

                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="amountString">Сумма, USD</label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <input type="text" class="form-control" id="amountString" name="amountString" value="${editContract.amountUSD}" placeholder="0.00" pattern="\d+(\.\d{1,2})?">
                                        </div>
                                    </div>

                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="rateString">Курс доллара</label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <input type="text" class="form-control" id="rateString" name="rateString" value="${editContract.rate}" placeholder="0.00" pattern="\d+(\.\d{1,2})?">
                                        </div>
                                    </div>

                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="amountUAH">Сумма, UAH</label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <input type="text" class="form-control" id="amountUAH" name="amountUAH" value="${editContract.amountUAH}" placeholder="0.00" pattern="\d+(\.\d{1,2})?">
                                        </div>
                                    </div>

                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="clientId">Ф.И.О. Клиента <span class="required">*</span></label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <select class="select2_client form-control" style="width: 100%" id="clientId" name="clientId" required="required">
                                                <option value="${editContract.client.id}">${editContract.client.fullName}</option>
                                                <c:forEach items="${clientsList}" var="client">
                                                    <c:if test="${client.id ne editContract.client.id}">
                                                    <option value='${client.id}'>${client.fullName}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="objectId">Номер дома/Номер объекта <span class="required">*</span></label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <select class="select2_object form-control" style="width: 100%" id="objectId" name="objectId" required="required">
                                                <option value="${editContract.objectOfSale.id}">${editContract.objectOfSale.name}</option>
                                                <c:forEach items="${objectsList}" var="object">
                                                    <c:if test="${object.name ne editContract.objectOfSale.name}">
                                                    <option value='${object.id}'>${object.name}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="modal-footer">
                                        <a href="${contracts}" role="button" class="btn btn-default">Отмена</a>
                                        <button type="submit" class="btn btn-primary">Сохранить изменения</button>
                                    </div>
                                </form>
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