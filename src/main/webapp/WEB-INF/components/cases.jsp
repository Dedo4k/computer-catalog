<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title><spring:message code="label.components.cases"/></title>
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
    String[] types = request.getParameterValues("type");
    String[] colr = request.getParameterValues("colour");
    String[] mat = request.getParameterValues("material");
    String[] sct = request.getParameterValues("section");
    String[] minWs = request.getParameterValues("min_width");
    String[] maxWs = request.getParameterValues("max_width");
    String minW = null;
    String maxW = null;
    String[] minHs = request.getParameterValues("min_height");
    String[] maxHs = request.getParameterValues("max_height");
    String minH = null;
    String maxH = null;
    String[] minDs = request.getParameterValues("min_depth");
    String[] maxDs = request.getParameterValues("max_depth");
    String minD = null;
    String maxD = null;
    String[] minWes = request.getParameterValues("min_weight");
    String[] maxWes = request.getParameterValues("max_weight");
    String minWe = null;
    String maxWe = null;
    if (prod != null) {
        pageContext.setAttribute("prod", Arrays.asList(prod));
    }
    if (types != null) {
        pageContext.setAttribute("types", Arrays.asList(types));
    }
    if (colr != null) {
        pageContext.setAttribute("colr", Arrays.asList(colr));
    }
    if (mat != null) {
        pageContext.setAttribute("mat", Arrays.asList(mat));
    }
    if (sct != null) {
        pageContext.setAttribute("sct", Arrays.asList(sct));
    }
    if (minWs == null || minWs[0].equals("")) {
        minW = "";
    } else {
        minW = minWs[0];
    }
    if (maxWs == null || maxWs[0].equals("")) {
        maxW = "";
    } else {
        maxW = maxWs[0];
    }
    pageContext.setAttribute("minW", minW);
    pageContext.setAttribute("maxW", maxW);
    if (minHs == null || minHs[0].equals("")) {
        minH = "";
    } else {
        minH = minHs[0];
    }
    if (maxHs == null || maxHs[0].equals("")) {
        maxH = "";
    } else {
        maxH = maxHs[0];
    }
    pageContext.setAttribute("minH", minH);
    pageContext.setAttribute("maxH", maxH);
    if (minDs == null || minDs[0].equals("")) {
        minD = "";
    } else {
        minD = minDs[0];
    }
    if (maxDs == null || maxDs[0].equals("")) {
        maxD = "";
    } else {
        maxD = maxDs[0];
    }
    pageContext.setAttribute("minD", minD);
    pageContext.setAttribute("maxD", maxD);
    if (minWes == null || minWes[0].equals("")) {
        minWe = "";
    } else {
        minWe = minWes[0];
    }
    if (maxWes == null || maxWes[0].equals("")) {
        maxWe = "";
    } else {
        maxWe = maxWes[0];
    }
    pageContext.setAttribute("minWe", minWe);
    pageContext.setAttribute("maxWe", maxWe);
