<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>

<page:template>

    <jsp:attribute name="title">Пользователи</jsp:attribute>

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
                            <li><a href=${documents}><i class="fa fa-file"></i> Документы</a></li>
                            <security:authorize access="hasAnyRole('ROLE_ADMIN')">
                                <ul class="nav side-menu">
                                    <li class="active"><a href=${users}><i class="fa fa-users"></i> Пользователи <span class="sr-only">(current)</span></a></li>
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
                        <h3>Пользователи</h3>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Список всех пользователей</h2>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">

                                <!--Button Group-->
                                <div class="panel">
                                    <div class="btn-toolbar">
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-dark" data-toggle="modal"
                                                    data-target="#modal-create"><i class="fa fa-plus-circle"></i> Создать
                                            </button>
                                        </div>
                                        <div class="btn-group">
                                            <button id="edit_user" type="button" class="btn btn-warning"><i class="fa fa-cog"></i> Изменить
                                            </button>
                                        </div>
                                        <div class="btn-group">
                                            <button id="delete_user" type="button" class="btn btn-danger"><i class="fa fa-times-circle"></i> Удалить
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <!--Data Table-->
                                <table id="example" class="table table-striped table-bordered">
                                    <thead>
                                    <tr>
                                        <th>Имя</th>
                                        <th>Телефон</th>
                                        <th>E-mail</th>
                                        <th>Роль</th>
                                        <th>Логин</th>
                                    </tr>
                                    </thead>

                                    <tfoot>
                                    <tr>
                                        <th>Имя</th>
                                        <th>Телефон</th>
                                        <th>E-mail</th>
                                        <th>Роль</th>
                                        <th>Логин</th>
                                    </tr>
                                    </tfoot>

                                    <tbody>
                                    <c:forEach items="${allUsers}" var="user">
                                        <tr data-value="${user.id}">
                                            <td>${user.fullName}</td>
                                            <td>${user.phone}</td>
                                            <td>${user.email}</td>
                                            <td>${user.role}</td>
                                            <td>${user.login}</td>
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
                                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span></button>
                                                <h4 class="modal-title" id="myModalLabel">Новый пользователь</h4>
                                            </div>
                                            <div class="modal-body">
                                                <form id="demo-form2P" data-parsley-validate class="form-horizontal form-label-left" enctype="multipart/form-data" action="/user_add" method="post">
                                                    <div class="item form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="fullName">Ф.И.О. <span class="required">*</span></label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Ф.И.О." required="required">
                                                        </div>
                                                    </div>

                                                    <div class="item form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="phone">Телефон <span class="required">*</span></label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control" id="phone" name="phone" placeholder="Номер телефона в формате +380ХХХХХХХХХ" required="required">
                                                        </div>
                                                    </div>

                                                    <div class="item form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">E-mail <span class="required">*</span></label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="email" class="form-control" id="email" name="email" placeholder="example@mail.com" required="required">
                                                        </div>
                                                    </div>

                                                    <div class="item form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address">Адрес регистрации</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control" id="address" name="address" placeholder="Адрес регистрации">
                                                        </div>
                                                    </div>

                                                    <div class="item form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="passport">Паспорт</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control" id="passport" name="passport" placeholder="Серия и номер паспорта, кем выдан, дата выдачи">
                                                        </div>
                                                    </div>

                                                    <div class="item form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="identNumber">ИНН</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="number" class="form-control" id="identNumber" name="identNumber" placeholder="Идентификационный номер">
                                                        </div>
                                                    </div>

                                                    <div class="item form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="dateBirth">Дата рождения</label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="date" class="form-control" id="dateBirth" name="dateBirth" placeholder="ДД.ММ.ГГГГ">
                                                        </div>
                                                    </div>

                                                    <div class="item form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="role">Роль <span class="required">*</span></label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <select class="form-control" id="role" name="role" required="required">
                                                                <c:forEach items="${roleList}" var="role">
                                                                    <option value='${role}'>${role}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="item form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="login">Логин <span class="required">*</span></label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="text" class="form-control" id="login"
                                                                   name="login" placeholder="Логин" required="required">
                                                        </div>
                                                    </div>

                                                    <div class="item form-group">
                                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="password">Пароль <span class="required">*</span></label>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <input type="password" class="form-control" id="password" name="password" placeholder="Вставьте хеш код желаемого пароля используя ссылку ниже" required="required">
                                                            <a href="http://www.sha1-online.com/" target="_blank" style="color: #2e6da4">www.sha1-online.com</a>
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
                                                            <span class="help-block">Прикрепите файлы</span>
                                                        </div><!-- /input-group -->
                                                    </div>

                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default"
                                                                data-dismiss="modal">Отменить
                                                        </button>
                                                        <button type="submit" class="btn btn-primary">Сохранить</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--Modal-Create-->
                                <form style="display: none" action="/user_edit" method="POST" id="formidupdate">
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