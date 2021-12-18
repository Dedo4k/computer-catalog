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
<div class="container align-items-center mt-5" style="min-height: 77.6vh;" >
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
<footer class="bg-primary text-center text-white mt-5 w-100" style="background-color: #f1f1f1;">
    <div class="container pt-1">

        <section class="mb-1">

            <a
                    class="btn btn-link btn-floating btn-lg text-dark m-1"
                    href="https://github.com/Dedo4k"
                    role="button"
                    data-mdb-ripple-color="dark"
            >
                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-github"
                     viewBox="0 0 16 16">
                    <path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.012 8.012 0 0 0 16 8c0-4.42-3.58-8-8-8z"/>
                </svg>
            </a>

            <a
                    class="btn btn-link btn-floating btn-lg text-dark m-1"
                    href="https://www.linkedin.com/in/vlad-lailo-264597217"
                    role="button"
                    data-mdb-ripple-color="dark"
            >
                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor"
                     class="bi bi-linkedin" viewBox="0 0 16 16">
                    <path d="M0 1.146C0 .513.526 0 1.175 0h13.65C15.474 0 16 .513 16 1.146v13.708c0 .633-.526 1.146-1.175 1.146H1.175C.526 16 0 15.487 0 14.854V1.146zm4.943 12.248V6.169H2.542v7.225h2.401zm-1.2-8.212c.837 0 1.358-.554 1.358-1.248-.015-.709-.52-1.248-1.342-1.248-.822 0-1.359.54-1.359 1.248 0 .694.521 1.248 1.327 1.248h.016zm4.908 8.212V9.359c0-.216.016-.432.08-.586.173-.431.568-.878 1.232-.878.869 0 1.216.662 1.216 1.634v3.865h2.401V9.25c0-2.22-1.184-3.252-2.764-3.252-1.274 0-1.845.7-2.165 1.193v.025h-.016a5.54 5.54 0 0 1 .016-.025V6.169h-2.4c.03.678 0 7.225 0 7.225h2.4z"/>
                </svg>
            </a>

            <a
                    class="btn btn-link btn-floating btn-lg text-dark m-1"
                    href="https://t.me/Dedo4k"
                    role="button"
                    data-mdb-ripple-color="dark"
            >
                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor"
                     class="bi bi-telegram" viewBox="0 0 16 16">
                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.287 5.906c-.778.324-2.334.994-4.666 2.01-.378.15-.577.298-.595.442-.03.243.275.339.69.47l.175.055c.408.133.958.288 1.243.294.26.006.549-.1.868-.32 2.179-1.471 3.304-2.214 3.374-2.23.05-.012.12-.026.166.016.047.041.042.12.037.141-.03.129-1.227 1.241-1.846 1.817-.193.18-.33.307-.358.336a8.154 8.154 0 0 1-.188.186c-.38.366-.664.64.015 1.088.327.216.589.393.85.571.284.194.568.387.936.629.093.06.183.125.27.187.331.236.63.448.997.414.214-.02.435-.22.547-.82.265-1.417.786-4.486.906-5.751a1.426 1.426 0 0 0-.013-.315.337.337 0 0 0-.114-.217.526.526 0 0 0-.31-.093c-.3.005-.763.166-2.984 1.09z"/>
                </svg>
            </a>

        </section>

    </div>


    <div class="text-center text-white p-3" style="background-color: rgba(0, 0, 0, 0.2);">
        Powered By: Vlad Lailo
    </div>

</footer>
</body>
</html>