%>
<div class="container align-items-center mt-5">
    <div class="row">
        <div class="filter col-3">
            <div class="card m-4">
                <form action="/catalog/cases/filter" method="get">

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
                            <h6 class="title"><spring:message code="label.case.casetype"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <c:forEach items="${types_set}" var="type">
                                    <label class="form-check">
                                        <c:if test="${types.contains(type)}">
                                            <input class="form-check-input" type="checkbox" name="type"
                                                   value="${type}"
                                                   checked>
                                        </c:if>
                                        <c:if test="${!types.contains(type)}">
                                            <input class="form-check-input" type="checkbox" name="type"
                                                   value="${type}">
                                        </c:if>
                                        <span class="form-check-label">
                                                ${type}
                                        </span>
                                    </label>
                                </c:forEach>
                            </div>
                        </div>
                    </article>

                    <article class="card-group-item">
                        <header class="card-header">
                            <h6 class="title"><spring:message code="label.case.colour"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <c:forEach items="${colours_set}" var="colour">
                                    <label class="form-check">
                                        <c:if test="${colr.contains(colour)}">
                                            <input class="form-check-input" type="checkbox" name="colour"
                                                   value="${colour}"
                                                   checked>
                                        </c:if>
                                        <c:if test="${!colr.contains(colour)}">
                                            <input class="form-check-input" type="checkbox" name="colour"
                                                   value="${colour}">
                                        </c:if>
                                        <span class="form-check-label">
                                                ${colour}
                                        </span>
                                    </label>
                                </c:forEach>
                            </div>
                        </div>
                    </article>

                    <article class="card-group-item">
                        <header class="card-header">
                            <h6 class="title"><spring:message code="label.case.material"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <c:forEach items="${materials_set}" var="material">
                                    <label class="form-check">
                                        <c:if test="${mat.contains(material)}">
                                            <input class="form-check-input" type="checkbox" name="material"
                                                   value="${material}"
                                                   checked>
                                        </c:if>
                                        <c:if test="${!mat.contains(material)}">
                                            <input class="form-check-input" type="checkbox" name="material"
                                                   value="${material}">
                                        </c:if>
                                        <span class="form-check-label">
                                                ${material}
                                        </span>
                                    </label>
                                </c:forEach>
                            </div>
                        </div>
                    </article>

                    <article class="card-group-item">
                        <header class="card-header">
                            <h6 class="title"><spring:message code="label.case.sectionnumber"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <c:forEach items="${sections_set}" var="section">
                                    <label class="form-check">
                                        <c:if test="${sct.contains(section.toString())}">
                                            <input class="form-check-input" type="checkbox" name="section"
                                                   value="${section}"
                                                   checked>
                                        </c:if>
                                        <c:if test="${!sct.contains(section.toString())}">
                                            <input class="form-check-input" type="checkbox" name="section"
                                                   value="${section}">
                                        </c:if>
                                        <span class="form-check-label">
                                                ${section}
                                        </span>
                                    </label>
                                </c:forEach>
                            </div>
                        </div>
                    </article>

                    <article class="card-group-item">
                        <header class="card-header">
                            <h6 class="title"><spring:message code="label.case.width"/>, <spring:message
                                    code="label.values.milim"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <div class="row">
                                    <label class="col-5">
                                        <input type="text" name="min_width" placeholder="Min" class="w-100"
                                               value="${minW}">
                                    </label>
                                    <span class="col-2">
                                        &#8212
                                    </span>
                                    <label class="col-5">
                                        <input type="text" name="max_width" placeholder="Max" class="w-100"
                                               value="${maxW}">
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
                            <h6 class="title"><spring:message code="label.case.height"/>, <spring:message
                                    code="label.values.milim"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <div class="row">
                                    <label class="col-5">
                                        <input type="text" name="min_height" placeholder="Min" class="w-100"
                                               value="${minH}">
                                    </label>
                                    <span class="col-2">
                                        &#8212
                                    </span>
                                    <label class="col-5">
                                        <input type="text" name="max_height" placeholder="Max" class="w-100"
                                               value="${maxH}">
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
                            <h6 class="title"><spring:message code="label.case.depth"/>, <spring:message
                                    code="label.values.milim"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <div class="row">
                                    <label class="col-5">
                                        <input type="text" name="min_depth" placeholder="Min" class="w-100"
                                               value="${minD}">
                                    </label>
                                    <span class="col-2">
                                        &#8212
                                    </span>
                                    <label class="col-5">
                                        <input type="text" name="max_depth" placeholder="Max" class="w-100"
                                               value="${maxD}">
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
                            <h6 class="title"><spring:message code="label.case.weight"/>, <spring:message
                                    code="label.values.kilog"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <div class="row">
                                    <label class="col-5">
                                        <input type="text" name="min_weight" placeholder="Min" class="w-100"
                                               value="${minWe}">
                                    </label>
                                    <span class="col-2">
                                        &#8212
                                    </span>
                                    <label class="col-5">
                                        <input type="text" name="max_weight" placeholder="Max" class="w-100"
                                               value="${maxWe}">
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
            <c:forEach items="${cases}" var="ccase">
                <div class="row">
                    <div class="card m-4">
                        <div class="row">
                            <c:if test="${ccase.image == null}">
                                <div class="col-3">
                                    <img src="<c:url value="/img/case.jpg"/>" class="w-100" alt="case"/>
                                </div>
                            </c:if>
                            <c:if test="${ccase.image != null}">
                                <div class="col-3">
                                    <img src="<c:url value="data:image/png;base64,${ccase.encodeImage}"/>" style="max-height: 463px;" class="w-auto" alt="case"/>
                                </div>
                            </c:if>
                            <div class="col-9">
                                <div class="card-body">
                                    <a href="/catalog/ccase/${ccase.id}" class="text-decoration-none"><h5
                                            class="card-title">${ccase.toString()}</h5></a>
                                    <p class="card-text"><spring:message code="label.case.casetype"/>: ${ccase.caseType},
                                        <spring:message code="label.case.material"/>: ${ccase.material}, <spring:message
                                                code="label.case.colour"/>: ${ccase.colour}, <spring:message
                                                code="label.case.sectionnumber"/>: ${ccase.sectionNumber},
                                        <spring:message
                                                code="label.case.commother"/>: ${ccase.compatible_motherboards} </p>
                                    <h5 class="btn btn-warning">${ccase.price} <spring:message
                                            code="label.currency.byn"/></h5>
                                    <c:if test="${sessionScope.get('computer_id') ne null}">
                                        <form action="/config/computer/${sessionScope.get('computer_id')}/ccase/${ccase.id}/add"
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
