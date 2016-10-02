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
                                <h2>Список всех документов</h2>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">

                                <!--Modal-Edit-->
                                <form id="demo-form2P" data-parsley-validate class="form-horizontal form-label-left" enctype="multipart/form-data" action="/document_update" method="post">
                                    <input type="hidden" id="id" name="id" value="${id}"/>

                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Название документа <span class="required">*</span></label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <input type="text" class="form-control" id="name" name="name" value="${editDocument.name}" placeholder="Название документа" required="required">
                                        </div>
                                    </div>

                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="status">Статус <span class="required">*</span></label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <select class="form-control" id="status" name="status" required="required">
                                                <c:if test="${editDocument.status eq 'FOR_APPROVAL'}">
                                                    <c:set var="documentStatus" value="На утверждение"/>
                                                </c:if>
                                                <c:if test="${editDocument.status eq 'AGREED'}">
                                                    <c:set var="documentStatus" value="Согласовано"/>
                                                </c:if>
                                                <c:if test="${editDocument.status eq 'DENIED'}">
                                                    <c:set var="documentStatus" value="Отказано"/>
                                                </c:if>
                                                <option value="${documentStatus}">${documentStatus}</option>
                                                <c:forEach items="${documentStatusList}" var="status">
                                                    <c:if test="${status ne documentStatus}">
                                                        <option value='${status}'>${status}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="clientId">Ф.И.О. Клиента <span class="required">*</span></label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <select class="select2_client form-control" style="width: 100%" id="clientId" name="clientId" required="required">
                                                <option value="${editDocument.client.id}">${editDocument.client.fullName}</option>
                                                <c:forEach items="${clientsList}" var="client">
                                                    <c:if test="${client.id ne editDocument.client.id}">
                                                        <option value='${client.id}'>${client.fullName}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="contractId">Договор <span class="required">*</span></label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <select class="select2_contract form-control" style="width: 100%" id="contractId" name="contractId" required="required">
                                                <option value="${editDocument.contract.id}">${editDocument.contract.contractType} №${editDocument.contract.number} ${editDocument.contract.client.fullName}</option>
                                                <c:forEach items="${contractList}" var="contract">
                                                    <c:if test="${contract.id ne editDocument.contract.id}">
                                                    <option value='${contract.id}'>${contract.contractType} №${contract.number} ${contract.client.fullName}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="info">Примечание</label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <textarea class="resizable_textarea form-control" id="info" name="info">${editDocument.info}</textarea>
                                        </div>
                                    </div>

                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="upfiles">Прикрепить файлы</label>
                                        <div class="col-md-9 col-sm-9 col-xs-12" id="upfiles">
                                            <div class="input-group">
                                                <label class="input-group-btn">
                                                    <span class="btn btn-primary">
                                                        Добавить&hellip; <input type="file" name="upfiles[]" style="display: none;" multiple>
                                                    </span>
                                                </label>
                                                <input type="text" class="form-control" readonly>
                                            </div>
                                            <span class="help-block">
                                                Прикрепите файлы к документу
                                            </span>
                                        </div><!-- /input-group -->
                                    </div>

                                    <div class="modal-footer">
                                        <a href="${documents}" role="button" class="btn btn-default">Отмена</a>
                                        <button type="submit" class="btn btn-primary">Сохранить изменения</button>
                                    </div>
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