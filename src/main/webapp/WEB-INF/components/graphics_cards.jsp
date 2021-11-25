<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title><spring:message code="label.components.graphiccards"/></title>
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
    String[] gpu_mdl = request.getParameterValues("gpu_model");
    String[] gpu_prod = request.getParameterValues("gpu_producer");
    String[] video_mem = request.getParameterValues("video_memory");
    String[] gpu_int = request.getParameterValues("gpu_interface");
    String[] video_mem_type = request.getParameterValues("video_memory_type");
    String[] minLengths = request.getParameterValues("min_length");
    String[] maxLengths = request.getParameterValues("max_length");
    String minLength = null;
    String maxLength = null;
    String[] minHeights = request.getParameterValues("min_height");
    String[] maxHeights = request.getParameterValues("max_height");
    String minHeight = null;
    String maxHeight = null;
    if (prod != null) {
        pageContext.setAttribute("prod", Arrays.asList(prod));
    }
    if (gpu_mdl != null) {
        pageContext.setAttribute("gpu_mdl", Arrays.asList(gpu_mdl));
    }
    if (gpu_prod != null) {
        pageContext.setAttribute("gpu_prod", Arrays.asList(gpu_prod));
    }
    if (gpu_int != null) {
        pageContext.setAttribute("gpu_int", Arrays.asList(gpu_int));
    }
    if (video_mem != null) {
        pageContext.setAttribute("video_mem", Arrays.asList(video_mem));
    }
    if (video_mem_type != null) {
        pageContext.setAttribute("video_mem_type", Arrays.asList(video_mem_type));
    }
    if (minLengths == null || minLengths[0].equals("")) {
        minLength = "";
    } else {
        minLength = minLengths[0];
    }
    if (maxLengths == null || maxLengths[0].equals("")) {
        maxLength = "";
    } else {
        maxLength = maxLengths[0];
    }
    pageContext.setAttribute("minLength", minLength);
    pageContext.setAttribute("maxLength", maxLength);
    if (minHeights == null || minHeights[0].equals("")) {
        minHeight = "";
    } else {
        minHeight = minHeights[0];
    }
    if (maxHeights == null || maxHeights[0].equals("")) {
        maxHeight = "";
    } else {
        maxHeight = maxHeights[0];
    }
    pageContext.setAttribute("minHeight", minHeight);
    pageContext.setAttribute("maxHeight", maxHeight);
