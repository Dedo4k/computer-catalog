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

<div class="container align-items-center mt-5">
    <div class="row pt-3">
        <h3 class="col">
            Content manage
        </h3>
    </div>
    <form action="<c:url value="/admin/content"/>" method="get">
        <div class="input-group w-100 p-0 m-0">
            <select class="form-select" id="inputGroupSelect04" name="type"
                    aria-label="Example select with button addon">
                <c:forEach items="${types}" var="type">
                    <c:if test="${type eq param.type}">
                        <option selected value="${type}">${type}</option>
                    </c:if>
                    <c:if test="${type ne param.type}">
                        <option value="${type}">${type}</option>
                    </c:if>
                </c:forEach>
            </select>
            <button class="btn btn-outline-secondary" type="submit">Choose</button>
            <button class="btn btn-success" formaction="/admin/content/new" type="submit">New</button>
        </div>
    </form>
    <c:forEach items="${processors}" var="processor">
        <div class="row">
            <div class="card mt-1">
                <div class="card-body">
                    <div class="row">
                        <div class="col-8">
                            <a href="/catalog/processor/${processor.id}" class="text-decoration-none"><h5
                                    class="card-title">${processor.toString()}</h5></a>
                        </div>
                        <div class="col-2">
                            <h5 class="btn btn-warning w-100">${processor.price} <spring:message
                                    code="label.currency.byn"/></h5>
                        </div>
                        <div class="col-1">
                            <form action="/admin/processor/${processor.id}/edit" method="get">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="submit" class="btn btn-primary w-100" value="Edit">
                            </form>
                        </div>
                        <div class="col-1">
                            <form action="/admin/processor/${processor.id}/delete" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="submit" class="btn btn-danger w-100" value="Delete">
                            </form>
                        </div>
                    </div>
                    <p class="card-text">${processor.core}, ${processor.crystalName}, <spring:message
                            code="label.processor.corenum"/>: ${processor.coreNumber},
                        <spring:message code="label.processor.socket"/>: ${processor.socket},
                        <spring:message code="label.processor.thermalpower"/>: ${processor.thermalPower}
                        <spring:message code="label.values.watt"/>,
                        <spring:message code="label.processor.minfreq"/>: ${processor.minFreq}
                        <spring:message code="label.values.mherz"/>, <spring:message
                                code="label.processor.maxfreq"/>: ${processor.maxFreq} <spring:message
                                code="label.values.mherz"/></p>
                </div>
            </div>
        </div>
    </c:forEach>
    <c:forEach items="${graphics_cards}" var="graphics_card">
        <div class="row">
            <div class="card mt-1">
                <div class="card-body">
                    <div class="row">
                        <div class="col-8">
                            <a href="/catalog/graphics_card/${graphics_card.id}" class="text-decoration-none"><h5
                                    class="card-title">${graphics_card.toString()}</h5></a>
                        </div>
                        <div class="col-2">
                            <h5 class="btn btn-warning w-100">${graphics_card.price} <spring:message
                                    code="label.currency.byn"/></h5>
                        </div>
                        <div class="col-1">
                            <form action="/admin/graphics_card/${graphics_card.id}/edit" method="get">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="submit" class="btn btn-primary w-100" value="Edit">
                            </form>
                        </div>
                        <div class="col-1">
                            <form action="/admin/graphics_card/${graphics_card.id}/delete" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="submit" class="btn btn-danger w-100" value="Delete">
                            </form>
                        </div>
                    </div>
                    <p class="card-text">${graphics_card.gpuProducer} ${graphics_card.gpuModel}, <spring:message
                            code="label.graphics.gpuinterface"/>: ${graphics_card.gpuInterface}, <spring:message
                            code="label.graphics.videomemory"/>: ${graphics_card.videoMemory} <spring:message
                            code="label.values.gbait"/> ${graphics_card.videoMemoryType} </p>
                </div>
            </div>
        </div>
    </c:forEach>
    <c:forEach items="${mother_boards}" var="mother_board">
        <div class="row">
            <div class="card mt-1">
                <div class="card-body">
                    <div class="row">
                        <div class="col-8">
                            <a href="/catalog/mother_board/${mother_board.id}" class="text-decoration-none"><h5
                                    class="card-title">${mother_board.toString()}</h5></a>
                        </div>
                        <div class="col-2">
                            <h5 class="btn btn-warning w-100">${mother_board.price} <spring:message
                                    code="label.currency.byn"/></h5>
                        </div>
                        <div class="col-1">
                            <form action="/admin/mother_board/${mother_board.id}/edit" method="get">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="submit" class="btn btn-primary w-100" value="Edit">
                            </form>
                        </div>
                        <div class="col-1">
                            <form action="/admin/mother_board/${mother_board.id}/delete" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="submit" class="btn btn-danger w-100" value="Delete">
                            </form>
                        </div>
                    </div>
                    <p class="card-text">${mother_board.formFactor}, <spring:message
                            code="label.motherboard.socket"/> ${mother_board.socket},
                        <spring:message code="label.motherboard.chipset"/> ${mother_board.chipset},
                        <spring:message code="label.motherboard.memorytype"/> ${mother_board.memoryType}</p>
                </div>
            </div>
        </div>
    </c:forEach>
    <c:forEach items="${rams}" var="ram">
        <div class="row">
            <div class="card mt-1">
                <div class="card-body">
                    <div class="row">
                        <div class="col-8">
                            <a href="/catalog/ram/${ram.id}" class="text-decoration-none"><h5
                                    class="card-title">${ram.toString()}</h5></a>
                        </div>
                        <div class="col-2">
                            <h5 class="btn btn-warning w-100">${ram.price} <spring:message
                                    code="label.currency.byn"/></h5>
                        </div>
                        <div class="col-1">
                            <form action="/admin/ram/${ram.id}/edit" method="get">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="submit" class="btn btn-primary w-100" value="Edit">
                            </form>
                        </div>
                        <div class="col-1">
                            <form action="/admin/ram/${ram.id}/delete" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="submit" class="btn btn-danger w-100" value="Delete">
                            </form>
                        </div>
                    </div>
                    <p class="card-text"><spring:message code="label.ram.capacity"/>: ${ram.capacity} <spring:message
                            code="label.values.gbait"/>,
                        <spring:message code="label.ram.freq"/>: ${ram.freq} <spring:message code="label.values.mherz"/>,
                        <spring:message code="label.ram.modules"/>: ${ram.moduleSet},
                        <spring:message code="label.ram.type"/>: ${ram.type}</p>
                </div>
            </div>
        </div>
    </c:forEach>
    <c:forEach items="${ssds}" var="ssd">
        <div class="row">
            <div class="card mt-1">
                <div class="card-body">
                    <div class="row">
                        <div class="col-8">
                            <a href="/catalog/ssd/${ssd.id}" class="text-decoration-none"><h5
                                    class="card-title">${ssd.toString()}</h5></a>
                        </div>
                        <div class="col-2">
                            <h5 class="btn btn-warning w-100">${ssd.price} <spring:message
                                    code="label.currency.byn"/></h5>
                        </div>
                        <div class="col-1">
                            <form action="/admin/ssd/${ssd.id}/edit" method="get">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="submit" class="btn btn-primary w-100" value="Edit">
                            </form>
                        </div>
                        <div class="col-1">
                            <form action="/admin/ssd/${ssd.id}/delete" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="submit" class="btn btn-danger w-100" value="Delete">
                            </form>
                        </div>
                    </div>
                    <p class="card-text">${ssd.formFactor}, ${ssd.ssdInterface}, <spring:message
                            code="label.ssd.microchip"/>: ${ssd.microchipType}, <spring:message
                            code="label.ssd.readingspeed"/>: ${ssd.readingSpeed} <spring:message
                            code="label.values.rwspeed"/> , <spring:message
                            code="label.ssd.writingspeed"/>: ${ssd.writingSpeed} <spring:message
                            code="label.values.rwspeed"/></p>
                </div>
            </div>
        </div>
    </c:forEach>
    <c:forEach items="${hdds}" var="hdd">
        <div class="row">
            <div class="card mt-1">
                <div class="card-body">
                    <div class="row">
                        <div class="col-8">
                            <a href="/catalog/hdd/${hdd.id}" class="text-decoration-none"><h5
                                    class="card-title">${hdd.toString()}</h5></a>
                        </div>
                        <div class="col-2">
                            <h5 class="btn btn-warning w-100">${hdd.price} <spring:message
                                    code="label.currency.byn"/></h5>
                        </div>
                        <div class="col-1">
                            <form action="/admin/hdd/${hdd.id}/edit" method="get">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="submit" class="btn btn-primary w-100" value="Edit">
                            </form>
                        </div>
                        <div class="col-1">
                            <form action="/admin/hdd/${hdd.id}/delete" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="submit" class="btn btn-danger w-100" value="Delete">
                            </form>
                        </div>
                    </div>
                    <p class="card-text">${hdd.formFactor}, ${hdd.hddInterface}, ${hdd.rotationSpeed}
                        <spring:message code="label.values.rotspeed"/>, <spring:message
                                code="label.hdd.buffersize"/>: ${hdd.bufferSize} <spring:message
                                code="label.values.mbait"/></p>
                </div>
            </div>
        </div>
    </c:forEach>
    <c:forEach items="${cases}" var="ccase">
        <div class="row">
            <div class="card mt-1">
                <div class="card-body">
                    <div class="row">
                        <div class="col-8">
                            <a href="/catalog/ccase/${ccase.id}" class="text-decoration-none"><h5
                                    class="card-title">${ccase.toString()}</h5></a>
                        </div>
                        <div class="col-2">
                            <h5 class="btn btn-warning w-100">${ccase.price} <spring:message
                                    code="label.currency.byn"/></h5>
                        </div>
                        <div class="col-1">
                            <form action="/admin/ccase/${ccase.id}/edit" method="get">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="submit" class="btn btn-primary w-100" value="Edit">
                            </form>
                        </div>
                        <div class="col-1">
                            <form action="/admin/case/${ccase.id}/delete" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="submit" class="btn btn-danger w-100" value="Delete">
                            </form>
                        </div>
                    </div>
                    <p class="card-text"><spring:message code="label.case.casetype"/>: ${ccase.caseType},
                        <spring:message code="label.case.material"/>: ${ccase.material}, <spring:message
                                code="label.case.colour"/>: ${ccase.colour}, <spring:message
                                code="label.case.sectionnumber"/>: ${ccase.sectionNumber},
                        <spring:message
                                code="label.case.commother"/>: ${ccase.compatible_motherboards} </p>
                </div>
            </div>
        </div>
    </c:forEach>
    <c:forEach items="${power_units}" var="power_unit">
        <div class="row">
            <div class="card mt-1">
                <div class="card-body">
                    <div class="row">
                        <div class="col-8">
                            <a href="/catalog/power_unit/${power_unit.id}" class="text-decoration-none"><h5
                                    class="card-title">${power_unit.toString()}</h5></a>
                        </div>
                        <div class="col-2">
                            <h5 class="btn btn-warning w-100">${power_unit.price} <spring:message
                                    code="label.currency.byn"/></h5>
                        </div>
                        <div class="col-1">
                            <form action="/admin/power_unit/${power_unit.id}/edit" method="get">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="submit" class="btn btn-primary w-100" value="Edit">
                            </form>
                        </div>
                        <div class="col-1">
                            <form action="/admin/power_unit/${power_unit.id}/delete" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="submit" class="btn btn-danger w-100" value="Delete">
                            </form>
                        </div>
                    </div>
                    <p class="card-text"><spring:message code="label.powerunit.pfc"/>: ${power_unit.pfc},
                        <spring:message code="label.powerunit.efficiency"/>: ${power_unit.efficiency}%,
                        <spring:message code="label.powerunit.certificate"/>: ${power_unit.certificate},
                            ${power_unit.power} <spring:message code="label.values.watt"/></p>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
</body>
</html>
