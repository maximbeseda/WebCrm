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
                        <li class="active"><a href=${objects}><span
                                class="glyphicon glyphicon-object-align-bottom"></span> Объекты<span class="sr-only">(current)</span></a>
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
                    <h1 class="page-header">Объекты</h1>

                    <div class="col-lg-12">
                        <c:if test="${editObject.type eq 'Квартира'}">
                        <form role="form" enctype="multipart/form-data" class="form-horizontal" action="/apartment/update" method="post">
                            <input type="hidden" id="id" name="id" value="${id}"/>

                            <div class="form-group">
                                <label class="control-label col-sm-3" for="houseNumber">Номер дома<span style="color:red;"> *</span></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="houseNumber" name="houseNumber" value="${editObject.houseNumber}" placeholder="Номер дома" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-3" for="apartmentNumber">Номер квартиры<span style="color:red;"> *</span></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="apartmentNumber" name="apartmentNumber" value="${editObject.apartmentNumber}" placeholder="Номер квартиры" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-3" for="level">Этаж<span style="color:red;"> *</span></label>
                                <div class="col-sm-9">
                                    <input type="number" class="form-control" id="level" name="level" value="${editObject.level}" placeholder="Этаж" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-3" for="totalSpace">Общая площадь, м.кв.<span style="color:red;"> *</span></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="totalSpace" name="totalSpace" value="${editObject.totalSpace}" placeholder="Общая площадь в формате 0.00" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-3" for="livingSpace">Жилая площадь, м.кв.<span style="color:red;"> *</span></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="livingSpace" name="livingSpace" value="${editObject.livingSpace}" placeholder="Жилая площадь в формате 0.00" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-3" for="rooms">Количество комнат<span style="color:red;"> *</span></label>
                                <div class="col-sm-9">
                                    <input type="number" class="form-control" id="rooms" name="rooms" value="${editObject.rooms}" placeholder="Количество комнат" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-3" for="priceUsd">Стоимость по прайсу, $<span style="color:red;"> *</span></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="priceUsd" name="priceUsd" value="${editObject.priceUsd}" placeholder="Стоимость в формате 0.00" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-3" for="status">Статус<span style="color:red;"> *</span></label>
                                <div class="col-sm-9">
                                    <input list="types" class="form-control" id="status" name="status" value="${editObject.status}" placeholder="Статус" required>
                                    <datalist id="types">
                                        <c:forEach items="${statusList}" var="status">
                                        <option value='${status}'>
                                            </c:forEach>
                                    </datalist>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-3" for="discount">Скидка, %</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="discount" name="discount" value="${editObject.discount}" placeholder="Скидка в формате 0.00">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-3" for="discountPriceUsd">Стоимость со скидкой, $</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="discountPriceUsd" name="discountPriceUsd" value="${editObject.discountPriceUsd}" readonly>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <a href="${objects}" role="button" class="btn btn-default">Отмена</a>
                                <button type="submit" class="btn btn-primary">Сохранить изменения</button>
                            </div>
                        </form>
                        </c:if>

                        <c:if test="${editObject.type eq 'Паркинг'}">
                            <form role="form" enctype="multipart/form-data" class="form-horizontal" action="/parking/update" method="post">
                                <input type="hidden" id="idP" name="id" value="${id}"/>

                                <div class="form-group">
                                    <label class="control-label col-sm-3" for="houseNumberP">Номер дома<span style="color:red;"> *</span></label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="houseNumberP" name="houseNumber" value="${editObject.houseNumber}" placeholder="Номер дома" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-sm-3" for="parkingNumber">Номер паркинга<span style="color:red;"> *</span></label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="parkingNumber" name="parkingNumber" value="${editObject.parkingNumber}" placeholder="Номер паркинга" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-sm-3" for="levelP">Этаж<span style="color:red;"> *</span></label>
                                    <div class="col-sm-9">
                                        <input type="number" class="form-control" id="levelP" name="level" value="${editObject.level}" placeholder="Этаж" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-sm-3" for="totalSpaceP">Общая площадь, м.кв.<span style="color:red;"> *</span></label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="totalSpaceP" name="totalSpace" value="${editObject.totalSpace}" placeholder="Общая площадь в формате 0.00" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-sm-3" for="priceUsdP">Стоимость по прайсу, $<span style="color:red;"> *</span></label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="priceUsdP" name="priceUsd" value="${editObject.priceUsd}" placeholder="Стоимость в формате 0.00" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-sm-3" for="statusP">Статус<span style="color:red;"> *</span></label>
                                    <div class="col-sm-9">
                                        <input list="typesP" class="form-control" id="statusP" name="status" value="${editObject.status}" placeholder="Статус" required>
                                        <datalist id="typesP">
                                            <c:forEach items="${statusList}" var="status">
                                            <option value='${status}'>
                                                </c:forEach>
                                        </datalist>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-sm-3" for="discountP">Скидка, %</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="discountP" name="discount" value="${editObject.discount}" placeholder="Скидка в формате 0.00">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-sm-3" for="discountPriceUsdP">Стоимость со скидкой, $</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="discountPriceUsdP" name="discountPriceUsd" value="${editObject.discountPriceUsd}" readonly>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <a href="${objects}" role="button" class="btn btn-default">Отмена</a>
                                    <button type="submit" class="btn btn-primary">Сохранить изменения</button>
                                </div>
                            </form>
                        </c:if>

                    </div>
                    <!-- /.col-lg-12 -->
                </div>
            </div>
        </div>

    </jsp:body>

</page:template>