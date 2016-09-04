<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>

<page:template>

    <jsp:attribute name="title">Договора</jsp:attribute>

    <jsp:body>

        <c:url value="/" var="index"/>
        <c:url value="/tasks" var="tasks"/>
        <c:url value="/contacts" var="contacts"/>
        <c:url value="/contracts" var="contracts"/>
        <c:url value="/objects" var="objects"/>
        <c:url value="/documents" var="documents"/>
        <c:url value="/reports" var="reports"/>
        <c:url value="/analytics" var="analytics"/>
        <c:url value="/users" var="users"/>

        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-3 col-md-2 sidebar">
                    <ul class="nav nav-sidebar">
                        <li><a href=${index}>Главная</a></li>
                        <li><a href=${tasks}>Задачи</a></li>
                        <li><a href=${contacts}>Контакты</a></li>
                        <li class="active"><a href=${contracts}>Договора<span class="sr-only">(current)</span></a></li>
                    </ul>
                    <ul class="nav nav-sidebar">
                        <li><a href=${objects}>Объекты</a></li>
                        <li><a href=${documents}>Документы</a></li>
                        <li><a href=${reports}>Отчеты</a></li>
                        <li><a href=${analytics}>Аналитика</a></li>
                    </ul>
                    <security:authorize access="hasAnyRole('ROLE_ADMIN')">
                    <ul class="nav nav-sidebar">
                        <li><a href=${users}>Пользователи</a></li>
                    </ul>
                    </security:authorize>
                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    <h1 class="page-header">Договора</h1>
                </div>
            </div>
        </div>

    </jsp:body>

</page:template>