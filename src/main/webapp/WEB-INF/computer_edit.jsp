<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Computer edit</title>
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
                <li class="nav-item active"><a class="nav-link" href="<c:url value="/config"/>"><spring:message
                        code="label.page.config"/></a></li>
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
<div class="container w-100">
<div class="container align-items-center mt-5 pt-3">
    <h1>Computer ${computer.title}</h1>
    <div class="row">
        <c:if test="${computer.processor == null}">
            <c:set var="computer_id" value="${computer.id}" scope="session"/>
            <div class="card col-3 m-4">
                <div class="h-75">
                    <img class="card-img-top w-100" src="<c:url value="/img/processors.jpg"/>" alt="processors">
                </div>
                <div class="card-body h-25">
                    <a href="<c:url value="/catalog/processors"/>"
                       class="btn btn-primary align-bottom w-100"><spring:message
                            code="label.components.processors"/></a>
                </div>
            </div>
        </c:if>
        <c:if test="${computer.graphicsCard == null}">
            <c:set var="computer_id" value="${computer.id}" scope="session"/>
            <div class="card col-3 m-4">
                <div class="h-75">
                    <img class="card-img-top w-100" src="<c:url value="/img/graphics.jpg"/>" alt="graphic cards">
                </div>
                <div class="card-body h-25">
                    <a href="<c:url value="/catalog/graphics_cards"/>" class="btn btn-primary w-100"><spring:message
                            code="label.components.graphiccards"/> </a>
                </div>
            </div>
        </c:if>
        <c:if test="${computer.motherBoard == null}">
            <c:set var="computer_id" value="${computer.id}" scope="session"/>
            <div class="card col-3 m-4">
                <div class="h-75">
                    <img class="card-img-top w-100" src="<c:url value="/img/mother_board.jpg"/>" alt="mother board">
                </div>
                <div class="card-body h-25">
                    <a href="<c:url value="/catalog/mother_boards"/>" class="btn btn-primary w-100"><spring:message
                            code="label.components.motherboards"/> </a>
                </div>
            </div>
        </c:if>
        <c:if test="${computer.ram == null}">
            <c:set var="computer_id" value="${computer.id}" scope="session"/>
            <div class="card col-3 m-4">
                <div class="h-75">
                    <img class="card-img-top w-100" src="<c:url value="/img/ram.jpg"/>" alt="ram">
                </div>
                <div class="card-body h-25">
                    <a href="<c:url value="/catalog/rams"/>" class="btn btn-primary w-100"><spring:message
                            code="label.components.rams"/></a>
                </div>
            </div>
        </c:if>
        <c:if test="${computer.ssd == null}">
            <c:set var="computer_id" value="${computer.id}" scope="session"/>
            <div class="card col-3 m-4">
                <div class="h-75">
                    <img class="card-img-top w-100" src="<c:url value="/img/ssd.jpg"/>" alt="ssd">
                </div>
                <div class="card-body h-25">
                    <a href="<c:url value="/catalog/ssds"/>" class="btn btn-primary w-100"><spring:message
                            code="label.components.ssds"/> </a>
                </div>
            </div>
        </c:if>
        <c:if test="${computer.hdd == null}">
            <c:set var="computer_id" value="${computer.id}" scope="session"/>
            <div class="card col-3 m-4">
                <div class="h-75">
                    <img class="card-img-top w-100" src="<c:url value="/img/hdd.jpg"/>" alt="hdd">
                </div>
                <div class="card-body h-25">
                    <a href="<c:url value="/catalog/hdds"/>" class="btn btn-primary w-100"><spring:message
                            code="label.components.hdds"/> </a>
                </div>
            </div>
        </c:if>
        <c:if test="${computer.powerUnit == null}">
            <c:set var="computer_id" value="${computer.id}" scope="session"/>
            <div class="card col-3 m-4">
                <div class="h-75">
                    <img class="card-img-top w-100" src="<c:url value="/img/power.jpg"/>" alt="power">
                </div>
                <div class="card-body h-25">
                    <a href="<c:url value="/catalog/power_units"/>" class="btn btn-primary w-100"><spring:message
                            code="label.components.powerunits"/> </a>
                </div>
            </div>
        </c:if>
        <c:if test="${computer.computerCase == null}">
            <c:set var="computer_id" value="${computer.id}" scope="session"/>
            <div class="card col-3 m-4">
                <div class="h-75">
                    <img class="card-img-top w-100" src="<c:url value="/img/case.jpg"/>" alt="case">
                </div>
                <div class="card-body h-25">
                    <a href="<c:url value="/catalog/cases"/>" class="btn btn-primary w-100"><spring:message
                            code="label.components.cases"/> </a>
                </div>
            </div>
        </c:if>
    </div>
