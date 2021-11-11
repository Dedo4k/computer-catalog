<%@ page import="iipu.shop.model.component.Processor" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>${power_unit.toString()}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="<c:url value="/css/styles.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/bootstrap.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/components.css"/>">
    <script src="<c:url value="/js/bootstrap.js"/>"></script>
    <script src="<c:url value="/js/script.js"/>"></script>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="<c:url value="/main"/>">VVAA</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#main_nav"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="main_nav">
            <ul class="navbar-nav">
                <li class="nav-item active"><a class="nav-link"
                                               href="<c:url value="/catalog"/>"><spring:message
                        code="label.page.catalog"/></a></li>
                <li class="nav-item"><a class="nav-link"
                                        href="<c:url value="/catalog/power_units"/>"><spring:message
                        code="label.components.powerunits"/></a></li>
                <li class="nav-item"><a class="nav-link" href="<c:url value="?lang=en"/>"><spring:message
                        code="label.lang.en"/></a></li>
                <li class="nav-item"><a class="nav-link" href="<c:url value="?lang=ru"/>"><spring:message
                        code="label.lang.ru"/></a></li>
                <li class="nav-item dropdown" id="myDropdown" style="float: right">
                    <a class="nav-link dropdown-toggle" href="" data-bs-toggle="dropdown"><sec:authentication
                            property="principal.firstName"/> <sec:authentication
                            property="principal.lastName"/></a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="<c:url value=""/>"><spring:message
                                code="label.page.account"/></a></li>
                        <sec:authorize access="hasAuthority('ADMIN')">
                            <li><a class="dropdown-item" href="<c:url value=""/>"><spring:message
                                    code="label.page.settings"/></a></li>
                        </sec:authorize>
                        <li>
                            <form action="<c:url value="/logout"/>" method="post">
                                <a class="dropdown-item" href="<c:url value="/logout"/>"><spring:message
                                        code="label.auth.signout"/></a>
                            </form>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container align-items-center mt-5">
    <div class="row pt-5">
        <div class="col-4">
            <img src="<c:url value="/img/power.jpg"/>" class="w-100" alt="mother_board">
        </div>
        <div class="col-8">
            <h2>${power_unit.producer} ${power_unit.model}</h2>
            <p>${power_unit.certificate}, ${power_unit.power}</p>
            <h5 class="btn btn-warning">${power_unit.price} <spring:message code="label.currency.byn"/></h5>
        </div>
    </div>
    <table class="table table-bordered align-middle mt-5">
        <caption class="caption-top text-center"><h3><spring:message code="label.component.description"/></h3></caption>
        <tbody>
        <tr>
            <td class="w-50"><spring:message code="label.component.producer"/></td>
            <td class="w-50">${power_unit.producer}</td>
        </tr>
        <tr>
            <td class="w-50"><spring:message code="label.component.model"/></td>
            <td class="w-50">${power_unit.model}</td>
        </tr>
        <tr>
            <td><spring:message code="label.powerunit.certificate"/></td>
            <td>${power_unit.certificate}</td>
        </tr>
        <tr>
            <td><spring:message code="label.powerunit.power"/></td>
            <td>${power_unit.power}</td>
        </tr>
        </tbody>
    </table>

    <table class="table table-bordered align-middle mt-5">
        <caption class="caption-top text-center"><h3><spring:message code="label.component.stores"/></h3></caption>
        <tbody>
        <c:forEach items="${power_unit.sources}" var="source">
            <tr>
                <td class="w-25">${source.name}</td>
                <td class="w-75"><a href="${source.link}">${source.link}</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<div class="container align-items-center mt-5">
    <form action="<c:url value="/catalog/power_unit/${power_unit.id}/comment"/>" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label">Leave your comment</label>
            <textarea class="form-control" name="message" id="exampleFormControlTextarea1" rows="3"></textarea>
        </div>
        <div class="row px-2 align-items-center">
            <button class="btn btn-primary btn-lg btn-block col-2" type="submit">Comment</button>
            <c:if test="${error != null}">
                <h5 class="col-10" style="color: #b02a37">${error}</h5>
            </c:if>
        </div>
    </form>

    <hr class="w-100">

    <c:if test="${!power_unit.reviews.isEmpty()}">
        <c:forEach items="${power_unit.reviews}" var="review">
            <div class="card mt-1">
                <div class="card-header">
                    <div class="row">
                        <h3 class="col-11">${review.user.firstName} ${review.user.lastName}</h3>
                        <form action="/catalog/power_unit/${power_unit.id}/comment/${review.id}" method="post"
                              class="col-1">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <sec:authorize access="hasAuthority('ADMIN')">
                                <button class="btn btn-primary" type="submit" style="float: right;">Delete</button>
                            </sec:authorize>
                            <sec:authorize access="hasAuthority('USER')">
                                <sec:authentication property="principal.id" var="user_id"/>
                                <c:if test="${review.user.id eq user_id}">
                                    <button class="btn btn-primary" type="submit" style="float: right;">Delete</button>
                                </c:if>
                            </sec:authorize>
                        </form>
                    </div>
                </div>
                <div class="card-body">
                    <p>${review.text}</p>
                </div>
            </div>
        </c:forEach>
    </c:if>
</div>

</body>
</html>
