<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title><spring:message code="label.components.rams"/></title>
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
    String[] mem_type = request.getParameterValues("memory_type");
    String[] cap = request.getParameterValues("capacity");
    String[] minFreqs = request.getParameterValues("minFreq");
    String[] maxFreqs = request.getParameterValues("maxFreq");
    String[] modl = request.getParameterValues("module_set");
    String minFreq = null;
    String maxFreq = null;
    if (prod != null) {
        pageContext.setAttribute("prod", Arrays.asList(prod));
    }
    if (mem_type != null) {
        pageContext.setAttribute("mem_type", Arrays.asList(mem_type));
    }
    if (cap != null) {
        pageContext.setAttribute("cap", Arrays.asList(cap));
    }
    if (modl != null) {
        pageContext.setAttribute("modl", Arrays.asList(modl));
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
    pageContext.setAttribute("minFreq", minFreq);
    pageContext.setAttribute("maxFreq", maxFreq);
%>
<div class="container align-items-center mt-5">
    <div class="row">
        <div class="filter col-3">
            <div class="card m-4">
                <form action="/catalog/rams/filter" method="get">

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
                            <h6 class="title"><spring:message code="label.ram.type"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <c:forEach items="${memory_types_set}" var="memory_type">
                                    <label class="form-check">
                                        <c:if test="${mem_type.contains(memory_type)}">
                                            <input class="form-check-input" type="checkbox" name="memory_type"
                                                   value="${memory_type}"
                                                   checked>
                                        </c:if>
                                        <c:if test="${!mem_type.contains(memory_type)}">
                                            <input class="form-check-input" type="checkbox" name="memory_type"
                                                   value="${memory_type}">
                                        </c:if>
                                        <span class="form-check-label">
                                                ${memory_type}
                                        </span>
                                    </label>
                                </c:forEach>
                            </div>
                        </div>
                    </article>

                    <article class="card-group-item">
                        <header class="card-header">
                            <h6 class="title"><spring:message code="label.ram.capacity"/>, <spring:message code="label.values.gbait"/></h6>
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
                            <h6 class="title"><spring:message code="label.ram.modules"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <c:forEach items="${module_set}" var="module">
                                    <label class="form-check">
                                        <c:if test="${modl.contains(module.toString())}">
                                            <input class="form-check-input" type="checkbox" name="module_set"
                                                   value="${module}"
                                                   checked>
                                        </c:if>
                                        <c:if test="${!modl.contains(module.toString())}">
                                            <input class="form-check-input" type="checkbox" name="module_set"
                                                   value="${module}">
                                        </c:if>
                                        <span class="form-check-label">
                                                ${module}
                                        </span>
                                    </label>
                                </c:forEach>
                            </div>
                        </div>
                    </article>

                    <article class="card-group-item">
                        <header class="card-header">
                            <h6 class="title"><spring:message code="label.ram.freq"/>, <spring:message code="label.values.mherz"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <div class="row">
                                    <label class="col-5">
                                        <input type="text" name="minFreq" placeholder="Min" class="w-100" value="${minFreq}">
                                    </label>
                                    <span class="col-2">
                                        &#8212
                                    </span>
                                    <label class="col-5">
                                        <input type="text" name="maxFreq" placeholder="Max" class="w-100" value="${maxFreq}">
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
            <c:forEach items="${rams}" var="ram">
                <div class="row">
                    <div class="card m-4">
                        <div class="row">
                            <c:if test="${ram.image == null}">
                                <div class="col-3">
                                    <img src="<c:url value="/img/ram.jpg"/>" class="w-100" alt="ram"/>
                                </div>
                            </c:if>
                            <c:if test="${ram.image != null}">
                                <div class="col-3">
                                    <img src="<c:url value="data:image/png;base64,${ram.encodeImage}"/>" class="w-100" alt="ram"/>
                                </div>
                            </c:if>
                            <div class="col-9">
                                <div class="card-body">
                                    <a href="/catalog/ram/${ram.id}" class="text-decoration-none"><h5
                                            class="card-title">${ram.toString()}</h5></a>
                                    <p class="card-text"><spring:message code="label.ram.capacity"/>: ${ram.capacity} <spring:message code="label.values.gbait"/>,
                                        <spring:message code="label.ram.freq"/>: ${ram.freq} <spring:message code="label.values.mherz"/>, <spring:message code="label.ram.modules"/>: ${ram.moduleSet},
                                        <spring:message code="label.ram.type"/>: ${ram.type}</p>
                                    <h5 class="btn btn-warning">${ram.price} <spring:message
                                            code="label.currency.byn"/></h5>
                                    <c:if test="${sessionScope.get('computer_id') ne null}">
                                        <form action="/config/computer/${sessionScope.get('computer_id')}/ram/${ram.id}/add"
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
