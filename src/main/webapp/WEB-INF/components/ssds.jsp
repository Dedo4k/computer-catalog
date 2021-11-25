<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title><spring:message code="label.components.ssds"/></title>
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
    String[] form_fct = request.getParameterValues("form_factor");
    String[] cap = request.getParameterValues("capacity");
    String[] ssd_int = request.getParameterValues("ssd_interface");
    String[] ctrl = request.getParameterValues("controller");
    String[] chip = request.getParameterValues("microchip");
    String[] minWrSs = request.getParameterValues("min_writing_speed");
    String[] maxWrSs = request.getParameterValues("max_writing_speed");
    String minWrS = null;
    String maxWrS = null;
    String[] minRSs = request.getParameterValues("min_reading_speed");
    String[] maxRSs = request.getParameterValues("max_reading_speed");
    String minRS = null;
    String maxRS = null;
    if (prod != null) {
        pageContext.setAttribute("prod", Arrays.asList(prod));
    }
    if (form_fct != null) {
        pageContext.setAttribute("form_fct", Arrays.asList(form_fct));
    }
    if (cap != null) {
        pageContext.setAttribute("cap", Arrays.asList(cap));
    }
    if (ssd_int != null) {
        pageContext.setAttribute("ssd_int", Arrays.asList(ssd_int));
    }
    if (ctrl != null) {
        pageContext.setAttribute("ctrl", Arrays.asList(ctrl));
    }
    if (chip != null) {
        pageContext.setAttribute("chip", Arrays.asList(chip));
    }
    if (minWrSs == null || minWrSs[0].equals("")) {
        minWrS = "";
    } else {
        minWrS = minWrSs[0];
    }
    if (maxWrSs == null || maxWrSs[0].equals("")) {
        maxWrS = "";
    } else {
        maxWrS = maxWrSs[0];
    }
    pageContext.setAttribute("minWrS", minWrS);
    pageContext.setAttribute("maxWrS", maxWrS);
    if (minRSs == null || minRSs[0].equals("")) {
        minRS = "";
    } else {
        minRS = minRSs[0];
    }
    if (maxRSs == null || maxRSs[0].equals("")) {
        maxRS = "";
    } else {
        maxRS = maxRSs[0];
    }
    pageContext.setAttribute("minRS", minRS);
    pageContext.setAttribute("maxRS", maxRS);
