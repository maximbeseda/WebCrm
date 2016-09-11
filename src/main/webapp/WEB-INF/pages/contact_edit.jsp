<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>

<page:template>

    <jsp:attribute name="title">Контакты</jsp:attribute>

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
                        <li class="active"><a href=${contacts}><span class="glyphicon glyphicon-book"></span>
                            Контакты<span class="sr-only">(current)</span></a></li>
                        <li><a href=${contracts}><span class="glyphicon glyphicon-list-alt"></span> Договора</a></li>
                    </ul>
                    <ul class="nav nav-sidebar">
                        <li><a href=${objects}><span class="glyphicon glyphicon-object-align-bottom"></span> Объекты</a>
                        </li>
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
                    <h1 class="page-header">Контакты</h1>

                    <div class="col-lg-12">
                        <form role="form" enctype="multipart/form-data" class="form-horizontal" action="/contact/update" method="post">
                            <input type="hidden" id="id" name="id" value="${id}"/>

                            <div class="form-group">
                                <label class="control-label col-sm-3" for="fullName">Ф.И.О.<span style="color:red;"> *</span></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="fullName" name="fullName" value="${getClient.fullName}" placeholder="Ф.И.О." required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-3" for="phone">Телефон<span style="color:red;"> *</span></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="phone" name="phone" value="${getClient.phone}" placeholder="Номер телефона в формате +380ХХХХХХХХХ" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-3" for="email">E-mail</label>
                                <div class="col-sm-9">
                                    <input type="email" class="form-control" id="email" name="email" value="${getClient.email}" placeholder="example@mail.com">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-3" for="address">Адрес регистрации</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="address" name="address" value="${getClient.address}" placeholder="Адрес регистрации">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-3" for="passport">Паспорт</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="passport" name="passport" value="${getClient.passport}" placeholder="Серия и номер паспорта, кем выдан, дата выдачи">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-3" for="identNumber">ИНН</label>
                                <div class="col-sm-9">
                                    <input type="number" class="form-control" id="identNumber" name="identNumber" value="${getClient.identNumber}" placeholder="Идентификационный номер">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-3" for="dateBirth">Дата рождения</label>
                                <div class="col-sm-9">
                                    <input type="date" class="form-control" id="dateBirth" name="dateBirth" value="${getClient.dateBirth}" placeholder="ДД.ММ.ГГГГ">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-3" for="partnerFullName">Ф.И.О. Супруга(ги)</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="partnerFullName" name="partnerFullName" value="${getClient.partnerFullName}" placeholder="Ф.И.О.">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-3" for="partnerIdentNumber">ИНН Супруга(ги)</label>
                                <div class="col-sm-9">
                                    <input type="number" class="form-control" id="partnerIdentNumber" name="partnerIdentNumber" value="${getClient.partnerIdentNumber}" placeholder="Идентификационный номер">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <a href="${contacts}" role="button" class="btn btn-default">Отмена</a>
                                <button type="submit" class="btn btn-primary">Сохранить изменения</button>
                            </div>
                        </form>

                    </div>
                    <!-- /.col-lg-12 -->
                </div>
            </div>
        </div>

    </jsp:body>

</page:template>