<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>

<page:template>

    <jsp:attribute name="title">Аналитика</jsp:attribute>

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
                        <li><a href=${objects}><span class="glyphicon glyphicon-object-align-bottom"></span> Объекты</a></li>
                        <li><a href=${documents}><span class="glyphicon glyphicon-duplicate"></span> Документы</a></li>
                        <li><a href=${reports}><span class="glyphicon glyphicon-briefcase"></span> Отчеты</a></li>
                        <li class="active"><a href=${analytics}><span class="glyphicon glyphicon-stats"></span> Аналитика<span class="sr-only">(current)</span></a></li>
                    </ul>
                    <security:authorize access="hasAnyRole('ROLE_ADMIN')">
                    <ul class="nav nav-sidebar">
                        <li><a href=${users}><span class="glyphicon glyphicon-user"></span> Пользователи</a></li>
                    </ul>
                    </security:authorize>
                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    <h1 class="page-header">Аналитика</h1>
                </div>
            </div>
        </div>
    </jsp:body>

</page:template>