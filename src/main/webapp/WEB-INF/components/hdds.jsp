<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title><spring:message code="label.components.hdds"/></title>
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
    String[] hdd_int = request.getParameterValues("hdd_int");
    String[] cap = request.getParameterValues("capacity");
    String[] buff = request.getParameterValues("buffer_size");
    String[] minRSs = request.getParameterValues("min_rotation_speed");
    String[] maxRSs = request.getParameterValues("max_rotation_speed");
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
    if (hdd_int != null) {
        pageContext.setAttribute("hdd_int", Arrays.asList(hdd_int));
    }
    if (buff != null) {
        pageContext.setAttribute("buff", Arrays.asList(buff));
    }
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
                <form action="/catalog/hdds/filter" method="get">

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
                            <h6 class="title"><spring:message code="label.hdd.formfactor"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <c:forEach items="${form_factors_set}" var="form_factor">
                                    <label class="form-check">
                                        <c:if test="${form_fct.contains(form_factor.replace('\"', ''))}">
                                            <input class="form-check-input" type="checkbox" name="form_factor"
                                                   value="${form_factor}"
                                                   checked>
                                        </c:if>
                                        <c:if test="${!form_fct.contains(form_factor.replace('\"', ''))}">
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
                            <h6 class="title"><spring:message code="label.hdd.inteface"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <c:forEach items="${hdd_interfaces_set}" var="hdd_interface">
                                    <label class="form-check">
                                        <c:if test="${hdd_int.contains(hdd_interface)}">
                                            <input class="form-check-input" type="checkbox" name="hdd_interface"
                                                   value="${hdd_interface}"
                                                   checked>
                                        </c:if>
                                        <c:if test="${!hdd_int.contains(hdd_interface)}">
                                            <input class="form-check-input" type="checkbox" name="hdd_interface"
                                                   value="${hdd_interface}">
                                        </c:if>
                                        <span class="form-check-label">
                                                ${hdd_interface}
                                        </span>
                                    </label>
                                </c:forEach>
                            </div>
                        </div>
                    </article>

                    <article class="card-group-item">
                        <header class="card-header">
                            <h6 class="title"><spring:message code="label.hdd.capacity"/></h6>
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
                            <h6 class="title"><spring:message code="label.hdd.buffersize"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <c:forEach items="${buffer_size_set}" var="buffer_size">
                                    <label class="form-check">
                                        <c:if test="${buff.contains(buffer_size.toString())}">
                                            <input class="form-check-input" type="checkbox" name="buffer_size"
                                                   value="${buffer_size}"
                                                   checked>
                                        </c:if>
                                        <c:if test="${!buff.contains(buffer_size.toString())}">
                                            <input class="form-check-input" type="checkbox" name="buffer_size"
                                                   value="${buffer_size}">
                                        </c:if>
                                        <span class="form-check-label">
                                                ${buffer_size}
                                        </span>
                                    </label>
                                </c:forEach>
                            </div>
                        </div>
                    </article>

                    <article class="card-group-item">
                        <header class="card-header">
                            <h6 class="title"><spring:message code="label.hdd.rotationspeed"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <div class="row">
                                    <label class="col-5">
                                        <input type="text" name="min_rotation_speed" placeholder="Min" class="w-100" value="${minRS}">
                                    </label>
                                    <span class="col-2">
                                        &#8212
                                    </span>
                                    <label class="col-5">
                                        <input type="text" name="max_rotation_speed" placeholder="Max" class="w-100" value="${maxRS}">
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
            <c:forEach items="${hdds}" var="hdd">
                <div class="row">
                    <div class="card m-4">
                        <div class="row">
                            <div class="col-3">
                                <img class="card-img-top" src="<c:url value="/img/hdd.jpg"/>" alt="processor">
                            </div>
                            <div class="col-9">
                                <div class="card-body">
                                    <a href="/catalog/hdd/${hdd.id}" class="text-decoration-none"><h5
                                            class="card-title">${hdd.toString()}</h5></a>
                                    <p class="card-text">${hdd.info()}</p>
                                    <h5 class="btn btn-warning">${hdd.price} <spring:message
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