</div>
<div class="container align-items-center mt-5 mb-5 pt-3">
    <table class="table table-bordered align-middle mt-1">
        <c:if test="${computer.totalPrice != 0.0}">
            <caption class="caption-top text-center"><h3><spring:message code="label.component.description"/></h3>
            </caption>
        </c:if>
        <tbody>
        <c:if test="${computer.processor ne null}">
            <tr>
                <td>Processor</td>
                <td><a href="/catalog/processor/${computer.processor.id}">${computer.processor.toString()}</a></td>
                <td>${computer.processor.price} <spring:message code="label.currency.byn"/></td>
                <td>
                    <form action="<c:url value="/config/computer/${computer.id}/processor/delete"/>" method="post"
                          class="col-3">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <button class="btn p-0" type="submit">
                            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor"
                                 class="bi bi-trash" viewBox="0 0 16 16">
                                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                <path fill-rule="evenodd"
                                      d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                            </svg>
                        </button>
                    </form>
                </td>
            </tr>
        </c:if>
        <c:if test="${computer.graphicsCard ne null}">
            <tr>
                <td class="">Graphics card</td>
                <td class=""><a
                        href="/catalog/graphics_card/${computer.graphicsCard.id}">${computer.graphicsCard.toString()}</a>
                </td>
                <td>${computer.graphicsCard.price} <spring:message code="label.currency.byn"/></td>
                <td>
                    <form action="<c:url value="/config/computer/${computer.id}/graphics_card/delete"/>" method="post"
                          class="col-3">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <button class="btn p-0" type="submit">
                            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor"
                                 class="bi bi-trash" viewBox="0 0 16 16">
                                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                <path fill-rule="evenodd"
                                      d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                            </svg>
                        </button>
                    </form>
                </td>
            </tr>
        </c:if>
        <c:if test="${computer.motherBoard ne null}">
            <tr>
                <td class="">Motherboard</td>
                <td class=""><a
                        href="/catalog/mother_board/${computer.motherBoard.id}">${computer.motherBoard.toString()}</a>
                </td>
                <td>${computer.motherBoard.price} <spring:message code="label.currency.byn"/></td>
                <td>
                    <form action="<c:url value="/config/computer/${computer.id}/mother_board/delete"/>" method="post"
                          class="col-3">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <button class="btn p-0" type="submit">
                            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor"
                                 class="bi bi-trash" viewBox="0 0 16 16">
                                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                <path fill-rule="evenodd"
                                      d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                            </svg>
                        </button>
                    </form>
                </td>
            </tr>
        </c:if>
        <c:if test="${computer.ram ne null}">
            <tr>
                <td class="">RAM</td>
                <td class=""><a href="/catalog/ram/${computer.ram.id}">${computer.ram.toString()}</a></td>
                <td>${computer.ram.price} <spring:message code="label.currency.byn"/></td>
                <td>
                    <form action="<c:url value="/config/computer/${computer.id}/ram/delete"/>" method="post"
                          class="col-3">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <button class="btn p-0" type="submit">
                            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor"
                                 class="bi bi-trash" viewBox="0 0 16 16">
                                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                <path fill-rule="evenodd"
                                      d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                            </svg>
                        </button>
                    </form>
                </td>
            </tr>
        </c:if>
        <c:if test="${computer.ssd ne null}">
            <tr>
                <td class="">SSD</td>
                <td class=""><a href="/catalog/ssd/${computer.ssd.id}">${computer.ssd.toString()}</a></td>
                <td>${computer.ssd.price} <spring:message code="label.currency.byn"/></td>
                <td>
                    <form action="<c:url value="/config/computer/${computer.id}/ssd/delete"/>" method="post"
                          class="col-3">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <button class="btn p-0" type="submit">
                            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor"
                                 class="bi bi-trash" viewBox="0 0 16 16">
                                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                <path fill-rule="evenodd"
                                      d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                            </svg>
                        </button>
                    </form>
                </td>
            </tr>
        </c:if>
        <c:if test="${computer.hdd ne null}">
            <tr>
                <td class="">HDD</td>
                <td class=""><a href="/catalog/hdd/${computer.hdd.id}">${computer.hdd.toString()}</a></td>
                <td>${computer.hdd.price} <spring:message code="label.currency.byn"/></td>
                <td>
                    <form action="<c:url value="/config/computer/${computer.id}/hdd/delete"/>" method="post"
                          class="col-3">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <button class="btn p-0" type="submit">
                            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor"
                                 class="bi bi-trash" viewBox="0 0 16 16">
                                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                <path fill-rule="evenodd"
                                      d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                            </svg>
                        </button>
                    </form>
                </td>
            </tr>
        </c:if>
        <c:if test="${computer.powerUnit ne null}">
            <tr>
                <td class="">Power unit</td>
                <td class=""><a href="/catalog/power_unit/${computer.powerUnit.id}">${computer.powerUnit.toString()}</a>
                </td>
                <td>${computer.powerUnit.price} <spring:message code="label.currency.byn"/></td>
                <td>
                    <form action="<c:url value="/config/computer/${computer.id}/power_unit/delete"/>" method="post"
                          class="col-3">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <button class="btn p-0" type="submit">
                            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor"
                                 class="bi bi-trash" viewBox="0 0 16 16">
                                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                <path fill-rule="evenodd"
                                      d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                            </svg>
                        </button>
                    </form>
                </td>
            </tr>
        </c:if>
        <c:if test="${computer.computerCase ne null}">
            <tr>
                <td class="">Computer case</td>
                <td class=""><a
                        href="/catalog/ccase/${computer.computerCase.id}">${computer.computerCase.toString()}</a>
                </td>
                <td>${computer.computerCase.price} <spring:message code="label.currency.byn"/></td>
                <td>
                    <form action="<c:url value="/config/computer/${computer.id}/ccase/delete"/>" method="post"
                          class="col-3">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <button class="btn p-0" type="submit">
                            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor"
                                 class="bi bi-trash" viewBox="0 0 16 16">
                                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                <path fill-rule="evenodd"
                                      d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                            </svg>
                        </button>
                    </form>
                </td>
            </tr>
        </c:if>
        <c:if test="${computer.totalPrice != 0.0}">
            <tr>
                <td colspan="2">Total price</td>
                <td colspan="2">${computer.totalPrice} <spring:message code="label.currency.byn"/></td>
            </tr>
        </c:if>
        </tbody>
    </table>
</div>
</div>
</body>
</html>
