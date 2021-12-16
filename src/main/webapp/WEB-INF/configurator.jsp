<%@ page import="com.mysql.cj.xdevapi.Collection" %>
<%@ page import="org.hibernate.engine.internal.Collections" %>
<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title><spring:message code="label.page.config"/></title>
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

<div class="container align-items-center mt-5 pt-3">
    <div class="row align-middle align-items-center">
        <h1 class="col-9">Press NEW to create a configuration</h1>
        <form action="<c:url value="/config/computer/new"/>" class="col-3" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <div class="row align-items-center align-middle">
                <label class="col-8">
                    <input type="text" name="title" placeholder="Config title" required>
                </label>
                <button class="btn btn-success col-4">New</button>
            </div>
        </form>
    </div>
    <c:if test="${computers.size() != 0}">
        <h1>My configurations</h1>
    </c:if>
    <c:if test="${computers.size() == 0}">
        <h1 class="justify-content-center align-middle">You don't have any configurations</h1>
    </c:if>
    <c:forEach items="${computers}" var="computer">
        <div class="row">
            <div class="card mt-1">
                <div class="card-body">
                    <div class="row">
                        <div class="col-8">
                            <h1><a href="/config/computer/${computer.id}" class="text-decoration-none"><h5
                                    class="card-title">${computer.title}</h5></a></h1>
                        </div>
                        <div class="col-2">
                            <h5 class="btn btn-warning w-100">${computer.totalPrice} <spring:message
                                    code="label.currency.byn"/></h5>
                        </div>
                        <div class="col-1">
                            <form action="/config/computer/${computer.id}/edit" method="get">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="submit" class="btn btn-primary w-100" value="Edit">
                            </form>
                        </div>
                        <div class="col-1">
                            <form action="/config/computer/${computer.id}/delete" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="submit" class="btn btn-danger w-100" value="Delete">
                            </form>
                        </div>
                    </div>
                    <p class="card-text">${computer.processor.toString()}, ${computer.graphicsCard.toString()},
                            ${computer.motherBoard.toString()}, ${computer.hdd.toString()}, ${computer.ssd.toString()},
                            ${computer.ram.toString()}, ${computer.powerUnit.toString()}, ${computer.computerCase.toString()}
                    </p>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
</body>
</html>
