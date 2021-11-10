<%@ page import="iipu.shop.model.component.Processor" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>${processor.toString()}</title>
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
                <li class="nav-item active"><a class="nav-link"
                                               href="<c:url value="/catalog/processors"/>"><spring:message
                        code="label.components.processors"/></a></li>
                <li class="nav-item"><a class="nav-link" href="<c:url value="?lang=en"/>"><spring:message
                        code="label.lang.en"/></a></li>
                <li class="nav-item"><a class="nav-link" href="<c:url value="?lang=ru"/>"><spring:message
                        code="label.lang.ru"/></a></li>
                <li class="nav-item dropdown" id="myDropdown">
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
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container align-items-center mt-5">
    <div class="row pt-5">
        <div class="col-4">
            <img src="<c:url value="/img/processors.jpg"/>" alt="processor">
        </div>
        <div class="col-8">
            <p>${processor.producer} ${processor.core}-${processor.model}</p>
            <p>${processor.socket}, ${processor.minFreq}/${processor.maxFreq}</p>
            <h5 class="btn btn-warning">${processor.price} <spring:message code="label.currency.byn"/></h5>
        </div>
    </div>
    <table class="table table-bordered align-middle mt-5">
        <caption class="caption-top text-center"><spring:message code="label.component.description"/></caption>
        <tbody>
            <tr>
                <td class="w-50"><spring:message code="label.component.producer"/></td>
                <td class="w-50">${processor.producer}</td>
            </tr>
            <tr>
                <td><spring:message code="label.processor.core"/></td>
                <td>${processor.core}</td>
            </tr>
            <tr>
                <td><spring:message code="label.processor.socket"/></td>
                <td>${processor.socket}</td>
            </tr>
            <tr>
                <td><spring:message code="label.processor.minfreq"/></td>
                <td>${processor.minFreq}</td>
            </tr>
            <tr>
                <td><spring:message code="label.processor.maxfreq"/></td>
                <td>${processor.maxFreq}</td>
            </tr>
        </tbody>
    </table>
</div>

<div class="container align-items-center mt-5">
    <form action="<c:url value="/catalog/processor/${processor.id}/comment"/>" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label">Leave your comment</label>
            <textarea class="form-control" name="message" id="exampleFormControlTextarea1" rows="3"></textarea>
        </div>
        <button class="btn btn-primary btn-lg btn-block" type="submit">Comment</button>
    </form>

    <hr class="w-100">

    <c:if test="${!processor.reviews.isEmpty()}">
        <c:forEach items="${processor.reviews}" var="review">
            <div class="card">
                <h3 class="card-header">${review.user.firstName} ${review.user.lastName}</h3>
                <div class="card-body">
                    <p>${review.text}</p>
                </div>
            </div>
        </c:forEach>
    </c:if>
</div>

</body>
</html>
