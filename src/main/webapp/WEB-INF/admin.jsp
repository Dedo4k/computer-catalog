<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>VVAA (ADMIN)</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="<c:url value="/css/styles.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/bootstrap.css"/>">
    <script src="<c:url value="/js/bootstrap.js"/>"></script>
    <script src="<c:url value="/js/script.js"/>"></script>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="<c:url value="/main"/>">VVAA (ADMIN)</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#main_nav"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="main_nav">
            <ul class="navbar-nav">
                <li class="nav-item active"><a class="nav-link" href="<c:url value="/main"/>"><spring:message
                        code="label.page.home"/></a></li>
                <li class="nav-item"><a class="nav-link" href="<c:url value="/catalog"/>"><spring:message
                        code="label.page.catalog"/></a></li>
                <li class="nav-item"><a class="nav-link" href="<c:url value="/config"/>"><spring:message
                        code="label.page.config"/></a></li>
                <li class="nav-item"><a class="nav-link" href="<c:url value="?lang=en"/>"><spring:message
                        code="label.lang.en"/></a></li>
                <li class="nav-item"><a class="nav-link" href="<c:url value="?lang=ru"/>"><spring:message
                        code="label.lang.ru"/></a></li>
                <li class="nav-item dropdown" id="myDropdown">
                    <sec:authorize access="isAuthenticated()">
                        <a class="nav-link dropdown-toggle" href="" data-bs-toggle="dropdown"
                           style="float: right"><sec:authentication property="principal.firstName"/> <sec:authentication
                                property="principal.lastName"/></a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="<c:url value=""/>"><spring:message
                                    code="label.page.account"/></a></li>
                            <sec:authorize access="hasAuthority('ADMIN')">
                                <li><a class="dropdown-item" href="<c:url value=""/>"><spring:message
                                        code="label.page.settings"/></a></li>
                            </sec:authorize>
                            <li>
                                <form action="<c:url value="/logout"/>" method="post">
                                    <a class="dropdown-item" href="<c:url value="/logout"/>"><spring:message
                                            code="label.auth.signout"/></a>
                                </form>
                            </li>
                        </ul>
                    </sec:authorize>
                    <sec:authorize access="!isAuthenticated()">
                        <a class="nav-link dropdown-toggle" href="" data-bs-toggle="dropdown"
                           style="float: right"><spring:message code="label.page.profile"/></a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="<c:url value="/sign-in"/>"><spring:message
                                    code="label.auth.signin"/></a></li>
                            <li><a class="dropdown-item" href="<c:url value="/sign-up"/>"><spring:message
                                    code="label.auth.signup"/></a></li>
                        </ul>
                    </sec:authorize>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container align-items-center mt-5">
    <table class="table table-bordered table-striped table-hover align-middle mt-5">
        <caption class="caption-top text-center"><h1>Admins</h1></caption>
        <a href="<c:url value="/admin/add"/>" class="btn btn-primary">New admin</a>
        <thead>
            <tr>
                <td><spring:message code="label.user.id"/></td>
                <td><spring:message code="label.user.firstname"/></td>
                <td><spring:message code="label.user.lastname"/></td>
                <td><spring:message code="label.user.email"/></td>
                <td><spring:message code="label.user.role"/></td>
                <td><spring:message code="label.user.status"/></td>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${admins}" var="admin">
                <tr>
                    <td>${admin.id}</td>
                    <td>${admin.firstName}</td>
                    <td>${admin.lastName}</td>
                    <td>${admin.email}</td>
                    <td>${admin.role}</td>
                    <td>${admin.active}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <table class="table table-bordered table-striped table-hover align-middle mt-5">
        <caption class="caption-top text-center"><h1>Users</h1></caption>
        <thead>
            <tr>
                <td><spring:message code="label.user.id"/></td>
                <td><spring:message code="label.user.firstname"/></td>
                <td><spring:message code="label.user.lastname"/></td>
                <td><spring:message code="label.user.email"/></td>
                <td><spring:message code="label.user.role"/></td>
                <td><spring:message code="label.user.status"/></td>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.firstName}</td>
                    <td>${user.lastName}</td>
                    <td>${user.email}</td>
                    <td>${user.role}</td>
                    <td>
                        <div class="row align-items-center">
                            <div class="col-auto">
                                ${user.active}
                            </div>
                            <div class="col-auto">
                                <form action="<c:url value="/admin/change_status/${user.id}"/>" method="post">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <button class="btn btn-primary" type="submit">Change</button>
                                </form>
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
