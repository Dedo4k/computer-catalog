<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>VVAA</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="<c:url value="/css/styles.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/bootstrap.css"/>">
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

<%--<c:if test="${cookie['org.springframework.web.servlet.i18n.CookieLocaleResolver.LOCALE'].value eq 'ru'}">--%>
<%--    <h1 class="mt-5">Russian</h1>--%>
<%--</c:if>--%>
<%--<c:if test="${cookie['org.springframework.web.servlet.i18n.CookieLocaleResolver.LOCALE'].value eq 'en'}">--%>
<%--    <h1 class="mt-5">English</h1>--%>
<%--</c:if>--%>
<div class="container align-items-center mt-5">
    <table class="table table-bordered table-striped table-hover align-middle">
        <caption class="caption-top text-center mt-5"><h2>User information</h2></caption>
        <tbody>
        <tr>
            <td><spring:message code="label.user.firstname"/></td>
            <td>${user.firstName}</td>
        </tr>
        <tr>
            <td><spring:message code="label.user.lastname"/></td>
            <td>${user.lastName}</td>
        </tr>
        <tr>
            <td><spring:message code="label.user.email"/></td>
            <td>${user.email}</td>
        </tr>
        <tr>
            <td><spring:message code="label.user.role"/></td>
            <td>${user.role}</td>
        </tr>
        </tbody>
    </table>
    <c:if test="${user.id eq user_id}">
        <form action="/user/${user.id}/edit" method="get">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <button class="btn btn-primary" type="submit"><spring:message code="label.actions.edit"/></button>
        </form>
    </c:if>
</div>

<div class="container align-items-center mt-5">
    <c:if test="${!user.reviews.isEmpty()}">
        <c:forEach items="${user.reviews}" var="review">
            <div class="card mt-1">
                <div class="card-header">
                    <div class="row">
                        <h3 class="col-11">${review.component.toString()}</h3>
                        <form action="/catalog/ccase/${ccase.id}/comment/${review.id}" method="post"
                              class="col-1">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <sec:authorize access="hasAuthority('ADMIN')">
                                <button class="btn btn-primary" type="submit" style="float: right;">Delete</button>
                            </sec:authorize>
                            <sec:authorize access="hasAuthority('USER')">
                                <sec:authentication property="principal.id" var="user_id"/>
                                <c:if test="${review.user.id eq user_id}">
                                    <button class="btn btn-primary" type="submit" style="float: right;">Delete</button>
                                </c:if>
                            </sec:authorize>
                        </form>
                    </div>
                </div>
                <div class="card-body">
                    <p>${review.text}</p>
                </div>
            </div>
        </c:forEach>
    </c:if>
</div>

</body>
</html>
