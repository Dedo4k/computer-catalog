<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title><spring:message code="label.page.catalog"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="<c:url value="/css/styles.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/bootstrap.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/catalog.css"/>">
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
                <li class="nav-item active"><a class="nav-link" href="<c:url value="/main"/>"><spring:message
                        code="label.page.home"/></a></li>
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

<div class="container align-items-center mt-5">
    <div class="row">
        <div class="card col-3 m-4">
            <img class="card-img-top" src="<c:url value="/img/processors.jpg"/>" alt="processors">
            <div class="card-body">
                <a href="<c:url value="/catalog/processors"/>" class="btn btn-primary align-bottom"><spring:message
                        code="label.components.processors"/></a>
            </div>
        </div>
        <div class="card col-3 m-4">
            <img class="card-img-top" src="<c:url value="/img/graphics.jpg"/>" alt="graphic cards">
            <div class="card-body">
                <a href="<c:url value="/catalog/graphics_cards"/>" class="btn btn-primary"><spring:message
                        code="label.components.graphiccards"/> </a>
            </div>
        </div>
        <div class="card col-3 m-4">
            <img class="card-img-top" src="<c:url value="/img/mother_board.jpg"/>" alt="mother board">
            <div class="card-body">
                <a href="<c:url value="/catalog/mother_boards"/>" class="btn btn-primary"><spring:message
                        code="label.components.motherboards"/> </a>
            </div>
        </div>
        <div class="card col-3 m-4">
            <img class="card-img-top" src="<c:url value="/img/ram.jpg"/>" alt="ram">
            <div class="card-body">
                <a href="<c:url value="/catalog/rams"/>" class="btn btn-primary"><spring:message
                        code="label.components.rams"/> </a>
            </div>
        </div>

        <div class="card col-3 m-4">
            <img class="card-img-top" src="<c:url value="/img/ssd.jpg"/>" alt="ssd">
            <div class="card-body">
                <a href="<c:url value="/catalog/ssds"/>" class="btn btn-primary"><spring:message
                        code="label.components.ssds"/> </a>
            </div>
        </div>
        <div class="card col-3 m-4">
            <img class="card-img-top" src="<c:url value="/img/hdd.jpg"/>" alt="hdd">
            <div class="card-body">
                <a href="<c:url value="/catalog/hdds"/>" class="btn btn-primary"><spring:message
                        code="label.components.hdds"/> </a>
            </div>
        </div>
        <div class="card col-3 m-4">
            <img class="card-img-top" src="<c:url value="/img/power.jpg"/>" alt="power">
            <div class="card-body">
                <a href="<c:url value="/catalog/power_units"/>" class="btn btn-primary"><spring:message
                        code="label.components.powerunits"/> </a>
            </div>
        </div>
        <div class="card col-3 m-4">
            <img class="card-img-top" src="<c:url value="/img/case.jpg"/>" alt="case">
            <div class="card-body">
                <a href="<c:url value="/catalog/cases"/>" class="btn btn-primary"><spring:message
                        code="label.components.cases"/> </a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
