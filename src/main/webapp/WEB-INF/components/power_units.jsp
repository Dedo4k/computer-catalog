<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title><spring:message code="label.components.powerunits"/></title>
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
                <li class="nav-item active"><a class="nav-link" href="<c:url value="/catalog"/>"><spring:message
                        code="label.page.catalog"/></a></li>
                <li class="nav-item dropdown" id="myDropdown1">
                    <a class="nav-link dropdown-toggle" href="" data-bs-toggle="dropdown"
                       style="float: right"><spring:message code="label.lang"/></a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="<c:url value="?lang=en"/>"><spring:message
                                code="label.lang.en"/></a></li>
                        <li><a class="dropdown-item" href="<c:url value="?lang=ru"/>"><spring:message
                                code="label.lang.ru"/></a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown" id="myDropdown">
                    <a class="nav-link dropdown-toggle" href="" data-bs-toggle="dropdown"
                       style="float: right"><sec:authentication property="principal.firstName"/> <sec:authentication
                            property="principal.lastName"/></a>
                    <ul class="dropdown-menu">
                        <sec:authentication property="principal.id" var="user_id"/>
                        <li><a class="dropdown-item" href="<c:url value="/user/${user_id}"/>"><spring:message
                                code="label.page.account"/></a></li>
                        <sec:authorize access="hasAuthority('ADMIN')">
                            <li><a class="dropdown-item" href="<c:url value="/admin"/>"><spring:message
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
<%
    String[] prod = request.getParameterValues("producer");
    String[] pwr = request.getParameterValues("power");
    String[] crt = request.getParameterValues("certificate");
    if (prod != null) {
        pageContext.setAttribute("prod", Arrays.asList(prod));
    }
    if (pwr != null) {
        pageContext.setAttribute("pwr", Arrays.asList(pwr));
    }
    if (crt != null) {
        pageContext.setAttribute("crt", Arrays.asList(crt));
    }
%>
<div class="container align-items-center mt-5">
    <div class="row">
        <div class="filter col-3">
            <div class="card m-4">
                <form action="/catalog/power_units/filter" method="get">

                    <article class="card-group-item">
                        <header class="card-header">
                            <h6 class="title"><spring:message code="label.component.producer"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <c:forEach items="${producers_set}" var="producer">
                                    <label class="form-check">
                                        <c:if test="${prod.contains(producer)}">
                                            <input class="form-check-input" type="checkbox" name="producer"
                                                   value="${producer}"
                                                   checked>
                                        </c:if>
                                        <c:if test="${!prod.contains(producer)}">
                                            <input class="form-check-input" type="checkbox" name="producer"
                                                   value="${producer}">
                                        </c:if>
                                        <span class="form-check-label">
                                                ${producer}
                                        </span>
                                    </label>
                                </c:forEach>
                            </div>
                        </div>
                    </article>

                    <article class="card-group-item">
                        <header class="card-header">
                            <h6 class="title"><spring:message code="label.powerunit.power"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <c:forEach items="${power_set}" var="power">
                                    <label class="form-check">
                                        <c:if test="${pwr.contains(power.toString())}">
                                            <input class="form-check-input" type="checkbox" name="power"
                                                   value="${power}"
                                                   checked>
                                        </c:if>
                                        <c:if test="${!pwr.contains(power.toString())}">
                                            <input class="form-check-input" type="checkbox" name="power"
                                                   value="${power}">
                                        </c:if>
                                        <span class="form-check-label">
                                                ${power}
                                        </span>
                                    </label>
                                </c:forEach>
                            </div>
                        </div>
                    </article>

                    <article class="card-group-item">
                        <header class="card-header">
                            <h6 class="title"><spring:message code="label.powerunit.certificate"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <c:forEach items="${certificates_set}" var="certificate">
                                    <label class="form-check">
                                        <c:if test="${crt.contains(certificate)}">
                                            <input class="form-check-input" type="checkbox" name="certificate"
                                                   value="${certificate}"
                                                   checked>
                                        </c:if>
                                        <c:if test="${!crt.contains(certificate)}">
                                            <input class="form-check-input" type="checkbox" name="certificate"
                                                   value="${certificate}">
                                        </c:if>
                                        <span class="form-check-label">
                                                ${certificate}
                                        </span>
                                    </label>
                                </c:forEach>
                            </div>
                        </div>
                    </article>

                    <div class="container align-items-center align-middle justify-content-center">
                        <button type="submit" class="btn btn-primary w-100 p-0 m-0">Find</button>
                    </div>
                </form>
            </div>
        </div>

        <div class="col-9">
            <c:forEach items="${power_units}" var="power_unit">
                <div class="row">
                    <div class="card m-4">
                        <div class="row">
                            <div class="col-3">
                                <img class="card-img-top" src="<c:url value="/img/power.jpg"/>" alt="processor">
                            </div>
                            <div class="col-9">
                                <div class="card-body">
                                    <a href="/catalog/power_unit/${power_unit.id}" class="text-decoration-none"><h5
                                            class="card-title">${power_unit.toString()}</h5></a>
                                    <p class="card-text">${power_unit.info()}</p>
                                    <h5 class="btn btn-warning">${power_unit.price} <spring:message
                                            code="label.currency.byn"/></h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

</body>
</html>
