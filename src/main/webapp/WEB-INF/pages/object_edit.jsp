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
                            <li class="active"><a href=${objects}><i class="fa fa-building"></i> Объекты<span class="sr-only">(current)</span></a></li>
                            <li><a href=${documents}><i class="fa fa-file"></i> Документы</a></li>
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
                        <h3>Объекты</h3>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Изменить объект</h2>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">

                                <!--Modal-Edit-->
                                <c:if test="${editObject.type eq 'Квартира'}">

                                    <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" enctype="multipart/form-data" action="/apartment_update" method="post">
                                        <input type="hidden" id="id" name="id" value="${id}"/>


                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="houseNumber">Номер дома <span class="required">*</span></label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <input type="text" class="form-control" id="houseNumber" name="houseNumber" value="${editObject.houseNumber}" placeholder="Номер дома" required="required">
                                            </div>
                                        </div>

                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="apartmentNumber">Номер квартиры <span class="required">*</span></label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <input type="text" class="form-control" id="apartmentNumber" name="apartmentNumber" value="${editObject.apartmentNumber}" placeholder="Номер квартиры" required="required">
                                            </div>
                                        </div>

                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="level">Этаж <span class="required">*</span></label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <input type="number" class="form-control" id="level" name="level" value="${editObject.level}" placeholder="Этаж" required="required">
                                            </div>
                                        </div>

                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="totalSpace">Общая площадь, м.кв. <span class="required">*</span></label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <input type="text" class="form-control" id="totalSpace" name="totalSpace" value="${editObject.totalSpace}" placeholder="Общая площадь в формате 0.00" required="required" pattern="\d+(\.\d{1,2})?">
                                            </div>
                                        </div>

                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="livingSpace">Жилая площадь, м.кв. <span class="required">*</span></label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <input type="text" class="form-control" id="livingSpace" name="livingSpace" value="${editObject.livingSpace}" placeholder="Жилая площадь в формате 0.00" required="required" pattern="\d+(\.\d{1,2})?">
                                            </div>
                                        </div>

                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="rooms">Количество комнат <span class="required">*</span></label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <input type="number" class="form-control" id="rooms" name="rooms" value="${editObject.rooms}" placeholder="Количество комнат" required="required">
                                            </div>
                                        </div>

                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="priceUsd">Стоимость по прайсу, $ <span class="required">*</span></label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <input type="text" class="form-control" id="priceUsd" name="priceUsd" value="${editObject.priceUsd}" placeholder="Стоимость в формате 0.00" required="required" pattern="\d+(\.\d{1,2})?">
                                            </div>
                                        </div>

                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="status">Статус <span class="required">*</span></label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <select class="form-control" id="status" name="status" required="required">
                                                    <c:if test="${editObject.status eq 'SOLD'}">
                                                        <c:set var="stat" value="Продан"/>
                                                    </c:if>
                                                    <c:if test="${editObject.status eq 'RESERVE'}">
                                                        <c:set var="stat" value="Резерв"/>
                                                    </c:if>
                                                    <c:if test="${editObject.status eq 'FREE'}">
                                                        <c:set var="stat" value="Свободен"/>
                                                    </c:if>
                                                    <c:if test="${editObject.status eq 'NOT_SALE'}">
                                                        <c:set var="stat" value="Не продается"/>
                                                    </c:if>
                                                    <option value="${stat}">${stat}</option>
                                                    <c:forEach items="${statusList}" var="status">
                                                        <c:if test="${status ne stat}">
                                                        <option value='${status}'>${status}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="discount">Скидка, %</label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <input type="text" class="form-control" id="discount" name="discount" value="${editObject.discount}" placeholder="Скидка в формате 0.00" pattern="\d+(\.\d{1,2})?">
                                            </div>
                                        </div>

                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="discountPriceUsd">Стоимость со скидкой, $</label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <input type="text" class="form-control" id="discountPriceUsd" name="discountPriceUsd" value="${editObject.discountPriceUsd}" readonly>
                                            </div>
                                        </div>

                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="info">Описание</label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <textarea class="resizable_textarea form-control" id="info" name="info">${editObject.info}</textarea>
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
                                                Прикрепите файлы
                                            </span>
                                            </div><!-- /input-group -->
                                        </div>

                                        <div class="modal-footer">
                                            <a href="${objects}" role="button" class="btn btn-default">Отмена</a>
                                            <button type="submit" class="btn btn-primary">Сохранить изменения</button>
                                        </div>
                                    </form>
                                </c:if>

                                <c:if test="${editObject.type eq 'Паркинг'}">
                                <form id="demo-form2P" data-parsley-validate class="form-horizontal form-label-left" enctype="multipart/form-data" action="/parking_update" method="post">
                                    <input type="hidden" id="idP" name="id" value="${id}"/>

                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="houseNumberP">Номер дома <span class="required">*</span></label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <input type="text" class="form-control" id="houseNumberP" name="houseNumber" value="${editObject.houseNumber}" placeholder="Номер дома" required="required">
                                        </div>
                                    </div>

                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="parkingNumber">Номер паркинга <span class="required">*</span></label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <input type="text" class="form-control" id="parkingNumber" name="parkingNumber" value="${editObject.parkingNumber}" placeholder="Номер паркинга" required="required">
                                        </div>
                                    </div>

                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="levelP">Этаж <span class="required">*</span></label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <input type="number" class="form-control" id="levelP" name="level" value="${editObject.level}" placeholder="Этаж" required="required">
                                        </div>
                                    </div>

                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="totalSpaceP">Общая площадь, м.кв. <span class="required">*</span></label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <input type="text" class="form-control" id="totalSpaceP" name="totalSpace" value="${editObject.totalSpace}" placeholder="Общая площадь в формате 0.00" required="required" pattern="\d+(\.\d{1,2})?">
                                        </div>
                                    </div>

                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="priceUsdP">Стоимость по прайсу, $ <span class="required">*</span></label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <input type="text" class="form-control" id="priceUsdP" name="priceUsd" value="${editObject.priceUsd}" placeholder="Стоимость в формате 0.00" required="required" pattern="\d+(\.\d{1,2})?">
                                        </div>
                                    </div>

                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="statusP">Статус <span class="required">*</span></label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <select class="form-control" id="statusP" name="status" required="required">
                                                <c:if test="${editObject.status eq 'SOLD'}">
                                                    <c:set var="stat" value="Продан"/>
                                                </c:if>
                                                <c:if test="${editObject.status eq 'RESERVE'}">
                                                    <c:set var="stat" value="Резерв"/>
                                                </c:if>
                                                <c:if test="${editObject.status eq 'FREE'}">
                                                    <c:set var="stat" value="Свободен"/>
                                                </c:if>
                                                <c:if test="${editObject.status eq 'NOT_SALE'}">
                                                    <c:set var="stat" value="Не продается"/>
                                                </c:if>
                                                <option value="${stat}">${stat}</option>
                                                <c:forEach items="${statusList}" var="status">
                                                    <c:if test="${status ne stat}">
                                                        <option value='${status}'>${status}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="discountP">Скидка, %</label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <input type="text" class="form-control" id="discountP" name="discount" value="${editObject.discount}" placeholder="Скидка в формате 0.00" pattern="\d+(\.\d{1,2})?">
                                        </div>
                                    </div>

                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="discountPriceUsdP">Стоимость со скидкой, $</label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <input type="text" class="form-control" id="discountPriceUsdP" name="discountPriceUsd" value="${editObject.discountPriceUsd}" readonly>
                                        </div>
                                    </div>

                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="infoP">Описание</label>
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <textarea class="resizable_textarea form-control" id="infoP" name="info">${editObject.info}</textarea>
                                        </div>
                                    </div>

                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="upfilesP">Прикрепить файлы</label>
                                        <div class="col-md-9 col-sm-9 col-xs-12" id="upfilesP">
                                            <div class="input-group">
                                                <label class="input-group-btn">
                                                    <span class="btn btn-primary">
                                                        Добавить&hellip; <input type="file" name="upfiles[]" style="display: none;" multiple>
                                                    </span>
                                                </label>
                                                <input type="text" class="form-control" readonly>
                                            </div>
                                            <span class="help-block">
                                                Прикрепите файлы
                                            </span>
                                        </div><!-- /input-group -->
                                    </div>

                                    <div class="modal-footer">
                                        <a href="${objects}" role="button" class="btn btn-default">Отмена</a>
                                        <button type="submit" class="btn btn-primary">Сохранить изменения</button>
                                    </div>
                                </form>
                                </c:if>
                                <!--Modal-Edit-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /page content -->

    </jsp:body>

</page:template>