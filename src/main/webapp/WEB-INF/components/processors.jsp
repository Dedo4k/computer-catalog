<%@ page import="com.mysql.cj.xdevapi.Collection" %>
<%@ page import="org.hibernate.engine.internal.Collections" %>
<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title><spring:message code="label.components.processors"/></title>
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
    String[] cor = request.getParameterValues("core");
    String[] sock = request.getParameterValues("socket");
    String[] cor_num = request.getParameterValues("core_number");
    String[] cr_name = request.getParameterValues("crystal_name");
    String[] minFreqs = request.getParameterValues("minFreq");
    String[] maxFreqs = request.getParameterValues("maxFreq");
    String minFreq = null;
    String maxFreq = null;
    String[] min_th_ps = request.getParameterValues("min_thermal_power");
    String[] max_th_ps = request.getParameterValues("max_thermal_power");
    String min_th_p = null;
    String max_th_p = null;
    if (prod != null) {
        pageContext.setAttribute("prod", Arrays.asList(prod));
    }
    if (cor != null) {
        pageContext.setAttribute("cor", Arrays.asList(cor));
    }
    if (sock != null) {
        pageContext.setAttribute("sock", Arrays.asList(sock));
    }
    if (cor_num != null) {
        pageContext.setAttribute("cor_num", Arrays.asList(cor_num));
    }
    if (cr_name != null) {
        pageContext.setAttribute("cr_name", Arrays.asList(cr_name));
    }
    if (minFreqs == null || minFreqs[0].equals("")) {
        minFreq = "";
    } else {
        minFreq = minFreqs[0];
    }
    if (maxFreqs == null || maxFreqs[0].equals("")) {
        maxFreq = "";
    } else {
        maxFreq = maxFreqs[0];
    }
    pageContext.setAttribute("minFreq", Arrays.asList(minFreq));
    pageContext.setAttribute("maxFreq", Arrays.asList(maxFreq));
    if (min_th_ps == null || min_th_ps[0].equals("")) {
        min_th_p = "";
    } else {
        min_th_p = min_th_ps[0];
    }
    if (max_th_ps == null || max_th_ps[0].equals("")) {
        max_th_p = "";
    } else {
        max_th_p = max_th_ps[0];
    }
    pageContext.setAttribute("min_th_p", min_th_p);
    pageContext.setAttribute("max_th_p", max_th_p);