%>
<div class="container align-items-center mt-5">
    <div class="row">
        <div class="filter col-3">
            <div class="card m-4">
                <form action="/catalog/ssds/filter" method="get">

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
                            <h6 class="title"><spring:message code="label.ssd.formfactor"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <c:forEach items="${form_factors_set}" var="form_factor">
                                    <label class="form-check">
                                        <c:if test="${form_fct.contains(form_factor.replace('\"',''))}">
                                            <input class="form-check-input" type="checkbox" name="form_factor"
                                                   value="${form_factor}"
                                                   checked>
                                        </c:if>
                                        <c:if test="${!form_fct.contains(form_factor.replace('\"',''))}">
                                            <input class="form-check-input" type="checkbox" name="form_factor"
                                                   value="${form_factor}">
                                        </c:if>
                                        <span class="form-check-label">
                                                ${form_factor}
                                        </span>
                                    </label>
                                </c:forEach>
                            </div>
                        </div>
                    </article>

                    <article class="card-group-item">
                        <header class="card-header">
                            <h6 class="title"><spring:message code="label.ssd.interface"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <c:forEach items="${ssd_interfaces_set}" var="ssd_interface">
                                    <label class="form-check">
                                        <c:if test="${ssd_int.contains(ssd_interface)}">
                                            <input class="form-check-input" type="checkbox" name="ssd_interface"
                                                   value="${ssd_interface}"
                                                   checked>
                                        </c:if>
                                        <c:if test="${!ssd_int.contains(ssd_interface)}">
                                            <input class="form-check-input" type="checkbox" name="ssd_interface"
                                                   value="${ssd_interface}">
                                        </c:if>
                                        <span class="form-check-label">
                                                ${ssd_interface}
                                        </span>
                                    </label>
                                </c:forEach>
                            </div>
                        </div>
                    </article>

                    <article class="card-group-item">
                        <header class="card-header">
                            <h6 class="title"><spring:message code="label.ssd.controller"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <c:forEach items="${controllers_set}" var="controller">
                                    <label class="form-check">
                                        <c:if test="${ctrl.contains(controller)}">
                                            <input class="form-check-input" type="checkbox" name="controller"
                                                   value="${controller}"
                                                   checked>
                                        </c:if>
                                        <c:if test="${!ctrl.contains(controller)}">
                                            <input class="form-check-input" type="checkbox" name="controller"
                                                   value="${controller}">
                                        </c:if>
                                        <span class="form-check-label">
                                                ${controller}
                                        </span>
                                    </label>
                                </c:forEach>
                            </div>
                        </div>
                    </article>

                    <article class="card-group-item">
                        <header class="card-header">
                            <h6 class="title"><spring:message code="label.ssd.microchip"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <c:forEach items="${microchips_set}" var="microchip">
                                    <label class="form-check">
                                        <c:if test="${chip.contains(microchip)}">
                                            <input class="form-check-input" type="checkbox" name="microchip"
                                                   value="${microchip}"
                                                   checked>
                                        </c:if>
                                        <c:if test="${!chip.contains(microchip)}">
                                            <input class="form-check-input" type="checkbox" name="microchip"
                                                   value="${microchip}">
                                        </c:if>
                                        <span class="form-check-label">
                                                ${microchip}
                                        </span>
                                    </label>
                                </c:forEach>
                            </div>
                        </div>
                    </article>

                    <article class="card-group-item">
                        <header class="card-header">
                            <h6 class="title"><spring:message code="label.ssd.capacity"/>, <spring:message code="label.values.gbait"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <c:forEach items="${capacity_set}" var="capacity">
                                    <label class="form-check">
                                        <c:if test="${cap.contains(capacity.toString())}">
                                            <input class="form-check-input" type="checkbox" name="capacity"
                                                   value="${capacity}"
                                                   checked>
                                        </c:if>
                                        <c:if test="${!cap.contains(capacity.toString())}">
                                            <input class="form-check-input" type="checkbox" name="capacity"
                                                   value="${capacity}">
                                        </c:if>
                                        <span class="form-check-label">
                                                ${capacity}
                                        </span>
                                    </label>
                                </c:forEach>
                            </div>
                        </div>
                    </article>

                    <article class="card-group-item">
                        <header class="card-header">
                            <h6 class="title"><spring:message code="label.ssd.readingspeed"/>, <spring:message code="label.values.rwspeed"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <div class="row">
                                    <label class="col-5">
                                        <input type="text" name="min_reading_speed" placeholder="Min" class="w-100" value="${minRS}">
                                    </label>
                                    <span class="col-2">
                                        &#8212
                                    </span>
                                    <label class="col-5">
                                        <input type="text" name="max_reading_speed" placeholder="Max" class="w-100" value="${maxRS}">
                                    </label>
                                    <c:if test="${error != null}">
                                        <h5 style="color: #b02a37">${error}</h5>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </article>

                    <article class="card-group-item">
                        <header class="card-header">
                            <h6 class="title"><spring:message code="label.ssd.writingspeed"/>, <spring:message code="label.values.rwspeed"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <div class="row">
                                    <label class="col-5">
                                        <input type="text" name="min_writing_speed" placeholder="Min" class="w-100" value="${minWrS}">
                                    </label>
                                    <span class="col-2">
                                        &#8212
                                    </span>
                                    <label class="col-5">
                                        <input type="text" name="max_writing_speed" placeholder="Max" class="w-100" value="${maxWrS}">
                                    </label>
                                    <c:if test="${error != null}">
                                        <h5 style="color: #b02a37">${error}</h5>
                                    </c:if>
                                </div>
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
            <c:forEach items="${ssds}" var="ssd">
                <div class="row">
                    <div class="card m-4">
                        <div class="row">
                            <div class="col-3">
                                <img class="card-img-top" src="<c:url value="/img/ssd.jpg"/>" alt="processor">
                            </div>
                            <div class="col-9">
                                <div class="card-body">
                                    <a href="/catalog/ssd/${ssd.id}" class="text-decoration-none"><h5
                                            class="card-title">${ssd.toString()}</h5></a>
                                    <p class="card-text">${ssd.formFactor}, ${ssd.ssdInterface}, <spring:message code="label.ssd.microchip"/>: ${ssd.microchipType}, <spring:message code="label.ssd.readingspeed"/>: ${ssd.readingSpeed} <spring:message code="label.values.rwspeed"/> , <spring:message code="label.ssd.writingspeed"/>: ${ssd.writingSpeed} <spring:message code="label.values.rwspeed"/> </p>
                                    <h5 class="btn btn-warning">${ssd.price} <spring:message
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