%>
<div class="container align-items-center mt-5">

    <div class="row">
        <div class="filter col-3">
            <div class="card m-4">
                <form action="/catalog/graphics_cards/filter" method="get">

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
                            <h6 class="title"><spring:message code="label.graphics.gpumodel"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <c:forEach items="${gpu_models_set}" var="gpu_model">
                                    <label class="form-check">
                                        <c:if test="${gpu_mdl.contains(gpu_model)}">
                                            <input class="form-check-input" type="checkbox" name="gpu_model" value="${gpu_model}"
                                                   checked>
                                        </c:if>
                                        <c:if test="${!gpu_mdl.contains(gpu_model)}">
                                            <input class="form-check-input" type="checkbox" name="gpu_model" value="${gpu_model}">
                                        </c:if>
                                        <span class="form-check-label">
                                                ${gpu_model}
                                        </span>
                                    </label>
                                </c:forEach>
                            </div>
                        </div>
                    </article>

                    <article class="card-group-item">
                        <header class="card-header">
                            <h6 class="title"><spring:message code="label.graphics.gpuproducer"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <c:forEach items="${gpu_producers_set}" var="gpu_producer">
                                    <label class="form-check">
                                        <c:if test="${gpu_prod.contains(gpu_producer)}">
                                            <input class="form-check-input" type="checkbox" name="gpu_producer"
                                                   value="${gpu_producer}"
                                                   checked>
                                        </c:if>
                                        <c:if test="${!gpu_prod.contains(gpu_producer)}">
                                            <input class="form-check-input" type="checkbox" name="gpu_producer"
                                                   value="${gpu_producer}">
                                        </c:if>
                                        <span class="form-check-label">
                                                ${gpu_producer}
                                        </span>
                                    </label>
                                </c:forEach>
                            </div>
                        </div>
                    </article>

                    <article class="card-group-item">
                        <header class="card-header">
                            <h6 class="title"><spring:message code="label.graphics.gpuinterface"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <c:forEach items="${gpu_interfaces_set}" var="gpu_interface">
                                    <label class="form-check">
                                        <c:if test="${gpu_int.contains(gpu_interface)}">
                                            <input class="form-check-input" type="checkbox" name="gpu_interface"
                                                   value="${gpu_interface}"
                                                   checked>
                                        </c:if>
                                        <c:if test="${!gpu_int.contains(gpu_interface)}">
                                            <input class="form-check-input" type="checkbox" name="gpu_interface"
                                                   value="${gpu_interface}">
                                        </c:if>
                                        <span class="form-check-label">
                                                ${gpu_interface}
                                        </span>
                                    </label>
                                </c:forEach>
                            </div>
                        </div>
                    </article>

                    <article class="card-group-item">
                        <header class="card-header">
                            <h6 class="title"><spring:message code="label.graphics.videomemory"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <c:forEach items="${video_memories_set}" var="video_memory">
                                    <label class="form-check">
                                        <c:if test="${video_mem.contains(video_memory.toString())}">
                                            <input class="form-check-input" type="checkbox" name="video_memory"
                                                   value="${video_memory}"
                                                   checked>
                                        </c:if>
                                        <c:if test="${!video_mem.contains(video_memory.toString())}">
                                            <input class="form-check-input" type="checkbox" name="video_memory"
                                                   value="${video_memory}">
                                        </c:if>
                                        <span class="form-check-label">
                                                ${video_memory}
                                        </span>
                                    </label>
                                </c:forEach>
                            </div>
                        </div>
                    </article>

                    <article class="card-group-item">
                        <header class="card-header">
                            <h6 class="title"><spring:message code="label.graphics.videomemorytype"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <c:forEach items="${video_memories_types_set}" var="video_memory_type">
                                    <label class="form-check">
                                        <c:if test="${video_mem_type.contains(video_memory_type)}">
                                            <input class="form-check-input" type="checkbox" name="video_memory_type"
                                                   value="${video_memory_type}"
                                                   checked>
                                        </c:if>
                                        <c:if test="${!video_mem_type.contains(video_memory_type)}">
                                            <input class="form-check-input" type="checkbox" name="video_memory_type"
                                                   value="${video_memory_type}">
                                        </c:if>
                                        <span class="form-check-label">
                                                ${video_memory_type}
                                        </span>
                                    </label>
                                </c:forEach>
                            </div>
                        </div>
                    </article>

                    <article class="card-group-item">
                        <header class="card-header">
                            <h6 class="title"><spring:message code="label.graphics.length"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <div class="row">
                                    <label class="col-5">
                                        <input type="text" name="min_length" placeholder="Min" class="w-100" value="${minLength}">
                                    </label>
                                    <span class="col-2">
                                        &#8212
                                    </span>
                                    <label class="col-5">
                                        <input type="text" name="max_length" placeholder="Max" class="w-100" value="${maxLength}">
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
                            <h6 class="title"><spring:message code="label.graphics.height"/></h6>
                        </header>
                        <div class="filter-content">
                            <div class="card-body">
                                <div class="row">
                                    <label class="col-5">
                                        <input type="text" name="min_height" placeholder="Min" class="w-100" value="${minHeight}">
                                    </label>
                                    <span class="col-2">
                                        &#8212
                                    </span>
                                    <label class="col-5">
                                        <input type="text" name="max_height" placeholder="Max" class="w-100" value="${maxHeight}">
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
            <c:forEach items="${graphics_cards}" var="graphics_card">
                <div class="row">
                    <div class="card m-4">
                        <div class="row">
                            <div class="col-3">
                                <img class="card-img-top" src="<c:url value="/img/graphics.jpg"/>" alt="processor">
                            </div>
                            <div class="col-9">
                                <div class="card-body">
                                    <a href="/catalog/graphics_card/${graphics_card.id}" class="text-decoration-none">
                                        <h5
                                                class="card-title">${graphics_card.toString()}</h5></a>
                                    <p class="card-text">${graphics_card.info()}</p>
                                    <h5 class="btn btn-warning">${graphics_card.price} <spring:message
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