%>
<div class="container align-items-center mt-5">
    <div class="row">
        <div class="filter col-3">
            <div class="card m-4">
                <form action="/catalog/processors/filter" method="get">

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
                            <h6 class="title"><spring:message code="label.processor.core"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <c:forEach items="${cores_set}" var="core">
                                    <label class="form-check">
                                        <c:if test="${cor.contains(core)}">
                                            <input class="form-check-input" type="checkbox" name="core" value="${core}"
                                                   checked>
                                        </c:if>
                                        <c:if test="${!cor.contains(core)}">
                                            <input class="form-check-input" type="checkbox" name="core" value="${core}">
                                        </c:if>
                                        <span class="form-check-label">
                                                ${core}
                                        </span>
                                    </label>
                                </c:forEach>
                            </div>
                        </div>
                    </article>

                    <article class="card-group-item">
                        <header class="card-header">
                            <h6 class="title"><spring:message code="label.processor.corenum"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <c:forEach items="${core_numbers_set}" var="core_number">
                                    <label class="form-check">
                                        <c:if test="${cor_num.contains(core_number.toString())}">
                                            <input class="form-check-input" type="checkbox" name="core_number"
                                                   value="${core_number}"
                                                   checked>
                                        </c:if>
                                        <c:if test="${!cor_num.contains(core_number.toString())}">
                                            <input class="form-check-input" type="checkbox" name="core_number"
                                                   value="${core_number}">
                                        </c:if>
                                        <span class="form-check-label">
                                                ${core_number}
                                        </span>
                                    </label>
                                </c:forEach>
                            </div>
                        </div>
                    </article>

                    <article class="card-group-item">
                        <header class="card-header">
                            <h6 class="title"><spring:message code="label.processor.crystalname"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <c:forEach items="${crystal_names_set}" var="crystal_name">
                                    <label class="form-check">
                                        <c:if test="${cr_name.contains(crystal_name)}">
                                            <input class="form-check-input" type="checkbox" name="crystal_name"
                                                   value="${crystal_name}"
                                                   checked>
                                        </c:if>
                                        <c:if test="${!cr_name.contains(crystal_name)}">
                                            <input class="form-check-input" type="checkbox" name="crystal_name"
                                                   value="${crystal_name}">
                                        </c:if>
                                        <span class="form-check-label">
                                                ${crystal_name}
                                        </span>
                                    </label>
                                </c:forEach>
                            </div>
                        </div>
                    </article>

                    <article class="card-group-item">
                        <header class="card-header">
                            <h6 class="title"><spring:message code="label.processor.socket"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <c:forEach items="${sockets_set}" var="socket">
                                    <label class="form-check">
                                        <c:if test="${sock.contains(socket)}">
                                            <input class="form-check-input" type="checkbox" name="socket"
                                                   value="${socket}"
                                                   checked>
                                        </c:if>
                                        <c:if test="${!sock.contains(socket)}">
                                            <input class="form-check-input" type="checkbox" name="socket"
                                                   value="${socket}">
                                        </c:if>
                                        <span class="form-check-label">
                                                ${socket}
                                        </span>
                                    </label>
                                </c:forEach>
                            </div>
                        </div>
                    </article>

                    <article class="card-group-item">
                        <header class="card-header">
                            <h6 class="title"><spring:message code="label.processor.freq"/>, <spring:message
                                    code="label.values.mherz"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <div class="row">
                                    <label class="col-5">
                                        <input type="text" name="minFreq" placeholder="Min" class="w-100"
                                               value="<%=minFreq%>">
                                    </label>
                                    <span class="col-2">
                                        &#8212
                                    </span>
                                    <label class="col-5">
                                        <input type="text" name="maxFreq" placeholder="Max" class="w-100"
                                               value="<%=maxFreq%>">
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
                            <h6 class="title"><spring:message code="label.processor.thermalpower"/>, <spring:message
                                    code="label.values.watt"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <div class="row">
                                    <label class="col-5">
                                        <input type="text" name="min_thermal_power" placeholder="Min" class="w-100"
                                               value="${min_th_p}">
                                    </label>
                                    <span class="col-2">
                                        &#8212
                                    </span>
                                    <label class="col-5">
                                        <input type="text" name="max_thermal_power" placeholder="Max" class="w-100"
                                               value="${max_th_p}">
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

        <div class="list col-9">
            <c:forEach items="${processors}" var="processor">
                <div class="row">
                    <div class="card m-4">
                        <div class="row">
                            <c:if test="${processor.image == null}">
                                <div class="col-3">
                                    <img src="<c:url value="/img/processors.jpg"/>" class="w-100" alt="processor"/>
                                </div>
                            </c:if>
                            <c:if test="${processor.image != null}">
                                <div class="col-3">
                                    <img src="<c:url value="data:image/png;base64,${processor.encodeImage}"/>"
                                         class="w-100" alt="processor"/>
                                </div>
                            </c:if>
                            <div class="col-9">
                                <div class="card-body">
                                    <a href="/catalog/processor/${processor.id}" class="text-decoration-none"><h5
                                            class="card-title">${processor.toString()}</h5></a>
                                    <p class="card-text">${processor.core}, ${processor.crystalName}, <spring:message
                                            code="label.processor.corenum"/>: ${processor.coreNumber},
                                        <spring:message code="label.processor.socket"/>: ${processor.socket},
                                        <spring:message code="label.processor.thermalpower"/>: ${processor.thermalPower}
                                        <spring:message code="label.values.watt"/>,
                                        <spring:message code="label.processor.minfreq"/>: ${processor.minFreq}
                                        <spring:message code="label.values.mherz"/>, <spring:message
                                                code="label.processor.maxfreq"/>: ${processor.maxFreq} <spring:message
                                                code="label.values.mherz"/></p>
                                    <h5 class="btn btn-warning">${processor.price} <spring:message
                                            code="label.currency.byn"/></h5>
                                    <c:if test="${sessionScope.get('computer_id') ne null}">
                                        <form action="/config/computer/${sessionScope.get('computer_id')}/processor/${processor.id}/add"
                                              method="post">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                            <button class="btn btn-outline-success">Add to configuration</button>
                                        </form>
                                    </c:if>
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
